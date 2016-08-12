local T, L, G = unpack(select(2, ...))

local chaosfrom, chaostarget
local mychaosto, mychaosby
local testindex
local wrought_chaos = GetSpellInfo(186123)
local focused_chaos = GetSpellInfo(185014)
local legion_mark = GetSpellInfo(187050)
local st_x, st_y = 0, 0
local Inrange = {}
local raidroster = {}

local gui = CreateFrame("Frame", "Mashushu_GUI", UIParent)
gui:SetSize(500, 780)
gui:SetScale(1)
gui:SetPoint("CENTER", UIParent, "CENTER")
gui:SetFrameStrata("HIGH")
gui:SetFrameLevel(2)
gui:Hide()

gui:RegisterForDrag("LeftButton")
gui:SetScript("OnDragStart", function(self) self:StartMoving() end)
gui:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
gui:SetClampedToScreen(true)
gui:SetMovable(true)
gui:SetUserPlaced(true)
gui:EnableMouse(true)

T.createborder(gui)

gui.title = T.createtext(gui, "OVERLAY", 15, "OUTLINE", "CENTER")
gui.title:SetPoint("BOTTOM", gui, "TOP", 0, -5)
gui.title:SetText(G.AddonColor.."Mashushu v"..GetAddOnMetadata("Mashushu", "Version").."|r")

gui.close = CreateFrame("Button", nil, gui)
gui.close:SetPoint("BOTTOMRIGHT", -3, 3)
gui.close:SetSize(20, 20)
gui.close:SetNormalTexture("Interface\\BUTTONS\\UI-GroupLoot-Pass-Up")
gui.close:SetHighlightTexture("Interface\\BUTTONS\\UI-GroupLoot-Pass-Highlight")
gui.close:SetPushedTexture("Interface\\BUTTONS\\UI-GroupLoot-Pass-Down")
gui.close:SetPushedTextOffset(3, 3)
gui.close:SetScript("OnClick", function() gui:Hide() end)

--====================================================--
--[[                   -- TABS --                   ]]--
--====================================================--

gui.sender = CreateFrame("Frame", nil, gui)
gui.sender:SetPoint("TOPLEFT", gui, "TOPLEFT", 15, -10)
gui.sender:SetSize(230, 20)
gui.sender.index = 1
T.createborder(gui.sender)

gui.sender.name = T.createtext(gui.sender, "OVERLAY", 12, "OUTLINE", "CENTER")
gui.sender.name:SetPoint("CENTER")
gui.sender.name:SetText(L["发送者"]..L["选项"])

gui.sender.optionframe = CreateFrame("Frame", nil, gui.sender)
gui.sender.optionframe:SetPoint("TOPLEFT", gui, "TOPLEFT", 0, -25)
gui.sender.optionframe:SetPoint("BOTTOMRIGHT", gui, "BOTTOMRIGHT", 0, 0)

gui.reciver = CreateFrame("Frame", nil, gui)
gui.reciver:SetPoint("TOPRIGHT", gui, "TOPRIGHT", -15, -10)
gui.reciver:SetSize(230, 20)
gui.reciver.index = 2
T.createborder(gui.reciver)

gui.reciver.name = T.createtext(gui.reciver, "OVERLAY", 12, "OUTLINE", "CENTER")
gui.reciver.name:SetPoint("CENTER")
gui.reciver.name:SetText(L["接收者"]..L["选项"])

gui.reciver.optionframe = CreateFrame("Frame", nil, gui.reciver)
gui.reciver.optionframe:SetPoint("TOPLEFT", gui, "TOPLEFT", 0, -25)
gui.reciver.optionframe:SetPoint("BOTTOMRIGHT", gui, "BOTTOMRIGHT", 0, 0)

local active_tab = 1

local function ClickTab(tab)
	active_tab = tab.index
end

local function UpdateTab()

	if gui.sender.index == active_tab then
		gui.sender.sd:SetBackdropBorderColor(0.5, 0.5, 1)
		gui.sender.optionframe:Show()
	else
		gui.sender.sd:SetBackdropBorderColor(0, 0, 0)
		gui.sender.optionframe:Hide()
	end
	
	if gui.reciver.index == active_tab then
		gui.reciver.sd:SetBackdropBorderColor(0.5, 0.5, 1)
		gui.reciver.optionframe:Show()
	else
		gui.reciver.sd:SetBackdropBorderColor(0, 0, 0)
		gui.reciver.optionframe:Hide()
	end
	
end

gui.sender:SetScript("OnMouseDown", function(tab) ClickTab(tab) UpdateTab() end)
gui.reciver:SetScript("OnMouseDown", function(tab) ClickTab(tab) UpdateTab() end)

