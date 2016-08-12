local addon, ns = ...

ns[1] = {} -- T, functions, constants, variables
ns[2] = {} -- L, localization
ns[3] = {} -- G, globals (Optionnal)

local T, L, G = unpack(select(2, ...))

G.addon = "Mashushu"

G.Font = GameFontHighlight:GetFont()
G.Media = {
	blank = "Interface\\Buttons\\WHITE8x8",
	arrow = "Interface\\AddOns\\Mashushu\\media\\Arrow",
	arrowup = "Interface\\AddOns\\Mashushu\\media\\Arrow-UP",
}

G.Client = GetLocale()
G.Version = GetAddOnMetadata("Mashushu", "Version")
G.myClass = select(2, UnitClass("player"))
G.PlayerName = UnitName("player")
G.PlayerRealm = GetRealmName()
G.PlayerFullName = G.PlayerName.."-"..G.PlayerRealm

G.AddonColor = "|cffA6FFFF"
G.Ccolors = {}
if(IsAddOnLoaded'!ClassColors' and CUSTOM_CLASS_COLORS) then
	G.Ccolors = CUSTOM_CLASS_COLORS
else
	G.Ccolors = RAID_CLASS_COLORS
end

G.ver = 6

RegisterAddonMessagePrefix(G.addon)
----------------------------------------------------------
--------------[[     Default Settings     ]]--------------
----------------------------------------------------------

G.Default = {
	Myrole = "Reciver", -- Sender
	Space = "4",
	Center = {x = .5, y = .5},
	Coords = {},
	Flare_Coords = {},
	Arrow = { 
		Point1 = "CENTER",
		Point2 = "CENTER",
		PointX = "-240",
		PointY = "120",
		Alpha = 100,
		Scale = 100,
	},
	Icon = { 
		Point1 = "CENTER",
		Point2 = "CENTER",
		PointX = "-240",
		PointY = "50",
		Alpha = 100,
		Scale = 100,
	},
	Icon2 = { 
		Point1 = "CENTER",
		Point2 = "CENTER",
		PointX = "-240",
		PointY = "-60",
		Alpha = 100,
		Scale = 100,
	},
	ST = {
		Point1 = "CENTER",
		Point2 = "CENTER",
		PointX = "-440",
		PointY = "-60",
		FontSize = 14,
	},
}

T.GetCoords = function(table, space)
	for i = 1, 20 do
		local x, y
		if i <= 5 then
			x = -8-i
			y = 2+(5-i)*space
		elseif i <=10 then
			x = i-19
			y = -2+(6-i)*space
		elseif i <=15 then
			x = i-2
			y = 2+(15-i)*space
		else
			x = 29-i
			y = -2-(i-16)*space
		end
		if table[i] == nil then
			table[i] = {}
		end
		table[i]["x"] = x
		table[i]["y"] = y
	end
end

T.GetFlareCoords = function(table, space)
	for i = 1, 6 do
		if table[i] == nil then
			table[i] = {}
		end
	end
	
	table[1]["x"] = -8
	table[1]["y"] = 5+4*space
	
	table[2]["x"] = -14
	table[2]["y"] = 0
	
	table[3]["x"] = -8
	table[3]["y"] = -5-4*space
	
	table[4]["x"] = 8
	table[4]["y"] = 5+4*space
	
	table[5]["x"] = 14
	table[5]["y"] = 0
	
	table[6]["x"] = 8
	table[6]["y"] = -5-4*space
end

function T.LoadVariables()
	if MSS_DB == nil then
		MSS_DB = {}
	end
	
	for a, b in pairs(G.Default) do
		if type(b) ~= "table" then
			if MSS_DB[a] == nil then
				MSS_DB[a] = b
			end
		else
			if MSS_DB[a] == nil then
				MSS_DB[a] = {}
			end
			for k, v in pairs(b) do
				if MSS_DB[a][k] == nil then
					MSS_DB[a][k] = v
				end
			end
		end
	end
	
	T.GetCoords(MSS_DB.Coords, MSS_DB.Space)
	T.GetFlareCoords(MSS_DB.Flare_Coords, MSS_DB.Space)
end

local loginframe = CreateFrame("Frame")
loginframe:HookScript("OnEvent", T.LoadVariables)
loginframe:RegisterEvent("PLAYER_LOGIN")
----------------------------------------------------------
-----------------[[     Functions     ]]------------------
----------------------------------------------------------
T.pairsByKeys = function(t)
    local a = {}
    for n in pairs(t) do table.insert(a, n) end
    table.sort(a)
    local i = 0      -- iterator variable
    local iter = function ()   -- iterator function
		i = i + 1
        if a[i] == nil then return nil
        else return a[i], t[a[i]]
        end
      end
    return iter
end

T.createtext = function(frame, layer, fontsize, flag, justifyh)
	local text = frame:CreateFontString(nil, layer)
	text:SetFont(G.Font, fontsize, flag)
	text:SetJustifyH(justifyh)
	return text
