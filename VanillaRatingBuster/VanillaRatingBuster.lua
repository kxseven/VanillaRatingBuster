
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

-- From BonusScanner
-- types = {
--   "STR",      -- strength 
--   "AGI",      -- agility
--   "STA",      -- stamina
--   "INT",      -- intellect
--   "SPI",      -- spirit
--   "ARMOR",    -- reinforced armor (not base armor)

--   "ARCANERES",  -- arcane resistance
--   "FIRERES",    -- fire resistance
--   "NATURERES",  -- nature resistance  
--   "FROSTRES",   -- frost resistance
--   "SHADOWRES",  -- shadow resistance

--   "FISHING",    -- fishing skill
--   "MINING",   -- mining skill
--   "HERBALISM",  -- herbalism skill
--   "SKINNING",   -- skinning skill
--   "DEFENSE",    -- defense skill

--   "BLOCK",      -- chance to block
--   "DODGE",    -- chance to dodge
--   "PARRY",    -- chance to parry
--   "ATTACKPOWER",  -- attack power
--   "ATTACKPOWERUNDEAD", -- attack power against undead
  
--   "CRIT",     -- chance to get a critical strike
--   "RANGEDATTACKPOWER", -- ranged attack power
--   "RANGEDCRIT", -- chance to get a crit with ranged weapons
--   "TOHIT",    -- chance to hit

--   "DMG",      -- spell damage
--   "DMGUNDEAD",  -- spell damage against undead
  
--   "ARCANEDMG",  -- arcane spell damage
--   "FIREDMG",    -- fire spell damage
--   "FROSTDMG",   -- frost spell damage
--   "HOLYDMG",    -- holy spell damage
--   "NATUREDMG",  -- nature spell damage
--   "SHADOWDMG",  -- shadow spell damage
--   "SPELLCRIT",  -- chance to crit with spells
--   "HEAL",     -- healing 
--   "HOLYCRIT",   -- chance to crit with holy spells
--   "SPELLTOHIT",   -- Chance to Hit with spells

--   "SPELLPEN",   -- amount of spell resist reduction

--   "HEALTHREG",  -- health regeneration per 5 sec.
--   "MANAREG",    -- mana regeneration per 5 sec.
--   "HEALTH",   -- health points
--   "MANA",     -- mana points
-- };

VRB_WEIGHTS_HEP = {

  ["DruidHEP"] = {
    ["INT"]       = 0.60,
    ["MANAREG"]   = 4.00,
    ["HEAL"]      = 1.00,
    ["SPELLCRIT"] = 7.50,
    ["SPI"]       = 0.30
  },

  ["DruidHEP2"] = {
    ["INT"]       = 0.30,
    ["MANAREG"]   = 3.00,
    ["HEAL"]      = 1.00,
    ["SPELLCRIT"] = 10.00,
    ["SPI"]       = 0.45
  },

  ["DruidHEPNAXX"] = {
    ["INT"]       = 0.30,
    ["MANAREG"]   = 3.00,
    ["HEAL"]      = 1.20,
    ["SPELLCRIT"] = 12.00,
    ["SPI"]       = 0.23
  },

  ["DruidCatDPS"] = {
    ["STR"]         = 0.19075,
    ["AGI"]         = 0.0893452,
    ["CRIT"]        = 1.875,
    ["TOHIT"]       = 1.811,
    ["ATTACKPOWER"] = 0.0953333
  },

  ["DruidBearTank"] = {
    ["AGI"]     = 2.29,
    ["ARMOR"]   = 0.79727,
    ["DEFENSE"] = 4.7,
    ["DODGE"]   = 39.5,
    ["STA"]     = 6.242
  },

  ["ShamanHEP"] = {
    ["INT"]       = 0.20,
    ["MANAREG"]   = 1.00,
    ["HEAL"]      = 0.14,
    ["SPELLCRIT"] = 0.00,
    ["SPI"]       = 0.00
  },

  ["WarriorProtEH"] = {
    ["ARMOR"]   = 0.51416,
    ["STA"]     = 10.14596,
    ["AGI"]     = 1.02832,
    ["STR"]     = 0.05,
    ["DODGE"]   = 0,
    ["PARRY"]   = 0,
    ["DEFENSE"] = 0.08,
    ["BLOCK"]   = 0.04
  },

  ["WarriorProtAvoidance"] = {
    ["ARMOR"]   = 0,
    ["STA"]     = 0,
    ["AGI"]     = 0.05,
    ["STR"]     = 0,
    ["DODGE"]   = 1,
    ["PARRY"]   = 0.04,
    ["DEFENSE"] = 0.08
  },

  ["WarriorDPSBeforeHitCap"] = {
    ["STR"]         = 0.1910,
    ["AGI"]         = 0.0971,
    ["CRIT"]        = 2.04,
    ["TOHIT"]       = 100,
    ["ATTACKPOWER"] = 0.0595
  },

  ["WarriorDPSAfterHitCap"] = {
    ["STR"]         = 0.1910,
    ["AGI"]         = 0.0971,
    ["CRIT"]        = 2.04,
    ["TOHIT"]       = 2.04,
    ["ATTACKPOWER"] = 0.0595
  }

}


function VRBRound(input, places)
  if not places then places = 0 end
  if type(input) == "number" and type(places) == "number" then
    local pow = 1
    for i = 1, places do pow = pow * 10 end
    return floor(input * pow + 0.5) / pow
  end
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
  local ratings = {}
  local class = UnitClass("player")

  if class == "Druid" then
    ratings = { "DruidHEP", "DruidCatDPS", "DruidBearTank" }
  elseif class == "Warrior" then
    ratings = { "WarriorProtEH", "WarriorProtAvoidance", "WarriorDPSBeforeHitCap", "WarriorDPSAfterHitCap"}
  elseif class == "Shaman" then
    ratings = { "ShamanHEP" }
  end

  return ratings

end


function VRBCalculateRating(weightTable, bonuses)

  local baseScore = 0
  local bonus, i;
  local weightTypes = VRB_WEIGHTS_HEP[weightTable]

  for t,w in pairs(weightTypes) do

    if(bonuses[t]) then
      baseScore = baseScore + ( bonuses[t] * w )
    end

  end

  return VRBRound(baseScore, 2) 

end


VRBItemScoreTooltip = CreateFrame( "Frame" , "VRBItemScoreTooltip", GameTooltip )

VRBItemScoreTooltip:SetScript("OnShow", function (self)
    local itemLevel = nil
    local itemRarity = nil
    local itemSlot = nil
    local bonuses = nil
    local tmpTxt, line;
    local lines = GameTooltip:NumLines();

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
        for i, r in ipairs(ratings) do
          vrbscore = VRBCalculateRating(r, bonuses)
          if vrbscore > 0 then
            normalizedLabel = string.gsub(r, UnitClass("player"), "")
            GameTooltip:AddLine(LIGHTYELLOW_FONT_COLOR_CODE .. normalizedLabel .. ": " .. vrbscore)
            GameTooltip:Show()          
          end
        end

      end

    end

  end)


SLASH_VRBSCORE1, SLASH_VRBSCORE2 = '/vrb', '/vanillaratingbuster';

