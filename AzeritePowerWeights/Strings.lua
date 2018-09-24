--[[----------------------------------------------------------------------------
	AzeritePowerWeights

	Helps you pick the best Azerite powers on your gear for your class and spec.

	(c) 2018 -
	Sanex @ EU-Arathor / ahak @ Curseforge
----------------------------------------------------------------------------]]--
local ADDON_NAME, n = ...

local _G = _G
local L = {}
n.L = L

local LOCALE = GetLocale()
do -- enUS / enGB
	-- Data.lua
	L.DefaultScaleName_Default = "Default"
	L.DefaultScaleName_Defensive = "Defensive"
	L.DefaultScaleName_Offensive = "Offensive"

	-- UI.lua
	L.ScaleWeightEditor_Title = "%s Scale Weight Editor" -- %s = ADDON_NAME

	-- Core.lua
	L.ScalesList_CustomGroupName = "Custom Scales"
	L.ScalesList_DefaultGroupName = "Default Scales"
	L.ScalesList_CreateImportText = "Create New / Import"

	L.ScaleName_Unnamed = "Unnamed"
	L.ScaleName_Unknown = "Unknown"

	L.ExportPopup_Title = "Export Scale"
	L.ExportPopup_Desc = "Exporting scale %1$s\nPress %2$sCtrl+C%3$s to copy the string and %4$sCtrl+V%5$s to paste it somewhere" -- %1$s = scaleName, rest are color codes

	L.ImportPopup_Title = "Import Scale"
	L.ImportPopup_Desc = "Importing scale from string\nPress %1$sCtrl+V%2$s to paste string to the editbox and press %3$s" -- %1$s and %2$s are color codes and %3$s = _G.ACCEPT
	L.ImportPopup_Error_OldStringVersion = "ERROR: \"Import string\" -version is too old or malformed import string!"
	L.ImportPopup_Error_MalformedString = "ERROR: Malformed import string!"
	L.ImportPopup_UpdatedScale = "Updated existing scale \"%s\"" -- %s = scaleName
	L.ImportPopup_CreatedNewScale = "Imported new scale \"%s\"" -- %s = scaleName

	L.CreatePopup_Title = "Create Scale"
	L.CreatePopup_Desc = "Creating new scale. Select class and specialization from dropdown and then enter name for the new scale and press %1$s" -- %s = _G.ACCEPT
	L.CreatePopup_Error_UnknownError = "ERROR: Something went wrong creating new scale \"%s\"!" -- %s = scaleName
	L.CreatePopup_Error_CreatedNewScale = "Created new scale \"%s\"" -- %s = scaleName

	L.RenamePopup_Title = "Rename Scale"
	L.RenamePopup_Desc = "Renaming scale %1$s\nEnter new name to the editbox and press %2$s" -- %1$s = old (current) scaleName, %2$s = _G.ACCEPT
	L.RenamePopup_RenamedScale = "Renamed scale \"%1$s\" to \"%2$s\"" -- %1$s = old scaleName, %2$s = new scaleName

	L.DeletePopup_Title = "Delete Scale"
	L.DeletePopup_Desc = "Deleting scale %1$s\nPress %2$s to confirm.\nAll characters using this scale for their specialization will be reverted back to Default scale." -- %1$s = scaleName, %2$s = _G.ACCEPT
	L.DeletePopup_Warning = " ! This action is permanent and cannot be reversed ! "
	L.DeletePopup_DeletedScale = "Deleted scale \"%s\"" -- %s = scaleName
	L.DeletePopup_DeletedDefaultScale = "Deleted scale was in use, reverting back to Default-option for your class and specialization!"

	L.WeightEditor_VersionText = "Version %s" -- %s = version
	L.WeightEditor_CreateNewText = "Create New"
	L.WeightEditor_ImportText = "Import"
	L.WeightEditor_EnableScaleText = "Use this Scale"
	L.WeightEditor_ExportText = "Export"
	L.WeightEditor_RenameText = "Rename"
	L.WeightEditor_DeleteText = "Delete"
	L.WeightEditor_TooltipText = "Show in Tooltips"
	L.WeightEditor_CurrentScale = "Current scale: %s" -- %s current scaleName

	L.PowersTitles_Class = "Class Powers"
	L.PowersTitles_Defensive = "Defensive Powers"
	L.PowersTitles_Role = "Role Powers"
	L.PowersTitles_Zone = "Raid and Zone Powers"
	L.PowersTitles_Profession = "Profession Powers"
	L.PowersTitles_PvP = "PvP Powers"

	L.PowersScoreString = "Current score: %1$s/%2$s\nMaximum score: %3$s\nAzerite level: %4$d/%5$d" -- %1$s = currentScore, %2$s = currentPotential, %3$s = maximumScore, %4$d = currentLevel, %5$d = maxLevel
	L.ItemToolTip_AzeriteLevel = "Azerite level: %1$d / %2$d" -- %1$d = currentLevel, %2$d = maxLevel

	L.Config_SettingsSavedPerChar = "All these settings here are saved per character.\nCustom scales are shared between all characters."

	L.Config_Scales_Title = "Scales list"
	L.Config_Scales_Desc = "Following settings only affects the list of Default scales. All Custom scales will be always listed to every class."
	L.Config_Scales_OwnClassDefaultsOnly = "List own class Default-scales only"
	L.Config_Scales_OwnClassDefaultsOnly_Desc = "List Default-scales for your own class only, instead of listing all of them."

	L.Config_Importing_Title = "Importing"
	L.Config_Importing_ImportingCanUpdate = "Importing can update existing scales"
	L.Config_Importing_ImportingCanUpdate_Desc = "When importing scale with same name, class and specialization as pre-existing scale, existing scale will be updated with the new weights instead of creating new scale."
	L.Config_Importing_ImportingCanUpdate_Desc_Clarification = "There can be multiple scales with same name as long as they are for different specializations or classes."

	L.Config_WeightEditor_Title = "Scales weight editor"
	L.Config_WeightEditor_Desc = "Following settings only affects the powers shown in the scale weight editor. Even if you disable them, all and any Azerite powers will be still scored if they have weight set to them in the active scale."
	L.Config_WeightEditor_ShowDefensive = "Show Defensive powers"
	L.Config_WeightEditor_ShowDefensive_Desc = "Show common and class specific Defensive powers in the scale weight editor."
	L.Config_WeightEditor_ShowRole = "Show Role specific powers"
	L.Config_WeightEditor_ShowRole_Desc = "Show Role specific powers in the scale weight editor."
	L.Config_WeightEditor_ShowRolesOnlyForOwnSpec = "Show Role specific powers only for my own specializations role"
	L.Config_WeightEditor_ShowRolesOnlyForOwnSpec_Desc = "Show common and current specialization related specific Role specific powers in the scale weight editor. Enabling this setting e.g. hides healer only specific powers from damagers and tanks etc."
	L.Config_WeightEditor_ShowZone = "Show Zone specific powers"
	L.Config_WeightEditor_ShowZone_Desc = "Show Zone specific powers in the scale weight editor. These powers can only appear in items acquired in particular zones related to the power."
	L.Config_WeightEditor_ShowZone_Desc_Proc = "Zone specific powers can activate/proc everywhere, but raid powers have secondary effect which will activate only while inside their related raid instance (e.g. Uldir powers secondary effect will only proc while inside Uldir raid instance).\nRaid powers are marked with an asterisk (*) next to their name in the scale weight editor."
	L.Config_WeightEditor_ShowProfession = "Show Profession specific powers"
	L.Config_WeightEditor_ShowProfession_Desc = "Show Profession specific powers in the scale weight editor. These powers can only appear in items created with professions. Currently these can only appear in Engineering headgear."
	L.Config_WeightEditor_ShowPvP = "Show PvP specific powers"
	L.Config_WeightEditor_ShowPvP_Desc = "Show PvP specific powers in the scale weight editor. You'll only see your own factions powers, but changes made to them will be mirrored to both factions."
	L.Config_WeightEditor_ShowPvP_Desc_Import = "When Exporting, the resulting export-string will only include your own factions pvp powers, but they are interchangeable with opposing factions pvp-powerIDs.\nWhen Importing import-string with pvp powers only from one faction, powers will get their weights mirrored to both factions on Import."

	L.Config_Score_Title = "Score"
	L.Config_Score_AddItemLevelToScore = "Add itemlevel to all scores"
	L.Config_Score_AddItemLevelToScore_Desc = "Add Azerite items itemlevel to all current score, current potential and maximum score calculations."
	L.Config_Score_ScaleByAzeriteEmpowered = "Scale itemlevel score by the weight of %s in the scale" -- %s Name of Azerite Empowered, returned by _G.GetSpellInfo(263978)
	L.Config_Score_ScaleByAzeriteEmpowered_Desc = "When adding itemlevel to the scores, use the weight of %s of the scale to calculate value of +1 itemlevel instead of using +1 itemlevel = +1 score." -- %s Name of Azerite Empowered, returned by _G.GetSpellInfo(263978)
	L.Config_Score_RelativeScore = "Show relative values in tooltips instead of absolute values"
	L.Config_Score_RelativeScore_Desc = "Instead of showing absolute values of scales in tooltips, calculate the relative value compared to currently equiped items and show them in percentages."
	L.Config_Score_ShowOnlyUpgrades = "Show tooltips only for upgrades"
	L.Config_Score_ShowOnlyUpgrades_Desc = "Show scales values in tooltips only if it is an upgrade compared to currently equiped item. This works only with relative values enabled."

	L.Slash_Command = "/azerite" -- If you need localized slash-command, this doesn't replace the existing /azerite
	L.Slash_RemindConfig = "Check ESC -> Interface -> AddOns -> %s for settings." -- %s = ADDON_NAME
	L.Slash_Error_Unkown = "ERROR: Something went wrong!"
