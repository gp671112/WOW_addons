--------------------------------------- 聊天物品前增加ICON-- @Author:M---------------------------------------生成新的ICON超链接local function GetHyperlink(Hyperlink, texture)    if (not texture) then        return Hyperlink    else        return " |T"..texture..":0|t" .. Hyperlink    endend--等级图标显示local function SetChatLinkIcon(Hyperlink)    local schema, id = string.match(Hyperlink, "|H(%w+):(%d+):")    local texture    if (schema == "item") then        texture = select(10, GetItemInfo(tonumber(id)))    elseif (schema == "spell") then        texture = select(3, GetSpellInfo(tonumber(id)))    elseif (schema == "achievement") then        texture = select(10, GetAchievementInfo(tonumber(id)))    end    return GetHyperlink(Hyperlink, texture)end--过滤器local function filter(self, event, msg, ...)    msg = msg:gsub("(|H%w+:%d+:.-|h.-|h)", SetChatLinkIcon)    return false, msg, ...endChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", filter)ChatFrame_AddMessageEventFilter("CHAT_MSG_SAY", filter)ChatFrame_AddMessageEventFilter("CHAT_MSG_YELL", filter)ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER", filter)ChatFrame_AddMessageEventFilter("CHAT_MSG_BN_WHISPER", filter)ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER_INFORM", filter)ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID", filter)ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID_LEADER", filter)ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY", filter)ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY_LEADER", filter)ChatFrame_AddMessageEventFilter("CHAT_MSG_GUILD", filter)ChatFrame_AddMessageEventFilter("CHAT_MSG_BATTLEGROUND", filter)ChatFrame_AddMessageEventFilter("CHAT_MSG_LOOT", filter)