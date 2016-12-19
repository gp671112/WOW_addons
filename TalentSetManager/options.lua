-- Talent Set Manager
-- by Jadya
-- EU-Well of Eternity

local format = string.format

local addonName, addonTable = ...
local L = addonTable.L

local highlight_icons = {"",
                         "spells\\star",
                         "spells\\butterfly_blue",
                         "spells\\eclipse_moon_a",
                         "spells\\palmblue",
                         "spells\\paw_green",
                         "spells\\heartring",
                         "spells\\health_64",
                         }

local chat_filter_entries = {L["options_chat_filter_show"],L["options_chat_filter_group"],L["options_chat_filter_hide"]}

local interface_defaults = {
                            highlight_icon = "spells\\star",
                            chat_filter = 2,
                            ignored_tiers_bg = {1, 0, 0, 0.5},
                            hide_info_button = false,
                           }

local options_cache = {}
local of, O

local function refresh_widgets()
 if of.initialized then
  for i = 1,#highlight_icons do
   local f = _G["TalentSetManagerHighlightIcon"..i]
   if f and f.tag == O.highlight_icon then
    f:Click()
    break
   end
  end
  UIDropDownMenu_SetText(TalentSetManagerChatFilterDropDown, chat_filter_entries[O.chat_filter])
  TalentSetManagerIgnoredTiersBGColorButton.tex:SetColorTexture(unpack(O.ignored_tiers_bg))
  TalentSetManagerChkInfoButton:SetChecked(O.hide_info_button)
 end
end

-- interface options panel button events
local function okay_OnClick()
 for k,v in pairs(options_cache) do
  O[k] = v
 end

 if TalentSetsMainframe then
  if options_cache.ignored_tiers_bg then
   for k,v in pairs(TalentSetsMainframe.ignore_tier_overlays) do
    v:SetVertexColor(unpack(options_cache.ignored_tiers_bg))
   end
  end
 
  if options_cache.hide_info_button ~= nil then
   TalentSetsMainframe.help:SetShown(not options_cache.hide_info_button)
  end
 end
end

local function cancel_OnClick()
 wipe(options_cache)
end

local function default_OnClick()
 for k,v in pairs(interface_defaults) do
  options_cache[k] = v
 end
 okay_OnClick()
 wipe(options_cache)
 refresh_widgets()
end
--

local function dropdown_initialize(self, level)
 local info = UIDropDownMenu_CreateInfo()
 for _,data in pairs(self.buttons) do
  for k,v in pairs(data) do
   info[k] = v
  end
  UIDropDownMenu_AddButton(info, level)
 end
end