--====================================================--
--[[                   -- Sender --                 ]]--
--====================================================--

gui.role = CreateFrame("Frame", nil, gui.sender.optionframe)
gui.role:SetPoint("TOPLEFT", gui.sender.optionframe, "TOPLEFT", 15, -20)
gui.role:SetSize(230, 40)
T.createborder(gui.role)

gui.role.text = T.createtext(gui.role, "OVERLAY", 12, "OUTLINE", "CENTER")
gui.role.text:SetPoint("TOPLEFT", gui.role, "TOPLEFT", 15, -5)
gui.role.text:SetText(G.AddonColor..L["角色"].."|r")

local role_group = {
	["Sender"] = L["发送者"],
	["Reciver"] = L["接收者"],
}
local rolebuttons = T.createradiobuttongroup(gui.role, "Myrole", role_group, "TOPLEFT", gui.role, "TOPLEFT", 70, -10)
rolebuttons.Sender:SetScript("OnEnter", function(self)
											GameTooltip:SetOwner(self, "ANCHOR_RIGHT",  -20, 10)
											GameTooltip:AddLine(L["队长权限"])
											GameTooltip:Show()
										end)
rolebuttons.Sender:SetScript("OnLeave", function(self) GameTooltip:Hide() end)
	
gui.space = CreateFrame("Frame", nil, gui.sender.optionframe)
gui.space:SetPoint("TOPLEFT", gui.role, "TOPRIGHT", 10, 0)
gui.space:SetSize(230, 40)
T.createborder(gui.space)

gui.space.text = T.createtext(gui.space, "OVERLAY", 12, "OUTLINE", "CENTER")
gui.space.text:SetPoint("TOPLEFT", gui.space, "TOPLEFT", 15, -5)
gui.space.text:SetText(G.AddonColor..L["间距"].."|r")

local space_group = {
	["3"] = "3",
	["4"] = "4",
	["5"] = "5",
	["6"] = "6",
}
T.createradiobuttongroup(gui.space, "Space", space_group, "TOPLEFT", gui.space, "TOPLEFT", 60, -10)

gui.center = CreateFrame("Frame", nil, gui.sender.optionframe)
gui.center:SetPoint("TOPLEFT", gui.sender.optionframe, "TOPLEFT", 15, -75)
gui.center:SetPoint("TOPRIGHT", gui.sender.optionframe, "TOPRIGHT", -15, -75)
gui.center:SetHeight(60)
T.createborder(gui.center)

gui.center.text = T.createtext(gui.center, "OVERLAY", 12, "OUTLINE", "CENTER")
gui.center.text:SetPoint("TOPLEFT", gui.center, "TOPLEFT", 15, -5)
gui.center.text:SetText(G.AddonColor..L["站位中心坐标"].."|r")

local function Reskinbox(box, name, value, ...)
	box:SetPoint(...)

	box.name = T.createtext(box, "OVERLAY", 12, "OUTLINE", "LEFT")
	box.name:SetPoint("RIGHT", box, "LEFT", -5, 0)
	box.name:SetText(G.AddonColor..name.."|r")
	
	local bd = CreateFrame("Frame", nil, box)
	bd:SetPoint("TOPLEFT", -2, 0)
	bd:SetPoint("BOTTOMRIGHT")
	bd:SetFrameLevel(box:GetFrameLevel()-1)
	T.createborder(bd)
	
	box:SetFont(GameFontHighlight:GetFont(), 12, "OUTLINE")
	box:SetAutoFocus(false)
	--box:SetNumeric(true)
	box:SetTextInsets(3, 0, 0, 0)
	
	box:SetScript("OnShow", function(self)
		self:SetText(format("%d", MSS_DB.Center[value]*100))
	end)
	
	box:SetScript("OnEscapePressed", function(self) 
		self:SetText(format("%d", MSS_DB.Center[value]*100))
		self:ClearFocus()
	end)
	
	box:SetScript("OnEnterPressed", function(self)
		MSS_DB.Center[value] = self:GetNumber()/100
		T.GetCoords(MSS_DB.Coords, MSS_DB.Space)
		self:ClearFocus()
	end)
end

-- x
gui.x_input = CreateFrame("EditBox", G.addon.."x_input", gui.sender.optionframe)
gui.x_input:SetSize(70, 20)
Reskinbox(gui.x_input, "X", "x", "TOPLEFT", gui.center, "TOPLEFT", 40, -30)

-- y
gui.y_input = CreateFrame("EditBox", G.addon.."y_input", gui.sender.optionframe)
gui.y_input:SetSize(70, 20)
Reskinbox(gui.y_input, "Y", "y", "LEFT", gui.x_input, "RIGHT", 40, 0)

