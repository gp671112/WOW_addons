--[[ File
NAME: TitanMovable.lua
DESC: Contains the routines to adjust the Blizzard frames to make room for the Titan bars the user has selected.
There are a select set of Blizzard frames at the top of screen and at the bottom of the screen that Titan will move.
Each frame adjusted has an entry in MData which is local and not directly accessible via addons.
However addons can tell Titan to not adjust some or all frames using TitanUtils_AddonAdjust(frame, bool). Addons that replace all or parts of the Blizzard UI use this.

The user can turn turn on / off the adjusting of all top frames or all bottom frames.
:DESC
--]]
-- Globals

-- Locals
local _G = getfenv(0);
local InCombatLockdown = _G.InCombatLockdown;

local move_count = 0
--[[ Titan
Declare the Ace routines
 local AceTimer = LibStub("AceTimer-3.0")
 i.e. TitanPanelAce.ScheduleTimer("LDBToTitanSetText", TitanLDBRefreshButton, 2);
 or
 i.e. TitanPanelAce:ScheduleTimer(TitanLDBRefreshButton, 2);

 Be careful that the 'self' is proper to cancel timers!!!
--]]
local TitanPanelAce = LibStub("AceAddon-3.0"):NewAddon("TitanPanel", "AceHook-3.0", "AceTimer-3.0")

--Determines the optimal magic number based on resolution
--local menuBarTop = 55;
--local width, height = string.match((({GetScreenResolutions()})[GetCurrentResolution()] or ""), "(%d+).-(%d+)");
--if ( tonumber(width) / tonumber(height ) > 4/3 ) then
	--Widescreen resolution
--	menuBarTop = 75;
--end

--[[From Resike to prevent tainting stuff to override the SetPoint calls securely.
hooksecurefunc(FrameRef, "SetPoint", function(self)
	if self.moving then
		return
	end
	self.moving = true
	self:SetMovable(true)
	self:SetUserPlaced(true)
	self:ClearAllPoints()
	self:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
	self:SetMovable(false)
	self.moving = nil
end)
--]]

--[[ API
NAME: TitanMovable_GetPanelYOffset
DESC: Get the Y axis offset Titan needs (1 or 2 bars) at the given position - top or bottom.
VAR: framePosition - TITAN_PANEL_PLACE_TOP or TITAN_PANEL_PLACE_BOTTOM
OUT: Y axis offset, in pixels
NOTE:
- The prefered method to determine the Y offset needed by using TitanUtils_GetBarAnchors().
:NOTE
--]]
function TitanMovable_GetPanelYOffset(framePosition) -- used by other addons
-- TitanPanelTopAnchor, TitanPanelBottomAnchor


	-- Both top & bottom are figured out but only the
	-- requested position is returned
--[[
	local barnum_top = TitanPanelTopAnchor:GetBottom()
	local barnum_bot = TitanPanelBottomAnchor:GetTop()

	if framePosition == TITAN_PANEL_PLACE_TOP then
		return -barnum_top
	elseif framePosition == TITAN_PANEL_PLACE_BOTTOM then
		return barnum_bot - 1; 
		-- no idea why -1 is needed... seems anchoring to bottom is off a pixel
	end
--]]
	local barnum_top = 0
	local barnum_bot = 0
	-- If user has the top adjust set then determine the
	-- top offset
	if not TitanPanelGetVar("ScreenAdjust") then
		if TitanPanelGetVar("Bar_Show") then
			barnum_top = 1
		end
		if TitanPanelGetVar("Bar2_Show") then
			barnum_top = 2
		end
	end
	-- If user has the top adjust set then determine the
	-- bottom offset
	if not TitanPanelGetVar("AuxScreenAdjust") then
		if TitanPanelGetVar("AuxBar_Show") then
			barnum_bot = 1
		end
		if TitanPanelGetVar("AuxBar2_Show") then
			barnum_bot = 2
		end
	end
	local scale = TitanPanelGetVar("Scale")
	-- return the requested offset
	-- 0 will be returned if the user has not bars showing
	-- or the scale is not valid
	if scale and framePosition then
		if framePosition == TITAN_PANEL_PLACE_TOP then
			return (-TITAN_PANEL_BAR_HEIGHT * scale)*(barnum_top);
		elseif framePosition == TITAN_PANEL_PLACE_BOTTOM then
			return (TITAN_PANEL_BAR_HEIGHT * scale)*(barnum_bot)-1; 
			-- no idea why -1 is needed... seems anchoring to bottom is off a pixel
		end
	end
	return 0
