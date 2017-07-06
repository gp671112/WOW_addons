local x = {}
x["Version"] = "|cFFFAFA44裝備屬性選擇建議:|cFF00EA00 2017.7.4|r"

--[[ Deathknight Blood]]
x[250] = "平衡 (推薦)：Str > Haste > Vers > Crit > Mast \n最大輸出：Str > Haste > Crit > Vers > Mast \n生存能力：Str > Haste > Vers > Mast > Crit "
--[[ Deathknight Frost]]
x[251] = "Str > Crit 20% > (Haste = Crit = Mast > Vers)"
--[[ Deathknight Unholy]]
x[252] = "Str > Mast > Haste 20% > Crit > Vers"

--[[ Druid Balance]]
x[102] = "Haste > Mast > Int > Crit > Vers"
--[[ Druid Feral]]
x[103] =  "Agi > Mast > Crit > Vers > Haste"
--[[ Druid Guardian]]
x[104] = "Armor > Vers >= Mast > Haste > Agi > Crit"
--[[ Druid Restoration]]
x[105] = "補團隊：Int > Mast > Haste >= Crit > Vers \n補坦/傳奇+：Mast >= Haste > Int > Crit > Vers"

--[[ Hunter Beastmaster]]
x[253] = "Agi > Mast > Haste > Crit > Vers"
--[[ Hunter Marksmanship]]
x[254] = "Mast > Crit > Haste > Vers > Agi"
--[[ Hunter Survival]]
x[255] = "Agi > Haste > Mast > Crit > Vers"

--[[ Mage Arcane]]
x[62] = "Vers > Crit > Haste > Int > Mast"
--[[ Mage Fire]]
x[63] = "Int > Crit >= Haste > Mast > Vers"
--[[ Mage Fros]]
x[64] = "Crit 33.34% > Int > Haste >  Vers > Mast"

--[[ Monk Brewmaster]]
x[268] = "Haste 10% > (Mast = Crit) > Vers > Haste > Agi"
--[[ Monk Mistweaver]]
x[270] = "標準：Int > Crit > Vers > Haste > Mast \n攻擊補血：Int > Vers > Haste >= Crit > Mast \n傳奇+：Int > Haste = Mast > Vers > Crit"
--[[ Monk Windwalker]]
x[269] = "單目標：Agi > Mast > Crit > Vers > Haste \n多目標：Agi > Mast > Haste > Crit > Vers"

--[[ Paladin Holy]]
x[65] = "Int > Crit > Mast > Vers > Haste"
--[[ Paladin Protection]]
x[66] = "生存能力：Haste > Vers > Mast > Crit > Sta \n最大輸出：Haste > Crit > Mast > Vers > Sta"
--[[ Paladin Retribution]]
x[70] = "Str > Haste > Crit = Vers > Mast"

--[[ Priest Discipline]]
x[256] = "Int > Haste > Crit > Mast > Vers"
--[[ Priest Holy]]
x[257] = "Int > Mast > Crit > Haste > Vers"
--[[ Priest Shadow]]
x[258] = "Haste > Crit >= Mast > Vers > Int"

--[[ Rogue Assassination]]
x[259] = "標準：Agi > Mast > Vers > Crit > Haste \n放血：Agi > Vers > Crit > Mast > Haste"
--[[ Rogue Outlaw]]
x[260] = "Agi > Vers > Haste > Crit > Mast"
--[[ Rogue Subtlety]]
x[261] = "Agi > Mast > Vers > Crit > Haste"

--[[ Shaman Elemental]]
x[262] = "冰怒：Int > Crit > Mast > Vers > Haste \n卓越術：Int > Mast >= Crit > Haste > Vers"
--[[ Shaman Enhancement]]
x[263] = "Haste = Mast > Agi > Vers > Crit"
--[[ Shaman Restoration]]
x[264] = "Int > Mast > Crit > Vers > Haste"

--[[ Warlock Affliction]]
x[265] = "Mast > Haste > Crit > Vers > Int"
--[[ Warlock Demonology]]
x[266] = "Haste > Int > Crit = Mast > Vers"
--[[ Warlock Destruction]]
x[267] = "Haste > Crit > Int > Vers > Mast"

--[[ Warrior Arms]]
x[71] = "Mast > Haste > Vers > Str > Crit"
--[[ Warrior Fury]]
x[72] = "Haste > Mast > Vers > Str > Crit >"
--[[ Warrior Protection]]
x[73] = "Str > Haste > Mast >= Vers > Crit > Stam"

--[[ Demon Hunter Havoc]]
x[577] = "Crit > Haste > Vers > Agi > Mast"
--[[ Demon Hunter Vengeance]]
x[581] = "生存能力：Agi > Vers > Mast >= Haste > Crit \n最大輸出：Agi > Crit >= Vers >= Mast >= Haste \n5人副本：Agi > Mast > Vers > Haste > Crit"
stats_Table = x
