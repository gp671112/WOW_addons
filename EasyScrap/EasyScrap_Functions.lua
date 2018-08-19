--Get all items eligible for scrapping.
function EasyScrap:getScrappableItems()
    --We have to rebuild the queue after an item has been scrapped
    local queueItemBackup = {}
    if #self.queueItems > 0 then
        for k,v in pairs(self.queueItems) do
            table.insert(queueItemBackup, {bag = self.scrappableItems[v].bag, slot = self.scrappableItems[v].slot, itemLink = self.scrappableItems[v].itemLink})
        end
    end

   self.eligibleItems = {}
   self.ignoredItems = {}
   self.scrappableItems = {}
   self.failedItems = {}

   local itemRef = 1
   
   for bag = 0, 4 do
      for i = 1, GetContainerNumSlots(bag) do
         local itemID = GetContainerItemID(bag, i)

         if itemID and EasyScrap:itemScrappable(itemID) then
            local texture, itemCount, locked, quality, readable, lootable, itemLink, isFiltered = GetContainerItemInfo(bag, i)  
            table.insert(self.scrappableItems, {itemRef = itemRef, bag = bag, slot = i, itemLink = itemLink, itemTexture = texture, itemCount = itemCount, itemID = itemID, itemQuality = quality, itemName = string.match(itemLink, "%[(.+)%]")})
            itemRef = itemRef + 1
         end
      end
   end
   
   --Finish queue rebuild check if everything is still correct
    if #self.queueItems > 0 then
        self.queueItems = {}
        for i = 1, #queueItemBackup do
            for z = 1, #self.scrappableItems do
                if self.scrappableItems[z].bag == queueItemBackup[i].bag and self.scrappableItems[z].slot == queueItemBackup[i].slot and self.scrappableItems[z].itemLink == queueItemBackup[i].itemLink then
                    table.insert(self.queueItems, z)
                end
            end
        end
    end
end

--Determine if item can be scrapped by checking if text is in tooltip
function EasyScrap:itemScrappable(itemID)
   if self.itemCache[itemID] ~= nil then
      return self.itemCache[itemID]
   else     
      self.tooltipReader:ClearLines()      
      if GetItemInfo(itemID) then
         self.tooltipReader:SetItemByID(itemID)
         for i = self.tooltipReader:NumLines(), self.tooltipReader:NumLines()-3, -1 do
            if i >= 1 then
               local text = _G["EasyScrapTooltipReaderTextLeft"..i]:GetText()                  
               if text == ITEM_SCRAPABLE_NOT then
                  self.itemCache[itemID] = false
                  return false
               elseif text == ITEM_SCRAPABLE then
                  self.itemCache[itemID] = true
                  return true
               end
            end
         end
         return false
      else
         table.insert(self.failedItems, itemID)
         return false
      end
   end
end

function EasyScrap:addQueueItems()
    ScrappingMachineFrame.ScrapButton:SetEnabled(false)
    ScrappingMachineFrame.ScrapButton.SetEnabled = function() end
    if self.queueItemsToAdd > 0 then
        self.queueItemsToAdd = self.queueItemsToAdd - 1
        local key, nextItemRef = next(self.queueItems)
        UseContainerItem(self.scrappableItems[nextItemRef].bag, self.scrappableItems[nextItemRef].slot)
        table.remove(self.queueItems, key)

        if self.queueItemsToAdd == 0 then
            ScrappingMachineFrame.ScrapButton.SetEnabled = ScrappingMachineFrame.ScrapButton.SetEnabledBackup
            ScrappingMachineFrame.ScrapButton:SetEnabled(true)       
        end
    else
        ScrappingMachineFrame.ScrapButton.SetEnabled = ScrappingMachineFrame.ScrapButton.SetEnabledBackup
        ScrappingMachineFrame.ScrapButton:SetEnabled(true)  
    end
end

function EasyScrap:searchItem(text)
    for i = 1, #self.scrappableItems do
        if text and string.find(string.lower(self.scrappableItems[i].itemName), string.lower(text)) then
            self.scrappableItems[i].searchMatch = true
        else
            self.scrappableItems[i].searchMatch = false
        end
    end
end

function EasyScrap:itemInWardrobeSet(itemID, bag, slot)
    for i = 0, C_EquipmentSet.GetNumEquipmentSets()-1 do
        local setName = C_EquipmentSet.GetEquipmentSetInfo(i)
        local items = C_EquipmentSet.GetItemIDs(i)
        for z = 1, 19 do --would be nicer to get the slot id beforehand so we don't have to loop over all the items in a set
            if items[z] then
                if itemID == items[z] then
                    local equipmentSetInfo = C_EquipmentSet.GetItemLocations(i)
                    local onPlayer, inBank, inBags, inVoidStorage, slotNumber, bagNumber = EquipmentManager_UnpackLocation(equipmentSetInfo[z])
                    if bag == bagNumber and slot == slotNumber then
                        return true
                    end
                end
            end
        end
    end
    return false
end

