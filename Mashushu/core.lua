local T, L, G = unpack(select(2, ...))

----------------------------
--  Initialize variables  --
----------------------------
local runAwayArrow
local targetType
local targetPlayer
local targetX, targetY
local hideTime, hideDistance
local dontHide
local isWorldCoord

local pi, pi2 = math.pi, math.pi * 2
local floor = math.floor
local sin, cos, atan2, sqrt, min = math.sin, math.cos, math.atan2, math.sqrt, math.min
local GetPlayerMapPosition = GetPlayerMapPosition
local GetCurrentMapZone, GetCurrentMapDungeonLevel, GetCurrentMapAreaID = GetCurrentMapZone, GetCurrentMapDungeonLevel, GetCurrentMapAreaID
local GetTime, GGetPlayerFacing = GetTime, GetPlayerFacing
local UnitPosition = UnitPosition

--------------------
--  Create Frame  --
--------------------
local arrowFrame = CreateFrame("Button", nil, UIParent)
arrowFrame:Hide()
arrowFrame:SetFrameStrata("HIGH")
arrowFrame:SetWidth(56)
arrowFrame:SetHeight(42)
arrowFrame:SetMovable(true)
arrowFrame:EnableMouse(true)
arrowFrame:RegisterForDrag("LeftButton", "RightButton")
arrowFrame:SetScript("OnDragStart", function(self)
	if self:IsMovable() then 
		self:StartMoving()
	end
end)
arrowFrame:SetScript("OnDragStop", function(self)
	self:StopMovingOrSizing()
	local point1, _, point2, x, y = self:GetPoint(1)
	
	MSS_DB.Arrow.Point1 = point1
	MSS_DB.Arrow.Point2 = point2
	MSS_DB.Arrow.PointX = x
	MSS_DB.Arrow.PointY = y
end)
arrowFrame:SetScript("OnClick", function(self)
	self:Hide()
end)

local arrow = arrowFrame:CreateTexture(nil, "OVERLAY")
arrow:SetTexture(G.Media.arrow)
arrow:SetAllPoints(arrowFrame)

local txtrng = arrowFrame:CreateFontString(nil,"OVERLAY")
txtrng:SetSize(44,18)
txtrng:SetPoint("BOTTOMRIGHT",10,5)
txtrng:SetFont(G.Font, 14, "OUTLINE")
txtrng:SetJustifyH("RIGHT")
txtrng:SetJustifyV("BOTTOM")
txtrng:SetText("")

local iconFrame = CreateFrame("Button", nil, UIParent)
iconFrame:Hide()
iconFrame:SetFrameStrata("HIGH")
iconFrame:SetWidth(56)
iconFrame:SetHeight(56)
T.createborder(iconFrame)

iconFrame:SetMovable(true)
iconFrame:EnableMouse(true)
iconFrame:RegisterForDrag("LeftButton", "RightButton")
iconFrame:SetScript("OnDragStart", function(self)
	if self:IsMovable() then 
		self:StartMoving()
	end
end)
iconFrame:SetScript("OnDragStop", function(self)
	self:StopMovingOrSizing()
	local point1, _, point2, x, y = self:GetPoint(1)
	
	MSS_DB.Icon.Point1 = point1
	MSS_DB.Icon.Point2 = point2
	MSS_DB.Icon.PointX = x
	MSS_DB.Icon.PointY = y
end)
iconFrame:SetScript("OnClick", function(self)
	self:Hide()
end)

iconFrame.tex = iconFrame:CreateTexture(nil, "OVERLAY")
iconFrame.tex:SetAllPoints()
iconFrame.tex:SetTexture("Interface\\ICONS\\spell_misc_zandalari_council_soulswap")

iconFrame.cooldown = CreateFrame("Cooldown", nil, iconFrame, "CooldownFrameTemplate")
iconFrame.cooldown:SetAllPoints(iconFrame)