end

if LOCALE == "zhCN" then -- plok245 (41), riggzh (36)
L["Config_Importing_ImportingCanUpdate"] = "导入覆盖现有配置"
L["Config_Importing_ImportingCanUpdate_Desc"] = "当导入配置名称相同并且职业专精一致时，将覆盖现有配置，而不是建立新配置。"
L["Config_Importing_ImportingCanUpdate_Desc_Clarification"] = "可以有多个同名配置，只要它们用于不同的专精或职业。"
L["Config_Importing_Title"] = "导入"
L["Config_Scales_Desc"] = "以下设置仅影响默认配置。所有自定义配置将在每个职业显示。"
L["Config_Scales_OwnClassDefaultsOnly"] = "只显示自己职业的默认配置"
L["Config_Scales_OwnClassDefaultsOnly_Desc"] = "只显示你自己职业的默认配置，而不是显示所有的默认配置。"
L["Config_Scales_Title"] = "配置列表"
L["Config_Score_AddItemLevelToScore"] = "将物品等级添加到所有分数中"
L["Config_Score_AddItemLevelToScore_Desc"] = "将艾泽里特护甲的物品等级添加到当前分数，当前可选最高分数，最大分数的计算中。"
--[[Translation missing --]]
--[[ L["Config_Score_RelativeScore"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_RelativeScore_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_ScaleByAzeriteEmpowered"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_ScaleByAzeriteEmpowered_Desc"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_ShowOnlyUpgrades"] = ""--]] 
--[[Translation missing --]]
--[[ L["Config_Score_ShowOnlyUpgrades_Desc"] = ""--]] 
L["Config_Score_Title"] = "分数"
L["Config_SettingsSavedPerChar"] = [=[这里的所有设置都是每个角色分开保存。
自定义配置则为所有角色共享。]=]
L["Config_WeightEditor_Desc"] = [=[以下设置只适用于显示在配置权重编辑器的特质。
即使你禁用了它们，如果它们在启用配置中设置了权重，所有的艾泽里特特质仍会计算分数。]=]
L["Config_WeightEditor_ShowDefensive"] = "显示防御性特质"
L["Config_WeightEditor_ShowDefensive_Desc"] = "在配置权重编辑器中显示通用与职业特定的防御性特质。"
L["Config_WeightEditor_ShowProfession"] = "显示专业技能专有特质"
L["Config_WeightEditor_ShowProfession_Desc"] = "在配置权重编辑器中显示专业技能专有特质。这些特质只会出现在专业技能制造的装备中。目前只有工程头。"
L["Config_WeightEditor_ShowPvP"] = "显示PvP专有特质"
L["Config_WeightEditor_ShowPvP_Desc"] = "在配置权重编辑器中显示PvP专有特质。你只会看到自己的阵营特质，但对它们进行更改会应用到双方阵营特质。"
L["Config_WeightEditor_ShowPvP_Desc_Import"] = [=[当导出生成的字符串时，只包含你自己阵营的PvP特质，但它们可以与对立阵营PvP特质ID互换。
当导入一个具有PvP特质的字符串时，权重会镜像导入到双方阵营特质中。]=]
L["Config_WeightEditor_ShowRole"] = "显示角色专有特质"
L["Config_WeightEditor_ShowRole_Desc"] = "在配置权重编辑器中显示角色专有特质。"
L["Config_WeightEditor_ShowRolesOnlyForOwnSpec"] = "只显示自己专精职责的角色专有特质"
L["Config_WeightEditor_ShowRolesOnlyForOwnSpec_Desc"] = "在配置权重编辑器中显示通用与当前专精相关的角色专有特质。启用此设置的话，例如治疗专有特质将会在DPS与坦克上隐藏等。"
L["Config_WeightEditor_ShowZone"] = "显示区域专有特质"
L["Config_WeightEditor_ShowZone_Desc"] = "在配置权重编辑器中显示区域专有特质。这些特质只会出现在与特质相关的特定区域中获得的装备上。"
L["Config_WeightEditor_ShowZone_Desc_Proc"] = [=[普通特质可以在任何地方生效，但团本特质的部分效果只能在相应的团本内生效（例如：奥迪尔特质的[重组矩阵]效果只能在奥迪尔内生效）
团本特质将在配置权重编辑器的名称旁标有星号（*）]=]
L["Config_WeightEditor_Title"] = "配置权重编辑器"
L["CreatePopup_Desc"] = "创建新配置。请从下拉列表中选择职业和天赋，然后输入新配置的名称并点击%1$s"
L["CreatePopup_Error_CreatedNewScale"] = "创建新配置“%s”"
L["CreatePopup_Error_UnknownError"] = "错误：无法创建新配置“%s”"
L["CreatePopup_Title"] = "添加配置"
L["DefaultScaleName_Default"] = "默认"
L["DefaultScaleName_Defensive"] = "防御"
L["DefaultScaleName_Offensive"] = "输出"
L["DeletePopup_DeletedDefaultScale"] = "删除正在使用的配置，恢复职业和天赋为默认选项"
L["DeletePopup_DeletedScale"] = "删除配置“%s”"
L["DeletePopup_Desc"] = [=[正在删除配置“%1$s”
点击%2$s确认
所有使用此配置的职业和天赋将恢复默认]=]
L["DeletePopup_Title"] = "删除配置"
L["DeletePopup_Warning"] = "！这项操作是永久的且不可恢复！"
L["ExportPopup_Desc"] = [=[导出配置%1$s
点击%2$sCtrl+C%3$s复制字符串，%4$sCtrl+V%5$s在其他地方粘贴]=]
L["ExportPopup_Title"] = "导出配置"
L["ImportPopup_CreatedNewScale"] = "导入新配置“%s”"
L["ImportPopup_Desc"] = [=[正在从字符串导入配置
按下 %1$sCtrl+V%2$s 来粘贴字符串到编辑框并点击 %3$s]=]
L["ImportPopup_Error_MalformedString"] = "错误：导入的字符串格式错误"
L["ImportPopup_Error_OldStringVersion"] = "错误：\"导入字符串\" -版本太旧或是导入字符串格式错误！"
L["ImportPopup_Title"] = "导入配置"
L["ImportPopup_UpdatedScale"] = "更新现有的配置 \"%s\""
L["ItemToolTip_AzeriteLevel"] = "艾泽里特等级: %1$d / %2$d"
L["PowersScoreString"] = [=[当前分数: %1$s/%2$s
最大分数: %3$s
艾泽里特等级: %4$d/%5$d]=]
L["PowersTitles_Class"] = "职业特质"
L["PowersTitles_Defensive"] = "防御性特质"
L["PowersTitles_Profession"] = "专业技能特质"
L["PowersTitles_PvP"] = "PvP特质"
L["PowersTitles_Role"] = "角色特质"
L["PowersTitles_Zone"] = "团本与通用特质"
L["RenamePopup_Desc"] = [=[正在重命名配置 %1$s
在编辑框中输入新名称并按下 %2$s]=]
L["RenamePopup_RenamedScale"] = "已重命名配置 \"%1$s\" 为 \"%2$s\""
L["RenamePopup_Title"] = "重命名配置"
L["ScaleName_Unknown"] = "未知"
L["ScaleName_Unnamed"] = "未命名"
L["ScalesList_CreateImportText"] = "新建/导入"
L["ScalesList_CustomGroupName"] = "自定义配置"
L["ScalesList_DefaultGroupName"] = "默认配置"
L["ScaleWeightEditor_Title"] = "%s 配置权重编辑器"
L["Slash_Command"] = "/azerite"
L["Slash_Error_Unkown"] = "错误：出现一些错误！"
L["Slash_RemindConfig"] = "到 ESC -> 界面 -> 插件 -> %s 来设置"
L["WeightEditor_CreateNewText"] = "新建"
L["WeightEditor_CurrentScale"] = "当前配置：%s"
L["WeightEditor_DeleteText"] = "删除"
L["WeightEditor_EnableScaleText"] = "启用配置"
L["WeightEditor_ExportText"] = "导出"
L["WeightEditor_ImportText"] = "导入"
L["WeightEditor_RenameText"] = "重命名"
L["WeightEditor_TooltipText"] = "在鼠标提示中显示"
L["WeightEditor_VersionText"] = "版本 %s"


elseif LOCALE == "zhTW" then -- BNSSNB (82), Sinusquell (1)
L["Config_Importing_ImportingCanUpdate"] = "導入可以更新現有比重"
L["Config_Importing_ImportingCanUpdate_Desc"] = "當導入具有相同名稱，職業和專精的比重作為預先存在的比重時，現有比重將使用新權值更新，而不是建立新比重。"
L["Config_Importing_ImportingCanUpdate_Desc_Clarification"] = "可以有多個具有相同名稱的比重，只要它們用於不同的專精或職業。"
L["Config_Importing_Title"] = "導入"
L["Config_Scales_Desc"] = "以下設置僅影響清單的預設比重。所有自訂比重將在每個職業列出。"
L["Config_Scales_OwnClassDefaultsOnly"] = "只列出自己職業的預設比重"
L["Config_Scales_OwnClassDefaultsOnly_Desc"] = "只列出你自己職業的預設比重，而非列出所有。"
L["Config_Scales_Title"] = "比重清單"
L["Config_Score_AddItemLevelToScore"] = "添加物品等級到所有分數"
L["Config_Score_AddItemLevelToScore_Desc"] = "添加艾澤萊護甲的物品等級到所有當前分數，當前潛力與最高分數計算。"
L["Config_Score_RelativeScore"] = "在工具提示中顯示相對值而不是絕對值"
L["Config_Score_RelativeScore_Desc"] = "不是在工具提示中顯示比重的絕對值，而是計算與當前裝備物品相比的相對值，並以百分比顯示差異。"
L["Config_Score_ScaleByAzeriteEmpowered"] = "按比重中的％s權值縮放物品等級計分"
L["Config_Score_ScaleByAzeriteEmpowered_Desc"] = "將物品等級計入到分數時，使用比重的％s的權值來計算+1物品等級的值，而不是使用+1物品等級 = +1分數。"
L["Config_Score_ShowOnlyUpgrades"] = "只顯示有升級的工具提示"
L["Config_Score_ShowOnlyUpgrades_Desc"] = "只有在與當前裝備的物品相比是升級時，才顯示工具提示中的比重值。 這僅適用於啟用了相對值。"
L["Config_Score_Title"] = "分數"
L["Config_SettingsSavedPerChar"] = [=[這裡所有設置都是每個角色分開儲存。
自訂比重則為所有角色共享。]=]
L["Config_WeightEditor_Desc"] = [=[以下設置只適用於顯示在比重權值編輯器的特質。
即使你停用了它們，如果它們在啟用比重中設置了權值，所有的艾澤萊特質仍會計算分數。]=]
L["Config_WeightEditor_ShowDefensive"] = "顯示防禦性特質"
L["Config_WeightEditor_ShowDefensive_Desc"] = "在比重權值編輯器中顯示通用與職業特定的防禦性特質。"
L["Config_WeightEditor_ShowProfession"] = "顯示專業技能專有特質"
L["Config_WeightEditor_ShowProfession_Desc"] = "在比重權值編輯器中顯示專業技能專有特質。這些特質只會出現在專業技能製作物品中。目前只有出現在工程學頭部裝備。"
L["Config_WeightEditor_ShowPvP"] = "顯示PvP專有特質"
L["Config_WeightEditor_ShowPvP_Desc"] = "在比重權值編輯器中顯示PvP專有特質。你只會看到自己的陣營特質，但對它們做的變動會反映到雙方陣營。"
L["Config_WeightEditor_ShowPvP_Desc_Import"] = [=[當導出生成的字串時，只包含你自己陣營的PvP特質，但它們可以與對立的陣營pvp-powerID互換。
當從一個陣營導入具有pvp特質的字串時，特質會將其權值鏡像導入到雙方陣營。]=]
L["Config_WeightEditor_ShowRole"] = "顯示角色類型專有特質"
L["Config_WeightEditor_ShowRole_Desc"] = "在比重權值編輯器中顯示角色類型專有特質。"
L["Config_WeightEditor_ShowRolesOnlyForOwnSpec"] = "只顯示我自己專精職責的角色類型專有特質"
L["Config_WeightEditor_ShowRolesOnlyForOwnSpec_Desc"] = "在比重權值編輯器中顯示共通與當前專精相關的角色類型專有特質。啟用此設置的話像是治療專有專精將會在傷害與坦克上隱藏等等。"
L["Config_WeightEditor_ShowZone"] = "顯示區域專有特質"
L["Config_WeightEditor_ShowZone_Desc"] = "在比重權值編輯器中顯示區域專有特質。這些特質只會出現在與特質相關特定區域中獲得的物品上。"
L["Config_WeightEditor_ShowZone_Desc_Proc"] = [=[正常區域專有特質可以在任何地方啟動/觸發，但團隊特質只會在與它們相關的團隊副本中進行(例如：奧杜爾特質只會在奧杜爾團隊副本中觸發)。
團隊特質在比重權值編輯器中的名稱旁標有星號(*)。]=]
L["Config_WeightEditor_Title"] = "比重權值編輯器"
L["CreatePopup_Desc"] = "建立新的比重。從下拉選單選擇職業與專精並輸入新比重的名稱然後按下 %1$s"
L["CreatePopup_Error_CreatedNewScale"] = "已建立新比重 \"%s\""
L["CreatePopup_Error_UnknownError"] = "錯誤：建立新比重“％s”出了點問題！"
L["CreatePopup_Title"] = "建立比重"
L["DefaultScaleName_Default"] = "預設"
L["DefaultScaleName_Defensive"] = "防禦性"
L["DefaultScaleName_Offensive"] = "攻擊性"
L["DeletePopup_DeletedDefaultScale"] = "刪除的比重正在使用中，恢復為您的職業和專精的預設選項！"
L["DeletePopup_DeletedScale"] = "已刪除比重 \"%s\""
L["DeletePopup_Desc"] = [=[正刪除比重 %1$s
按下 %2$s 以確認。
所有使用此專精比重的角色將恢復為預設比重。]=]
L["DeletePopup_Title"] = "刪除比重"
L["DeletePopup_Warning"] = "！ 這個動作是永久性的，無法逆轉！"
L["ExportPopup_Desc"] = [=[正導出比重 %1$s
按下 %2$sCtrl+C%3$s 來複製字串並且 %4$sCtrl+V%5$s 來貼上到某處]=]
L["ExportPopup_Title"] = "導出比重"
L["ImportPopup_CreatedNewScale"] = "導入新的比重 \"%s\""
L["ImportPopup_Desc"] = [=[正從字串導入比重
按下 %1$sCtrl+V%2$s 來貼上字串到編輯框並按下 %3$s]=]
L["ImportPopup_Error_MalformedString"] = "錯誤：導入的字串格式錯誤"
L["ImportPopup_Error_OldStringVersion"] = "錯誤：\"導入字串\" -版本太舊或是導入字串格式錯誤！"
L["ImportPopup_Title"] = "導入比重"
L["ImportPopup_UpdatedScale"] = "更新現有的比重 \"%s\""
L["ItemToolTip_AzeriteLevel"] = "艾澤萊等級: %1$d / %2$d"
L["PowersScoreString"] = [=[當前分數: %1$d/%2$d
最大分數: %3$d
艾澤萊等級: %4$d/%5$d]=]
L["PowersTitles_Class"] = "職業特質"
L["PowersTitles_Defensive"] = "防禦性特質"
L["PowersTitles_Profession"] = "專業技能特質"
L["PowersTitles_PvP"] = "PvP特質"
L["PowersTitles_Role"] = "角色類型特質"
L["PowersTitles_Zone"] = "團隊與區域特質"
L["RenamePopup_Desc"] = [=[正重新命名比重 %1$s
在編輯框中輸入新名稱並按下 %2$s]=]
L["RenamePopup_RenamedScale"] = "已重命名比重 \"%1$s\" 為 \"%2$s\""
L["RenamePopup_Title"] = "重命名比重"
L["ScaleName_Unknown"] = "未知"
L["ScaleName_Unnamed"] = "未命名"
L["ScalesList_CreateImportText"] = "建立新的 / 導入"
L["ScalesList_CustomGroupName"] = "自訂比重"
L["ScalesList_DefaultGroupName"] = "預設比重"
L["ScaleWeightEditor_Title"] = "%s 比重權值編輯器"
L["Slash_Command"] = "/azerite"
L["Slash_Error_Unkown"] = "錯誤：出了些問題了！"
L["Slash_RemindConfig"] = "到ESC -> 介面 -> 插件 -> %s來設置"
L["WeightEditor_CreateNewText"] = "建立新的"
L["WeightEditor_CurrentScale"] = "當前比重: %s"
L["WeightEditor_DeleteText"] = "刪除"
L["WeightEditor_EnableScaleText"] = "使用此比重"
L["WeightEditor_ExportText"] = "導出"
L["WeightEditor_ImportText"] = "導入"
L["WeightEditor_RenameText"] = "重命名"
L["WeightEditor_TooltipText"] = "在提示中顯示"
L["WeightEditor_VersionText"] = "版本 %s"


end

--#EOF
