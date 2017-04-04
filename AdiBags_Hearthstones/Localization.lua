--[[
AdiBags_Hearths - Adds various hearthing items to AdiBags virtual groups
© 2016 - 2017 Paul "Myrroddin" Vandersypen, All Rights Reserved
]]--

local addonName, addon = ...

local L = setmetatable({}, {
	__index = function(self, key)
		if key then
			rawset(self, key, tostring(key))
		end
		return tostring(key)
	end,
})
addon.L = L

local locale = GetLocale()

if locale == "zhTW" then
L["Flight Master's Whistle"] = "飛行管理員的口哨"
L["FMW isn't a Hearthstone, but helps you get around faster."] = "飛行管理員的口哨不是個爐石，但有助於你更快的到達。"
L["Items that hearth you to various places."] = "傳送你到各個地方的物品。"
L["Jewelry"] = "首飾"
L["Show items like Innkeeper's Daughter in this group."] = "在此類別顯示像是旅館老闆的女兒的物品。"
L["Show items like Ruby Slippers in this group."] = "在此類別顯示像是紅寶石軟靴的物品"
L["Show items like the Kirin Tor rings in this group."] = "在此類別顯示像是祈倫托戒指的物品。"
L["Show quest items that portal in this group."] = "在此類別顯示任務傳送物品。"

else
-- enUS default
L["Flight Master's Whistle"] = true
L["FMW isn't a Hearthstone, but helps you get around faster."] = true
L["Items that hearth you to various places."] = true
L["Jewelry"] = true
L["Show items like Innkeeper's Daughter in this group."] = true
L["Show items like the Kirin Tor rings in this group."] = true
L["Show items like Ruby Slippers in this group."] = true
L["Show quest items that portal in this group."] = true
end

-- Replace remaining true values by their key
for k,v in pairs(L) do
	if v == true then
		L[k] = k
	end
end