end

--[[ local
NAME: TitanMovableFrame_GetXOffset
DESC: Get the x axis offset Titan needs to adjust the given frame.
VAR: frame - frame object
VAR: point - "LEFT" / "RIGHT" / "TOP" / "BOTTOM" / "CENTER"
OUT: int - X axis offset, in pixels
--]]
local function TitanMovableFrame_GetXOffset(frame, point)
	-- A valid frame and point is required
	-- Determine a proper X offset using the given point (position)
	local ret = 0 -- In case the inputs were invalid or the point was not relevant to the frame then return 0
	if frame and point then
		if point == "LEFT" and frame:GetLeft() and UIParent:GetLeft() then
			ret = frame:GetLeft() - UIParent:GetLeft();
		elseif point == "RIGHT" and frame:GetRight() and UIParent:GetRight() then
			ret = frame:GetRight() - UIParent:GetRight();			
		elseif point == "TOP" and frame:GetTop() and UIParent:GetTop() then
			ret = frame:GetTop() - UIParent:GetTop();
		elseif point == "BOTTOM" and frame:GetBottom() and UIParent:GetBottom() then
			ret = frame:GetBottom() - UIParent:GetBottom();
		elseif point == "CENTER" and frame:GetLeft() and frame:GetRight() 
				and UIParent:GetLeft() and UIParent:GetRight() then
			local framescale = frame.GetScale and frame:GetScale() or 1;
			ret = (frame:GetLeft()* framescale + frame:GetRight()
				* framescale - UIParent:GetLeft() - UIParent:GetRight()) / 2;
		end
	end

	return ret
end

--[[ local
NAME: MoveFrame
DESC: Adjust the given frame. Expected are frames where :GetPoint works
VAR: frame_ptr - Text string of the frame name
VAR: start_y - Any offset due to the specific frame
OUT: top_bottom - Frame is at top or bottom, expecting Titan constant for top or bottom
--]]
local function MoveFrame(frame_ptr, start_y, top_bottom)
	local frame = _G[frame_ptr]
	if frame and frame:IsUserPlaced() then
		-- skip this frame
	else
		if frame:IsShown() then
			local y = TitanMovable_GetPanelYOffset(top_bottom) + (start_y or 0) -- includes scale adjustment
			local point, relativeTo, relativePoint, xOfs, yOfs = frame:GetPoint()
			frame:ClearAllPoints();		
			frame:SetPoint(point, relativeTo:GetName(), relativePoint, xOfs, y)
		else
			--[[
			Some frames such as the ticket frame may not be visible or even created
			--]]
		end
	end
end

--[[ local
NAME: MoveMenuFrame
DESC: Adjust the MainMenuBar frame. Needed because :GetPoint does NOT work. This is modeled after MoveFrame to keep it similar.
Titan sets the IsUserPlaced for the MainMenuBar frame so Titan needs to adjust.
VAR: frame_ptr - Text string of the frame name
VAR: start_y - Any offset due to the specific frame
OUT: top_bottom - Frame is at top or bottom, expecting Titan constant for top or bottom
--]]
local function MoveMenuFrame(frame_ptr, start_y, top_bottom)
	local frame = _G[frame_ptr]
	if frame then
		local yOffset = TitanMovable_GetPanelYOffset(top_bottom) -- includes scale adjustment
		xOffset = TitanMovableFrame_GetXOffset(frame, top_bottom);
		if ( StatusTrackingBarManager:GetNumberVisibleBars() == 2 ) then
			yOffset = yOffset + 17;
		elseif ( StatusTrackingBarManager:GetNumberVisibleBars() == 1 ) then
			yOffset = yOffset + 14;
		end
		frame:ClearAllPoints();		
		frame:SetPoint("BOTTOM", "UIParent", "BOTTOM", xOffset, yOffset);
	end