gui.getcoord = CreateFrame("Button", G.addon.."getcoord", gui.sender.optionframe, "UIPanelButtonTemplate")
gui.getcoord:SetPoint("LEFT", gui.y_input, "RIGHT", 25, 0)
gui.getcoord:SetSize(100, 20)
gui.getcoord:SetText(L["使用当前位置"])
gui.getcoord:SetScript("OnClick", function()
	local x,y = GetPlayerMapPosition("player")
	MSS_DB.Center["x"] = x
	MSS_DB.Center["y"] = y
	
	gui.x_input:SetText(format("%d", x*100))
	gui.x_input:ClearFocus()
	gui.y_input:SetText(format("%d", y*100))
	gui.y_input:ClearFocus()
	T.GetCoords(MSS_DB.Coords, MSS_DB.Space)
	T.GetFlareCoords(MSS_DB.Flare_Coords, MSS_DB.Space)
end)

gui.resetcoord = CreateFrame("Button", G.addon.."resetcoord", gui.sender.optionframe, "UIPanelButtonTemplate")
gui.resetcoord:SetPoint("LEFT", gui.getcoord, "RIGHT", 15, 0)
gui.resetcoord:SetSize(100, 20)
gui.resetcoord:SetText(L["使用默认位置"])
gui.resetcoord:SetScript("OnClick", function()
	MSS_DB.Center["x"] = G.Default.Center["x"]
	MSS_DB.Center["y"] = G.Default.Center["y"]
	
	gui.x_input:SetText(format("%d", MSS_DB.Center["x"]*100))
	gui.x_input:ClearFocus()
	gui.y_input:SetText(format("%d", MSS_DB.Center["y"]*100))
	gui.y_input:ClearFocus()
	T.GetCoords(MSS_DB.Coords, MSS_DB.Space)
	T.GetFlareCoords(MSS_DB.Flare_Coords, MSS_DB.Space)
end)

gui.simu = CreateFrame("Frame", nil, gui.sender.optionframe)
gui.simu:SetPoint("TOPLEFT", gui.sender.optionframe, "TOPLEFT", 15, -150)
gui.simu:SetPoint("TOPRIGHT", gui.sender.optionframe, "TOPRIGHT", -15, -150)
gui.simu:SetPoint("BOTTOM", gui.sender.optionframe, "BOTTOM", 0, 15)
T.createborder(gui.simu)

gui.simu_button = CreateFrame("Button", G.addon.."simu_button", gui.simu, "UIPanelButtonTemplate")
gui.simu_button:SetPoint("TOPLEFT", gui.simu, "TOPLEFT", 15, -8)
gui.simu_button:SetPoint("TOPRIGHT", gui.simu, "TOPRIGHT", -15, -8)
gui.simu_button:SetHeight(20)
gui.simu_button:SetText(L["模拟坐标"])

local simu_players = {}
local simu_flares = {}

for i = 1, 20 do
	simu_players[i] = CreateFrame("Frame", G.addon.."simu_player"..i, gui.simu)
	simu_players[i]:SetSize(45, 20)
	T.createborder(simu_players[i], 0.5, 0.5, 1)
	simu_players[i].sd:Hide()
	
	simu_players[i].title = T.createtext(simu_players[i], "OVERLAY", 10, "OUTLINE", "BOTTOM")
	simu_players[i].title:SetPoint("TOP", simu_players[i], "TOP", 0, -2)
	simu_players[i].title:SetText(G.AddonColor.."< "..i.." >|r")
	
	simu_players[i].coords = T.createtext(simu_players[i], "OVERLAY", 10, "OUTLINE", "TOP")
	simu_players[i].coords:SetPoint("TOP", simu_players[i].title, "BOTTOM", 0, 2)
	
	simu_players[i].name = T.createtext(simu_players[i], "OVERLAY", 10, "OUTLINE", "LEFT")
	simu_players[i].name:SetPoint("LEFT", simu_players[i], "RIGHT", 2, 0)
	
	simu_players[i].t = 0
	
	simu_players[i]:SetScript("OnEnter", function(self)
								GameTooltip:SetOwner(self, "ANCHOR_RIGHT",  -20, 10)
								local x = format("%d", self.x*100)
								local y = format("%d", self.y*100)
								GameTooltip:AddLine(L["地图坐标"]..":"..x..","..y)
								GameTooltip:Show()
								self.sd:Show()
							end)
	simu_players[i]:SetScript("OnLeave", function(self) GameTooltip:Hide() self.sd:Hide() end)
end

