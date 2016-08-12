-- A simple quick chatbar,with low memory cost :)
-- Creat Date : July,20,2011
-- Email : Neavo7@gmail.com
-- Version : 0.1

-- Nevo_Chatbar主框體 --
local chatFrame = SELECTED_DOCK_FRAME
local editBox = chatFrame.editBox
COLORSCHEME_BORDER   = { 0.3,0.3,0.3,1 }

local chatbar = CreateFrame("Frame", "chatbar", UIParent)
chatbar:SetWidth(300); -- 主框體寬度
chatbar:SetHeight(20); -- 主框體高度
chatbar:SetPoint("TOPLEFT" ,ChatFrame1, "BOTTOMLEFT", 5, 210); -- 錨點,想移動位置的改這裡


-- "說(/s)" --
local ChannelSay = CreateFrame("Button", "ChannelSay", UIParent);
ChannelSay:SetWidth(23);  -- 按鈕寬度
ChannelSay:SetHeight(23);  -- 按鈕高度
ChannelSay:SetPoint("LEFT",chatbar,"LEFT",0,0);   -- 錨點
ChannelSay:RegisterForClicks("AnyUp");
ChannelSay:SetScript("OnClick", function() ChannelSay_OnClick() end)

ChannelSay:SetScript("OnEnter", function(self) 
	GameTooltip:SetOwner(self, "ANCHOR_TOP", 0, 6)
	GameTooltip:AddLine("白字說話")
	GameTooltip:Show()
end)
ChannelSay:SetScript("OnLeave", function() GameTooltip:Hide() end)
ChannelSayText = ChannelSay:CreateFontString("ChannelSayText", "OVERLAY")
ChannelSayText:SetFont("fonts\\bLEI00D.TTF", 15, "OUTLINE") -- 字體設置
ChannelSayText:SetJustifyH("CENTER")
ChannelSayText:SetWidth(25)
ChannelSayText:SetHeight(25)
ChannelSayText:SetText("說") -- 顯示的文字
ChannelSayText:SetPoint("CENTER", 0, 0)
ChannelSayText:SetTextColor(1,1,1) -- 顏色

function ChannelSay_OnClick()
      ChatFrame_OpenChat("/s ", chatFrame)
end

-- "喊(/y)" --
local ChannelYell = CreateFrame("Button", "ChannelYell", UIParent);
ChannelYell:SetWidth(23); 
ChannelYell:SetHeight(23); 
ChannelYell:SetPoint("LEFT",ChannelSay,"RIGHT",5,0); 
ChannelYell:RegisterForClicks("AnyUp");
ChannelYell:SetScript("OnClick", function() ChannelYell_OnClick() end)

ChannelYell:SetScript("OnEnter", function(self) 
	GameTooltip:SetOwner(self, "ANCHOR_TOP", 0, 6)
	GameTooltip:AddLine("大喊")
	GameTooltip:Show()
end)
ChannelYell:SetScript("OnLeave", function() GameTooltip:Hide() end)
ChannelYellText = ChannelYell:CreateFontString("ChannelYellText", "OVERLAY")
ChannelYellText:SetFont("fonts\\bLEI00D.TTF", 15, "OUTLINE")
ChannelYellText:SetJustifyH("CENTER")
ChannelYellText:SetWidth(25)
ChannelYellText:SetHeight(25)
ChannelYellText:SetText("喊")
ChannelYellText:SetPoint("CENTER", 0, 0)
ChannelYellText:SetTextColor(255/255, 64/255, 64/255)

function ChannelYell_OnClick()
      ChatFrame_OpenChat("/y ", chatFrame)
end

-- "綜合(/1)" --
local Channel_01 = CreateFrame("Button", "Channel_01", UIParent);
Channel_01:SetWidth(23); 
Channel_01:SetHeight(23); 
Channel_01:SetPoint("LEFT",ChannelYell,"RIGHT",5,0); 
Channel_01:RegisterForClicks("AnyUp");
Channel_01:SetScript("OnClick", function() Channel_01_OnClick() end)

Channel_01:SetScript("OnEnter", function(self) 
	GameTooltip:SetOwner(self, "ANCHOR_TOP", 0, 6)
	GameTooltip:AddLine("綜合頻道")
	GameTooltip:Show()
end)
Channel_01:SetScript("OnLeave", function() GameTooltip:Hide() end)
Channel_01Text = Channel_01:CreateFontString("Channel_01Text", "OVERLAY")
Channel_01Text:SetFont("fonts\\bLEI00D.TTF", 15, "OUTLINE")
Channel_01Text:SetJustifyH("CENTER")
Channel_01Text:SetWidth(25)
Channel_01Text:SetHeight(25)
Channel_01Text:SetText("綜")
Channel_01Text:SetPoint("CENTER", 0, 0)
Channel_01Text:SetTextColor(210/255, 180/255, 140/255)