end

--[[ Titan
NAME: Titan_FCF_UpdateDockPosition
DESC: Secure post hook to help adjust the chat / log frame.
VAR:  None
OUT:  None
NOTE:
- This is required because Blizz adjusts the chat frame relative to other frames so some of the Blizz code is copied.
- If in combat or if the user has moved the chat frame then no action is taken.
- The frame is adjusted in the Y axis only.
:NOTE
--]]
local function Titan_FCF_UpdateDockPosition()
	if not Titan__InitializedPEW
	or not TitanPanelGetVar("LogAdjust") 
	or TitanPanelGetVar("AuxScreenAdjust") then 
		return 
	end
	
	if not InCombatLockdown() or (InCombatLockdown() 
	and not _G["DEFAULT_CHAT_FRAME"]:IsProtected()) then
		local panelYOffset = TitanMovable_GetPanelYOffset(TITAN_PANEL_PLACE_BOTTOM);
		local scale = TitanPanelGetVar("Scale");
		if scale then
			panelYOffset = panelYOffset + (24 * scale) -- after 3.3.5 an additional adjust was needed. why? idk
		end

--[[ Blizz code
		if _G["DEFAULT_CHAT_FRAME"]:IsUserPlaced() then
			if _G["SIMPLE_CHAT"] ~= "1" then return end
		end
		
		local chatOffset = 85 + panelYOffset;
		if GetNumShapeshiftForms() > 0 or HasPetUI() or PetHasActionBar() then
			if MultiBarBottomLeft:IsVisible() then
				chatOffset = chatOffset + 55;
			else
				chatOffset = chatOffset + 15;
			end
		elseif MultiBarBottomLeft:IsVisible() then
			chatOffset = chatOffset + 15;
		end
		_G["DEFAULT_CHAT_FRAME"]:SetPoint("BOTTOMLEFT", "UIParent", "BOTTOMLEFT", 32, chatOffset);
		FCF_DockUpdate();
--]]
		if ( DEFAULT_CHAT_FRAME:IsUserPlaced() ) then
			return;
		end
		
		local chatOffset = 85 + panelYOffset; -- Titan change to adjust Y offset
		if ( GetNumShapeshiftForms() > 0 or HasPetUI() or PetHasActionBar() ) then
			if ( MultiBarBottomLeft:IsShown() ) then
				chatOffset = chatOffset + 55;
			else
				chatOffset = chatOffset + 15;
			end
		elseif ( MultiBarBottomLeft:IsShown() ) then
			chatOffset = chatOffset + 15;
		end
		DEFAULT_CHAT_FRAME:SetPoint("BOTTOMLEFT", "UIParent", "BOTTOMLEFT", 
			32, chatOffset);
		FCF_DockUpdate();
	end
end