iconFrame.infotext = T.createtext(iconFrame, "OVERLAY", 18, "OUTLINE", "TOP")
iconFrame.infotext:SetPoint("TOP", iconFrame, "BOTTOM")
iconFrame.infotext:SetSize(100, 25)
iconFrame.infotext:SetText(">13<")

iconFrame.infotext2 = T.createtext(iconFrame, "OVERLAY", 15, "OUTLINE", "TOP")
iconFrame.infotext2:SetPoint("TOP", iconFrame.infotext, "BOTTOM")
iconFrame.infotext2:SetSize(250, 25)
iconFrame.infotext2:SetText("Player1 → Player2")

G.iconFrame = iconFrame

T.ShowIconInfo = function(index)
	iconFrame.infotext:SetText(">"..index.."<")
	iconFrame.cooldown:SetCooldown(GetTime(), 18)
	iconFrame.cooldown:SetScript("OnHide", function(self)
		arrowFrame:Hide()
		iconFrame:Hide()
	end)
	iconFrame:Show()
end

T.UpdateIconInfo = function(player1, player2)
	iconFrame.infotext2:SetText(player1.." → "..player2)
end

local iconFrame2 = CreateFrame("Button", nil, UIParent)
iconFrame2:Hide()
iconFrame2:SetFrameStrata("HIGH")
iconFrame2:SetWidth(56)
iconFrame2:SetHeight(56)
T.createborder(iconFrame2)

iconFrame2:SetMovable(true)
iconFrame2:EnableMouse(true)
iconFrame2:RegisterForDrag("LeftButton", "RightButton")
iconFrame2:SetScript("OnDragStart", function(self)
	if self:IsMovable() then 
		self:StartMoving()
	end
end)
iconFrame2:SetScript("OnDragStop", function(self)
	self:StopMovingOrSizing()
	local point1, _, point2, x, y = self:GetPoint(1)
	
	MSS_DB.Icon2.Point1 = point1
	MSS_DB.Icon2.Point2 = point2
	MSS_DB.Icon2.PointX = x
	MSS_DB.Icon2.PointY = y
end)
iconFrame2:SetScript("OnClick", function(self)
	self:Hide()
end)

iconFrame2.tex = iconFrame2:CreateTexture(nil, "OVERLAY")
iconFrame2.tex:SetAllPoints()
iconFrame2.tex:SetTexture("Interface\\ICONS\\spell_warlock_demonbolt")

iconFrame2.cooldown = CreateFrame("Cooldown", nil, iconFrame2, "CooldownFrameTemplate")
iconFrame2.cooldown:SetAllPoints(iconFrame2)

iconFrame2.infotext = T.createtext(iconFrame2, "OVERLAY", 18, "OUTLINE", "TOP")
iconFrame2.infotext:SetPoint("TOP", iconFrame2, "BOTTOM")
iconFrame2.infotext:SetSize(100, 25)
iconFrame2.infotext:SetText(L["右上"])

iconFrame2.infotext2 = T.createtext(iconFrame2, "OVERLAY", 15, "OUTLINE", "TOP")
iconFrame2.infotext2:SetPoint("TOP", iconFrame2.infotext, "BOTTOM")
iconFrame2.infotext2:SetSize(250, 25)
iconFrame2.infotext2:SetText("Player1")

G.iconFrame2 = iconFrame2

T.ShowIconInfo2 = function(dirc, duration, marked)
	iconFrame2.infotext:SetText(dirc)
	iconFrame2.infotext2:SetText(marked)	
	iconFrame2.cooldown:SetCooldown(GetTime(), duration)

	iconFrame2.cooldown:SetScript("OnHide", function(self)
		iconFrame2:Hide()
	end)

	iconFrame2:Show()
end

local STFrame = CreateFrame("Button", nil, UIParent)
STFrame:Hide()
STFrame:SetFrameStrata("HIGH")
STFrame:SetWidth(160)
STFrame:SetHeight(160)
T.createborder(STFrame)

