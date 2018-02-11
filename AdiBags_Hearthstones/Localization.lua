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

if locale == "zhCN" then
L["Flight Master's Whistle"] = "飞行管理员的哨子"
L["FMW isn't a Hearthstone, but helps you get around faster."] = "飞行管理员的哨子不是一个炉石，但有助于你更快的到达."
L["Items that hearth you to various places."] = "传送你到各个地方的物品."
L["Jewelry"] = "首饰"
L["Show items like Innkeeper's Daughter in this group."] = "在此类别显示像是旅店老板的女儿的物品."
L["Show items like Ruby Slippers in this group."] = "在此类别显示像是红宝石靴子的物品."
L["Show items like the Kirin Tor rings in this group."] = "在此类别显示像是肯瑞托戒指的物品."
L["Show quest items that portal in this group."] = "在此类别显示任务传送物品."

-- ToC
L["Notes"] = "增加各种传送物品到AdiBags的虚拟类别"

elseif locale == "zhTW" then
L["Flight Master's Whistle"] = "飛行管理員的哨子"
L["FMW isn't a Hearthstone, but helps you get around faster."] = "飛行管理員的哨子不是個爐石，但有助於你更快的到達。"
L["Items that hearth you to various places."] = "傳送你到各個地方的物品。"
L["Jewelry"] = "首飾"
L["Show items like Innkeeper's Daughter in this group."] = "在此類別顯示像是旅館老闆的女兒的物品。"
L["Show items like Ruby Slippers in this group."] = "在此類別顯示像是紅寶石軟靴的物品。"
L["Show items like the Kirin Tor rings in this group."] = "在此類別顯示像是祈倫托戒指的物品。"
L["Show quest items that portal in this group."] = "在此類別顯示任務傳送物品。"

-- ToC
L["Notes"] = "增加各種傳送物品到AdiBags的虛擬類別"

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