function Channel_01_OnClick()
      ChatFrame_OpenChat("/1 ", chatFrame)
end

-- "交易(/2)" --
local Channel_02 = CreateFrame("Button", "Channel_02", UIParent);
Channel_02:SetWidth(23); 
Channel_02:SetHeight(23); 
Channel_02:SetPoint("LEFT",Channel_01,"RIGHT",5,0); 
Channel_02:RegisterForClicks("AnyUp");
Channel_02:SetScript("OnClick", function() Channel_02_OnClick() end)

Channel_02:SetScript("OnEnter", function(self) 
	GameTooltip:SetOwner(self, "ANCHOR_TOP", 0, 6)
	GameTooltip:AddLine("交易頻道")
	GameTooltip:Show()
end)
Channel_02:SetScript("OnLeave", function() GameTooltip:Hide() end)
Channel_02Text = Channel_02:CreateFontString("Channel_02Text", "OVERLAY")
Channel_02Text:SetFont("fonts\\bLEI00D.TTF", 15, "OUTLINE")
Channel_02Text:SetJustifyH("CENTER")
Channel_02Text:SetWidth(25)
Channel_02Text:SetHeight(25)
Channel_02Text:SetText("交")
Channel_02Text:SetPoint("CENTER", 0, 0)
Channel_02Text:SetTextColor(255/255, 130/255, 130/255)

function Channel_02_OnClick()
      ChatFrame_OpenChat("/2 ", chatFrame)
end

-- "尋求組隊(/4)" --
local Channel_04 = CreateFrame("Button", "Channel_04", UIParent);
Channel_04:SetWidth(23); 
Channel_04:SetHeight(23); 
Channel_04:SetPoint("LEFT",Channel_02,"RIGHT",5,0); 
Channel_04:RegisterForClicks("AnyUp");
Channel_04:SetScript("OnClick", function() Channel_04_OnClick() end)

Channel_04:SetScript("OnEnter", function(self) 
	GameTooltip:SetOwner(self, "ANCHOR_TOP", 0, 6)
	GameTooltip:AddLine("尋求組隊")
	GameTooltip:Show()
end)
Channel_04:SetScript("OnLeave", function() GameTooltip:Hide() end)
Channel_04Text = Channel_04:CreateFontString("Channel_04Text", "OVERLAY")
Channel_04Text:SetFont("fonts\\bLEI00D.TTF", 15, "OUTLINE")
Channel_04Text:SetJustifyH("CENTER")
Channel_04Text:SetWidth(25)
Channel_04Text:SetHeight(25)
Channel_04Text:SetText("組")
Channel_04Text:SetPoint("CENTER", 0, 0)
Channel_04Text:SetTextColor(210/255, 180/255, 140/255)

function Channel_04_OnClick()
      ChatFrame_OpenChat("/4 ", chatFrame)
end

-- "隊伍(/p)" --
local ChannelParty = CreateFrame("Button", "ChannelParty", UIParent);
ChannelParty:SetWidth(20); 
ChannelParty:SetHeight(20); 
ChannelParty:SetPoint("LEFT",Channel_04,"RIGHT",5,0); 
ChannelParty:RegisterForClicks("AnyUp");
ChannelParty:SetScript("OnClick", function() ChannelParty_OnClick() end)

ChannelParty:SetScript("OnEnter", function(self) 
	GameTooltip:SetOwner(self, "ANCHOR_TOP", 0, 6)
	GameTooltip:AddLine("隊伍")
	GameTooltip:Show()
end)
ChannelParty:SetScript("OnLeave", function() GameTooltip:Hide() end)
ChannelPartyText = ChannelParty:CreateFontString("ChannelPartyText", "OVERLAY")
ChannelPartyText:SetFont("fonts\\bLEI00D.TTF", 15, "OUTLINE")
ChannelPartyText:SetJustifyH("CENTER")
ChannelPartyText:SetWidth(25)
ChannelPartyText:SetHeight(25)
ChannelPartyText:SetText("隊")
ChannelPartyText:SetPoint("CENTER", 0, 0)
ChannelPartyText:SetTextColor(170/255, 170/255, 255/255)

function ChannelParty_OnClick()
      ChatFrame_OpenChat("/p ", chatFrame)
end

-- "公會(/g)" --
local ChannelGuild = CreateFrame("Button", "ChannelGuild", UIParent);
ChannelGuild:SetWidth(20); 
ChannelGuild:SetHeight(20); 
ChannelGuild:SetPoint("LEFT",ChannelParty,"RIGHT",5,0); 
ChannelGuild:RegisterForClicks("AnyUp");
ChannelGuild:SetScript("OnClick", function() ChannelGuild_OnClick() end)