--[[ Titan
NAME: Titan_ContainerFrames_Relocate
DESC: Secure post hook to help adjust the bag frames.
VAR:  None
OUT:  None
NOTE:
- The frame is adjusted in the Y axis only.
- The Blizz routine "ContainerFrames_Relocate" should be examined for any conditions it checks and any changes to the SetPoint.
If Blizz changes the anchor points the SetPoint here must change as well!!
The Blizz routine calculates X & Y offsets to UIParent (screen) so there is not need to store the prior offsets.
Like the Blizz routine we search through the visible bags. Unlike the Blizz routine we only care about the first of each column to adjust for Titan.
This way the Blizz code does not need to be copied here.
:NOTE
--]]
local function Titan_ContainerFrames_Relocate()
	if not TitanPanelGetVar("BagAdjust") then 
		return 
	end

	local panelYOffset = TitanMovable_GetPanelYOffset(TITAN_PANEL_PLACE_BOTTOM)
	local off_y = 10000 -- something ridiculously high
	local bottom_y = 0
	local right_x = 0

	for index, frameName in ipairs(ContainerFrame1.bags) do
		frame = _G[frameName];
		if frame:GetBottom() then bottom_y = frame:GetBottom() end
		if ( bottom_y < off_y ) then
			-- Start a new column
			right_x = frame:GetRight()
			frame:ClearAllPoints();		
			frame:SetPoint("BOTTOMRIGHT", frame:GetParent(), 
				"BOTTOMLEFT", -- changed because we are taking the current x value
				right_x, -- x is not adjusted
				bottom_y + panelYOffset -- y
			)
		end
		off_y = bottom_y
	end
end

--[[ local
NAME: MData table
DESC: MData is a local table that holds each frame Titan may need to adjust. It controls the offsets needed to make room for the Titan bar(s).
Each frame can be adjusted by modifying its 'move' function.
The index is the frame name. Each record contains:
frameName - frame name (string) to adjust
addonAdj - true if another addon is taking responsibility of adjusting this frame, if false Titan will use the user settings to adjust or not
:DESC
NOTE:
- Of course Blizzard had to make the MainMenuBar act differently <sigh>. :GetPoint() does not work on it so a special helper routine was needed.
:NOTE
--]]
local MData = {
	[1] = {frameName = "PlayerFrame", 
		move = function () MoveFrame("PlayerFrame", 0, TITAN_PANEL_PLACE_TOP) end, 
		addonAdj = false, },
	[2] = {frameName = "TargetFrame", 
		move = function () MoveFrame("TargetFrame", 0, TITAN_PANEL_PLACE_TOP) end, 
		addonAdj = false, },
	[3] = {frameName = "PartyMemberFrame1", 
		move = function () MoveFrame("PartyMemberFrame1", -128, TITAN_PANEL_PLACE_TOP) end, 
		addonAdj = false, },
	[4] = {frameName = "TicketStatusFrame", 
		move = function () MoveFrame("TicketStatusFrame", 0, TITAN_PANEL_PLACE_TOP) end, 
		addonAdj = false, },
	[5] = {frameName = "BuffFrame", 
		move = function () 
			-- properly adjust buff frame(s) if GM Ticket is visible

			-- Use IsShown rather than IsVisible. In some cases (after closing
			-- full screen map) the ticket may not yet be visible.
			local yOffset = 0
			if TicketStatusFrame:IsShown()
			and TitanPanelGetVar("TicketAdjust") 
			then
				yOffset = (-TicketStatusFrame:GetHeight())
			else
				yOffset = -13
			end
			MoveFrame("BuffFrame", yOffset, TITAN_PANEL_PLACE_TOP) end, 
		addonAdj = false, },
	[6] = {frameName = "MinimapCluster", 
		move = function () 
			local yOffset = 0
			if MinimapBorderTop 
			and not MinimapBorderTop:IsShown() then
				yOffset = yOffset + (MinimapBorderTop:GetHeight() * 3/5) - 5
			end
			MoveFrame("MinimapCluster", yOffset, TITAN_PANEL_PLACE_TOP) end, 
		addonAdj = false, },
	[7] = {frameName = "MultiBarRight", 
		move = function () 
				-- account for Reputation Status Bar (doh)
			local yOffset = 98
				local playerlevel = UnitLevel("player");
				if ReputationWatchStatusBar 
				and ReputationWatchStatusBar:IsVisible() 
				and playerlevel < _G["MAX_PLAYER_LEVEL"] then
					yOffset = yOffset + 8;
				end
			MoveFrame("MultiBarRight", yOffset, TITAN_PANEL_PLACE_BOTTOM) end, 
		addonAdj = false, },
	[8] = {frameName = "OverrideActionBar", 
		move = function () MoveFrame("OverrideActionBar", 0, TITAN_PANEL_PLACE_BOTTOM) end, 
		addonAdj = false, },
	[9] = {frameName = "MicroButtonAndBagsBar", 
		move = function () MoveFrame("MicroButtonAndBagsBar", 0, TITAN_PANEL_PLACE_BOTTOM) end, 
		addonAdj = false, },
	[10] = {frameName = "MainMenuBar", 
		move = function () 
			MoveMenuFrame("MainMenuBar", 0, TITAN_PANEL_PLACE_BOTTOM) end, 
		addonAdj = false, },
--]]
}