STFrame.infotext = T.createtext(STFrame, "OVERLAY", 18, "OUTLINE", "CENTER")
STFrame.infotext:SetPoint("TOPLEFT", STFrame, "TOPLEFT", 3, -3)
STFrame.infotext:SetSize(160, 20)
STFrame.infotext:SetText("|cffFF0000"..L["枷锁爆炸范围内有"].."|r")

STFrame.infotext2 = T.createtext(STFrame, "OVERLAY", 15, "OUTLINE", "CENTER")
STFrame.infotext2:SetJustifyV("TOP")
STFrame.infotext2:SetPoint("TOPLEFT", STFrame.infotext, "BOTTOMLEFT", 3, -3)
STFrame.infotext2:SetSize(160, 140)
STFrame.infotext2:SetText("Player1\nPlayer2\nPlayer3")

STFrame:SetMovable(true)
STFrame:EnableMouse(true)
STFrame:RegisterForDrag("LeftButton", "RightButton")
STFrame:SetScript("OnDragStart", function(self)
	if self:IsMovable() then 
		self:StartMoving()
	end
end)
STFrame:SetScript("OnDragStop", function(self)
	self:StopMovingOrSizing()
	local point1, _, point2, x, y = self:GetPoint(1)
	
	MSS_DB.ST.Point1 = point1
	MSS_DB.ST.Point2 = point2
	MSS_DB.ST.PointX = x
	MSS_DB.ST.PointY = y
end)
STFrame:SetScript("OnClick", function(self)
	self:Hide()
end)

STFrame.t = 0

G.STFrame = STFrame
-----------------
--  Map Sizes  --
-----------------
local mapSizes = {}
local mapCoords = {}

local function UpdateMapSizes()
	SetMapToCurrentZone()
	local _, a2, b2, c2, d2 = GetCurrentMapZone()
	local zoneIndex = GetCurrentMapAreaID()
	local floor, a1, b1, c1, d1 = GetCurrentMapDungeonLevel()
	if mapSizes[zoneIndex] and mapSizes[zoneIndex][floor] then
		G.currentSizes = mapSizes[zoneIndex][floor]
		return
	end

	if not (a1 and b1 and c1 and d1) then
		a1, b1, c1, d1 = c2, d2, a2, b2
	end

	if not (a1 and b1 and c1 and d1) then 
		return
	end
	
	G.currentSizes = {abs(c1-a1), abs(d1-b1)}
	if not mapSizes[zoneIndex] then
		mapSizes[zoneIndex] = {}
		mapCoords[zoneIndex] = {}
	end
	mapSizes[zoneIndex][floor] = G.currentSizes
	mapCoords[zoneIndex][floor] = {c1, d1, a1, b1}
	
	--[[
		! Note:
		GetCurrentMapDungeonLevel() > return 3001,-13.833,3938.75,611.333 instead 3938.75,611.333,3001,-13.833	[xB,yB,xT,xT instead xT,yT,xB,yB]
	]]
end

T.GetMapSizes =function()
	if not G.currentSizes then
		UpdateMapSizes()
	end
	return G.currentSizes
end

---------------------
--  Map Utilities  --
---------------------
local SetMapToCurrentZone -- throttled SetMapToCurrentZone function to prevent lag issues with unsupported WorldMap addons
do
	local lastMapUpdate = 0
	function SetMapToCurrentZone(...)
		if GetTime() - lastMapUpdate > 1 then
			lastMapUpdate = GetTime()
			return _G.SetMapToCurrentZone(...)
		end
	end
end

local function calculateDistance(x1, y1, x2, y2)
	local dims = T.GetMapSizes()
	if not dims then
		return
	end
	local dX = (x1 - x2) * dims[1]
	local dY = (y1 - y2) * dims[2]
	--print("x1:"..x1.."  y1:"..y1.."  x2:"..x2.."  y2:"..y2.."   "..dims[1].." / "..dims[2])
	return sqrt(dX * dX + dY * dY)