ChannelGuild:SetScript("OnEnter", function(self) 
	GameTooltip:SetOwner(self, "ANCHOR_TOP", 0, 6)
	GameTooltip:AddLine("公會")
	GameTooltip:Show()
end)
ChannelGuild:SetScript("OnLeave", function() GameTooltip:Hide() end)
ChannelGuildText = ChannelGuild:CreateFontString("ChannelGuildText", "OVERLAY")
ChannelGuildText:SetFont("fonts\\bLEI00D.TTF", 15, "OUTLINE")
ChannelGuildText:SetJustifyH("CENTER")
ChannelGuildText:SetWidth(25)
ChannelGuildText:SetHeight(25)
ChannelGuildText:SetText("公")
ChannelGuildText:SetPoint("CENTER", 0, 0)
ChannelGuildText:SetTextColor(64/255, 255/255, 64/255)

function ChannelGuild_OnClick()
      ChatFrame_OpenChat("/g ", chatFrame)
end

-- "團隊(/raid)" --
local ChannelRaid = CreateFrame("Button", "ChannelRaid", UIParent);
ChannelRaid:SetWidth(20); 
ChannelRaid:SetHeight(20); 
ChannelRaid:SetPoint("LEFT",ChannelGuild,"RIGHT",5,0); 
ChannelRaid:RegisterForClicks("AnyUp");
ChannelRaid:SetScript("OnClick", function() ChannelRaid_OnClick() end)

ChannelRaid:SetScript("OnEnter", function(self) 
	GameTooltip:SetOwner(self, "ANCHOR_TOP", 0, 6)
	GameTooltip:AddLine("團隊")
	GameTooltip:Show()
end)
ChannelRaid:SetScript("OnLeave", function() GameTooltip:Hide() end)
ChannelRaidText = ChannelRaid:CreateFontString("ChannelRaidText", "OVERLAY")
ChannelRaidText:SetFont("fonts\\bLEI00D.TTF", 15, "OUTLINE")
ChannelRaidText:SetJustifyH("CENTER")
ChannelRaidText:SetWidth(25)
ChannelRaidText:SetHeight(25)
ChannelRaidText:SetText("團")
ChannelRaidText:SetPoint("CENTER", 0, 0)
ChannelRaidText:SetTextColor(255/255, 127/255, 0)

function ChannelRaid_OnClick()
      ChatFrame_OpenChat("/raid ", chatFrame)
end

-- "團隊警告(/rw)" --
local ChannelRaidWarns = CreateFrame("Button", "ChannelRaidWarns", UIParent)
ChannelRaidWarns:SetWidth(20) 
ChannelRaidWarns:SetHeight(20) 
ChannelRaidWarns:SetPoint("LEFT",ChannelRaid,"RIGHT",5,0) 
ChannelRaidWarns:RegisterForClicks("AnyUp")
ChannelRaidWarns:SetScript("OnClick", function() ChannelRaidWarns_OnClick() end)

ChannelRaidWarns:SetScript("OnEnter", function(self) 
	GameTooltip:SetOwner(self, "ANCHOR_TOP", 0, 6)
	GameTooltip:AddLine("團隊警告")
	GameTooltip:Show()
end)
ChannelRaidWarns:SetScript("OnLeave", function() GameTooltip:Hide() end)
ChannelRaidWarnsText = ChannelRaidWarns:CreateFontString("ChannelRaidWarnsText", "OVERLAY")
ChannelRaidWarnsText:SetFont("fonts\\bLEI00D.TTF", 15, "OUTLINE")
ChannelRaidWarnsText:SetJustifyH("CENTER")
ChannelRaidWarnsText:SetWidth(25)
ChannelRaidWarnsText:SetHeight(25)
ChannelRaidWarnsText:SetText("警")
ChannelRaidWarnsText:SetPoint("CENTER", 0, 0)
ChannelRaidWarnsText:SetTextColor(255/255, 69/255, 0) 

function ChannelRaidWarns_OnClick()
      ChatFrame_OpenChat("/rw ", chatFrame)
end

-- "副本(/bg)" --
local Channel_i = CreateFrame("Button", "ChannelBattleGround", UIParent)
ChannelBattleGround:SetWidth(20) 
ChannelBattleGround:SetHeight(20) 
ChannelBattleGround:SetPoint("LEFT",ChannelRaidWarns,"RIGHT",5,0) 
ChannelBattleGround:RegisterForClicks("AnyUp")
ChannelBattleGround:SetScript("OnClick", function() ChannelBattleGround_OnClick() end)

