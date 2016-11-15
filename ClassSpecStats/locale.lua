local _, vars = ...;
local Ld, La = {}, {}
local locale = GetLocale()

vars.L = setmetatable({},{
    __index = function(t, s) return La[s] or Ld[s] or rawget(t,s) or s end
})

-- Ld means default (english) if no translation found. So we don't need a translation for "enUS" or "enGB".
Ld["Agi"] = "Agi"
Ld["Crit"] = "Crit"
Ld["Haste"] = "Haste"
Ld["Int"] = "Int"
Ld["Mastery"] = "Mastery"
Ld["Sta"] = "Stam"
Ld["Str"] = "Str"
Ld["Vers"] = "Vers"

if locale == "zhTW" then do end
	La["Agi"] = "敏捷"
	La["Haste"] = "加速"
	La["Crit"] = "致命"
	La["Int"] = "智力"
	La["Mastery"] = "精通"
	La["Sta"] = "耐力"
	La["Str"] = "力量"
	La["Vers"] = "臨機"
end