end

local function calculateWorldDistance(x1, y1, x2, y2)
	local dX = (x1 - x2)
	local dY = (y1 - y2)
	return sqrt(dX * dX + dY * dY)
end

local function mapPositionToCoords(x,y)
	local zoneIndex = GetCurrentMapAreaID()
	local floor = GetCurrentMapDungeonLevel()
	
	local coords = mapCoords[zoneIndex] and mapCoords[zoneIndex][floor]
	if not coords then
		UpdateMapSizes()
		coords = mapCoords[zoneIndex] and mapCoords[zoneIndex][floor]
		if not coords then
			return
		end
	end
	return coords[1] - x * (coords[1] - coords[3]),coords[2] - y * (coords[2] - coords[4])
end

local GetPlayerFacing = function(...)
	local result = GGetPlayerFacing(...)
	if result < 0 then
		result = result + pi2
	end
	return result
end

------------------------
--  Update the arrow  --
------------------------
local updateArrow
do
	local currentCell
	local count = 0
	local showDownArrow = false
	function updateArrow(direction, distance)
		if distance and distance <= hideDistance and dontHide then
			if not showDownArrow then
				arrowFrame:SetHeight(60)
				arrowFrame:SetWidth(47)
				arrow:SetTexture(G.Media.arrowup)
				arrow:SetVertexColor(0.3, 1, 0)
				showDownArrow = true
			end
			count = count + 1
			if count >= 55 then
				count = 0
			end
	
			local cell = count
			local column = cell % 9
			local row = floor(cell / 9)
	
			local xstart = (column * 53) / 512
			local ystart = (row * 70) / 512
			local xend = ((column + 1) * 53) / 512
			local yend = ((row + 1) * 70) / 512
			arrow:SetTexCoord(xstart,xend,ystart,yend)
			txtrng:SetText(floor(distance))
		else
			if showDownArrow then
				arrowFrame:SetHeight(42)
				arrowFrame:SetWidth(56)
				arrow:SetTexture(G.Media.arrow)
				showDownArrow = false
				currentCell = nil
			end
			local cell = floor(direction / pi2 * 108 + 0.5) % 108
			if cell ~= currentCell then
				currentCell = cell
				local column = cell % 9
				local row = floor(cell / 9)
				local xStart = (column * 56) / 512
				local yStart = (row * 42) / 512
				local xEnd = ((column + 1) * 56) / 512
				local yEnd = ((row + 1) * 42) / 512
				arrow:SetTexCoord(xStart, xEnd, yStart, yEnd)
			end
			if distance then
				if runAwayArrow then
					local perc = distance / hideDistance
					local red = 1 - perc
					arrow:SetVertexColor(red, perc, 0)
					txtrng:SetTextColor(red, perc, 0)
					if distance >= hideDistance then
						arrowFrame:Hide()
					end
				else
					local perc = min(distance, 40)
					if perc > 20 then
						local green = 1 - ((perc-20) / 20)
						arrow:SetVertexColor(1, green, 0)
						txtrng:SetTextColor(1, green, 0)
					else
						local red = perc / 20
						arrow:SetVertexColor(red, 1, 0)
						txtrng:SetTextColor(red, 1, 0)
					end
					if distance <= hideDistance then
						arrowFrame:Hide()			
					end
				end
				txtrng:SetText(floor(distance))
			else
				if runAwayArrow then
					arrow:SetVertexColor(1, 0.3, 0)
				else
					arrow:SetVertexColor(1, 1, 0)
				end
			end
		end
	end
end