ChannelBattleGround:SetScript("OnEnter", function(self) 
	GameTooltip:SetOwner(self, "ANCHOR_TOP", 0, 6)
	GameTooltip:AddLine("副本")
	GameTooltip:Show()
end)
ChannelBattleGround:SetScript("OnLeave", function() GameTooltip:Hide() end)
ChannelBattleGroundText = ChannelBattleGround:CreateFontString("ChannelBattleGroundText", "OVERLAY")
ChannelBattleGroundText:SetFont("fonts\\bLEI00D.TTF", 15, "OUTLINE")
ChannelBattleGroundText:SetJustifyH("CENTER")
ChannelBattleGroundText:SetWidth(25)
ChannelBattleGroundText:SetHeight(25)
ChannelBattleGroundText:SetText("副")
ChannelBattleGroundText:SetPoint("CENTER", 0, 0)
ChannelBattleGroundText:SetTextColor(255/255, 127/255, 0) 

function ChannelBattleGround_OnClick()
      ChatFrame_OpenChat("/i ", chatFrame)
end

---- "密語(/w)" --
local ChannelWhisper = CreateFrame("Button", "ChannelWhisper", UIParent)
ChannelWhisper:SetWidth(20) 
ChannelWhisper:SetHeight(20) 
ChannelWhisper:SetPoint("LEFT",Channel_i,"RIGHT",5,0) 
ChannelWhisper:RegisterForClicks("AnyUp")
ChannelWhisper:SetScript("OnClick", function() ChannelWhisper_OnClick() end)

ChannelWhisper:SetScript("OnEnter", function(self) 
	GameTooltip:SetOwner(self, "ANCHOR_TOP", 0, 6)
	GameTooltip:AddLine("悄悄話")
	GameTooltip:Show()
end)
ChannelWhisper:SetScript("OnLeave", function() GameTooltip:Hide() end)
ChannelWhisperText = ChannelWhisper:CreateFontString("ChannelWhisperText", "OVERLAY")
ChannelWhisperText:SetFont("fonts\\bLEI00D.TTF", 15, "OUTLINE")
ChannelWhisperText:SetJustifyH("CENTER")
ChannelWhisperText:SetWidth(25)
ChannelWhisperText:SetHeight(25)
ChannelWhisperText:SetText("密")
ChannelWhisperText:SetPoint("CENTER", 0, 0)
ChannelWhisperText:SetTextColor(240/255, 128/255, 128/255) 

function ChannelWhisper_OnClick()
      ChatFrame_OpenChat("/w ", chatFrame)
end

-- Roll --
local roll = CreateFrame("Button", "rollMacro", UIParent, "SecureActionButtonTemplate")
roll:SetAttribute("*type*", "macro")
roll:SetAttribute("macrotext", "/roll")
roll:SetWidth(20);
roll:SetHeight(20);
roll:SetPoint("LEFT",ChannelWhisper,"RIGHT",5,0);
rollText =roll:CreateFontString("rollText", "OVERLAY")
rollText:SetFont("fonts\\bLEI00D.TTF", 15, "OUTLINE")
rollText:SetJustifyH("CENTER")
rollText:SetWidth(25)
rollText:SetHeight(25)
roll.t = roll:CreateTexture()
roll.t:SetAllPoints()
roll.t:SetTexture("Interface\\Buttons\\UI-GroupLoot-Dice-Up")


--[[-- "大腳世界頻道(/0)" --
local Channel_05 = CreateFrame("Button", "Channel_05", UIParent);
Channel_05:SetWidth(23); 
Channel_05:SetHeight(23); 
Channel_05:SetPoint("LEFT",ChannelWhisper,"RIGHT",5,0); 
Channel_05:RegisterForClicks("AnyUp");
Channel_05:SetScript("OnClick", function(self,button) Channel_05_OnClick(self,button) end)

Channel_05Text = Channel_05:CreateFontString("Channel_05Text", "OVERLAY")
Channel_05Text:SetFont("fonts\\bLEI00D.TTF", 15, "OUTLINE")
Channel_05Text:SetJustifyH("CENTER")
Channel_05Text:SetWidth(25)
Channel_05Text:SetHeight(25)
Channel_05Text:SetText("▅")
Channel_05Text:SetPoint("CENTER", 0, 0)
Channel_05Text:SetTextColor(30/255, 144/255, 255/255) 

function Channel_05_OnClick(self,button)
   if button == "RightButton" then   
     local _, channelName, _  =  GetChannelName("夢想we團")
     if channelName == nil then
    JoinPermanentChannel("夢想we團", nil, 1, 1) 
    ChatFrame_RemoveMessageGroup(ChatFrame1, "CHANNEL")
    ChatFrame_AddChannel(ChatFrame1,"夢想we團")
    else
    LeaveChannelByName("夢想we團") 
    end
   else   
     local channel,_,_  = GetChannelName("夢想we團")
    ChatFrame_OpenChat("/"..channel.." ", chatFrame)
  end         
end]]
