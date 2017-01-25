local _, L = ...
local Timer = CreateFrame('Frame')

-- Borrowed fixes from Storyline :)
local LINE_FEED_CODE = string.char(10)
local CARRIAGE_RETURN_CODE = string.char(13)
local WEIRD_LINE_BREAK = LINE_FEED_CODE .. CARRIAGE_RETURN_CODE .. LINE_FEED_CODE

Timer.Texts = {}
L.TextMixin = {}

local Text = L.TextMixin

function Text:SetText(text)
	self:StopTexts()
	self.storedText = text
	if text then
		local strings, delays = {}, {}
		local timeToFinish = 0
		text = text:gsub(LINE_FEED_CODE .. '+', '\n')
		text = text:gsub(WEIRD_LINE_BREAK, '\n')
		for i, str in pairs({strsplit('\n', text)}) do
			local length = str:len()
			if length ~= 0 then
				local delay = (length / 15 ) + 2
				timeToFinish = timeToFinish + delay
				delays[ #strings + 1] = delay
				strings[ #strings + 1 ] = str
			end
		end
		self.numTexts = #strings
		self.timeToFinish = timeToFinish
		self.timeStarted = GetTime()
		self:QueueTexts(strings, delays)
	end
end

function Text:QueueTexts(strings, delays)
	assert(strings, 'No strings added to object '.. ( self:GetName() or '<unnamed fontString>' ) )
	assert(delays, 'No delays added to object '.. ( self:GetName() or '<unnamed fontString>' ) )
	self.strings = strings
	self.delays = delays
	Timer:AddText(self)
end

function Text:RepeatTexts()
	if self.storedText then
		self:SetText(self.storedText)
	end
end

function Text:IsFinished()
	return ( not self.strings )
end

function Text:IsSequence()
	return ( self.numTexts and self.numTexts > 1 )
end

function Text:GetNumRemaining()
	return self.strings and #self.strings or 0
end

function Text:GetProgress()
	local full = self.numTexts or 0
	local remaining = self.strings and #self.strings or 0
	return ('%d/%d'):format(full - remaining + 1, full)
end

function Text:GetProgressPercent()
	if self.timeStarted and self.timeToFinish then
		local progress = ( GetTime() - self.timeStarted ) / self.timeToFinish
		return ( progress > 1 ) and 1 or progress
	else
		return 1
	end
end

function Text:GetNumTexts() return self.numTexts or 0 end

function Text:OnFinished() end

function Text:ForceNext()
	if self.delays and self.strings then
		tremove(self.delays, 1)
		tremove(self.strings, 1)
		if self.strings[1] then
			self:SetNext(self.strings[1])
		else
			Timer:RemoveText(self)
			self:RepeatTexts()
		end
		if not self.strings[2] then
			self:OnFinished()
		end
	end
end

function Text:StopTexts()
	Timer:RemoveText(self)
	self.strings = nil
	self.delays = nil
	self.numTexts = nil
	self.timeToFinish = nil
	self.timeStarted = nil
	self:SetNext()
end

function Text:SetNext(text)
	if not self:GetFont() then
		if not self.fontObjectsToTry then
			error('No fonts applied to TextMixin, call SetFontObjectsToTry first')
		end
		self:SetFontObject(self.fontObjectsToTry[1])
	end

	getmetatable(self).__index.SetText(self, text)
	self:ApplyFontObjects()
end

function Text:SetFontObjectsToTry(...)
	self.fontObjectsToTry = { ... }
	if self:GetText() then
		self:ApplyFontObjects()
	end
end

function Text:ApplyFontObjects()
	if not self.fontObjectsToTry then
		error('No fonts applied to TextMixin, call SetFontObjectsToTry first');
	end

	for i, fontObject in ipairs(self.fontObjectsToTry) do
		self:SetFontObject(fontObject)
		if not self:IsTruncated() then
			break
		end
	end
end

function Text:SetFormattedText(format, ...)
	if not self:GetFont() then
		if not self.fontObjectsToTry then
			error('No fonts applied to TextMixin, call SetFontObjectsToTry first')
		end
		self:SetFontObject(self.fontObjectsToTry[1])
	end

	getmetatable(self).__index.SetFormattedText(self, format, ...)
	self:ApplyFontObjects()
end

function Timer:AddText(fontString)
	if fontString then
		self.Texts[fontString] = true
		if not self:GetScript('OnUpdate') then
			self.elapsed = 0
		end
		self:SetScript('OnUpdate', self.OnUpdate)
	end
end

function Timer:GetTexts() return pairs(self.Texts) end

function Timer:RemoveText(fontString)
	if fontString then
		self.Texts[fontString] = nil
	end
end

function Timer:OnUpdate(elapsed)
	for text in self:GetTexts() do
		if next(text.strings) and next(text.delays) then
			if not text:GetText() then
				text:SetNext(text.strings[1])
			end
			text.delays[1] = text.delays[1] - elapsed
			if text.delays[1] <= 0 then
				tremove(text.delays, 1)
				tremove(text.strings, 1)
				if text.strings[1] then
					text:SetNext(text.strings[1])
					if not text.strings[2] then
						text:OnFinished()
					end
				else
					self.Texts[text] = nil
				end
			end
		else
			text:OnFinished()
			self.Texts[text] = nil
		end
	end
	if not next(self.Texts) then
		self:SetScript('OnUpdate', nil)
	end
end