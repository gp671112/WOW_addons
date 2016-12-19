-- Talent Set Manager
-- by Jadya - EU Well of Eternity

local addonName, addonTable = ...

local locale = GetLocale()
addonTable.L = {}
local L = addonTable.L

local debug
--[===[@debug@
debug = true
--@end-debug@]===]
 
if debug then
 L["set_already_exists"] = "A talent set with that name already exists"
 L["sets_limit_reached"] = "You cannot create any more new talent sets."
 L["confirm_save_set"] = "Would you like to save the talent set '%s'?"
 L["confirm_delete_set"] = "Are you sure you want to delete the talent set %s?"
 L["confirm_overwrite_set"] = "You already have a talent set named %s. Would you like to overwrite it?"
 L["link_equipment"] = "Link Equipment"
 L["current_equipment"] = "Current: %s"
 L["equipment_menu_title1"] = "Select an equipment set to be equipped"
 L["equipment_menu_title2"] = "along with this set of talents:"
 L["equipment_not_found"] = "The equipment set %s was not found and has been unlinked from the talent set %s"
 L["no_talent_sets"] = "No %s talent sets available"
 L["macro_comment"] = "automatically generated, do not modify"
 L["macro_limit_reached"] = "Macro limit reached"
 L["custom_macro_desc_lc"] = "|cff00ffffLeft-Click|r for more info."
 L["custom_macro_desc_rc"] = "|cff00ffffRight-Click|r this button to delete the macro"
 L["custom_macro_desc1"] = "To be used in actionbars, a talent set needs its own macro."
 L["custom_macro_desc2"] = "Dragging the talent set, automatically creates it in your character macros."
 L["not_available_in_combat"] = "Not available in combat"
 L["help_title1"] = "Right click to ignore tiers"
 L["help_string1"] = "By right-clicking on any talent in the Talent Frame, its tier's background will become red and will not be saved when clicking the save button. When learning a set containing ignored tiers, only the talents on the available tiers (i.e. the ones that don't have a red background) will be changed."
 L["talents_changed"] = "Talents Changed"
 
 L["options_talent_highlight_icon"] = "Talent Highlight Icon"
 L["options_chat_filter"] = "Talent chat message filter"
 L["options_chat_filter_show"] = "Do not filter"
 L["options_chat_filter_group"] = "Group into a single line"
 L["options_chat_filter_hide"] = "Hide entirely"
 L["options_ignored_tiers_background_color"] = "Ignored tiers background color"
 L["options_hide_info_button"] = "Hide Info Button"
 
 -- new
 return
end

if locale == "zhTW" then 
L["confirm_delete_set"] = "你確定要刪除此天賦設定 %s嗎？"
L["confirm_overwrite_set"] = "你已經有個天賦設定名為 %s，你想要覆寫它嗎？"
L["confirm_save_set"] = "你想要儲存天賦設定'%s'嗎？"
L["current_equipment"] = "目前：%s"
L["custom_macro_desc1"] = "要使用在快捷列上，一個天賦設定需要有它自己的巨集。"
L["custom_macro_desc2"] = "拖曳此天賦設定，自動建立你角色專屬的巨集。"
L["custom_macro_desc_lc"] = "|cff00ffff左鍵點擊|r獲得更多資訊。"
L["custom_macro_desc_rc"] = "|cff00ffff右鍵點擊|r此按鈕以刪除巨集"
L["equipment_menu_title1"] = "選擇一個套裝設定來裝備"
L["equipment_menu_title2"] = "天賦單獨的套裝設定："
L["equipment_not_found"] = "此套裝設定 %s 沒找到並且未連結至天賦 %s"
L["help_string1"] = "在天賦視窗中藉由右鍵點擊任何天賦，它的套裝背景將會變回紅色並且按下儲存按鈕也不會儲存。當學習一個設定包含忽略的套裝，只有此天賦有可用的套裝 (例如：有一個設定沒有紅色背景的)會被更換。"
L["help_title1"] = "右鍵點擊來忽略套裝"
L["link_equipment"] = "連結裝備"
L["macro_comment"] = "已自動生成，請勿修改"
L["macro_limit_reached"] = "巨集限制已達"
L["no_talent_sets"] = "無 %s 天賦設定可用"
L["not_available_in_combat"] = "戰鬥中不可使用"
L["options_chat_filter"] = "天賦聊天訊息過濾"
L["options_chat_filter_group"] = "群組縮為單行"
L["options_chat_filter_hide"] = "完全隱藏"
L["options_chat_filter_show"] = "不過濾"
L["options_hide_info_button"] = "隱藏資訊按鈕"
L["options_ignored_tiers_background_color"] = "忽略套裝背景顏色"
L["options_talent_highlight_icon"] = "天賦高亮圖示"
L["set_already_exists"] = "此天賦設定的名稱已經存在"
L["sets_limit_reached"] = "你不能在創建更多新天賦設定。"
L["talents_changed"] = "天賦已改變"

else -- enUS
L["confirm_delete_set"] = "Are you sure you want to delete the talent set %s?"
L["confirm_overwrite_set"] = "You already have a talent set named %s. Would you like to overwrite it?"
L["confirm_save_set"] = "Would you like to save the talent set '%s'?"
L["current_equipment"] = "Current: %s"
L["custom_macro_desc1"] = "To be used in actionbars, a talent set needs its own macro."
L["custom_macro_desc2"] = "Dragging the talent set, automatically creates it in your character macros."
L["custom_macro_desc_lc"] = "|cff00ffffLeft-Click|r for more info."
L["custom_macro_desc_rc"] = "|cff00ffffRight-Click|r this button to delete the macro"
L["equipment_menu_title1"] = "Select an equipment set to be equipped"
L["equipment_menu_title2"] = "along with this set of talents:"
L["equipment_not_found"] = "The equipment set %s was not found and has been unlinked from the talent set %s"
L["help_string1"] = "By right-clicking on any talent in the Talent Frame, its tier's background will become red and will not be saved when clicking the save button. When learning a set containing ignored tiers, only the talents on the available tiers (i.e. the ones that don't have a red background) will be changed."
L["help_title1"] = "Right click to ignore tiers"
L["link_equipment"] = "Link Equipment"
L["macro_comment"] = "automatically generated, do not modify"
L["macro_limit_reached"] = "Macro limit reached"
L["no_talent_sets"] = "No %s talent sets available"
L["not_available_in_combat"] = "Not available in combat"
L["options_chat_filter"] = "Talent chat message filter"
L["options_chat_filter_group"] = "Group into a single line"
L["options_chat_filter_hide"] = "Hide entirely"
L["options_chat_filter_show"] = "Do not filter"
L["options_hide_info_button"] = "Hide Info Button"
L["options_ignored_tiers_background_color"] = "Ignored tiers background color"
L["options_talent_highlight_icon"] = "Talent Highlight Icon"
L["set_already_exists"] = "A talent set with that name already exists"
L["sets_limit_reached"] = "You cannot create any more new talent sets."
L["talents_changed"] = "Talents Changed"

end