local function populate_options_panel()
 local f, last_f

 local function new_widget(p, func, ...)
  last_f = f
  f = p and p[func](p, ...) or func(...)
 end
 
 -- dropdown menus
 local dropdowns_list = {}
 local function dropdown_menubutton_click(self, k, v)
  options_cache[k] = v
  if k == "chat_filter" then
   UIDropDownMenu_SetText(dropdowns_list[k], chat_filter_entries[v])
  else
   UIDropDownMenu_SetText(dropdowns_list[k], v)
  end
 end

 local mn_chat_filter = {}
 for k,v in pairs(chat_filter_entries) do
  mn_chat_filter[k] = {
                          text = v,
                          notCheckable = true,
                          arg1 = "chat_filter",
                          arg2 = k,
                          func = dropdown_menubutton_click,
                         }
 end

 local function dropdown(title, name, v)
  new_widget(of, "CreateFontString", nil, nil, "GameFontHighlightSmall")
  f:SetText(title)
  
  new_widget(nil, CreateFrame, "Button", "TalentSetManager"..name.."DropDown", of, "UIDropDownMenuTemplate")
  f.initialize = dropdown_initialize
  f.point = "LEFT"
  f.relativePoint = "RIGHT"
  f.relativeTo = f
  f.displayMode = "MENU"
  f.buttons = v
  dropdowns_list[v[1].arg1] = f

  last_f:SetPoint("BOTTOMLEFT", f, "TOPLEFT", 15, 2)
 end
 --

 -- Color button
 local function colorbutton_click(self)
  local Or, Og, Ob, Oa = unpack(options_cache[self.tag] or O[self.tag])
  
  ColorPickerFrame.func = function()
   local r, g, b = ColorPickerFrame:GetColorRGB()
   local a = 1 - OpacitySliderFrame:GetValue()
   
   if not options_cache[self.tag] then options_cache[self.tag] = {} end
   options_cache[self.tag][1] = r
   options_cache[self.tag][2] = g
   options_cache[self.tag][3] = b
   options_cache[self.tag][4] = a
   
   self.tex:SetColorTexture(r, g, b, a)
  end
  ColorPickerFrame.opacityFunc = ColorPickerFrame.func
  
  ColorPickerFrame.cancelFunc = function()
   if not options_cache[self.tag] then options_cache[self.tag] = {} end
   options_cache[self.tag][1] = Or
   options_cache[self.tag][2] = Og
   options_cache[self.tag][3] = Ob
   options_cache[self.tag][4] = Oa
   
   self.tex:SetColorTexture(Or, Og, Ob, Oa)
  end
  
  ColorPickerFrame:SetColorRGB(Or, Og, Ob)
  ColorPickerFrame.hasOpacity = true
  ColorPickerFrame.opacity = 1 - Oa
  
  ColorPickerFrame:Hide()
  ColorPickerFrame:Show()
 end
 
 local function colorbutton(title, name, tag)
  new_widget(of,"CreateFontString", nil, nil, "GameFontHighlight")
  f:SetText(title)
  
  new_widget(nil, CreateFrame, "Button", "TalentSetManager"..name.."ColorButton", of)
  f:SetSize(24, 24)
  f.tag = tag
  f:SetScript("OnClick", colorbutton_click)

  f:SetNormalTexture("Interface\\ChatFrame\\ChatFrameColorSwatch")
  
  f.tex = f:CreateTexture(nil, "OVERLAY")
  f.tex:SetSize(14, 14)
  f.tex:SetPoint("CENTER")
  
  last_f:SetPoint("LEFT", f, "RIGHT", 5)
 end
 --
 
 -- general options separator
 new_widget(of, "CreateTexture", nil, nil, "videoUnderline")
 f:SetPoint("TOPLEFT", of, "TOPLEFT", 20, -65)
 f:SetPoint("BOTTOMRIGHT", of, "TOPRIGHT", -20, -67)
 
 new_widget(of, "CreateFontString", nil, nil, "GameFontHighlight")
 f:SetPoint("CENTER", last_f, "CENTER")
 f:SetText(COMPACT_UNIT_FRAME_PROFILE_SUBTYPE_ALL)

 -- Talent Highlight Icons
 local grp = CreateFrame("Frame", "TalentSetManagerOptionsGroup1", of, "OptionsBoxTemplate")
 grp:SetSize(9 + #highlight_icons * 36, 60)
 --grp:SetPoint("TOPLEFT", of, "TOPLEFT", 15, -100)
 grp:SetPoint("BOTTOMLEFT", of, "BOTTOMLEFT", 15, 15)
 TalentSetManagerOptionsGroup1Title:SetText(L["options_talent_highlight_icon"])

 local last_selected
 local function highlighticon_onclick(self)
  for i = 1, #self.border.Textures do
   if last_selected then
    last_selected.border.Textures[i]:SetVertexColor(0.5, 0.75, 1, 1)
    last_selected.border.Textures[i]:SetAlpha(0.5)
   end
   self.border.Textures[i]:SetVertexColor(1, 1, 0, 1)
   self.border.Textures[i]:SetAlpha(1)
  end
  if last_selected then
   last_selected.selected = false
  end 
  self.selected = true
  last_selected = self
  
  options_cache.highlight_icon = self.tag
 end
 
 local function create_highlight_icon(i)
  new_widget(nil, CreateFrame, "Button", "TalentSetManagerHighlightIcon"..i, grp, "TalentSetManagerInterfaceOptionsIconSel")
  if i == 1 then
   f:SetPoint("LEFT", grp, "LEFT", 9, 0)
   f.text = f:CreateFontString(nil, nil, "GameFontHighlightSmall")
   f.text:SetPoint("LEFT")
   f.text:SetPoint("RIGHT")
   f.text:SetText(NONE)
  else
   f:SetPoint("LEFT", last_f, "RIGHT", 3, 0)
  end
  f.tag = highlight_icons[i]
  f.texture:SetTexture(highlight_icons[i])
  f:SetScript("OnClick", highlighticon_onclick)
 end

 for i = 1,#highlight_icons do
  create_highlight_icon(i)
 end
 if not last_selected then
  highlighticon_onclick(f)
 end
 --
 
 -- Chat Filter
 dropdown(L["options_chat_filter"], "ChatFilter", mn_chat_filter)
 f:SetPoint("TOPLEFT", of, "TOPLEFT", 0, -105)
 UIDropDownMenu_SetWidth(f, 165)

 -- Ignored tiers background color
 colorbutton(L["options_ignored_tiers_background_color"], "IgnoredTiersBG", "ignored_tiers_bg")
 f:SetPoint("TOPLEFT", TalentSetManagerChatFilterDropDown, "BOTTOMLEFT", 15, -20)

 -- Hide Info Button checkbox
 new_widget(nil, CreateFrame, "CheckButton", "TalentSetManagerChkInfoButton", of, "OptionsCheckButtonTemplate")
 f:SetPoint("TOPLEFT", last_f, "BOTTOMLEFT", 0, -10)
 _G["TalentSetManagerChkInfoButtonText"]:SetText("|cffffffff"..L["options_hide_info_button"].."|r")
 f:SetScript("OnClick", function(self)
                         options_cache.hide_info_button = self:GetChecked()
                        end)
 
 of.initialized = true
 
 refresh_widgets()
end

function addonTable:InitializeOptions()

 if not TalentSetManager_Options.interface then TalentSetManager_Options.interface = {} end
 
 O = TalentSetManager_Options.interface
 

 for k,v in pairs(interface_defaults) do
  if O[k] == nil then
   O[k] = v
  end
 end

 of = CreateFrame("Frame", "TalentSetManager_ConfigPanel", UIParent)
 of:Hide()
 of.name = "天賦設定管理"

 -- title
 local f = of:CreateFontString(nil, nil, "GameFontNormalLarge")
 f:SetPoint("TOPLEFT", 15, -15)
 local version = GetAddOnMetadata(addonName, "X-Curse-Packaged-Version")
 f:SetText(GetAddOnMetadata(addonName, "Title")..(version and (" |cffffffff"..version.."|r") or ""))
 
 f = of:CreateFontString(nil, nil, "GameFontHighlightSmall")
 f:SetPoint("TOPLEFT", of, "TOPLEFT", 15, -36)
 f:SetText(GetAddOnMetadata(addonName, "Notes"))
 
 f = CreateFrame("Button", nil, of, "UIPanelButtonTemplate")
 f:SetSize(100, 30)
 f:SetPoint("TOPLEFT", of, "TOPLEFT", 10, -50)
 f:SetText(OPTIONS)
 f:SetScript("OnClick", function(self) self:Hide() populate_options_panel() end)

--
 of:SetScript("OnShow", function() wipe(options_cache) refresh_widgets() end)
 
 of.okay    = okay_OnClick
 of.cancel  = cancel_OnClick
 of.default = default_OnClick
 InterfaceOptions_AddCategory(of)
end



