local Titles, _, L = {}, ...
L.TitlesMixin = Titles

local NORMAL_QUEST_DISPLAY = NORMAL_QUEST_DISPLAY:gsub(0, 'f')
local TRIVIAL_QUEST_DISPLAY = TRIVIAL_QUEST_DISPLAY:gsub(0, 'f')
local IGNORED_QUEST_DISPLAY = IGNORED_QUEST_DISPLAY:gsub(0, 'f')

-- Priority
local P_COMPLETE_QUEST = 1
local P_AVAILABLE_QUEST = 2
local P_AVAILABLE_GOSSIP = 3
local P_INCOMPLETE_QUEST = 4

----------------------------------
-- Display
----------------------------------
function Titles:AdjustHeight(newHeight)
	self.offset = 0
	self:SetScript('OnUpdate', function(self)
		local height = self:GetHeight()
		local diff = newHeight - height
		if abs(newHeight - height) < 0.5 then
			self:SetHeight(newHeight)
			self:SetScript('OnUpdate', nil)
		else
			self:SetHeight(height + ( diff / 10 ) )
		end
		self:OnUpdateOffset()
	end)
end

function Titles:OnUpdateOffset()
	local anchor, relativeRegion, relativeKey, x, y = self:GetPoint()
	local offset = self.offset or 0
	local diff = ( y - offset )
	if (offset == 0) or abs( y - offset ) < 0.3 then
		self:SetPoint(anchor, relativeRegion, relativeKey, x, offset)
		if self:GetScript('OnUpdate') == self.OnUpdateOffset then
			self:SetScript('OnUpdate', nil)
		end
	else
		self:SetPoint(anchor, relativeRegion, relativeKey, x, offset + (diff / 10))
	end
end

function Titles:OnMouseWheel(delta)
	self.offset = self.offset and self.offset + (-delta * 40) or (-delta * 40)
	self:SetScript('OnUpdate', self.OnUpdateOffset)
end

function Titles:ResetPosition()
	self.offset = 0
	self:SetScript('OnUpdate', self.OnUpdateOffset)
end

function Titles:OnEvent(event, ...)
	if self[event] then
		self[event](self, ...)
	else
		self:Hide()
	end
end

function Titles:OnHide()
	for i, button in pairs(self.Buttons) do
		button:UnlockHighlight()
		button:Hide()
	end
	self:ResetPosition()
	self.numActive = 0
	self.idx = 1
end

function Titles:GetNumActive()
	return self.numActive or 0
end

function Titles:GetButton(index)
	local button = self.Buttons[index]
	if not button then
		button = CreateFrame('Button', _ .. 'TitleButton' .. index, self)
		L.Mixin(button, L.ButtonMixin, L.ScalerMixin)
		button:Init(index)
		self.Buttons[index] = button
	end
	button:Show()
	return button
end

function Titles:UpdateActive()
	local newHeight, numActive = 0, 0
	for i, button in pairs(self.Buttons) do
		if button:IsVisible() then
			newHeight = newHeight + button:GetHeight()
			numActive = numActive + 1
		end
	end
	self.numActive = numActive
	self:AdjustHeight(newHeight)
end

----------------------------------
-- Gossip
----------------------------------
function Titles:GOSSIP_SHOW()
	self.idx = 1
	self.type = 'Gossip'
	self:Show()
	self:UpdateAvailableQuests(GetGossipAvailableQuests())
	self:UpdateActiveQuests(GetGossipActiveQuests())
	self:UpdateGossipOptions(GetGossipOptions())
	for i = self.idx, #self.Buttons do
		self.Buttons[i]:Hide()
	end
	self:UpdateActive()
end

function Titles:UpdateAvailableQuests(...)
	local titleIndex = 1
	for i = 1, select('#', ...), 7 do
		local button = self:GetButton(self.idx)
		local 	titleText, level, isTrivial, frequency, 
				isRepeatable, isLegendary, isIgnored = select(i, ...)
		----------------------------------
		local qType = ( isIgnored and IGNORED_QUEST_DISPLAY) or
					( isTrivial and TRIVIAL_QUEST_DISPLAY )
		button:SetFormattedText(qType or NORMAL_QUEST_DISPLAY, titleText)
		----------------------------------
		local icon = ( isLegendary and 'AvailableLegendaryQuestIcon' ) or
					( frequency == LE_QUEST_FREQUENCY_DAILY and 'DailyQuestIcon') or
					( frequency == LE_QUEST_FREQUENCY_WEEKLY and 'DailyQuestIcon' ) or
					( isRepeatable and 'DailyActiveQuestIcon' ) or
					( 'AvailableQuestIcon' )
		button:SetGossipQuestIcon(icon, qType and 0.5)
		button:SetPriority(P_AVAILABLE_QUEST)
		----------------------------------
		button:SetID(titleIndex)
		button.type = 'Available'
		----------------------------------
		self.idx = self.idx + 1
		titleIndex = titleIndex + 1
	end
end