--[[ Titan
NAME: TitanMovable_AdjustTimer
DESC: Cancel then add the given timer. The timer must be in TitanTimers.
VAR: ttype - The timer type (string) as defined in TitanTimers
OUT:  None
--]]
function TitanMovable_AdjustTimer(ttype)
	local timer = TitanTimers[ttype]
	if timer then
		TitanPanelAce.CancelAllTimers(timer.obj)
		TitanPanelAce.ScheduleTimer(timer.obj, timer.callback, timer.delay)
	end
end

--[[ Titan
NAME: TitanMovable_AddonAdjust
DESC: Set the given frame to be adjusted or not by another addon. This is called from TitanUtils for a developer API.
VAR: frame - frame name (string)
VAR: bool - true (addon will adjust) or false (Titan will use its settings) 
OUT:  None
--]]
function TitanMovable_AddonAdjust(frame, bool)
	for i = 1,#MData,1 do
		local fData = MData[i]
		local fName = nil
		if fData then
			fName = fData.frameName;
		end

		if (frame == fName) then
			fData.addonAdj = bool
		end
	end
end

--[[ local
NAME: TitanMovableFrame_MoveFrames
DESC: Loop through MData calling each frame's 'move' function for each Titan controlled frame.
Then update the chat and open bag frames.
OUT: None
--]]
local function TitanMovableFrame_MoveFrames()
	if not InCombatLockdown() then
		for i = 1,#MData,1 do
			if MData[i] then
				if MData[i].addonAdj then
					-- An addon has taken control of the frame so skip
				else
					-- Adjust the frame per MData
					MData[i].move()
				end
			end
		end
--[[
move_count = move_count + 1
TitanPrint("Move "
.." "..move_count
)
--]]
		Titan_FCF_UpdateDockPosition(); -- chat
		UpdateContainerFrameAnchors(); -- Move bags as needed
	else
		-- nothing to do
	end
end

--[[ local
NAME: Titan_AdjustUIScale
DESC: Adjust the scale of Titan bars and plugins to the user selected scaling. This is called by the secure post hooks to the 'Video Options Frame'.
VAR:  None
OUT:  None
--]]
local function Titan_AdjustUIScale()	
	Titan_AdjustScale()
end

--[[ Titan
NAME: TitanPanel_AdjustFrames
DESC: Adjust the frames for the Titan visible bars.
This is a shell for the actual Movable routine by other Titan routines and used by hooks
OUT:  None
NOTE:
:NOTE
--]]
function TitanPanel_AdjustFrames()
	-- Adjust frame positions top and bottom
	TitanMovableFrame_MoveFrames()
end

--[[ Titan
NAME: Titan_AdjustScale
DESC: Update the bars and plugins to the user selected scale.
VAR:  None
OUT:  None
NOTE:
- Ensure Titan has done its initialization before this is run.
:NOTE
--]]
function Titan_AdjustScale()
	-- Only adjust if Titan is fully initialized
	if Titan__InitializedPEW then 
		TitanPanel_SetScale();
		
		TitanPanel_ClearAllBarTextures()
		TitanPanel_CreateBarTextures()

		for idx,v in pairs (TitanBarData) do
			TitanPanel_SetTexture(TITAN_PANEL_DISPLAY_PREFIX..TitanBarData[idx].name
				, TITAN_PANEL_PLACE_TOP);
		end

		TitanPanelBarButton_DisplayBarsWanted()
		TitanPanel_RefreshPanelButtons();
	end