for i = 1, 6 do
	simu_flares[i] = CreateFrame("Button", G.addon.."simu_flare"..i, gui.simu, "UIPanelButtonTemplate")
	simu_flares[i]:SetSize(20, 20)
	simu_flares[i]:SetFrameLevel(20)
	
	simu_flares[i].texture = simu_flares[i]:CreateTexture(nil, "OVERLAY")
	simu_flares[i].texture:SetPoint("TOPLEFT", 3, -3)
	simu_flares[i].texture:SetPoint("BOTTOMRIGHT", -3, 3)
	simu_flares[i].texture:SetTexture("Interface\\TARGETINGFRAME\\UI-RAIDTARGETINGICON_"..i)

	simu_flares[i]:SetScript("OnEnter", function(self) 
								GameTooltip:SetOwner(self, "ANCHOR_RIGHT",  -20, 10)
								local x = format("%d", self.x*100)
								local y = format("%d", self.y*100)
								GameTooltip:AddLine(L["地图坐标"]..":"..x..","..y)
								GameTooltip:Show() 
							end)
	simu_flares[i]:SetScript("OnLeave", function(self) GameTooltip:Hide() end)
	simu_flares[i]:SetScript("OnClick", function(self)
		T.ShowRunTo(self.x, self.y, 2)
	end)
end

local function SimulateCoords()
	local dims = T.GetMapSizes()
	if not dims then
		return
	end
	for i = 1, 20 do
		simu_players[i]:SetPoint("CENTER", gui.simu, "CENTER", -MSS_DB.Coords[i]["x"]*8, MSS_DB.Coords[i]["y"]*8)
		simu_players[i].coords:SetText(MSS_DB.Coords[i]["x"]..","..MSS_DB.Coords[i]["y"])
		simu_players[i]["x"] = MSS_DB.Center["x"]+MSS_DB.Coords[i]["x"]/dims[1]
		simu_players[i]["y"] = MSS_DB.Center["y"]+MSS_DB.Coords[i]["y"]/dims[2]
	end
	for i = 1, 6 do
		simu_flares[i]:SetPoint("CENTER", gui.simu, "CENTER", -MSS_DB.Flare_Coords[i]["x"]*8, MSS_DB.Flare_Coords[i]["y"]*8)
		simu_flares[i]["x"] = MSS_DB.Center["x"]+MSS_DB.Flare_Coords[i]["x"]/dims[1]
		simu_flares[i]["y"] = MSS_DB.Center["y"]+MSS_DB.Flare_Coords[i]["y"]/dims[2]
	end
end

gui.simu_button:SetScript("OnClick", SimulateCoords)

gui.test_button = CreateFrame("Button", G.addon.."test_button", gui.simu, "UIPanelButtonTemplate")
gui.test_button:SetPoint("TOP", gui.simu, "CENTER", 0, -5)
gui.test_button:SetSize(100, 20)
gui.test_button:SetText(L["测试"])

gui.ver_button = CreateFrame("Button", G.addon.."test_button", gui.simu, "UIPanelButtonTemplate")
gui.ver_button:SetPoint("BOTTOM", gui.simu, "CENTER", 0, 5)
gui.ver_button:SetSize(100, 20)
gui.ver_button:SetText(L["检测版本"])
gui.ver_button:SetScript("OnEnter", function(self)
											GameTooltip:SetOwner(self, "ANCHOR_RIGHT",  -20, 10)
											GameTooltip:AddLine(L["队长权限"])
											GameTooltip:Show()
										end)
gui.ver_button:SetScript("OnLeave", function(self) GameTooltip:Hide() end)
gui.ver_button:SetScript("OnEvent", function(self, event, ...)
	if event == "CHAT_MSG_ADDON" then
		local prefix, message, channel, sender = ...
		if prefix == G.addon then
			local arg1, name, realm, ver = string.split(",", message)
			if arg1 == "ver2" then
				local fullname = name.."-"..realm
				if raidroster[fullname] == 0 then
					raidroster[fullname] = ver
				end
			end
		end
	end
end)
	
