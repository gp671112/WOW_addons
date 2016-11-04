
--[[     Channel Name Replacements Module     ]]--

local _, BCM = ...
BCM.modules[#BCM.modules+1] = function()
	if bcmDB.BCM_ChannelNames then bcmDB.replacements = nil return end

	if not bcmDB.replacements then
		bcmDB.replacements = {
			"[綜]", --General
			"[交]", --Trade
			"[世防]", --WorldDefense
			"[本防]", --LocalDefense
			"[組]", --LookingForGroup
			"[募]", --GuildRecruitment
			"[副]", --Instance
			"[領]", --Instance Leader
			"[公]", --Guild
			"[隊]", --Party
			"[領]", --Party Leader
			"[領]", --Party Leader (Guide)
			"[幹]", --Officer
			"[團]", --Raid
			"[團長]", --Raid Leader
			"[團警]", --Raid Warning
			"[%1]", --Custom Channels
		}
	end

	local rplc = bcmDB.replacements
	local gsub = gsub
	local chn = {
		"%[%d0?%. General%]",
		"%[%d0?%. Trade%]",
		"%[%d0?%. WorldDefense%]",
		"%[%d0?%. LocalDefense%]",
		"%[%d0?%. LookingForGroup%]",
		"%[%d0?%. GuildRecruitment%]",
		gsub(CHAT_INSTANCE_CHAT_GET, ".*%[(.*)%].*", "%%[%1%%]"),
		gsub(CHAT_INSTANCE_CHAT_LEADER_GET, ".*%[(.*)%].*", "%%[%1%%]"),
		gsub(CHAT_GUILD_GET, ".*%[(.*)%].*", "%%[%1%%]"),
		gsub(CHAT_PARTY_GET, ".*%[(.*)%].*", "%%[%1%%]"),
		gsub(CHAT_PARTY_LEADER_GET, ".*%[(.*)%].*", "%%[%1%%]"),
		gsub(CHAT_PARTY_GUIDE_GET, ".*%[(.*)%].*", "%%[%1%%]"),
		gsub(CHAT_OFFICER_GET, ".*%[(.*)%].*", "%%[%1%%]"),
		gsub(CHAT_RAID_GET, ".*%[(.*)%].*", "%%[%1%%]"),
		gsub(CHAT_RAID_LEADER_GET, ".*%[(.*)%].*", "%%[%1%%]"),
		gsub(CHAT_RAID_WARNING_GET, ".*%[(.*)%].*", "%%[%1%%]"),
		"%[(%d0?)%. ([^ ]-)%]", --Custom Channels
	}

	local L = GetLocale()
	if L == "zhTW" then --Traditional Chinese
		chn[1] = "%[%d0?%. 綜合.-%]"
		chn[2] = "%[%d0?%. 交易.-%]"
		chn[3] = "%[%d0?%. 世界防務%]"
		chn[4] = "%[%d0?%. 本地防務.-%]"
		chn[5] = "%[%d0?%. 尋求組隊%]"
		chn[6] = "%[%d0?%. 公會招募.-%]"
	end

	BCM.chatFuncs[#BCM.chatFuncs+1] = function(text)
		for i=1, 17 do
			text = gsub(text, chn[i], rplc[i])
		end
		return text
	end
end

