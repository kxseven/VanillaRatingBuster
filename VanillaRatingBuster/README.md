
# Vanilla Rating Buster

A very basic AddOn that calculates ratings for various specs and classes based on stat weights defined by the community. 

![example_druid.png](VanillaRatingBuster/assets/example_druid.png)

## How to install

1. Download Release
2. Unpack the Zip
3. Copy both "VanillaRatingBuster" and "BonusScanner" folders to Wow-Directory\Interface\AddOns
4. Restart Wow


## FAQ

**How does it calculate a rating?**
It uses the BonusScanner AddOn to get bonuses, including enchants for an item and then uses the stat weights for your class to calculate an overall rating

**What about stats with weight changes at a certain (eg. Hit) cap?**
These can be specified as `{threshold-value, before-weight, after-weight}`. (eg. `["TOHIT"] = { 8, 100, 1.811 }`)

**Why doesn't it always show a rating?**
If the rating is `0` then it's not shown (eg. HEP value on tanking gear)

**Why does it need a modified version of BonusScanner?**
The default BonusScanner ignores normal Armor on items and scans only for 'bonus' Armor. For tank ratings we need the base Armor value instead. The original author of BonusScanner is/was Crowley and is available [here](https://wow.curseforge.com/projects/project-1352)

**My class isn't supported! Why not?**
I don't know other classes well enough or have weights for them. If you do feel free to provide them in an Issue ticket.


## Sources and Weights

 - Some weights are defined as simple `TYPE = WEIGHT`
 - Others are defined as `{ THRESHOLD, BELOW_THRESHOLD_WEIGHT, AFTER_THRESHOLD_WEIGHT }`

```lua
  ["DruidCatDPS"] = {
    ["STR"]         = 0.19075,
    ["AGI"]         = 0.0893452,
    ["CRIT"]        = 1.875,
    ["TOHIT"]       = { 8, 1.811, 0 }, 
    ["ATTACKPOWER"] = 0.0953333
  },
```


