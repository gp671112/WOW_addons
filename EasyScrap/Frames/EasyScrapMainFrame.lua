local EasyScrap = EasyScrap

local mainFrame = CreateFrame('Frame', 'EasyScrapMainFrame', ScrappingMachineFrame)
mainFrame:SetPoint('TOP', ScrappingMachineFrame, 'BOTTOM', 0, 16)
mainFrame:SetSize(ScrappingMachineFrame:GetWidth()-16, 264) --264
mainFrame:EnableMouse(true)
mainFrame:SetFrameLevel(ScrappingMachineFrame:GetFrameLevel()-1)
mainFrame:RegisterEvent("PLAYER_LOGOUT")
mainFrame:RegisterEvent("ADDON_LOADED")
mainFrame:SetBackdrop({
      bgFile="Interface\\FrameGeneral\\UI-Background-Marble", 
      edgeFile='Interface/Tooltips/UI-Tooltip-Border', 
      tile = false, tileSize = 16, edgeSize = 16,
      insets = { left = 4, right = 4, top = 4, bottom = 4 }}
)


mainFrame.searchBox = CreateFrame('EditBox', nil, mainFrame, 'SearchBoxTemplate')
mainFrame.searchBox:SetPoint('TOPLEFT', 22, -22)
mainFrame.searchBox:SetSize(100, 18)
mainFrame.searchBox.Instructions:SetText('搜尋')
mainFrame.searchBox.isEmpty = true

mainFrame.searchBox:SetScript('OnTextChanged', function(searchBox, value)
	if ( not searchBox:HasFocus() and searchBox:GetText() == "" ) then
		searchBox.searchIcon:SetVertexColor(0.6, 0.6, 0.6);
		searchBox.clearButton:Hide();
	else
		searchBox.searchIcon:SetVertexColor(1.0, 1.0, 1.0);
		searchBox.clearButton:Show();
	end
	InputBoxInstructions_OnTextChanged(searchBox);

    if value then
        local text = searchBox:GetText()
        if string.len(text) > 0 then
            searchBox.isEmpty = false
            EasyScrap:searchItem(text)
            EasyScrap:filterScrappableItems()
            EasyScrap.itemFrame:displayState()
        else
            --Clear results
            searchBox.isEmpty = true
            EasyScrap:searchItem()
            EasyScrap:filterScrappableItems()
            EasyScrap.itemFrame:displayState()
        end
    else
        --Clear results
        searchBox.isEmpty = true
        EasyScrap:searchItem()
        EasyScrap:filterScrappableItems()
        EasyScrap.itemFrame:displayState()
    end
end)

--[[
local optionsButton = CreateFrame('Button', 'Bert', mainFrame)
optionsButton:SetSize(32, 32)
optionsButton:SetPoint('BOTTOMRIGHT', -2, 14)

local t = optionsButton:CreateTexture(nil, 'BACKGROUND')
t:SetAllPoints()
t:SetTexture('Interface/HelpFrame/HelpIcon-CharacterStuck')
t:SetDesaturated(true)

local th = optionsButton:CreateTexture(nil, 'BACKGROUND')
th:SetAllPoints()
th:SetTexture('Interface/HelpFrame/HelpIcon-CharacterStuck')
th:SetDesaturated(false)


optionsButton:SetNormalTexture(t)
optionsButton:SetHighlightTexture(th)

optionsButton:SetPushedTexture('Interface/Buttons/UI-SpellbookIcon-PrevPage-Down')
optionsButton:SetDisabledTexture('Interface/Buttons/UI-SpellbookIcon-PrevPage-Disabled')
--]]


local menu = {
    {}
}

-- Note that this frame must be named for the dropdowns to work.
local filterSelection = CreateFrame("Frame", "EasyScrapFilterSelectionMenu", mainFrame, "UIDropDownMenuTemplate")
filterSelection.Middle:SetWidth(96)
filterSelection:SetPoint("LEFT", mainFrame.searchBox, "RIGHT", 56, -4) --32

filterSelection.text = filterSelection:CreateFontString()
filterSelection.text:SetFontObject('GameFontNormal')
filterSelection.text:SetText('過濾：')
filterSelection.text:SetPoint('RIGHT', filterSelection, 'LEFT', 16, 4)

UIDropDownMenu_SetText(filterSelection, "Coming Soon")
--filterSelection.Button:SetScript('OnClick', function() EasyMenu(menu, filterSelection, menuFrame, 0, 0) end)
filterSelection.Button:SetEnabled(false)

EasyScrap.mainFrame = mainFrame