end

--[[ Titan
NAME: TitanMovable_SecureFrames
DESC: Once Titan is initialized create the post hooks we need to help adjust frames properly.
VAR:  None
OUT:  None
NOTE:
- The secure post hooks are required because Blizz adjusts frames Titan is interested in at times other than the events Titan registers for.
- This used to be inline code but was moved to a routine to avoid errors as Titan loaded.
:NOTE
--]]
function TitanMovable_SecureFrames()
	if not TitanPanelAce:IsHooked("FCF_UpdateDockPosition", Titan_FCF_UpdateDockPosition) then
		TitanPanelAce:SecureHook("FCF_UpdateDockPosition", Titan_FCF_UpdateDockPosition) -- FloatingChatFrame
	end
	if not TitanPanelAce:IsHooked("UIParent_ManageFramePositions", TitanPanel_AdjustFrames) then
		TitanPanelAce:SecureHook("UIParent_ManageFramePositions", TitanPanel_AdjustFrames) -- UIParent.lua
		TitanPanel_AdjustFrames()
	end

	if not TitanPanelAce:IsHooked(TicketStatusFrame, "Show", TitanPanel_AdjustFrames) then
		TitanPanelAce:SecureHook(TicketStatusFrame, "Show", TitanPanel_AdjustFrames) -- HelpFrame.xml
		TitanPanelAce:SecureHook(TicketStatusFrame, "Hide", TitanPanel_AdjustFrames) -- HelpFrame.xml
		TitanPanelAce:SecureHook("TargetFrame_Update", TitanPanel_AdjustFrames) -- TargetFrame.lua
		TitanPanelAce:SecureHook(MainMenuBar, "Show", TitanPanel_AdjustFrames) -- HelpFrame.xml
		TitanPanelAce:SecureHook(MainMenuBar, "Hide", TitanPanel_AdjustFrames) -- HelpFrame.xml
		TitanPanelAce:SecureHook(OverrideActionBar, "Show", TitanPanel_AdjustFrames) -- HelpFrame.xml
		TitanPanelAce:SecureHook(OverrideActionBar, "Hide", TitanPanel_AdjustFrames) -- HelpFrame.xml
		TitanPanelAce:SecureHook("UpdateContainerFrameAnchors", Titan_ContainerFrames_Relocate) -- ContainerFrame.lua
		TitanPanelAce:SecureHook(WorldMapFrame.BorderFrame.MaximizeMinimizeFrame.MinimizeButton, "Show", TitanPanel_AdjustFrames) -- WorldMapFrame.lua

		--[[
		Setting the MainMenuBar was needed because in 8.0.0 Blizzard changed something in the 
		way they controlled the frame. With Titan panel and bottom bars the MainMenuBar
		would 'bounce'. Figuring out what the root cause was a bust.
		This fix came from a Titan user.
		--]]
		MainMenuBar:SetMovable(true);
		MainMenuBar:SetUserPlaced(true);
		MainMenuBar:SetMovable(false);
	end
		
	if not TitanPanelAce:IsHooked("VideoOptionsFrameOkay_OnClick", Titan_AdjustUIScale) then
		-- Properly Adjust UI Scale if set
		-- Note: These are the least intrusive hooks we could think of, to properly adjust the Titan Bar(s)
		-- without having to resort to a SetCvar secure hook. Any addon using SetCvar should make sure to use the 3rd
		-- argument in the API call and trigger the CVAR_UPDATE event with an appropriate argument so that other addons
		-- can detect this behavior and fire their own functions (where applicable).
		TitanPanelAce:SecureHook("VideoOptionsFrameOkay_OnClick", Titan_AdjustUIScale) -- VideoOptionsFrame.lua
		TitanPanelAce:SecureHook(VideoOptionsFrame, "Hide", Titan_AdjustUIScale) -- VideoOptionsFrame.xml
	end
end