------------------------
--  OnUpdate Handler  --
------------------------
do
	local rotateState = 0
	arrowFrame:SetScript("OnUpdate", function(self, elapsed)
		--[[
		if WorldMapFrame:IsShown() then -- it doesn't work while the world map arrowFrame is shown
			arrow:Hide()
			return
		end
		]]
		if hideTime and GetTime() > hideTime then
			arrowFrame:Hide()
		end
		arrow:Show()
		-- the static arrow type is special because it doesn't depend on the player's orientation or position
		if targetType == "static" then
			return updateArrow(targetX) -- targetX contains the static angle to show
		end

		local x, y = GetPlayerMapPosition("player")
		if x == 0 and y == 0 then
			SetMapToCurrentZone()
			x, y = GetPlayerMapPosition("player")
			if x == 0 and y == 0 then
				self:Hide() -- hide the arrow if you enter a zone without a map
				return
			end
		end
		if targetType == "player" then
			targetX, targetY = GetPlayerMapPosition(targetPlayer)
			if targetX == 0 and targetY == 0 then
				self:Hide() -- hide the arrow if the target doesn't exist. TODO: just hide the texture and add a timeout
			end
		elseif targetType == "rotate" then
			rotateState = rotateState + elapsed
			targetX = x + cos(rotateState)
			targetY = y + sin(rotateState)
		end
		if not targetX or not targetY then
			return
		end
		if isWorldCoord then
			x,y = mapPositionToCoords(x,y)
			if not x or not y then
				self:Hide()
				return
			end
		end
		local angle = atan2(x - targetX, targetY - y)
		if angle <= 0 then -- -pi < angle < pi but we need/want a value between 0 and 2 pi
			if runAwayArrow then
				angle = -angle -- 0 < angle < pi
			else
				angle = pi - angle -- pi < angle < 2pi
			end
		else
			if runAwayArrow then
				angle = pi2 - angle -- pi < angle < 2pi
			else
				angle = pi - angle  -- 0 < angle < pi
			end
		end
		if isWorldCoord then
			local player = GetPlayerFacing()
			player = player - pi
			if player < 0 then
				player = pi2 + player
			end
			updateArrow(angle - player, calculateWorldDistance(x, y, targetX, targetY))
		else
			updateArrow(angle - GetPlayerFacing(), calculateDistance(x, y, targetX, targetY))
		end
	end)
end


----------------------
--  Public Methods  --
----------------------
local function show(runAway, x, y, distance, time, world, hide)
	local player
	SetMapToCurrentZone()--Set map to current zone before checking other stuff
	UpdateMapSizes()--Force a mapsize update after SetMapToCurrentZone to ensure our information is current
	if type(x) == "string" then
		player, hideDistance, hideTime = x, y, distance
	end
	arrowFrame:Show()
	runAwayArrow = runAway
	hideDistance = distance or runAway and 100 or 3
	if time then
		hideTime = time + GetTime()
	else
		hideTime = nil
	end
	if player then
		targetType = "player"
		targetPlayer = player
	else
		targetType = "fixed"
		targetX, targetY = x, y
	end
	isWorldCoord = world
	dontHide = hide
end

T.ShowRunTo = function(...)
	return show(false, ...)
end

T.ShowRunAway = function(...)
	return show(true, ...)
end

-- shows a static arrow
T.ShowStatic = function(angle, time)
	runAwayArrow = false
	hideDistance = 0
	targetType = "static"
	targetX = angle * pi2 / 360
	if time then
		hideTime = time + GetTime()
	else
		hideTime = nil
	end
	arrowFrame:Show()
end

T.ShowToPlayer = function(...)
	return show(false, ...)
end

--- Other func

local buffFilter = {"HARMFUL","HELPFUL"}
T.ShowToBuff = function(spell)
	local n = GetNumGroupMembers() or 0
	local spellName
	if type(spell) == "string" then
		spellName = spell
	end
	for i=1,n do
		local name, _, _, _, _, _, _, online, isDead = GetRaidRosterInfo(i)
		if name and online and not isDead then
			if spellName then
				for k=1,2 do
					for j=1,40 do
						local auraName = UnitAura(name, j, buffFilter[k])
						if auraName and string.lower(auraName) == spellName then
							return self:ShowToPlayer(name)
						end
					end
				end
			else
				for k=1,2 do
					for j=1,40 do
						local _, _, _, _, _, _, _, _, _, _, spellId = UnitAura(name, j, buffFilter[k])
						if spellId and spellId == spell then
							return self:ShowToPlayer(name)
						end
					end
				end
			end
		end
	end
