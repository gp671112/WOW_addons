local me,ns=...
local lang=GetLocale()
local l=LibStub("AceLocale-3.0")
local L=l:NewLocale(me,"enUS",true,true)
L["Appearance"] = true
L["Assume Buckle on waist"] = true
L["Bottom Left"] = true
L["Bottom Right"] = true
L["Change colors and appearance"] = true
L["Choose a color scheme"] = true
L["Choose profile"] = true
L["Choose what is shown"] = true
L["Colorize level text by"] = true
L["Common profile for all characters"] = true
L["Current profile is: "] = true
L["Debug info"] = true
L["E"] = true
L["Gem frame position"] = true
L["itemlevel (green best)"] = true
L["itemlevel (red best)"] = true
L["Level text aligned to"] = true
L["none (plain white)"] = true
L["Options"] = true
L["Per character profile"] = true
L["Please, choose between global or per character profile"] = true
L["Position"] = true
L["quality"] = true
L["Show raw item info.Please post the screenshot to Curse Forum"] = true
L["Shows missing enchants"] = true
L["Shows number of empty socket"] = true
L["Shows total number of gems"] = true
L["Switch between global and per character profile"] = true
L["Top Left"] = true
L["Top Right"] = true
L["Total compatible gems/Total sockets"] = true
L["You can change this decision on a per character basis in configuration panel."] = true
L["You can now choose if you want all your character share the same configuration or not."] = true
L=l:NewLocale(me,"zhCN")
if (L) then
L["Appearance"] = "\\22806\\35266"
L["Assume Buckle on waist"] = "\\20551\\35774\\26377\\33136\\24102\\25187\\25554\\27133"
L["Bottom Left"] = "\\24038\\19979"
L["Bottom Right"] = "\\21491\\19979"
L["Change colors and appearance"] = "\\25913\\21464\\39068\\33394\\21450\\22806\\35266"
L["Choose a color scheme"] = "\\36873\\25321\\19968\\31181\\33394\\24425\\26041\\26696"
L["Choose profile"] = "\\36873\\25321\\37197\\32622\\25991\\20214"
L["Choose what is shown"] = "\\36873\\25321\\26174\\31034\\21738\\20123"
L["Colorize level text by"] = "\\31561\\32423\\25991\\23383\\30528\\33394\\25353\\29031"
L["Common profile for all characters"] = "\\25152\\26377\\35282\\33394\\20849\\29992\\37197\\32622"
L["Current profile is: "] = "\\24403\\21069\\37197\\32622\\25991\\20214\\65306"
L["Debug info"] = "\\35843\\35797\\20449\\24687"
L["E"] = true
L["Gem frame position"] = "\\23453\\30707\\32479\\35745\\31383\\21475\\20301\\32622"
L["itemlevel (green best)"] = "\\29289\\21697\\31561\\32423\\65288\\32511\\33394\\26368\\20339\\65289"
L["itemlevel (red best)"] = "\\29289\\21697\\31561\\32423\\65288\\32418\\33394\\26368\\20339\\65289"
L["Level text aligned to"] = "\\25991\\26412\\27700\\24179\\23545\\40784"
L["none (plain white)"] = "\\26080\\65288\\32431\\30333\\33394\\65289"
L["Options"] = "\\36873\\39033"
L["Per character profile"] = "\\27599\\20010\\35282\\33394\\29420\\31435\\37197\\32622"
L["Please, choose between global or per character profile"] = "\\35831\\36873\\25321\\20351\\29992\\20840\\23616\\20844\\29992\\37197\\32622\\25110\\27599\\20010\\35282\\33394\\29420\\31435\\37197\\32622"
L["Position"] = "\\20301\\32622"
L["quality"] = "\\21697\\36136"
L["Show raw item info.Please post the screenshot to Curse Forum"] = "\\26174\\31034\\21407\\22987\\29289\\21697\\20449\\24687. \\35831\\25552\\20132\\25130\\22270\\21040Curse\\35770\\22363"
L["Shows missing enchants"] = "\\26174\\31034\\20002\\22833\\30340\\38468\\39764"
L["Shows number of empty socket"] = "\\26174\\31034\\31354\\30340\\25554\\27133\\25968"
L["Shows total number of gems"] = "\\26174\\31034\\23453\\30707\\24635\\25968"
L["Switch between global and per character profile"] = "\\20999\\25442\\20351\\29992\\20840\\23616\\20844\\29992\\37197\\32622\\25110\\27599\\20010\\35282\\33394\\29420\\31435\\37197\\32622"
L["Top Left"] = "\\24038\\19978"
L["Top Right"] = "\\21491\\19978"
L["Total compatible gems/Total sockets"] = "\\24635\\20860\\23481\\23453\\30707\\25968/\\24635\\25554\\27133\\25968"
L["You can change this decision on a per character basis in configuration panel."] = "\\24744\\20173\\28982\\21487\\20197\\22522\\20110\\27599\\20010\\35282\\33394\\22312\\30028\\38754\\37197\\32622\\38754\\26495\\20013\\20877\\27425\\26356\\25913\\36825\\19968\\36873\\39033\\12290"
L["You can now choose if you want all your character share the same configuration or not."] = "\\24744\\29616\\22312\\21487\\20197\\36873\\25321\\65292\\26159\\21542\\24819\\35201\\25152\\26377\\30340\\35282\\33394\\20849\\29992\\30456\\21516\\37197\\32622\\12290"
return
end
L=l:NewLocale(me,"zhTW")
if (L) then
L["Appearance"] = "外觀"
L["Assume Buckle on waist"] = "假設扣在腰間"
L["Bottom Left"] = "左下"
L["Bottom Right"] = "右下"
L["Change colors and appearance"] = "改變顏色及外觀"
L["Choose a color scheme"] = "選擇一個著色方案"
L["Choose profile"] = "選擇設定檔"
L["Choose what is shown"] = "選擇顯示些什麼"
L["Colorize level text by"] = "著色等級文字依據"
L["Common profile for all characters"] = "所有角色通用的設定檔"
L["Current profile is: "] = "目前的設定檔是："
L["Debug info"] = "除錯資訊"
L["E"] = true
L["Gem frame position"] = "珠寶框架位置"
L["itemlevel (green best)"] = "物品等級(綠色最佳)"
L["itemlevel (red best)"] = "物品等級(紅色最佳)"
L["Level text aligned to"] = "等級文字對齊"
L["none (plain white)"] = "無（純白色）"
L["Options"] = "選項"
L["Per character profile"] = "個別角色設定檔"
L["Please, choose between global or per character profile"] = "請在全局與個別角色的設定檔中選擇"
L["Position"] = "位置"
L["quality"] = "品質"
L["Show raw item info.Please post the screenshot to Curse Forum"] = "顯示未經加工的物品資訊。請貼此擷圖到Curse討論區"
L["Shows missing enchants"] = "顯示缺少的附魔"
L["Shows number of empty socket"] = "顯示空的插槽數"
L["Shows total number of gems"] = "顯示珠寶總數量"
L["Switch between global and per character profile"] = "在全局與個別角色設定檔中切換"
L["Top Left"] = "左上"
L["Top Right"] = "右上"
L["Total compatible gems/Total sockets"] = "總相容寶石/總插座"
L["You can change this decision on a per character basis in configuration panel."] = "你可以在配置面板基於個別角色改變此決定。"
L["You can now choose if you want all your character share the same configuration or not."] = "現在你可以選擇是否要所有角色共享相同的配置。"
L["ItemLevelDisplay"] = "裝備欄物品等級"
L['Don\'t disply'] = "不顯示 (需要重新載入)"
L['Show iLevel on shirt and tabard'] = "顯示襯衣和外袍的等級"
L["Gem frame position"] = "寶石數目位置"
L["Please, choose between global or per character profile"] = "請選擇通用或個別角色的設定檔"
L['Top Center'] = "中間上方"
L['Bottom Center'] = "中間下方"
L["Please post this screenshot to curse, thanks"] = "請將這個畫面截圖貼到 Curse 網站，謝謝!"
L["Choose a font"] = "字型"
L["Choose a font size"] = "字型大小"
L["Choose a shadow"] = "陰影"
L["Options"] = "(O) 選項"
L["Appearance"] = "(A) 外觀"
L['Bags'] = "(B) 背包"
L['Manages itemlevel in bags'] = "管理背包中的物品等級"
L["Show iLevel in bags"] = "背包中顯示物品等級"
L['Will have full effect on NEXT reload'] = "需要重新載入才會生效"
L["Minimum shown iLevel"] = "要顯示的最低物品等級"
L["Items under this iLevel will not have the iLevel shown"] = "低於這個等級的物品將不會顯示物品等級"
L['Only show iLevel for selected classes'] = "只顯示下面所勾選物品的物品等級"
L["Add the expected ilevel for upgraded items"] = "為升等的物品新增正確的物品等級"
L["No shadow"] = "沒有陰影"
L["Light shadow"] = "一般陰影"
L["Strong shadow"] = "強烈陰影"
L["Enabling"] = "啟用"
L["Disabling"] = "停用"
return
end
