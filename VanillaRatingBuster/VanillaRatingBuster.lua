
scoredItemTypes = {
  INVTYPE_2HWEAPON, INVTYPE_CHEST, INVTYPE_CLOAK,
  INVTYPE_FEET, INVTYPE_FINGER, INVTYPE_HAND, INVTYPE_HEAD, INVTYPE_HOLDABLE,
  INVTYPE_LEGS, INVTYPE_NECK, INVTYPE_RANGED, INVTYPE_RELIC, INVTYPE_ROBE, INVTYPE_SHIELD,
  INVTYPE_SHOULDER, INVTYPE_TRINKET, INVTYPE_WAIST, INVTYPE_WEAPON,
  INVTYPE_WEAPONMAINHAND, INVTYPE_WEAPONOFFHAND, INVTYPE_WRIST,
  -- deDE
  "Schusswaffe", "Zauberstab", "Armbrust",
  -- enGB
  "Gun", "Wand", "Crossbow"
}


function istable(t)
  return type(t) == 'table'
end


function VRBRound(num, places)
  local mult = 10^(places or 0)
  return math.floor(num * mult + 0.5) / mult
end


function VRBCheckItemType(slot)
  for id, scoredSlot in pairs(scoredItemTypes) do
    if slot == scoredSlot then
      return true
    end
  end
  return nil
end


function VRBGetValidRatings()
  local ratings
  local class = UnitClass("player")

  ratings = VRB_LABELS[class]
  if ratings then
    return ratings
  end
  return {}

end


function VRBCalculateRating(weightTable, bonuses)

  local baseScore = 0
  local bonus, i;
  local weightTypes = VRB_WEIGHTS[weightTable]
  local currentBonus = 0

  for t,w in pairs(weightTypes) do

    if (BonusScanner.bonuses[t]) then
      currentBonus = BonusScanner.bonuses[t]
    end

    if(bonuses[t]) then
      -- Now check if the weight is a compound structure; has a threshold
      if istable(w) then
        threshold = w[1]
        beforeWeight = w[2]
        afterWeight = w[3]
        if tonumber(currentBonus) < tonumber(threshold) then
          baseScore = baseScore + ( bonuses[t] * beforeWeight )
        else
          baseScore = baseScore + ( bonuses[t] * afterWeight )
        end
      else
        baseScore = baseScore + ( bonuses[t] * w )
      end
    end

  end

  return VRBRound(baseScore, 2)

end


VRBItemScoreTooltip = CreateFrame( "Frame" , "VRBItemScoreTooltip", GameTooltip )
VRBItemScoreTooltip:SetScript("OnShow", function (self)
    local itemLevel = nil
    local itemRarity = nil
    local itemSlot = nil
    local itemName = nil
    local itemID = nil
    local bonuses = nil
    local tmpTxt, line;
    local lines = GameTooltip:NumLines();
    local hasScoreToShow = false
    local vrbscore = 0
    local normalizedLabel = nil

    BonusScanner.temp.sets = {};
    BonusScanner.temp.set = "";
    BonusScanner.temp.bonuses = {};
    BonusScanner.temp.slot = "";

    local lbl = getglobal("GameTooltipTextLeft1")
    if lbl then

      for i=2, lines, 1 do
        tmpText = getglobal("GameTooltipTextLeft"..i);
        val = nil;
        if (tmpText:GetText()) then
          line = tmpText:GetText();
          BonusScanner:ScanLine(line);
        end
      end

      bonuses = BonusScanner.temp.bonuses;

      if(bonuses) then

        local ratings = VRBGetValidRatings()
        local className, classFileName = UnitClass("player")
        local color = RAID_CLASS_COLORS[classFileName]

        for _, r in ipairs(ratings) do
          vrbscore = VRBCalculateRating(r, bonuses)
          if vrbscore > 0 then
            normalizedLabel = string.gsub(r, className, "")
            -- GameTooltip:AddLine(normalizedLabel .. ": " .. vrbscore, color.r, color.g, color.b)
            GameTooltip:AddDoubleLine(normalizedLabel .. ": ", vrbscore , color.r, color.g, color.b, color.r, color.g, color.b)
            hasScoreToShow = true
          end
        end

        if hasScoreToShow then
          GameTooltip:Show()
        end

      end

    end

  end)


SLASH_VRBSCORE1, SLASH_VRBSCORE2 = '/vrb';
