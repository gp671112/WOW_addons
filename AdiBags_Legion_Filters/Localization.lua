local AddonName, AddonTable = ...
AddonTable.L = {}
local L = AddonTable.L
local locale = GetLocale()

--Name and description
L["Legion"] = EXPANSION_NAME6 or true
L["Put items from Legion in their own sections."] = true
--Container Names
L["Artifact Power"] = ARTIFACT_POWER or true--Localized by Blizzard global strings.
L["Ancient Mana"] = GetCurrencyInfo(1155) or true
L["Champion Upgrades"] = true
L["Champion Equipment"] = true
L["Bait"] = true
L["Rare Fish"] = true
L["Fish Bait"] = true --The Combined Bait and Rare Fish container
L["Reputation"] = REPUTATION or true
L["Broken Shore"] = GetMapNameByID(1021) --Broken Shore
L["Legendary Equipment"] = true
--Option Strings
L['Create a section for Artifact Power items.'] = true
L['Create a section for Ancient Mana items.'] = true
L['Artifact Relics'] = true
L['Create a section for Artifact Relics.'] = true
L['Create a section for Champion Upgrades items.'] = true
L['Create a section for Champion Equipment.'] = true
L["Merge Champion Items"] = true
L['Put Champion Equipment and Upgrades in one section.'] = true
L['Create a section for Bait.'] = true
L['Create a section for Rare Fish.'] = true
L["Merge Bait and Fish"] = true
L['Put Fish Bait and Rare Fish in one section.'] = true
L['Create a section for Reputation items.'] = true
L['Create a section for Broken Shore items.'] = true
L['Create a section for Legendary Equipment.'] = true
--Artifact Power Plugin
L["Artifact Power Values"] = true
L["NumberScaleFactors"] = {
	{1000,"k"},
	{1000000,"m"},
	{1000000000,"b"},
}
--Artifact Power Currency
L["Artifact Power Currency"] = true


-- Contributors: BLizzatron@Curse
if locale == 'zhTW' then
	L["Legion"] = EXPANSION_NAME6
	L["Put items from Legion in their own sections."] = "放置軍臨天下物品到它們自己的類別。"
	--Container Names
	L["Artifact Power"] = ARTIFACT_POWER --Localized by Blizzard global strings.
	L["Ancient Mana"] = GetCurrencyInfo(1155)
	L["Champion Upgrades"] = "勇士升級"
	L["Champion Equipment"] = "勇士裝備"
	L["Bait"] = "誘餌"
	L["Rare Fish"] = "稀有魚類"
	L["Fish Bait"] = "魚餌" --The Combined Bait and Rare Fish container
	L["Reputation"] = "聲望"
	L["Broken Shore"] = GetMapNameByID(1021) 
	L["Legendary Equipment"] = "傳說裝備"
	--Option Strings
	L['Create a section for Artifact Power items.'] = "建立神兵之力物品的類別。"
	L['Create a section for Ancient Mana items.'] = "建立上古法力物品的類別。"
	L['Artifact Relics'] = "神兵聖物"
	L['Create a section for Artifact Relics.'] = "建立神兵聖物的類別。"
	L['Create a section for Champion Upgrades items.'] = "建立勇士升級物品的類別。"
	L['Create a section for Champion Equipment.'] = "建立勇士裝備的類別"
	L["Merge Champion Items"] = "合併勇士物品"
	L['Put Champion Equipment and Upgrades in one section.'] = "放置勇士裝備與升級物品到同一類別"
	L['Create a section for Bait.'] = "建立誘餌的類別"
	L['Create a section for Rare Fish.'] = "建立稀有魚類的類別。"
	L["Merge Bait and Fish"] = "合併誘餌與魚類"
	L['Put Fish Bait and Rare Fish in one section.'] = "合併魚餌與稀有魚類到同一類別。"
	L['Create a section for Reputation items.'] = "建立聲望物品的類別。"
	L['Create a section for Broken Shore items.'] = "建立破碎群島的物品類別"
	L['Create a section for Legendary Equipment.'] = "建立傳說裝備的物品類別"
	--Artifact Power Plugin
	L["Artifact Power Values"] = "神兵之力值"
	L["NumberScaleFactors"] = {
		{10000,"萬"},
		{100000000,"億"},
	}
	--Artifact Power Currency
	L["Artifact Power Currency"] = "神兵之力通貨"
end

-- Replace remaining true values by their key
for k,v in pairs(L) do if v == true then L[k] = k end end
