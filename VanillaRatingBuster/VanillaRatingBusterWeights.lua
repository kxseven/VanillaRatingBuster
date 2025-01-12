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

VRB_LABELS = {
    ["Druid"]   = { "DruidFeralDPS-EP", "DruidTanking-EP", "DruidResto-EP" },
    ["Shaman"]  = { "ShamanHEP", "ShamanMelee" },
    ["Warrior"] = { "WarriorThreat-EP", "WarriorMitigation-EP", "WarriorFury-EP" },
    ["Paladin"] = { "PaladinProtEH", "PaladinRetDPS", "PaladinHEP" },
    ["Priest"]  = { "PriestHEP_2M", "PriestHEP_15M", "PriestHEP_TIG", "PriestShadowDPS_2M", "PriestShadowDPS_9M" }
--    ["Priest"]  = { "Priest2MinHEP", "Priest15MinHEP", "Priest2MinHEPT2Bonus", "Priest15MinHEPT2Bonus" }
}


VRB_WEIGHTS = {

  ["PaladinRetDPS"] = {
    ["STR"]         = 0.1428571428571429,
    ["AGI"]         = 0.1020,
    ["CRIT"]        = 2.04,
    ["TOHIT"]       = { 5.6, 100, 0 },
    ["ATTACKPOWER"] = 0.0714285714285714
  },

  ["PaladinHEP"] = {
    ["INT"]       = 1.00,
    ["MANAREG"]   = 1.91,
    ["HEAL"]      = 1.00,
    ["SPELLCRIT"] = 20.34,
    ["SPI"]       = 0.00
  },

  ["PaladinProtEH"] = {
    ["ARMOR"]   = 0.51416,
    ["STA"]     = 10.14596,
    ["AGI"]     = 1.02832,
    ["STR"]     = 0.05,
    ["DODGE"]   = 0,
    ["PARRY"]   = 0,
    ["DEFENSE"] = 0.08,
    ["BLOCK"]   = 0.04
  },

  ["DruidResto-EP"] = {
    ["HEAL"]      = 1.00,
    ["DMG"]       = 1.00,
    ["INT"]       = 0.3,
    ["SPI"]       = 0.46,
    ["MANAREG"]   = 3.0,
    ["SPELLCRIT"] = 10,
    ["MANA"]      = 0.02,
  },

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

  ["DruidCatDPSLegacy"] = {
    ["STR"]         = 0.19075,
    ["AGI"]         = 0.0893452,
    ["CRIT"]        = 1.875,
    ["TOHIT"]       = { 8, 1.811, 0 },
    ["ATTACKPOWER"] = 0.0953333
  },

  ["DruidCatDPS"] = {
    ["STR"]         = 2.4,
    ["AGI"]         = 2.1,
    ["CRIT"]        = 22,
    ["TOHIT"]       = { 8, 15, 0 },
    ["ATTACKPOWER"] = 1
  },

  ["DruidBearTank"] = {
    ["AGI"]     = 2.29,
    ["ARMOR"]   = 0.79727,
    ["DEFENSE"] = 4.7,
    ["DODGE"]   = 39.5,
    ["STA"]     = 6.242
  },

  ["DruidFeralDPS-EP"] = {
    ["ATTACKPOWER"] = 1,
    ["FERALATTACKPOWER"] = 1,
    ["STR"]      = 2.64,
    ["AGI"]      = 2.8,
    ["TOHIT"]    = { 32.78, 8, 0 },
    ["CRIT"]     = 30.88,
    ["ARMORPEN"] = 0.5,
  },

  ["DruidTanking-EP"] = {
    ["STR"]     = 2.2,
    ["AGI"]     = 1.57,
    ["STA"]     = 2.2,
    ["ATTACKPOWER"] = 1,
    ["FERALATTACKPOWER"] = 1,
    ["TOHIT"]   = { 36.1, 8, 0 },
    ["CRIT"]    = 25.8,
    ["HASTE"]    = 26.6,
    ["ARMOR"]   = 0.33,
    ["DEFENSE"] = 0.46,
    ["HEALTH"] = 0.167,
    ["ARMORPEN"] = 0.5,
  },

  ["ShamanHEP"] = {
    ["INT"]       = 0.20,
    ["MANAREG"]   = 1.00,
    ["HEAL"]      = 0.14,
    ["SPELLCRIT"] = 0.00,
    ["SPI"]       = 0.00
  },

  ["ShamanMelee"] = {
    ["STR"]         = 0.1428571428571429,
    ["AGI"]         = 0.1020,
    ["CRIT"]        = 2.04,
    ["TOHIT"]       = { 5.6, 2.04, 0 },
    ["ATTACKPOWER"] = 0.0714285714285714
  },

  ["PriestHEP_TIG"] = {
    ["INT"]       = 1.1607,
    ["MANAREG"]   = 3.5,
    ["HEAL"]      = 1,
    ["SPELLCRIT"] = 1.161317565,
    ["SPI"]       = 0.8275
  },

  ["PriestHEP_2M"] = {
    ["INT"]       = 2.322635135,
    ["MANAREG"]   = 3.5,
    ["HEAL"]      = 1,
    ["SPELLCRIT"] = 1.161317565,
    ["SPI"]       = 0.8275
  },

  ["PriestHEP_2M_T2"] = {
    ["INT"]       = 2.322635135,
    ["MANAREG"]   = 3.5,
    ["HEAL"]      = 1,
    ["SPELLCRIT"] = 1.161317565,
    ["SPI"]       = 1.1775
  },

  ["PriestHEP_15M"] = {
    ["INT"]       = 0.4351,
    ["MANAREG"]   = 3.5,
    ["HEAL"]      = 1,
    ["SPELLCRIT"] = 1.161317565,
    ["SPI"]       = 0.8275
  },

  ["PriestHEP_15M_T2"] = {
    ["INT"]       = 0.4351,
    ["MANAREG"]   = 3.5,
    ["HEAL"]      = 1,
    ["SPELLCRIT"] = 1.161317565,
    ["SPI"]       = 1.1775
  },


  ["PriestShadowDPS_2M"] = {
    ["DMG"]        = 1,
    ["SHADOWDMG"]  = 1,
    ["INT"]        = 1.52,
    ["MANAREG"]    = 1.8,
    ["SPI"]        = 0.34,
    ["SPELLCRIT"]  = 1.25,
    ["SPELLTOHIT"] = { 8, 10.36, 0 },
  },

  ["PriestShadowDPS_9M"] = {
    ["DMG"]        = 1,
    ["SHADOWDMG"]  = 1,
    ["INT"]        = 0.4,
    ["MANAREG"]    = 2.81,
    ["SPI"]        = 0.09,
    ["SPELLCRIT"]  = 0.88,
    ["SPELLTOHIT"] = { 8, 10.02, 0 },
  },

  ["WarriorThreat-EP"] = {
    ["AGI"]     = 1.05,
    ["ARMOR"]   = 0.05,
    ["ATTACKPOWER"] = 1,
    ["BLOCK"]   = 0.04,
    ["CRIT"]    = 22,
    ["DEFENSE"] = 0.22,
    ["DODGE"]   = 0,
    ["PARRY"]   = 7.47,
    ["STR"]     = 2,
    ["TOHIT"]   = { 14, 27, 0 },
  },

  ["WarriorMitigation-EP"] = {
    ["AGI"]     = 0.91,
    ["ARMOR"]   = 0.05,
    ["BLOCK"]   = 0.04,
    ["DEFENSE"] = 2.61,
    ["DODGE"]   = 16.29,
    ["PARRY"]   = 16.29,
    ["STA"]     = 1,
    ["STR"]     = 0.02,
    ["TOHIT"]   = { 9, 27, 0 },
  },

  ["WarriorArmsDPS"] = {
    ["STR"]         = 0.1428571428571429,
    ["AGI"]         = 0.1020,
    ["CRIT"]        = 2.04,
    ["TOHIT"]       = { 8.6, 2.04, 0 },
    ["ATTACKPOWER"] = 0.0714285714285714
  },

  ["WarriorFury-EP"] = {
    ["AGI"]     = 1.00,
    ["ATTACKPOWER"] = 1,
    ["CRIT"]    = 20,
    ["STR"]     = 2,
    ["TOHIT"]   = { 14, 20, 0 },
  }

}