end

---
T.HideFrames = function()
	iconFrame:Hide()
	iconFrame2:Hide()
	arrowFrame:Hide()
	STFrame:Hide()
end

T.SetFramePoint = function()
	arrowFrame:ClearAllPoints()
	iconFrame:ClearAllPoints()
	iconFrame2:ClearAllPoints()
	STFrame:ClearAllPoints()
	
	arrowFrame:SetPoint(MSS_DB.Arrow.Point1,UIParent,MSS_DB.Arrow.Point2,MSS_DB.Arrow.PointX,MSS_DB.Arrow.PointY)
	iconFrame:SetPoint(MSS_DB.Icon.Point1,UIParent,MSS_DB.Icon.Point2,MSS_DB.Icon.PointX,MSS_DB.Icon.PointY)
	iconFrame2:SetPoint(MSS_DB.Icon2.Point1,UIParent,MSS_DB.Icon2.Point2,MSS_DB.Icon2.PointX,MSS_DB.Icon2.PointY)
	STFrame:SetPoint(MSS_DB.ST.Point1,UIParent,MSS_DB.ST.Point2,MSS_DB.ST.PointX,MSS_DB.ST.PointY)
end

T.SetFrameScale = function()
	arrowFrame:SetScale(MSS_DB.Arrow.Scale/100)
	iconFrame:SetScale(MSS_DB.Icon.Scale/100)
	iconFrame2:SetScale(MSS_DB.Icon2.Scale/100)
	STFrame.infotext:SetFont(G.Font, MSS_DB.ST.FontSize, "OUTLINE")
	STFrame.infotext2:SetFont(G.Font, MSS_DB.ST.FontSize, "OUTLINE")
end

T.SetFrameAlpha = function()
	arrowFrame:SetAlpha(MSS_DB.Arrow.Alpha/100)
	iconFrame:SetAlpha(MSS_DB.Icon.Alpha/100)
	iconFrame2:SetAlpha(MSS_DB.Icon2.Alpha/100)
end

local loginframe = CreateFrame("Frame")
loginframe:HookScript("OnEvent", function()
	T.SetFramePoint()
	T.SetFrameScale()
	T.SetFrameAlpha()
end)
loginframe:RegisterEvent("PLAYER_LOGIN")