function Titles:UpdateActiveQuests(...)
	local titleIndex = 1
	local numActiveQuestData = select("#", ...)
	self.hasActiveQuests = (numActiveQuestData > 0)
	for i = 1, numActiveQuestData, 6 do
		local button = self:GetButton(self.idx)
		local 	titleText, level, isTrivial, 
				isComplete, isLegendary, isIgnored = select(i, ...)
		----------------------------------
		local qType = ( isIgnored and IGNORED_QUEST_DISPLAY) or
					( isTrivial and TRIVIAL_QUEST_DISPLAY )
		button:SetFormattedText(qType or NORMAL_QUEST_DISPLAY, titleText)
		----------------------------------
		local icon = ( isComplete and isLegendary and 'ActiveLegendaryQuestIcon') or
					( isComplete and 'ActiveQuestIcon' ) or
					( 'InCompleteQuestIcon' )
		button:SetGossipQuestIcon(icon, qType and 0.5)
		button:SetPriority(isComplete and P_COMPLETE_QUEST or P_INCOMPLETE_QUEST)
		----------------------------------
		button:SetID(titleIndex)
		button.type = 'Active'
		----------------------------------
		self.idx = self.idx + 1
		titleIndex = titleIndex + 1
	end
end

function Titles:UpdateGossipOptions(...)
	local titleIndex = 1
	for i=1, select('#', ...), 2 do
		local button = self:GetButton(self.idx)
		local titleText, icon = select(i, ...)
		----------------------------------
		button:SetText(titleText)
		button:SetGossipIcon(icon)
		button:SetPriority(P_AVAILABLE_GOSSIP)
		----------------------------------
		button:SetID(titleIndex)
		button.type = 'Gossip'
		----------------------------------
		self.idx = self.idx + 1
		titleIndex = titleIndex + 1
	end
end

function Titles:QUEST_LOG_UPDATE()
	if self:IsVisible() then
		if ( self.type == 'Gossip' and self.hasActiveQuests ) then
			self:Hide()
			self:GOSSIP_SHOW()
		elseif ( self.type == 'Quests' ) then
			self:Hide()
			self:QUEST_GREETING()
		end
	end
end

----------------------------------
-- Quest
----------------------------------
function Titles:QUEST_GREETING()
	self.idx = 1
	self.type = 'Quests'
	self:Show()
	self:UpdateActiveGreetingQuests(GetNumActiveQuests())
	self:UpdateAvailableGreetingQuests(GetNumAvailableQuests())
	for i = self.idx, #self.Buttons do
		self.Buttons[i]:Hide()
	end
	self:UpdateActive()
end


function Titles:UpdateActiveGreetingQuests(numActiveQuests)
	for i=1, numActiveQuests do
		local button = self:GetButton(self.idx)
		local title, isComplete = GetActiveTitle(i)
		----------------------------------
		local qType = ( IsActiveQuestIgnored(i) and IGNORED_QUEST_DISPLAY ) or
					( IsActiveQuestTrivial(i) and TRIVIAL_QUEST_DISPLAY )
		button:SetFormattedText(qType or NORMAL_QUEST_DISPLAY, title)
		----------------------------------
		local icon = ( isComplete and IsActiveQuestLegendary(i) and 'ActiveLegendaryQuestIcon' ) or
					( isComplete and 'ActiveQuestIcon') or
					( 'InCompleteQuestIcon' )
		button:SetGossipQuestIcon(icon, qType and 0.75)
		button:SetPriority(isComplete and P_COMPLETE_QUEST or P_INCOMPLETE_QUEST)
		----------------------------------
		button:SetID(i)
		button.type = 'ActiveQuest'
		----------------------------------
		self.idx = self.idx + 1
	end
end

function Titles:UpdateAvailableGreetingQuests(numAvailableQuests)
	for i=1, numAvailableQuests do
		local button = self:GetButton(self.idx)
		local title = GetAvailableTitle(i)
		local isTrivial, frequency, isRepeatable, isLegendary, isIgnored = GetAvailableQuestInfo(i)
		----------------------------------
		local qType = ( isIgnored and IGNORED_QUEST_DISPLAY) or
					( isTrivial and TRIVIAL_QUEST_DISPLAY )
		button:SetFormattedText(qType or NORMAL_QUEST_DISPLAY, title)
		----------------------------------
		local icon = ( isLegendary and 'AvailableLegendaryQuestIcon' ) or
					( frequency == LE_QUEST_FREQUENCY_DAILY and 'DailyQuestIcon') or
					( frequency == LE_QUEST_FREQUENCY_WEEKLY and 'DailyQuestIcon' ) or
					( isRepeatable and 'DailyActiveQuestIcon' ) or
					( 'AvailableQuestIcon' )
		button:SetGossipQuestIcon(icon, qType and 0.5)
		button:SetPriority(P_AVAILABLE_QUEST)
		----------------------------------
		button:SetID(i)
		button.type = 'AvailableQuest'
		----------------------------------
		self.idx = self.idx + 1
	end
end