function EasyScrap:filterScrappableItems()
    --Filter items
    --Example fitler for items that are in wardrobe
    local ignoredItems = {}
    local eligibleItems = {}
    

    for i = 1, #self.scrappableItems do
        --Check filter to see if we go to ignored or eligible then check if it's a searchmatch and put it in there. Queue can be build up later
        
        local insertionOrder = nil    
        if self.scrappableItems[i].searchMatch then
            insertionOrder = 1
        end
        
        if not EasyScrap:itemInIgnoreList(self.scrappableItems[i].itemID, self.scrappableItems[i].itemLink) then
            if insertionOrder then
                table.insert(eligibleItems, insertionOrder, i)      
            else
                table.insert(eligibleItems, i)     
            end       
        else
             if insertionOrder then
                table.insert(ignoredItems, insertionOrder, i)      
            else
                table.insert(ignoredItems, i)     
            end          
        end


            --[[
        if self:itemInWardrobeSet(self.scrappableItems[i].itemID, self.scrappableItems[i].bag, self.scrappableItems[i].slot) then
            table.insert(ignoredItems, self.scrappableItems[i])
        else
            table.insert(eligibleItems, self.scrappableItems[i])
        end
            --]]
    end

    self.eligibleItems = eligibleItems
    self.ignoredItems = ignoredItems
end

--DETERMINE IF STILL NEEDED
function EasyScrap:inIgnoreList(link)
    for k,v in pairs(self.itemIgnoreList) do if v == link then return k end end return false
end

function EasyScrap:printEligibleItems()
    for k,v in pairs(self.eligibleItems) do
        print(v.itemLink)
    end
end

function EasyScrap:getItemsInScrapper()
    self.itemsInScrapper = {}
    for i = 0, 8 do
        local item = C_ScrappingMachineUI.GetCurrentPendingScrapItemLocationByIndex(i)
        if item then
            item.scrapperSlot = i
            table.insert(self.itemsInScrapper, item)
        end
    end
end

function EasyScrap:removeItemFromScrapper(bag, slot)      
    for i = 1, #self.itemsInScrapper do
        if self.itemsInScrapper[i].bagID == bag and self.itemsInScrapper[i].slotIndex == slot then
            C_ScrappingMachineUI.RemoveItemToScrap(self.itemsInScrapper[i].scrapperSlot)
            break
        end
    end
end

function EasyScrap:itemInScrapper(bag, slot)
    for i = 1, #self.itemsInScrapper do
        local b,s = self.itemsInScrapper[i]:GetBagAndSlot()
        if b == bag and s == slot then
            return true
        end
    end
end

function EasyScrap:addItemToIgnoreList(itemID, itemLink)
    if not self.itemIgnoreList[itemID] then
        self.itemIgnoreList[itemID] = {}
    end
 
    local duplicate = false
    for k,v in pairs(self.itemIgnoreList[itemID]) do
        if v == itemLink then
            duplicate = true
            break
        end
    end
    
    if not duplicate then
        table.insert(self.itemIgnoreList[itemID], itemLink)
    end
end

function EasyScrap:removeItemFromIgnoreList(itemID, itemLink)
    if self.itemIgnoreList[itemID] then
        for k,v in pairs(self.itemIgnoreList[itemID]) do
            if v == itemLink then
                table.remove(self.itemIgnoreList[itemID], k)
                break
            end
        end
    end
end

function EasyScrap:itemInIgnoreList(itemID, itemLink)
    if self.itemIgnoreList[itemID] then
        for k,v in pairs(self.itemIgnoreList[itemID]) do
            if v == itemLink then
                return true
            end
        end
    end
    return false
end

--Scroll frame acting up because it always gets a weird yrange value
function ScrollFrame_OnScrollRangeChanged_EasyScrap(self, xrange, yrange)
	local name = self:GetName();
	local scrollbar = self.ScrollBar or _G[name.."ScrollBar"];
    _,yrange = scrollbar:GetMinMaxValues()
    
	-- Accounting for very small ranges
	yrange = floor(yrange);

	local value = min(scrollbar:GetValue(), yrange);
	--scrollbar:SetMinMaxValues(0, yrange);
	--scrollbar:SetValue(value);

	local scrollDownButton = scrollbar.ScrollDownButton or _G[scrollbar:GetName().."ScrollDownButton"];
	local scrollUpButton = scrollbar.ScrollUpButton or _G[scrollbar:GetName().."ScrollUpButton"];
	local thumbTexture = scrollbar.ThumbTexture or _G[scrollbar:GetName().."ThumbTexture"];

	if ( yrange == 0 ) then
		if ( self.scrollBarHideable ) then
			scrollbar:Hide();
			scrollDownButton:Hide();
			scrollUpButton:Hide();
			thumbTexture:Hide();
		else
			scrollDownButton:Disable();
			scrollUpButton:Disable();
			scrollDownButton:Show();
			scrollUpButton:Show();
			if ( not self.noScrollThumb ) then
				thumbTexture:Show();
			end
		end
	else
		scrollDownButton:Show();
		scrollUpButton:Show();
		scrollbar:Show();
		if ( not self.noScrollThumb ) then
			thumbTexture:Show();
		end
		-- The 0.005 is to account for precision errors
		if ( yrange - value > 0.005 ) then
			scrollDownButton:Enable();
		else
			scrollDownButton:Disable();
		end
	end

	-- Hide/show scrollframe borders
	local top = self.Top or name and _G[name.."Top"];
	local bottom = self.Bottom or name and _G[name.."Bottom"];
	local middle = self.Middle or name and _G[name.."Middle"];
	if ( top and bottom and self.scrollBarHideable ) then
		if ( self:GetVerticalScrollRange() == 0 ) then
			top:Hide();
			bottom:Hide();
		else
			top:Show();
			bottom:Show();
		end
	end
	if ( middle and self.scrollBarHideable ) then
		if ( self:GetVerticalScrollRange() == 0 ) then
			middle:Hide();
		else
			middle:Show();
		end
	end
end
