local itemFrame = EasyScrapItemFrame
local contentFrame = itemFrame.contentFrame
local EasyScrap = EasyScrap
local itemButtonsVisible = 0

contentFrame.itemButtons = {}

local function updateQueueTab()
    itemFrame.tabButtons[1]:SetCount(#EasyScrap.queueItems)
end

local function itemInQueue(itemRef)
    for k,v in pairs(EasyScrap.queueItems) do
        if v == itemRef then return true end
    end
    return false
end

local function addItemToQueue(itemButton)
    table.insert(EasyScrap.queueItems, itemButton.itemRef)
    
    SetItemButtonDesaturated(itemButton, true)
    itemButton.IconBorder:Hide()
    AutoCastShine_AutoCastStart(itemButton.shineFrame)

    updateQueueTab()
end

local function removeItemFromQueue(itemButton)
    for k,v in pairs(EasyScrap.queueItems) do
        if v == itemButton.itemRef then table.remove(EasyScrap.queueItems, k) break end
    end
    SetItemButtonDesaturated(itemButton, false)
    itemButton.IconBorder:Show()
    AutoCastShine_AutoCastStop(itemButton.shineFrame)       

    if itemFrame.contentState == 1 then
        itemFrame:updateContent()
    else
        updateQueueTab()
    end
end

local function selectItemForScrapping(self)
    local scrappableItems = EasyScrap.scrappableItems
    --CHECK IF BUTTON IS STILL THE SAME ITEM?
    local itemInScrapper = EasyScrap:itemInScrapper(scrappableItems[self.itemRef].bag, scrappableItems[self.itemRef].slot)
    local itemInQueue = itemInQueue(self.itemRef)
    
    if not itemInScrapper and not itemInQueue and #EasyScrap.itemsInScrapper < 9 and not EasyScrap.scrapInProgress then
        UseContainerItem(scrappableItems[self.itemRef].bag, scrappableItems[self.itemRef].slot)
    elseif itemInScrapper and not itemInQueue then
        EasyScrap:removeItemFromScrapper(scrappableItems[self.itemRef].bag, scrappableItems[self.itemRef].slot)
        if #EasyScrap.itemsInScrapper == 0 and #EasyScrap.queueItems > 0 then
            EasyScrap.queueItems = {}
            EasyScrapItemFrame:updateContent()
        end
    elseif itemInQueue and not itemInScrapper then
        removeItemFromQueue(self)
    else
        addItemToQueue(self)
    end  
end

local function selectItemToIgnore(self)
    local itemRef = self.itemRef
    local itemInScrapper = EasyScrap:itemInScrapper(EasyScrap.scrappableItems[itemRef].bag, EasyScrap.scrappableItems[itemRef].slot)
    local itemInQueue = itemInQueue(itemRef)
    if itemInScrapper then EasyScrap:removeItemFromScrapper(EasyScrap.scrappableItems[itemRef].bag, EasyScrap.scrappableItems[itemRef].slot) end
    if itemInQueue then removeItemFromQueue(self) end

    if itemRef > 0 then
        itemFrame.ignoreItemFrame.itemRef = itemRef
        
        itemFrame.ignoreItemFrame:Show()
        itemFrame.contentFrame:Hide()

    end
end

local function itemButtonOnClick(self, button)
    if button == 'LeftButton' then
        selectItemForScrapping(self)
    elseif button == 'RightButton' then
        --Ignore item options
        if not EasyScrap.scrapInProgress then
            selectItemToIgnore(self)
        end
    end
end

local function createItemButton(i)
    --local frame = CreateFrame('Button', 'EasyScrapItemButton'..i, contentFrame, "ItemButtonTemplate")
    local frame = CreateFrame('Button', 'EasyScrapItemButton'..i, contentFrame, "EasyScrapItemButtonTemplate")
    frame:SetScale(0.95, 0.95)
    frame:RegisterForClicks('LeftButtonUp', 'RightButtonUp')
    frame:SetScript('OnClick', itemButtonOnClick)
    frame:SetScript('OnEnter', function(self) if self.itemRef > 0 then GameTooltip:SetOwner(self, "ANCHOR_RIGHT"); GameTooltip:SetHyperlink(EasyScrap.scrappableItems[self.itemRef].itemLink) GameTooltip:Show() end end)
    frame:SetScript('OnLeave', function(self) GameTooltip_Hide() end)
    
    frame.shineFrame = CreateFrame('Frame', 'EasyScrapItemButton'..i..'Shine', frame, 'AutoCastShineTemplate')
    frame.shineFrame:SetPoint('TOPLEFT', 1, -1)
    frame.shineFrame:SetPoint('BOTTOMRIGHT', -1, 1)

    local spacing = 1.05*((contentFrame:GetWidth()-(7*frame:GetWidth()))/7)
    local perRow = 7
    local x = 8 + (spacing/2) + (i-1)%perRow*(frame:GetWidth()+spacing)
    local y = -4 - math.floor((i-1)/7)*42

    frame:SetPoint('TOPLEFT', x, y)   
    
    frame.bg = frame:CreateTexture(nil, 'BACKGROUND')
    frame.bg:SetTexture("Interface\\Buttons\\UI-EmptySlot-Disabled")
    frame.bg:SetSize(54, 54)
    frame.bg:SetPoint('CENTER')
    frame.itemRef = 0
    frame:Hide()
    
    return frame    
end

local function displayItemButtons()
    local itemTable = EasyScrap.eligibleItems
    if itemFrame.contentState == 3 then
        itemTable = EasyScrap.ignoredItems
    elseif itemFrame.contentState == 1 then
        itemTable = EasyScrap.queueItems
    end
    
    for i = 1, #itemTable do
        if not contentFrame.itemButtons[i] then contentFrame.itemButtons[i] = createItemButton(i) end
        local itemButton = contentFrame.itemButtons[i]
        
        local scrappableItem = EasyScrap.scrappableItems[itemTable[i]]
        
        SetItemButtonTexture(itemButton, scrappableItem.itemTexture)
        SetItemButtonCount(itemButton, scrappableItem.itemCount);
        SetItemButtonQuality(itemButton, scrappableItem.itemQuality, scrappableItem.itemLink)
        
        if EasyScrap.mainFrame.searchBox.isEmpty then
            itemButton.searchOverlay:Hide()
        else
            if EasyScrap.scrappableItems[itemTable[i]].searchMatch then              
                itemButton.searchOverlay:Hide()
            else
                itemButton.searchOverlay:Show()
            end       
        end
            

        --itemButton.newitemglowAnim:Play() voor items die nu erin zitten
        
        
        --        AutoCastShine_AutoCastStart(itemButton.shineFrame);
        --          itemButton.NewActionTexture:Show()
        itemButton.itemRef = itemTable[i]
        itemButton:Show()
        
        itemButtonsVisible = itemButtonsVisible + 1
    end
end

local function hideItemButtons()
    for i = 1, #contentFrame.itemButtons do
        contentFrame.itemButtons[i]:Hide()

        SetItemButtonDesaturated(contentFrame.itemButtons[i], false)
        contentFrame.itemButtons[i].NewActionTexture:Hide()
        contentFrame.itemButtons[i].IconBorder:Show()
        AutoCastShine_AutoCastStop(contentFrame.itemButtons[i].shineFrame)
    end
end

function EasyScrapItemFrame:displayState()
    hideItemButtons()
    itemFrame.ignoreItemFrame:Hide()
    contentFrame.tabInfo:Hide()
    itemFrame.contentFrame:Show()
    self:moveQueueTabSparks()
    if self.contentState == 1 then
        if #EasyScrap.queueItems == 0 then
            contentFrame.tabInfo:SetText("此標籤顯示你所有正在佇列等候銷毀的物品。要佇列來銷毀只要簡單的保持加入物品到當銷毀器已滿的時候。")
            contentFrame.tabInfo:Show()
        end
    elseif self.contentState == 2 then
    elseif self.contentState == 3 then
        if #EasyScrap.ignoredItems == 0 then
            contentFrame.tabInfo:SetText("此標籤顯示你所有當前忽略的物品那些你不想出現在符合標籤中的。右鍵點擊可以(不)忽略物品，如果物品插入珠寶或附魔你可能需要再次的忽略它。")
            contentFrame.tabInfo:Show()
        end
    end
    displayItemButtons()
    self:highlightItemsForScrapping()
end

EasyScrapItemFrame.switchContentState = function(newState)
    PanelTemplates_DeselectTab(itemFrame.tabButtons[itemFrame.contentState])
    itemFrame.contentState = newState
    PanelTemplates_SelectTab(itemFrame.tabButtons[itemFrame.contentState])
    
    EasyScrapItemFrame:updateContent()
end

local function updateSlider()
    itemFrame.scrollFrame.ScrollBar:SetValue(0)
    if itemButtonsVisible <= 28 then
        itemFrame.scrollFrame.ScrollBar:SetMinMaxValues(0, 0)
    else
        local u = (itemButtonsVisible - 28)%7
        itemFrame.scrollFrame.ScrollBar:SetMinMaxValues(0, u*40)
    end
end

function EasyScrapItemFrame:updateContent()
    itemButtonsVisible = 0
    self:displayState()
    updateSlider()
    
    self.tabButtons[1]:SetCount(#EasyScrap.queueItems)
    self.tabButtons[2]:SetCount(#EasyScrap.eligibleItems)
    self.tabButtons[3]:SetCount(#EasyScrap.ignoredItems)
end

function EasyScrapItemFrame:moveQueueTabSparks()
    if self.contentState == 1 then
        itemFrame.tabButtons[1].shineFrame:ClearAllPoints()
        itemFrame.tabButtons[1].shineFrame:SetPoint('CENTER', 1, 24)   
    else
        itemFrame.tabButtons[1].shineFrame:ClearAllPoints()
        itemFrame.tabButtons[1].shineFrame:SetPoint('CENTER', 1, 28)   
    end
end

function EasyScrapItemFrame:highlightItemsForScrapping()
    local itemTable = {}
    if itemFrame.contentState == 1 then
        itemTable = EasyScrap.queueItems
    elseif itemFrame.contentState == 2 then
        itemTable = EasyScrap.eligibleItems
    elseif itemFrame.contentState == 3 then
        itemTable = EasyScrap.ignoredItems
    end

    for i = 1, #itemTable do
        if EasyScrap:itemInScrapper(EasyScrap.scrappableItems[itemTable[i]].bag, EasyScrap.scrappableItems[itemTable[i]].slot) then
            SetItemButtonDesaturated(contentFrame.itemButtons[i], true)
            contentFrame.itemButtons[i].IconBorder:Hide()
            contentFrame.itemButtons[i].NewActionTexture:Show()
        elseif itemInQueue(itemTable[i]) then
            SetItemButtonDesaturated(contentFrame.itemButtons[i], true)
            contentFrame.itemButtons[i].IconBorder:Hide()
            AutoCastShine_AutoCastStart(contentFrame.itemButtons[i].shineFrame)       
        else
            SetItemButtonDesaturated(contentFrame.itemButtons[i], false)
            contentFrame.itemButtons[i].NewActionTexture:Hide()
            contentFrame.itemButtons[i].IconBorder:Show()
        end
    end
end


-- contentFrame.itemButtons[i].newitemglowAnim:Play()
-- contentFrame.itemButtons[i].newitemglowAnim:Stop()

-- AutoCastShine_AutoCastStart(contentFrame.itemButtons[i].shineFrame)
-- AutoCastShine_AutoCastStop(contentFrame.itemButtons[i].shineFrame);