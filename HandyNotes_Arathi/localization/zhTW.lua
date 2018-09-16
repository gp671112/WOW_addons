local _L = LibStub("AceLocale-3.0"):NewLocale("HandyNotes_Arathi", "zhTW")

if not _L then return end

if _L then

--
-- DATA
--

--
--    READ THIS BEFORE YOU TRANSLATE !!!
-- 
--    DO NOT TRANSLATE THE RARE NAMES HERE UNLESS YOU HAVE A GOOD REASON!!!
--    FOR EU KEEP THE RARE PART AS IT IS. CHINA & CO MAY NEED TO ADJUST!!!
--
--    _L["Rarename_search"] must have at least 2 Elements! First is the hardfilter, >=2nd are softfilters
--    Keep the hardfilter as general as possible. If you must, set it to "".
--    These Names are only used for the Group finder!
--    Tooltip names are already localized!
--
_L["Alliance only"] = "聯盟專用";
_L["Horde only"] = "部落專用";
_L["In cave"] = "在洞穴內";

_L["Pet"] = "寵物";
_L["(Mount known)"] = "(|cFF00FF00已收藏的坐騎|r)";
_L["(Mount missing)"] = "(|cFFFF0000未收藏的坐騎|r)";
_L["(Toy known)"] = "(|cFF00FF00已收藏的玩具|r)";
_L["(Toy missing)"] = " (|cFFFF0000未收藏的玩具|r)";
_L["(itemLinkGreen)"] = "(|cFF00FF00%s|r)";
_L["(itemLinkRed)"] = "(|cFFFF0000%s|r)";
_L["Retrieving data ..."] = "正在取得資料 ...";

_L["context_menu_title"] = "地圖標記 - 阿拉希高地寶藏";
_L["context_menu_add_tomtom"] = "新增 TomTom 導航路線";
_L["context_menu_hide_node"] = "隱藏這個點";
_L["context_menu_restore_hidden_nodes"] = "恢復所有隱藏的點";

_L["options_title"] = "阿拉希高地寶藏";

_L["options_icon_settings"] = "圖示設定";
_L["options_icon_settings_desc"] = "圖示設定";
_L["options_icons_treasures"] = "寶藏圖示";
_L["options_icons_treasures_desc"] = "寶藏圖示";
_L["options_icons_rares"] = "稀有怪圖示";
_L["options_icons_rares_desc"] = "稀有怪圖示";
_L["options_icons_caves"] = "洞穴圖示";
_L["options_icons_caves_desc"] = "洞穴圖示";
_L["options_icons_pet_battles"] = "寵物對戰圖示";
_L["options_icons_pet_battles_desc"] = "寵物對戰圖示";
_L["options_scale"] = "大小";
_L["options_scale_desc"] = "1 = 100%";
_L["options_opacity"] = "透明度";
_L["options_opacity_desc"] = "0 = 透明, 1 = 不透明";
_L["options_visibility_settings"] = "選擇要顯示什麼";
_L["options_visibility_settings_desc"] = "選擇要顯示什麼";
_L["Arathi"] = "阿拉希";
_L["options_toggle_treasures"] = "顯示寶藏";
_L["options_toggle_rares"] = "顯示稀有怪";
_L["options_toggle_battle_pets"] = "顯示戰寵";
_L["options_toggle_npcs"] = "顯示 NPC";
_L["options_toggle_caves"] = "顯示洞穴";
_L["options_general_settings"] = "一般";
_L["options_general_settings_desc"] = "一般";
_L["options_toggle_alreadylooted_rares"] = "已拾取過的稀有怪";
_L["options_toggle_alreadylooted_rares_desc"] = "顯示每個稀有怪，不論是否已經拾取過。";
_L["options_toggle_alreadylooted_treasures"] = "已拾取過的寶藏";
_L["options_toggle_alreadylooted_treasures_desc"] = "顯示每個寶藏，不論是否已經拾取過。";
_L["options_tooltip_settings"] = "滑鼠提示";
_L["options_tooltip_settings_desc"] = "滑鼠提示";
_L["options_toggle_show_loot"] = "顯示戰利品";
_L["options_toggle_show_loot_desc"] = "在滑鼠提示中顯示掉落物品資訊";
_L["options_toggle_show_notes"] = "顯示註記";
_L["options_toggle_show_notes_desc"] = "在滑鼠提示中顯示有用的註記，如果有的話。";

_L["options_general_settings"] = "一般";
_L["options_general_settings_desc"] = "一般設定";

_L["options_toggle_show_debug"] = "除錯";
_L["options_toggle_show_debug_desc"] = "顯示除錯資訊";

_L["options_toggle_hideKnowLoot"] = "隱藏戰利品都已收藏的稀有怪";
_L["options_toggle_hideKnowLoot_desc"] = "如果稀有怪掉落的所有物品都已經收藏，隱藏這些稀有怪。";

end