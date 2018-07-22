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
    ["Druid"]   = { "DruidHEP", "DruidHEP2", "DruidCatDPS", "DruidCatAPValue", "DruidBearTank" },
    ["Shaman"]  = { "ShamanHEP" },
    ["Warrior"] = { "WarriorProtEH", "WarriorProtAvoidance", "WarriorArmsDPS", "WarriorFuryDPS" },
    ["Paladin"] = { "PaladinProtEH", "PaladinRetDPS", "PaladinHEP" },
    ["Priest"]  = { "PriestHEP_2M", "PriestHEP_15M", "PriestShadowDPS_2M" }
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
    ["TOHIT"]       = { 8, 1.811, 0 }, 
    ["ATTACKPOWER"] = 0.0953333
  },

  ["DruidCatAPValue"] = {
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

  ["ShamanHEP"] = {
    ["INT"]       = 0.20,
    ["MANAREG"]   = 1.00,
    ["HEAL"]      = 0.14,
    ["SPELLCRIT"] = 0.00,
    ["SPI"]       = 0.00
  },

  ["PriestHEP_2M"] = {
    ["INT"]       = 2.322635135,
    ["MANAREG"]   = 3.5,
    ["HEAL"]      = 1,
    ["SPELLCRIT"] = 8,
    ["SPI"]       = 0.8275
  },

  ["PriestHEP_2M_T2"] = {
    ["INT"]       = 2.322635135,
    ["MANAREG"]   = 3.5,
    ["HEAL"]      = 1,
    ["SPELLCRIT"] = 8,
    ["SPI"]       = 1.1775
  },
  
  ["PriestHEP_15M"] = {
    ["INT"]       = 0.4351,
    ["MANAREG"]   = 3.5,
    ["HEAL"]      = 1,
    ["SPELLCRIT"] = 8,
    ["SPI"]       = 0.8275
  },  

  ["PriestHEP_15M_T2"] = {
    ["INT"]       = 0.4351,
    ["MANAREG"]   = 3.5,
    ["HEAL"]      = 1,
    ["SPELLCRIT"] = 8,
    ["SPI"]       = 1.1775
  },  


  ["PriestShadowDPS_2M"] = {
    ["DMG"]        = 0.387742,
    ["SHADOWDMG"]  = 0.387742,
    ["INT"]        = 1.093871,
    ["MANAREG"]    = 0.077742,
    ["SPI"]        = 0.006452,
    ["SPELLCRIT"]  = 0.018231,
    ["SPELLTOHIT"] = { 8, 100, 0 }, 
  },

  ["PriestShadowDPS_15M"] = {
    ["DMG"]        = 0.39,
    ["SHADOWDMG"]  = 0.39,
    ["INT"]        = 0.546774,
    ["MANAREG"]    = 0.077742,
    ["SPI"]        = 0.012903,
    ["SPELLCRIT"]  = 0.009113,
    ["SPELLTOHIT"] = { 8, 100, 0 }, 
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

  ["WarriorArmsDPS"] = {
    ["STR"]         = 0.1428571428571429,
    ["AGI"]         = 0.1020,
    ["CRIT"]        = 2.04,
    ["TOHIT"]       = { 8.6, 2.04, 0 },
    ["ATTACKPOWER"] = 0.0714285714285714
  },

  ["WarriorFuryDPS"] = {
    ["STR"]         = 0.1428571428571429,
    ["AGI"]         = 0.1020,
    ["CRIT"]        = 2.04,
    ["TOHIT"]       = { 14, 2.04, 0 },
    ["ATTACKPOWER"] = 0.0714285714285714    
  }

}