local function slash(arg)
	if arg:find("^arrow ") then
		local x,y = arg:match("([0-9%.]+),? ([0-9%.]+)")
		if not x or not y then
			return
		end
		local isWorldCoord = arg:find("^arrow w")
		x = tonumber(x)/100
		y = tonumber(y)/100
		if isWorldCoord then
			local floor, a1, b1, c1, d1 = GetCurrentMapDungeonLevel()
			local _, a2, b2, c2, d2 = GetCurrentMapZone()
			if not a1 or not b1 or not c1 or not d1 then
				a1, b1, c1, d1 = c2, d2, a2, b2
			end
			x = c1 - x * abs(c1-a1)
			y = d1 - y * abs(d1-b1)
		end
		T.ShowRunTo(x,y,nil,nil,isWorldCoord)
	elseif arg:find("^range ") then
		local unit = arg:match("^range (.+)")
		if not unit or not UnitName(unit) then
			print('Unit doesnt exist')
			return
		end
		--local x,y = mapPositionToCoords(GetPlayerMapPosition(unit))
		--local xP,yP = mapPositionToCoords(GetPlayerMapPosition("player"))
		local y,x = UnitPosition(unit)
		local yP,xP = UnitPosition("player")
		--if (x == 0 and y == 0) or (xP == 0 or yP == 0) then
		if not x or not xP then
			print('Map error')
			return
		end
		local dist = calculateWorldDistance(x,y,xP,yP)
		print(format("Distance to %s: %d",unit,dist))
	elseif arg:find("^arrowbuff ") then
		local spell = arg:match("^arrowbuff (.+)")
		if not spell then
			return
		end
		if tonumber(spell) then spell = tonumber(spell) end
		T.ShowToBuff(spell)
	elseif arg:find("^arrowplayer ") then
		local unit,hidetime = arg:match("^arrowplayer ([^ ]+) ?(%d*)")
		if not unit or not UnitName(unit) then
			print('Unit doesnt exist')
			return
		end
		if not tonumber(hidetime) then
			hidetime = nil
		end
		T.ShowToPlayer(unit,nil,nil,hidetime,nil,true)
	elseif arg:find("^arrowplayer2 ") then
		local unit,hidetime = arg:match("^arrowplayer2 ([^ ]+) ?(%d*)")
		if not unit or not UnitName(unit) then
			print('Unit doesnt exist')
			return
		end
		if not tonumber(hidetime) then
			hidetime = nil
		end
		T.ShowToPlayer(unit,nil,nil,hidetime)
	elseif arg:find("^arrowhide") then
		arrowFrame:Hide()
	elseif arg:find("^arrowthis") then
		local y,x = UnitPosition("player")
		T.ShowRunTo(x, y, 3, nil, true, true)
	elseif arg:find("^arrowmark ") then
		local markID = arg:match("^arrowmark (%d+)")
		markID = tonumber(markID or "?")
		if not markID then
			return
		end
		for i=1,40 do
			local mark = GetRaidTargetIndex('raid'..i)
			if mark == markID then
				return self:ShowToPlayer( UnitName('raid'..i), nil )
			end
		end
	elseif arg:find("^arrowget") then
		print(targetX, targetY)	
	elseif arg:find("^test") then
		SendAddonMessage(G.addon, "mark,"..L["左下"]..",11,"..("|c"..G.Ccolors[select(2, UnitClass(G.PlayerName))]["colorStr"].."%s|r"):format(G.PlayerName), "GUILD")
	else
		_G["Mashushu_GUI"]:Show()
		PlaySoundFile("Interface\\AddOns\\Mashushu\\voice\\1.ogg","Master")
	end
end

SlashCmdList["Mashushu"] = slash
SLASH_Mashushu1 = "/mss"
SLASH_Mashushu2 = "/mashushu"

local function ArrowText(angle)
	local cell = floor(angle / pi2 * 108 + 0.5) % 108
	local column = cell % 9
	local row = floor(cell / 9)
	local xStart = (column * 56) / 512
	local yStart = (row * 42) / 512
	local xEnd = ((column + 1) * 56) / 512
	local yEnd = ((row + 1) * 42) / 512
	xStart = floor(512 * xStart)
	xEnd = floor(512 * xEnd)
	yStart = floor(512 * yStart)
	yEnd = floor(512 * yEnd)
	
	return "|T"..G.Media.arrow..":16:16:0:0:512:512:"..xStart..":"..xEnd..":"..yStart..":"..yEnd.."|t"
end

local function ArrowTextPlayer(unit)
	local pY,pX = UnitPosition('player')
	local tY,tX = UnitPosition(unit)
	if not tX or (tY == 0 and tX == 0) then
		return ""
	end
	local angle = atan2(pX - tX, pY - tY)
	local player = GetPlayerFacing()
	
	return ArrowText( angle - player - pi )
end

local function ArrowTextCoord(tX,tY)
	local pY,pX = UnitPosition('player')
	if not tX or not tY or (tY == 0 and tX == 0) then
		return ""
	end
	local angle = atan2(pX - tX, pY - tY)
	local player = GetPlayerFacing()
	
	return ArrowText( angle - player - pi )
end