local function Test()
	if IsInRaid() and MSS_DB["Myrole"] == "Sender" then
		print(G.AddonColor..G.addon.."|r:"..L["团队测试开始"])
		local number = GetNumGroupMembers()
		if number > 20 then
			number = 20
		end

		for i = 1, number do
			local name, realm = UnitName("raid"..i)
			if not realm then
				realm = G.PlayerRealm
			end
			local fullname = name.."-"..realm
			
			if name then
				if UnitIsUnit("player", "raid"..i) then
					T.ShowRunTo(simu_players[i]["x"], simu_players[i]["y"], nil, nil, nil, true)
					T.ShowIconInfo(i)
				else
					SendAddonMessage(G.addon, "chaos,"..fullname..","..i..","..simu_players[i]["x"]..","..simu_players[i]["y"], "RAID")
				end
				simu_players[i].name:SetText(name)
				C_Timer.After(18, function()
					simu_players[i].name:SetText("")
				end)
			end
			
		end	
	else
		print(G.AddonColor..G.addon.."|r:"..L["个人测试开始"])
		local index = random(1 ,20)
		T.ShowRunTo(simu_players[index]["x"], simu_players[index]["y"], nil, nil, nil, true)
		T.ShowIconInfo(index)

		simu_players[index].sd:SetBackdropColor(1, 1, 0, .5)
		simu_players[index].sd:SetBackdropBorderColor(1, 1, 0)
		simu_players[index].sd:Show()		
		C_Timer.After(18, function()
			simu_players[index].sd:SetBackdropColor(.5, .5, 1, .5)
			simu_players[index].sd:SetBackdropBorderColor(.5, .5, 1)
			simu_players[index].sd:Hide()		  
		end)
		
		for i = 1, 20 do
			if i ~= index then
				simu_players[i].sd:SetBackdropColor(.5, .5, 1, .5)
				simu_players[i].sd:SetBackdropBorderColor(.5, .5, 1)
				simu_players[i].sd:Hide()
			end
		end
	end
end

local function GetVer()
	if IsInRaid() then
		print(G.AddonColor..G.addon.."|r:"..L["检测插件版本"])
		raidroster = {}
		gui.ver_button:RegisterEvent("CHAT_MSG_ADDON")
		
		SendAddonMessage(G.addon, "ver", "RAID")
		
		for i = 1, 20 do
			local unitID = "raid"..i
			local name, realm = UnitName(unitID)
			if name then
				if not realm then
					realm = G.PlayerRealm
				end
				local fullname = name.."-"..realm
				raidroster[fullname] = 0
			end
		end

		C_Timer.After(2, function()
			gui.ver_button:UnregisterEvent("CHAT_MSG_ADDON")
			for fullname, ver in pairs(raidroster) do
				print(fullname.." version: "..ver)
			end
		end)
	end
end
gui.test_button:SetScript("OnClick", Test)
gui.ver_button:SetScript("OnClick", GetVer)
--====================================================--
--[[                  -- Reciver --                 ]]--
--====================================================--
gui.position = CreateFrame("Frame", nil, gui.reciver.optionframe)
gui.position:SetPoint("TOPLEFT", gui.reciver.optionframe, "TOPLEFT", 15, -20)
gui.position:SetPoint("TOPRIGHT", gui.sender.optionframe, "TOPRIGHT", -15, -20)
gui.position:SetHeight(60)
T.createborder(gui.position)

gui.position.text = T.createtext(gui.position, "OVERLAY", 12, "OUTLINE", "CENTER")
gui.position.text:SetPoint("TOPLEFT", gui.position, "TOPLEFT", 15, -5)
gui.position.text:SetText(G.AddonColor..L["位置"].."|r")

gui.unlock = CreateFrame("Button", G.addon.."unlock", gui.position, "UIPanelButtonTemplate")
gui.unlock:SetPoint("TOPLEFT", gui.position, "TOPLEFT", 15, -30)
gui.unlock:SetSize(130, 20)
gui.unlock:SetText(L["解锁位置"])
gui.unlock:SetScript("OnClick", function()
	G.iconFrame:Show()
	G.iconFrame2:Show()
	G.STFrame:Show()
	local y,x = UnitPosition("player")
	T.ShowRunTo(x, y, 3, nil, true, true)
end)

gui.lock = CreateFrame("Button", G.addon.."lock", gui.position, "UIPanelButtonTemplate")
gui.lock:SetPoint("LEFT", gui.unlock, "RIGHT", 25, 0)
gui.lock:SetSize(130, 20)
gui.lock:SetText(L["锁定位置"])
gui.lock:SetScript("OnClick", function()
	T.HideFrames()
end)

gui.reset = CreateFrame("Button", G.addon.."reset", gui.position, "UIPanelButtonTemplate")
gui.reset:SetPoint("LEFT", gui.lock, "RIGHT", 25, 0)
gui.reset:SetSize(130, 20)
gui.reset:SetText(L["还原位置"])
gui.reset:SetScript("OnClick", function()
	MSS_DB.Arrow.Point1 = G.Default.Arrow.Point1
	MSS_DB.Arrow.Point2 = G.Default.Arrow.Point2
	MSS_DB.Arrow.PointX = G.Default.Arrow.PointX
	MSS_DB.Arrow.PointY = G.Default.Arrow.PointY
	
	MSS_DB.Icon.Point1 = G.Default.Icon.Point1
	MSS_DB.Icon.Point2 = G.Default.Icon.Point2
	MSS_DB.Icon.PointX = G.Default.Icon.PointX
	MSS_DB.Icon.PointY = G.Default.Icon.PointY
	
	MSS_DB.Icon2.Point1 = G.Default.Icon2.Point1
	MSS_DB.Icon2.Point2 = G.Default.Icon2.Point2
	MSS_DB.Icon2.PointX = G.Default.Icon2.PointX
	MSS_DB.Icon2.PointY = G.Default.Icon2.PointY
	
	MSS_DB.ST.Point1 = G.Default.ST.Point1
	MSS_DB.ST.Point2 = G.Default.ST.Point2
	MSS_DB.ST.PointX = G.Default.ST.PointX
	MSS_DB.ST.PointY = G.Default.ST.PointY
	
	T.SetFramePoint()
	G.iconFrame:Show()
	G.iconFrame2:Show()
	G.STFrame:Show()
	local y,x = UnitPosition("player")
	T.ShowRunTo(x, y, 3, nil, true, true)
end)

