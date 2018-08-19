local checkNeedToQueue = false
local EasyScrap = EasyScrap

EasyScrapMainFrame:SetScript('OnShow', function()
    EasyScrapMainFrame:RegisterEvent('BAG_UPDATE_DELAYED')
	EasyScrapMainFrame:RegisterEvent("SCRAPPING_MACHINE_CLOSE")
	EasyScrapMainFrame:RegisterEvent("SCRAPPING_MACHINE_PENDING_ITEM_CHANGED")
	EasyScrapMainFrame:RegisterEvent("SCRAPPING_MACHINE_SCRAPPING_FINISHED")
	EasyScrapMainFrame:RegisterUnitEvent("UNIT_SPELLCAST_START", "player")
	EasyScrapMainFrame:RegisterUnitEvent("UNIT_SPELLCAST_INTERRUPTED", "player")
	EasyScrapMainFrame:RegisterUnitEvent("UNIT_SPELLCAST_SUCCEEDED", "player")
 
    EasyScrap.queueItems = {}
    EasyScrap:getScrappableItems()
    EasyScrap:filterScrappableItems()
    --EasyScrap:resetQueue()

    EasyScrapItemFrame.switchContentState(2)
    checkNeedToQueue = false
    EasyScrap.scrapCastLineID = nil
    EasyScrap.scrapInProgress = false
end)

EasyScrapMainFrame:SetScript('OnHide', function()
    EasyScrap.scrapCastLineID = nil
    EasyScrapMainFrame:UnregisterEvent('BAG_UPDATE_DELAYED')
	EasyScrapMainFrame:UnregisterEvent("UNIT_SPELLCAST_START", "player")
	EasyScrapMainFrame:UnregisterEvent("UNIT_SPELLCAST_INTERRUPTED", "player")
	EasyScrapMainFrame:UnregisterEvent("UNIT_SPELLCAST_SUCCEEDED", "player")
end)
--[[
--At some point on beta SCRAPPING_MACHINE_SCRAPPING_FINISHED stopped firing reliably for one speficic highmountain tauren character.
--Could never reproduce it on any other character but keeping the ugly workaround of using ITEM_CHANGED for now.
--]]
EasyScrapMainFrame:SetScript('OnEvent', function(self, event, ...)
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
            if #EasyScrap.queueItems > 9 then
                EasyScrap.queueItemsToAdd = 9
            else
                EasyScrap.queueItemsToAdd = #EasyScrap.queueItems
            end   
        else
            checkNeedToQueue = false
        end
        
        if EasyScrap.queueItemsToAdd > 0 then
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
            if EasyScrap_SaveData then
                EasyScrap.saveData = EasyScrap_SaveData

                if EasyScrap.saveData.addonVersion < EasyScrap.addonVersion then
                    EasyScrap:updateAddonSettings()
                end     
            else
                EasyScrap:initializeSaveData()        
            end
            
            if EasyScrap_IgnoreList then
                EasyScrap.itemIgnoreList = EasyScrap_IgnoreList
            end
           
            EasyScrapMainFrame:UnregisterEvent('ADDON_LOADED')
        end
    elseif event == 'PLAYER_LOGOUT' then
        EasyScrap.saveData.addonVersion = EasyScrap.addonVersion
        EasyScrap_SaveData = EasyScrap.saveData
        EasyScrap_IgnoreList = EasyScrap.itemIgnoreList
    end
end)