end

T.createborder = function(frame, r, g, b)
	if frame.style then return end
	frame.sd = CreateFrame("Frame", nil, frame)
	frame.sd:SetFrameLevel(frame:GetFrameLevel()-1)
	frame.sd:SetBackdrop({
		bgFile = "Interface\\Buttons\\WHITE8x8",
		edgeFile = "Interface\\Buttons\\WHITE8x8",
		edgeSize = 1,
			insets = { left = 1, right = 1, top = 1, bottom = 1,}
		})
	frame.sd:SetPoint("TOPLEFT", frame, -1, 1)
	frame.sd:SetPoint("BOTTOMRIGHT", frame, 1, -1)
	if not (r and g and b) then
		frame.sd:SetBackdropColor(.05, .05, .05, .5)
		frame.sd:SetBackdropBorderColor(0, 0, 0)
	else
		frame.sd:SetBackdropColor(r, g, b, .5)
		frame.sd:SetBackdropBorderColor(r, g, b)
	end
	frame.style = true
end

T.createradiobuttongroup = function(parent, value, group, ...)
	local frame = CreateFrame("Frame", G.addon..value.."RadioButtonGroup", parent)
	frame:SetPoint(...)
	frame:SetSize(150, 30)
	
	for k, v in T.pairsByKeys(group) do
		frame[k] = CreateFrame("CheckButton", G.addon..value..k.."RadioButtonGroup", frame, "UIRadioButtonTemplate")
		
		_G[frame[k]:GetName() .. "Text"]:SetText(v)
		
		frame[k]:SetScript("OnShow", function(self)
			self:SetChecked(MSS_DB[value] == k)
		end)
		
		frame[k]:SetScript("OnClick", function(self)
			if self:GetChecked() then
				MSS_DB[value] = k
				T.GetCoords(MSS_DB.Coords, MSS_DB.Space)
				T.GetFlareCoords(MSS_DB.Flare_Coords, MSS_DB.Space)
			else
				self:SetChecked(true)
			end
		end)		
	end
	
	for k, v in T.pairsByKeys(group) do
		frame[k]:HookScript("OnClick", function(self)
			if MSS_DB[value] == k then
				for key, value in T.pairsByKeys(group) do
					if key ~= k then
						frame[key]:SetChecked(false)
					end
				end
			end
		end)
	end
	
	local buttons = {frame:GetChildren()}
	for i = 1, #buttons do
		if i == 1 then
			buttons[i]:SetPoint("LEFT", 5, 0)
		else
			buttons[i]:SetPoint("LEFT", _G[buttons[i-1]:GetName() .. "Text"], "RIGHT", 5, 0)
		end
	end
	
	return frame
end

local function TestSlider_OnValueChanged(self, value)
   if not self._onsetting then   -- is single threaded 
     self._onsetting = true
     self:SetValue(self:GetValue())
     value = self:GetValue()     -- cant use original 'value' parameter
     self._onsetting = false
   else return end               -- ignore recursion for actual event handler
 end
 
T.createslider = function(parent, name, table, value, min, max, step, ...)
	local slider = CreateFrame("Slider", G.addon..table..value.."Slider", parent, "OptionsSliderTemplate")
	slider:SetPoint(...)
	slider:SetWidth(180)
	
	BlizzardOptionsPanel_Slider_Enable(slider)
	
	slider:SetMinMaxValues(min, max)
	_G[slider:GetName()..'Low']:SetText(min)
	_G[slider:GetName()..'Low']:ClearAllPoints()
	_G[slider:GetName()..'Low']:SetPoint("RIGHT", slider, "LEFT", 10, 0)
	_G[slider:GetName()..'High']:SetText(max)
	_G[slider:GetName()..'High']:ClearAllPoints()
	_G[slider:GetName()..'High']:SetPoint("LEFT", slider, "RIGHT", -10, 0)
	
	_G[slider:GetName()..'Text']:ClearAllPoints()
	_G[slider:GetName()..'Text']:SetPoint("BOTTOM", slider, "TOP", 0, 3)
	_G[slider:GetName()..'Text']:SetFontObject(GameFontHighlight)
	--slider:SetStepsPerPage(step)
	slider:SetValueStep(step)
	
	slider:SetScript("OnShow", function(self)
		self:SetValue(MSS_DB[table][value])
		_G[slider:GetName()..'Text']:SetText(name.." "..G.AddonColor..MSS_DB[table][value].."|r")
	end)
	slider:SetScript("OnValueChanged", function(self, getvalue)
		MSS_DB[table][value] = getvalue
		TestSlider_OnValueChanged(self, getvalue)
		_G[slider:GetName()..'Text']:SetText(name.." "..G.AddonColor..MSS_DB[table][value].."|r")
	end)
	
	return slider
end