gui.style = CreateFrame("Frame", nil, gui.reciver.optionframe)
gui.style:SetPoint("TOPLEFT", gui.reciver.optionframe, "TOPLEFT", 15, -95)
gui.style:SetPoint("TOPRIGHT", gui.sender.optionframe, "TOPRIGHT", -15, -95)
gui.style:SetHeight(220)
T.createborder(gui.style)

gui.style.text = T.createtext(gui.style, "OVERLAY", 12, "OUTLINE", "CENTER")
gui.style.text:SetPoint("TOPLEFT", gui.style, "TOPLEFT", 15, -5)
gui.style.text:SetText(G.AddonColor..L["样式"].."|r")

gui.style.arrowscale = T.createslider(gui.style, L["箭头"]..L["尺寸"], "Arrow", "Scale", 50, 200, 5, "TOPLEFT", gui.style, "TOPLEFT", 25, -50)
gui.style.arrowscale:HookScript("OnValueChanged", T.SetFrameScale)

gui.style.arrowalpha = T.createslider(gui.style, L["箭头"]..L["透明度"], "Arrow", "Alpha", 10, 100, 2, "LEFT", gui.style.arrowscale, "RIGHT", 35, 0)
gui.style.arrowalpha:HookScript("OnValueChanged", T.SetFrameAlpha)

gui.style.iconscale = T.createslider(gui.style, L["精炼混乱图标"]..L["尺寸"], "Icon", "Scale", 50, 200, 5, "TOPLEFT", gui.style.arrowscale, "BOTTOMLEFT", 0, -30)
gui.style.iconscale:HookScript("OnValueChanged", T.SetFrameScale)

gui.style.iconalpha = T.createslider(gui.style, L["精炼混乱图标"]..L["透明度"], "Icon", "Alpha", 10, 100, 2, "LEFT", gui.style.iconscale, "RIGHT", 35, 0)
gui.style.iconalpha:HookScript("OnValueChanged", T.SetFrameAlpha)

gui.style.iconscale2 = T.createslider(gui.style, L["军团印记图标"]..L["尺寸"], "Icon2", "Scale", 50, 200, 5, "TOPLEFT", gui.style.iconscale, "BOTTOMLEFT", 0, -30)
gui.style.iconscale2:HookScript("OnValueChanged", T.SetFrameScale)

gui.style.iconalpha2 = T.createslider(gui.style, L["军团印记图标"]..L["透明度"], "Icon2", "Alpha", 10, 100, 2, "LEFT", gui.style.iconscale2, "RIGHT", 35, 0)
gui.style.iconalpha2:HookScript("OnValueChanged", T.SetFrameAlpha)

gui.style.fontsize = T.createslider(gui.style, L["酷刑枷锁安全提示"]..L["字号"], "ST", "FontSize", 10, 20, 1, "TOPLEFT", gui.style.iconscale2, "BOTTOMLEFT", 0, -30)
gui.style.fontsize:HookScript("OnValueChanged", T.SetFrameScale)

