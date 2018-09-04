local checkNeedToQueue = false
local EasyScrap = EasyScrap

EasyScrap.parentFrame:SetScript('OnShow', function()
    EasyScrap.parentFrame:RegisterEvent('BAG_UPDATE_DELAYED')
	EasyScrap.parentFrame:RegisterEvent("SCRAPPING_MACHINE_CLOSE")
	EasyScrap.parentFrame:RegisterEvent("SCRAPPING_MACHINE_PENDING_ITEM_CHANGED")
	EasyScrap.parentFrame:RegisterEvent("SCRAPPING_MACHINE_SCRAPPING_FINISHED")
	EasyScrap.parentFrame:RegisterUnitEvent("UNIT_SPELLCAST_START", "player")
	EasyScrap.parentFrame:RegisterUnitEvent("UNIT_SPELLCAST_INTERRUPTED", "player")
	EasyScrap.parentFrame:RegisterUnitEvent("UNIT_SPELLCAST_SUCCEEDED", "player")
 
    EasyScrap.queueItems = {}
    EasyScrap:getScrappableItems()
    EasyScrap:filterScrappableItems()
    --EasyScrap:resetQueue()

    EasyScrapItemFrame.switchContentState(2)
    checkNeedToQueue = false
    EasyScrap.addingItems = false
    EasyScrap.scrapCastLineID = nil
    EasyScrap.scrapInProgress = false
    
    if EasyScrap.saveData.showWhatsNew then
        EasyScrap.mainFrame:Hide()
        EasyScrap.updateOverlay.content:SetText(EasyScrap.whatsNewText[EasyScrap.saveData.showWhatsNew])
        EasyScrap.updateOverlay:Show()
    else
        EasyScrap.updateOverlay:Hide()
        EasyScrap.mainFrame:Show()
    end
end)

EasyScrap.parentFrame:SetScript('OnHide', function()
    EasyScrap.scrapCastLineID = nil
    EasyScrap.parentFrame:UnregisterEvent('BAG_UPDATE_DELAYED')
	EasyScrap.parentFrame:UnregisterEvent("UNIT_SPELLCAST_START", "player")
	EasyScrap.parentFrame:UnregisterEvent("UNIT_SPELLCAST_INTERRUPTED", "player")
	EasyScrap.parentFrame:UnregisterEvent("UNIT_SPELLCAST_SUCCEEDED", "player")
end)
--[[
--At some point on beta SCRAPPING_MACHINE_SCRAPPING_FINISHED stopped firing reliably for one speficic highmountain tauren character.
--Could never reproduce it on any other character but keeping the ugly workaround of using ITEM_CHANGED for now.
--]]
EasyScrap.parentFrame:SetScript('OnEvent', function(self, event, ...)
    --print('Easy Scrap Event: '..event)
    if event == 'BAG_UPDATE_DELAYED' then
        EasyScrap:getScrappableItems()
        if not EasyScrap.mainFrame.searchBox.isEmpty then EasyScrap:searchItem(EasyScrap.mainFrame.searchBox:GetText()) end
        EasyScrap:filterScrappableItems()
        EasyScrapItemFrame:updateContent()
    elseif event == 'SCRAPPING_MACHINE_SCRAPPING_FINISHED_BROKEN' then 
        if #EasyScrap.queueItems > 0 then
            if #EasyScrap.queueItems > 9 then
                EasyScrap.queueItemsToAdd = 9
            else
                EasyScrap.queueItemsToAdd = #EasyScrap.queueItems
            end
            C_Timer.After(0, function() EasyScrap:addQueueItems() end)
        end
    elseif event == 'SCRAPPING_MACHINE_PENDING_ITEM_CHANGED' then
        EasyScrap:getItemsInScrapper()
        EasyScrapItemFrame:updateContent()
        
        if checkNeedToQueue and #EasyScrap.itemsInScrapper == 0 and #EasyScrap.queueItems > 0 then
            checkNeedToQueue = false
            EasyScrap.addingItems = true
        else
            checkNeedToQueue = false
        end
        
        if EasyScrap.addingItems then
            C_Timer.After(0, function() EasyScrap:addQueueItems() end)
        end    
	elseif (event == "UNIT_SPELLCAST_START") then
		local unitTag, lineID, spellID = ...;
		if spellID == C_ScrappingMachineUI.GetScrapSpellID() then
			self.scrapCastLineID = lineID;
            EasyScrap.scrapInProgress = true
		end
	elseif (event == "UNIT_SPELLCAST_INTERRUPTED") then
		local unitTag, lineID, spellID = ...;
		if self.scrapCastLineID and self.scrapCastLineID == lineID then
			self.scrapCastLineID = nil;
            EasyScrap.scrapInProgress = false
		end
	elseif (event == "UNIT_SPELLCAST_SUCCEEDED") then
		local unitTag, lineID, spellID = ...;
		if self.scrapCastLineID and self.scrapCastLineID == lineID then
			checkNeedToQueue = true
            EasyScrap.scrapInProgress = false
		end
    elseif event == 'ADDON_LOADED' then
        local name = ...
        if name == 'EasyScrap' then
            if EasyScrap_IgnoreList then
                EasyScrap.itemIgnoreList = EasyScrap_IgnoreList
            end       
        
            if EasyScrap_SaveData then
                EasyScrap.saveData = EasyScrap_SaveData

                if EasyScrap.saveData.addonVersion < EasyScrap.addonVersion then
                    EasyScrap:updateAddonSettings()
                end     
                
                 --Ignore list changed to only name
                if EasyScrap.saveData.addonVersion < 7 then
                    --Reset ignore list
                    EasyScrap.itemIgnoreList = {}
                    EasyScrap.saveData.showWhatsNew = 6
                end                    
            else
                EasyScrap:initializeSaveData()        
            end
        
            EasyScrap.parentFrame:UnregisterEvent('ADDON_LOADED')
        end
    elseif event == 'PLAYER_LOGOUT' then
        EasyScrap.saveData.addonVersion = EasyScrap.addonVersion
        EasyScrap_SaveData = EasyScrap.saveData
        EasyScrap_IgnoreList = EasyScrap.itemIgnoreList
    end
end)