--====================================================--
--[[                   -- Update --                 ]]--
--====================================================--
gui:SetScript("OnEvent", function(self, event, ...)
	if event == "CHAT_MSG_ADDON" then
		local prefix, message, channel, sender = ...
		if prefix == G.addon then
			local spell, arg1, arg2, arg3, arg4 = string.split(",", message)
			if spell == "chaos" then
				local fullname, index, x, y = arg1, arg2, arg3, arg4
				x = tonumber(x)
				y = tonumber(y)
				if fullname == G.PlayerFullName and index and x and y then
					T.ShowRunTo(x, y, nil, nil, nil, true)
					T.ShowIconInfo(index)
				end
			elseif spell == "ver" then
				SendAddonMessage(G.addon, "ver2,"..G.PlayerName..","..G.PlayerRealm..","..G.ver, "RAID")
			end
		end
	elseif event == "COMBAT_LOG_EVENT_UNFILTERED" then
		local timestamp, subevent, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, spellid, spellname = ...
		mychaosby = false
		mychaosto = false
		
		-- BOSS 精炼混乱
		if subevent == "SPELL_CAST_SUCCESS" and spellid == 184265 then
			
			if MSS_DB["Myrole"] == "Sender" and UnitIsGroupLeader("player") then
				chaosfrom = 0
				chaostarget = 10
				
				C_Timer.After(0.3, function()
					for i = 1, 20 do
						local unitID = 'raid' .. i
						local name, realm = UnitName(unitID)
						if not realm then
							realm = G.PlayerRealm
						end
						local fullname = name.."-"..realm
						
						if UnitDebuff(unitID, wrought_chaos) then
							chaosfrom = chaosfrom + 1
							if UnitIsUnit('player', unitID) then
								T.ShowRunTo(simu_players[chaosfrom]["x"], simu_players[chaosfrom]["y"], nil, nil, nil, true)
								T.ShowIconInfo(chaosfrom)
							else
								SendAddonMessage(G.addon, "chaos,"..fullname..","..chaosfrom..","..simu_players[chaosfrom]["x"]..","..simu_players[chaosfrom]["y"], "RAID")
							end
						elseif UnitDebuff(unitID, focused_chaos) then
							chaostarget = chaostarget + 1
							if UnitIsUnit('player', unitID) then
								T.ShowRunTo(simu_players[chaostarget]["x"], simu_players[chaostarget]["y"], nil, nil, nil, true)
								T.ShowIconInfo(chaostarget)
							else
								SendAddonMessage(G.addon, "chaos,"..fullname..","..chaostarget..","..simu_players[chaostarget]["x"]..","..simu_players[chaostarget]["y"], "RAID")
							end
						end
						
					end
				end)
			end
		end
		
		-- BOSS 军团印记
		if subevent == "SPELL_CAST_SUCCESS" and spellid == 188514 then

			local index = 1			
			local duration_tr, duration_tl, duration_bl, duration_br = 5, 5, 5, 5
			local player_tr, player_tl, player_bl, player_br = "Unknown", "Unknown", "Unknown", "Unknown"
			local voice1, voice2, voice3, voice4 
			
			voice1 = "Interface\\AddOns\\Mashushu\\voice\\1.ogg"
			voice2 = "Interface\\AddOns\\Mashushu\\voice\\2.ogg"
			voice3 = "Interface\\AddOns\\Mashushu\\voice\\3.ogg"
			voice4 = "Interface\\AddOns\\Mashushu\\voice\\4.ogg"			
			
				C_Timer.After(0.3, function()
				
					if UnitDebuff("player", legion_mark) then
						local duration = select(6, UnitDebuff("player", legion_mark))
						if duration >= 10.5 then		
							T.ShowIconInfo2(L["右上"], duration, ("|cffff0000"..L["我"].."|r"))
							PlaySoundFile(voice1,"Master")
						elseif duration >= 8.5 then
							T.ShowIconInfo2(L["左上"], duration, ("|cffff0000"..L["我"].."|r"))
							PlaySoundFile(voice2,"Master")
						elseif duration >= 6.5 then
							T.ShowIconInfo2(L["左下"], duration, ("|cffff0000"..L["我"].."|r"))
							PlaySoundFile(voice3,"Master")
						elseif duration >= 4.5 then
							T.ShowIconInfo2(L["右下"], duration, ("|cffff0000"..L["我"].."|r"))
							PlaySoundFile(voice4,"Master")
						end
					end
					
					for i = 1, 20 do		
						local unitID = 'raid' .. i
						local name = UnitName(unitID) or "NONE"
						
						if UnitDebuff(unitID, legion_mark) then
							local duration = select(6, UnitDebuff(unitID, legion_mark))
							if duration >= 10.5 then
								duration_tr = duration
								player_tr = ("|c"..G.Ccolors[select(2, UnitClass(unitID))]["colorStr"].."%s|r"):format(name)
							elseif  duration >= 8.5 then
								duration_tl = duration
								player_tl = ("|c"..G.Ccolors[select(2, UnitClass(unitID))]["colorStr"].."%s|r"):format(name)
							elseif  duration >= 6.5 then
								duration_bl = duration
								player_bl = ("|c"..G.Ccolors[select(2, UnitClass(unitID))]["colorStr"].."%s|r"):format(name)
							elseif  duration >= 4.5 then
								duration_br = duration
								player_br = ("|c"..G.Ccolors[select(2, UnitClass(unitID))]["colorStr"].."%s|r"):format(name)
							end
						end
					end
					
					for i = 1, 20 do
						local unitID = 'raid' .. i
						local name = UnitName(unitID) or "NONE"
						
						if not UnitDebuff(unitID, legion_mark) then
							if index <= 4 then
								if UnitIsUnit('player', unitID) then
									T.ShowIconInfo2(L["右上"], duration_tr, player_tr)
									PlaySoundFile(voice1,"Master")
								end
								index = index + 1
							elseif index <= 8 then
								if UnitIsUnit('player', unitID) then
									T.ShowIconInfo2(L["左上"], duration_tl, player_tl)
									PlaySoundFile(voice2,"Master")
								end
								index = index + 1
							elseif index <= 12 then
								if UnitIsUnit('player', unitID) then
									T.ShowIconInfo2(L["左下"], duration_bl, player_bl)
									PlaySoundFile(voice3,"Master")
								end
								index = index + 1
							elseif UnitIsUnit('player', unitID) then
								T.ShowIconInfo2(L["右下"], duration_br, player_br)
								PlaySoundFile(voice4,"Master")
							end
						end
					end
					
				end)
		end
		
		-- 聚焦混乱
		if subevent == "SPELL_AURA_APPLIED" and spellid == 185014 then		
			if sourceName == G.PlayerName then
				local destClass = select(2, UnitClass(destName))
				T.UpdateIconInfo(("|cffff0000%s|r"):format(L["我"]), ("|c"..G.Ccolors[destClass]["colorStr"].."%s|r"):format(destName))	
				mychaosto = destName
			elseif destName == G.PlayerName then
				local sourceClass = select(2, UnitClass(sourceName))
				T.UpdateIconInfo(("|c"..G.Ccolors[destClass]["colorStr"].."%s|r"):format(sourceName), ("|cffff0000%s|r"):format(L["我"]))
				mychaosby = sourceName
			end
		end
		
		-- 误伤
		if subevent == "SPELL_DAMAGE" then
			--if (spellid == 29722 or spellid == 8092) then 烧尽/心灵震爆
			if (spellid == 184265 or spellid == 186124 or spellid == 186123 or spellname == wrought_chaos) then
				if mychaosby and mychaosto then	
					if sourceName == G.PlayerName then
						if destName ~= G.PlayerName and destName ~= mychaosto then
							SendChatMessage(L["误伤"]..destName, "YELL")
						end
					elseif destName == G.PlayerName then
						if sourceName ~= G.PlayerName and sourceName ~= mychaosby then
							SendChatMessage(L["被误伤"]..sourceName, "YELL")
						end
					end
				end
			end
		end
		
		-- 酷刑枷锁
		if subevent == "SPELL_AURA_APPLIED" and spellid == 184964 and destName == G.PlayerName then
		--if subevent == "SPELL_AURA_APPLIED" and spellid == 6788 and destName == G.PlayerName then
			st_y, st_x = UnitPosition('player')
						
			G.STFrame:Show()
			G.STFrame:SetScript("OnUpdate", function(self, e)
				self.t = self.t + e
				if self.t > 0.1 then
					table.wipe(Inrange)
					for i = 1, 20 do
						local unitID = "raid"..i
						local name = UnitName(unitID)
						local class = select(2, UnitClass(unitID))
						if not UnitIsUnit('player', unitID) then
							if not UnitIsDead(unitID) then
								local y, x = UnitPosition(unitID)
								if y and x then
									local r = ((x - st_x)^2 + (y - st_y)^2) ^ 0.5
									if r < 26  then
										table.insert(Inrange, "|c"..G.Ccolors[class]["colorStr"]..name.."|r")
									end
								end
							end
						end
					end
					
					if #Inrange == 0 then
						G.STFrame.infotext:SetText("|cff00FF00"..L["安全"].."|r")
						G.STFrame.infotext2:SetText("")
					else
						G.STFrame.infotext:SetText("|cffFF0000"..L["枷锁爆炸范围内有"].."|r")
						G.STFrame.infotext2:SetText(table.concat(Inrange, "\n"))
					end
					
					self.t = 0
				end
			end)
		end
		
		if subevent == "SPELL_AURA_REMOVED" and spellid == 184964 and destName == G.PlayerName then
		--if subevent == "SPELL_AURA_REMOVED" and spellid == 6788 and destName == G.PlayerName then
			G.STFrame:Hide()
			G.STFrame:SetScript("OnUpdate", nil)
			table.wipe(Inrange)
			G.STFrame.infotext:SetText("")
			G.STFrame.infotext2:SetText("")
		end
	end
end)

gui:RegisterEvent("CHAT_MSG_ADDON")
gui:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")

gui:SetScript("OnShow", function() SimulateCoords() UpdateTab() end)