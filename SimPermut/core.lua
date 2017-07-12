local _, SimPermut = ...

SimPermut = LibStub("AceAddon-3.0"):NewAddon(SimPermut, "SimPermut", "AceConsole-3.0", "AceEvent-3.0")

local OFFSET_ITEM_ID 	= 1
local OFFSET_ENCHANT_ID = 2
local OFFSET_GEM_ID_1 	= 3
local OFFSET_GEM_ID_2 	= 4
local OFFSET_GEM_ID_3 	= 5
local OFFSET_GEM_ID_4 	= 6
local OFFSET_SUFFIX_ID 	= 7
local OFFSET_FLAGS 		= 11
local OFFSET_BONUS_ID 	= 13
local ITEM_THRESHOLD 	= 800
local ITEM_COUNT_THRESHOLD = 22
local COPY_THRESHOLD 	= 500
-- local LEGENDARY_MAX		= 2


local report_type		= 2


-- Libs
local ArtifactUI          	= _G.C_ArtifactUI
local Clear                 = ArtifactUI.Clear
local HasArtifactEquipped 	= _G.HasArtifactEquipped
local SocketInventoryItem 	= _G.SocketInventoryItem
local Timer               	= _G.C_Timer
local AceGUI 			  	= LibStub("AceGUI-3.0")
local LAD					= LibStub("LibArtifactData-1.0")
local PersoLib			  	= LibStub("PersoLib")

--UI
local mainframe 
local mainframeCreated=false
local stringframeCreated=false
local scroll1
local scroll2
local scroll3
local checkBoxForce
local actualEnchantNeck=0
local actualEnchantFinger=0
local actualEnchantBack=0
local actualGem=0
local actualForce=false
local editLegMin
local editLegMax
local actualLegMin=0
local actualLegMax=0
local actualSets=0
local tableListItems={}
local tableTitres={}
local tableLabel={}
local tableCheckBoxes={}
local tableLinkPermut={}
local tableBaseLink={}
local tableBaseString={}
local tableNumberSelected={}
local labelCount
local selecteditems=0
local errorMessage=""
local artifactData={}
local artifactID
local resultBox
local fingerInf = false
local trinketInf = false
local classID=0
local equipedLegendaries=0
local ad=false

-- load stuff from extras.lua
local slotNames     	= SimPermut.slotNames
local simcSlotNames 	= SimPermut.simcSlotNames
local listNames 		= SimPermut.listNames
local specNames     	= SimPermut.SpecNames
local profNames     	= SimPermut.ProfNames
local PermutSimcNames   = SimPermut.PermutSimcNames
local PermutSlotNames   = SimPermut.PermutSlotNames
local regionString  	= SimPermut.RegionString
local artifactTable 	= SimPermut.ArtifactTable
local gemList 			= SimPermut.gemList
local SetsList				= SimPermut.Sets
local enchantRing 		= SimPermut.enchantRing
local enchantCloak 		= SimPermut.enchantCloak
local enchantNeck 		= SimPermut.enchantNeck
local statsString		= SimPermut.statsString
local statsStringCorres	= SimPermut.statsStringCorres
local RelicTypes		= SimPermut.RelicTypes
local RelicSlots		= SimPermut.RelicSlots
local HasTierSets 		= SimPermut.HasTierSets

SLASH_SIMPERMUTSLASH1 = "/SimP"
SLASH_SIMPERMUTSLASHDEBUG1 = "/SimPermutDebug"

-------------Test-----------------
SLASH_SIMPERMUTSLASHTEST1 = "/Simtest"
SlashCmdList["SIMPERMUTSLASHTEST"] = function (arg)
	local artifactID,artifactData = LAD:GetArtifactInfo() 
	
	for i=1,#artifactData.relics do
		print(artifactData.relics[i].name ,artifactData.relics[i].type)
	end

end
-------------Test-----------------

-- Command UI
SlashCmdList["SIMPERMUTSLASH"] = function (arg)
	if mainframeCreated and mainframe:IsShown()then
		mainframe:Hide()
	else
		SimPermut:BuildFrame()
		mainframeCreated=true
	end
end

SlashCmdList["SIMPERMUTSLASHDEBUG"] = function (arg)
	if ad then
		ad = false
		print("SimpPermut:Desactivated debug")
	else
		ad = true
		print("SimpPermut:Activated debug")
	end
end

function SimPermut:OnInitialize()
	SlashCmdList["SimPermut"] = handler;
end

function SimPermut:OnEnable()
end

function SimPermut:OnDisable()
end


----------------------------
----------- UI -------------
----------------------------
-- Main Frame construction
function SimPermut:BuildFrame()
	artifactID,artifactData = LAD:GetArtifactInfo() 
	
	mainframe = AceGUI:Create("Frame")
	mainframe:SetTitle("SimPermut")
	mainframe:SetPoint("CENTER")
	mainframe:SetCallback("OnClose", function(widget) 
		AceGUI:Release(widget) 
		if stringframeCreated and SimcCopyFrame:IsShown() then
			SimcCopyFrame:Hide()
		end
	end)
	mainframe:SetLayout("Flow")
	mainframe:SetWidth(1300)
	mainframe:SetHeight(780)
	
	local mainGroup = AceGUI:Create("SimpleGroup")
    mainGroup:SetLayout("Flow")
    mainGroup:SetRelativeWidth(0.65)
	
	local scrollcontainer1 = AceGUI:Create("SimpleGroup")
	scrollcontainer1:SetRelativeWidth(0.5)
	scrollcontainer1:SetHeight(600)
	scrollcontainer1:SetLayout("Fill")
	mainGroup:AddChild(scrollcontainer1)
	
	scroll1 = AceGUI:Create("ScrollFrame")
	scroll1:SetLayout("Flow")
	scrollcontainer1:AddChild(scroll1)
	
	local scrollcontainer2 = AceGUI:Create("SimpleGroup")
	scrollcontainer2:SetRelativeWidth(0.5)
	scrollcontainer2:SetHeight(600)
	scrollcontainer2:SetLayout("Fill")
	mainGroup:AddChild(scrollcontainer2)
	
	scroll2 = AceGUI:Create("ScrollFrame")
	scroll2:SetLayout("Flow")
	scrollcontainer2:AddChild(scroll2)
	
	
	
	local resultGroup = AceGUI:Create("SimpleGroup")
    resultGroup:SetLayout("Flow")
    resultGroup:SetRelativeWidth(0.35)
	
	local scrollcontainer3 = AceGUI:Create("SimpleGroup")
	scrollcontainer3:SetRelativeWidth(1)
	scrollcontainer3:SetHeight(600)
	scrollcontainer3:SetLayout("Fill")
	resultGroup:AddChild(scrollcontainer3)
	
	resultBox= AceGUI:Create("MultiLineEditBox")
	resultBox:SetText("")
	resultBox:SetLabel("")
	resultBox:DisableButton(true)
	resultBox:SetRelativeWidth(1)
	scrollcontainer3:AddChild(resultBox)
	
	local labelSpacerResult= AceGUI:Create("Label")
	labelSpacerResult:SetText(" ")
	labelSpacerResult:SetRelativeWidth(0.7)
	
	local buttonGenerateRaw = AceGUI:Create("Button")
	buttonGenerateRaw:SetText("AutoSimc 匯出")
	buttonGenerateRaw:SetRelativeWidth(0.3)
	buttonGenerateRaw:SetCallback("OnClick", function()
		SimPermut:GenerateRaw()
	end)
	
	resultGroup:AddChild(labelSpacerResult)
	resultGroup:AddChild(buttonGenerateRaw)

	
	------ Items + param
	local labelEnchantNeck= AceGUI:Create("Label")
	labelEnchantNeck:SetText("附魔項鍊")
	labelEnchantNeck:SetWidth(80)
	
	local dropdownEnchantNeck = AceGUI:Create("Dropdown")
	dropdownEnchantNeck:SetWidth(130)
	dropdownEnchantNeck:SetList(enchantNeck)
	dropdownEnchantNeck:SetValue(0)
	dropdownEnchantNeck:SetCallback("OnValueChanged", function (this, event, item)
		actualEnchantNeck=item
    end)
		
	local labelEnchantBack= AceGUI:Create("Label")
	labelEnchantBack:SetText("      附魔披風")
	labelEnchantBack:SetWidth(95)
	
	local dropdownEnchantBack = AceGUI:Create("Dropdown")
	dropdownEnchantBack:SetWidth(110)
	dropdownEnchantBack:SetList(enchantCloak)
	dropdownEnchantBack:SetValue(0)
	dropdownEnchantBack:SetCallback("OnValueChanged", function (this, event, item)
		actualEnchantBack=item
    end)
	
	local labelEnchantFinger= AceGUI:Create("Label")
	labelEnchantFinger:SetText("      附魔戒指")
	labelEnchantFinger:SetWidth(95)
	
	local dropdownEnchantFinger = AceGUI:Create("Dropdown")
	dropdownEnchantFinger:SetWidth(110)
	dropdownEnchantFinger:SetList(enchantRing)
	dropdownEnchantFinger:SetValue(0)
	dropdownEnchantFinger:SetCallback("OnValueChanged", function (this, event, item)
		actualEnchantFinger=item
    end)
	
	
	
	local labelGem= AceGUI:Create("Label")
	labelGem:SetText("     珠寶")
	labelGem:SetWidth(55)
	
	local dropdownGem = AceGUI:Create("Dropdown")
	dropdownGem:SetList(gemList)
	dropdownGem:SetWidth(110)
	dropdownGem:SetCallback("OnValueChanged", function (this, event, item)
		actualGem=item
    end)
	dropdownGem:SetValue(0)
	
	
	
	checkBoxForce = AceGUI:Create("CheckBox")
	checkBoxForce:SetWidth(250)
	checkBoxForce:SetLabel("Replace current enchant/gems")
	checkBoxForce:SetCallback("OnValueChanged", function (this, event, item)
		actualForce=checkBoxForce:GetValue()
    end)
	
	local labelSpacerFull= AceGUI:Create("Label")
	labelSpacerFull:SetText("")
	labelSpacerFull:SetWidth(182)
	
	local labelLeg= AceGUI:Create("Label")
	labelLeg:SetText("傳奇裝備")
	labelLeg:SetWidth(80)
	
	editLegMin= AceGUI:Create("EditBox")
	editLegMin:SetText("0")
	editLegMin:SetWidth(20)
	editLegMin:DisableButton(true)
	editLegMin:SetMaxLetters(1)
	editLegMin:SetCallback("OnTextChanged", function (this, event, item)
		editLegMin:SetText(string.match(item, '%d'))
		if editLegMin:GetText()=="" then
			editLegMin:SetText(0)
		end
    end)
	
	editLegMax= AceGUI:Create("EditBox")
	editLegMax:SetText("2")
	editLegMax:SetWidth(20)
	editLegMax:DisableButton(true)
	editLegMax:SetMaxLetters(1)
	editLegMax:SetCallback("OnTextChanged", function (this, event, item)
		editLegMax:SetText(string.match(item, '%d'))
		if editLegMax:GetText()=="" then
			editLegMax:SetText(0)
		end
    end)
	
	local labelSpacer2= AceGUI:Create("Label")
	labelSpacer2:SetText(" ")
	labelSpacer2:SetWidth(60)
	
	local labelSets= AceGUI:Create("Label")
	labelSets:SetText("設定 (最小)")
	labelSets:SetWidth(63)
	
	local dropdownSets = AceGUI:Create("Dropdown")
	dropdownSets:SetList(SetsList)
	dropdownSets:SetWidth(110)
	dropdownSets:SetCallback("OnValueChanged", function (this, event, item)
		actualSets=item
    end)
	dropdownSets:SetValue(0)
	
	local labelSpacerline= AceGUI:Create("Label")
	labelSpacerline:SetText(" ")
	labelSpacerline:SetWidth(250)

	local buttonGenerate = AceGUI:Create("Button")
	buttonGenerate:SetText("生成")
	buttonGenerate:SetWidth(160)
	buttonGenerate:SetCallback("OnClick", function()
		SimPermut:Generate()
	end)
	
	labelCount= AceGUI:Create("Label")
	labelCount:SetText(" ")
	labelCount:SetWidth(255)
	

	
	mainGroup:AddChild(labelEnchantNeck)
	mainGroup:AddChild(dropdownEnchantNeck)
	mainGroup:AddChild(labelEnchantBack)
	mainGroup:AddChild(dropdownEnchantBack)
	mainGroup:AddChild(labelEnchantFinger)
	mainGroup:AddChild(dropdownEnchantFinger)
	mainGroup:AddChild(labelGem)
	mainGroup:AddChild(dropdownGem)
	mainGroup:AddChild(checkBoxForce)
	mainGroup:AddChild(labelSpacerFull)
	mainGroup:AddChild(labelLeg)
	mainGroup:AddChild(editLegMin)
	mainGroup:AddChild(editLegMax)
	mainGroup:AddChild(labelSpacer2)
	mainGroup:AddChild(labelSets)
	mainGroup:AddChild(dropdownSets)
	mainGroup:AddChild(labelSpacerline)
	mainGroup:AddChild(buttonGenerate)
	mainGroup:AddChild(labelCount)

	
	
	mainframe:AddChild(mainGroup)
	mainframe:AddChild(resultGroup)
	
	tableTitres={}
	tableLabel={}
	tableCheckBoxes={}
	tableLinkPermut={}
	_,tableBaseLink=SimPermut:GetBaseString()
	
	editLegMin:SetText(equipedLegendaries)
	
	SimPermut:GetListItems()
	SimPermut:BuildItemFrame()
	SimPermut:GetSelectedCount()
	
	SimPermut:Generate()
end

-- Load Item list
function SimPermut:BuildItemFrame()
	for j=1,#listNames do
		--if tableDropDown[j] then
		tableTitres[j]=AceGUI:Create("Label")
		tableTitres[j]:SetText(PersoLib:firstToUpper(listNames[j]))
		tableTitres[j]:SetFullWidth(true)
		if(j<7) then
			scroll1:AddChild(tableTitres[j])
		else
			scroll2:AddChild(tableTitres[j])
		end
		
		
		tableCheckBoxes[j]={}
		tableLabel[j]={}
		for i=1 ,#tableListItems[j] do
			tableCheckBoxes[j][i]=AceGUI:Create("CheckBox")
			tableCheckBoxes[j][i]:SetLabel("")
			tableCheckBoxes[j][i]:SetRelativeWidth(0.05)
			if SimPermut:isEquiped(tableListItems[j][i],j) then
				tableCheckBoxes[j][i]:SetValue(true)
			else
				tableCheckBoxes[j][i]:SetValue(false)
			end
			tableCheckBoxes[j][i]:SetCallback("OnValueChanged", function(this, event, item)
				if tableCheckBoxes[j][i]:GetValue() then
					selecteditems=selecteditems+1
				else
					selecteditems=selecteditems-1
				end
				SimPermut:CheckItemCount()
			end)
			selecteditems=selecteditems+1
			if j<7 then
				scroll1:AddChild(tableCheckBoxes[j][i])
			else
				scroll2:AddChild(tableCheckBoxes[j][i])
			end
			
			tableLabel[j][i]=AceGUI:Create("InteractiveLabel")
			tableLabel[j][i]:SetText(tableListItems[j][i])
			tableLabel[j][i]:SetRelativeWidth(0.95)
			tableLabel[j][i]:SetCallback("OnEnter", function(widget)
				GameTooltip:SetOwner(widget.frame, "ANCHOR_BOTTOMLEFT")
				GameTooltip:SetHyperlink(tableListItems[j][i])
				GameTooltip:Show()
			end)
			tableLabel[j][i]:SetCallback("OnLeave", function() GameTooltip:Hide()  end)
			
			if (j>=11 and ad) then
				PersoLib:debugPrint(listNames[j]..i.." : "..PersoLib:GetIDFromLink(tableListItems[j][i]),ad)
			end
			
			if(j<7) then
				scroll1:AddChild(tableLabel[j][i])
			else
				scroll2:AddChild(tableLabel[j][i])
			end
			
			
		end
		--end
	end

	
end

-- check if the item is selected
function SimPermut:isEquiped(itemLink,slot)
	local returnValue=false
	if slot==11 then
		if tableBaseLink[11]==itemLink or tableBaseLink[12]==itemLink then
			returnValue=true
		end
	elseif slot==12 then
		if tableBaseLink[13]==itemLink or tableBaseLink[14]==itemLink then
			returnValue=true
		end
	else
		if tableBaseLink[slot]==itemLink then
			returnValue=true
		end
	end
	return returnValue
end

-- clic btn generate
function SimPermut:Generate()
	mainframe:SetStatusText("")
	local permuttable={}
	local permutString=""
	local baseString=""
	local finalString=""
	if SimPermut:GetTableLink() then
		PersoLib:debugPrint("--------------------",ad)
		PersoLib:debugPrint("生成字串...",ad)
		SimPermut:GetSelectedCount()
		baseString,tableBaseLink=SimPermut:GetBaseString()
		permuttable=SimPermut:GetAllPermutations()
		SimPermut:PreparePermutations(permuttable)
		permutString=SimPermut:GetPermutationString(permuttable)
		finalString=SimPermut:GetFinalString(baseString,permutString)
		SimPermut:PrintPermut(finalString)
		
		
		PersoLib:debugPrint("生成結束",ad)
		PersoLib:debugPrint("--------------------",ad)
	else --error
		mainframe:SetStatusText(errorMessage)
	end
end

-- clic btn generate raw
function SimPermut:GenerateRaw()
	mainframe:SetStatusText("")
	
	local itemList=""
	local baseString=""
	local finalString=""
	local AutoSimcString=""
	
	if SimPermut:GetTableLink() then
		PersoLib:debugPrint("--------------------",ad)
		PersoLib:debugPrint("生成字串...",ad)
		baseString,tableBaseLink=SimPermut:GetBaseString()
		AutoSimcString=SimPermut:GetAutoSimcString()
		itemList=SimPermut:GetItemListString()
		finalString=SimPermut:GetFinalString(AutoSimcString,itemList)
		SimPermut:PrintPermut(finalString)
		PersoLib:debugPrint("生成結束",ad)
		PersoLib:debugPrint("--------------------",ad)
	end
end

-- Get the count of selected items
function SimPermut:GetSelectedCount()
	selecteditems = 0
	tableNumberSelected={}
	for i=1,#listNames do
		tableNumberSelected[i]=0
		for j=1,#tableListItems[i] do
			if tableCheckBoxes[i][j]:GetValue() then
				selecteditems=selecteditems+1
				tableNumberSelected[i]=tableNumberSelected[i]+1
			end
		end
	end
	
	SimPermut:CheckItemCount()
end

-- Check if item count is not too high
function SimPermut:CheckItemCount()
	if selecteditems >= ITEM_COUNT_THRESHOLD then
		labelCount:SetText("     警告 : 選擇太多物品 ("..selecteditems.."). 考慮使用AutoSimC 匯出")
	else
		labelCount:SetText("     ".. selecteditems.. " 物品已選")
	end
end

-- draw the frame and print the text
function SimPermut:PrintPermut(finalString)
	--SimcCopyFrame:Show()
	--SimcCopyFrame:SetPoint("RIGHT")
	--stringframeCreated=true
	--SimcCopyFrameScroll:Show()
	--SimcCopyFrameScrollText:Show()
	--SimcCopyFrameScrollText:SetText(finalString)
	--SimcCopyFrameScrollText:HighlightText()
	resultBox:SetText(finalString)
	resultBox:HighlightText()
	resultBox:SetFocus()
end

----------------------------
-- Permutation Management --
----------------------------
-- get item string
function SimPermut:GetItemString(itemLink,itemType,base)
	--itemLink 	: link of the item
	--itemType 	: item slot
	--base 		: true if item from equiped gear, false from inventory

	local itemString = string.match(itemLink, "item:([%-?%d:]+)")
	local itemSplit = {}
	local simcItemOptions = {}	
	local bonuspool={}
	local enchantID=""
	for i, value in pairs(statsString) do 
		bonuspool[value]=0
	end
	
	-- Split data into a table
	for v in string.gmatch(itemString, "(%d*:?)") do
		if v == ":" then
		  itemSplit[#itemSplit + 1] = 0
		else
		  itemSplit[#itemSplit + 1] = string.gsub(v, ':', '')
		end
	end
	
	-- Item id
	local itemId = itemSplit[OFFSET_ITEM_ID]
	simcItemOptions[#simcItemOptions + 1] = ',id=' .. itemId
	
	-- Enchant
	if base then 
		if tonumber(itemSplit[OFFSET_ENCHANT_ID]) > 0 then
			--simcItemOptions[#simcItemOptions + 1] = 'enchant_id=' .. itemSplit[OFFSET_ENCHANT_ID]
			enchantID=itemSplit[OFFSET_ENCHANT_ID]
		end
	else
		if itemType=="neck" then
			if actualForce and actualEnchantNeck~=0 then
				--simcItemOptions[#simcItemOptions + 1] = 'enchant_id=' .. actualEnchantNeck
				enchantID=actualEnchantNeck
			else	
				if actualEnchantNeck==0 or tonumber(itemSplit[OFFSET_ENCHANT_ID]) > 0 then
					if tonumber(itemSplit[OFFSET_ENCHANT_ID]) > 0 then
						--simcItemOptions[#simcItemOptions + 1] = 'enchant_id=' .. itemSplit[OFFSET_ENCHANT_ID]
						enchantID=itemSplit[OFFSET_ENCHANT_ID]
					end
				else
					--simcItemOptions[#simcItemOptions + 1] = 'enchant_id=' .. actualEnchantNeck
					enchantID=actualEnchantNeck
				end
			end
		elseif itemType=="back" then
			if actualForce and actualEnchantBack~=0 then
				--simcItemOptions[#simcItemOptions + 1] = 'enchant_id=' .. actualEnchantBack
				enchantID=actualEnchantBack
			else
				if actualEnchantBack==0 or tonumber(itemSplit[OFFSET_ENCHANT_ID]) > 0 then
					if tonumber(itemSplit[OFFSET_ENCHANT_ID]) > 0 then
						--simcItemOptions[#simcItemOptions + 1] = 'enchant_id=' .. itemSplit[OFFSET_ENCHANT_ID]
						enchantID=itemSplit[OFFSET_ENCHANT_ID]
					end
				else
					--simcItemOptions[#simcItemOptions + 1] = 'enchant_id=' .. actualEnchantBack
					enchantID=actualEnchantBack
				end
			end
		elseif string.match(itemType, 'finger*') then
			if actualForce and actualEnchantFinger~=0 then
				--simcItemOptions[#simcItemOptions + 1] = 'enchant_id=' .. actualEnchantFinger
				enchantID=actualEnchantFinger
			else
				if actualEnchantFinger==0 or tonumber(itemSplit[OFFSET_ENCHANT_ID]) > 0 then
					if tonumber(itemSplit[OFFSET_ENCHANT_ID]) > 0 then
						--simcItemOptions[#simcItemOptions + 1] = 'enchant_id=' .. itemSplit[OFFSET_ENCHANT_ID]
						enchantID=itemSplit[OFFSET_ENCHANT_ID]
					end
				else
					--simcItemOptions[#simcItemOptions + 1] = 'enchant_id=' .. actualEnchantFinger
					enchantID=actualEnchantFinger
				end
			end
		else
			if tonumber(itemSplit[OFFSET_ENCHANT_ID]) > 0 then
				--simcItemOptions[#simcItemOptions + 1] = 'enchant_id=' .. itemSplit[OFFSET_ENCHANT_ID]
				enchantID=itemSplit[OFFSET_ENCHANT_ID]
			end
		end
	end
	
	if enchantID ~= "" then
		simcItemOptions[#simcItemOptions + 1] = 'enchant_id=' .. enchantID
		--bonuspool=SimPermut:StatAddBonus(bonuspool,"enchant",itemType,enchantID)
	end

	-- New style item suffix, old suffix style not supported
	if tonumber(itemSplit[OFFSET_SUFFIX_ID]) ~= 0 then
		simcItemOptions[#simcItemOptions + 1] = 'suffix=' .. itemSplit[OFFSET_SUFFIX_ID]
	end

	local flags = tonumber(itemSplit[OFFSET_FLAGS])

	local bonuses = {}

	for index=1, tonumber(itemSplit[OFFSET_BONUS_ID]) do
		bonuses[#bonuses + 1] = itemSplit[OFFSET_BONUS_ID + index]
	end

	if #bonuses > 0 then
		simcItemOptions[#simcItemOptions + 1] = 'bonus_id=' .. table.concat(bonuses, '/')
	end

	local rest_offset = OFFSET_BONUS_ID + #bonuses + 1


	-- Artifacts use this
	if bit.band(flags, 256) == 256 then
        rest_offset = rest_offset + 1 -- An unknown field
        local n_bonus_ids = tonumber(itemSplit[rest_offset])
		if n_bonus_ids==1 then --unlocked traits field
			rest_offset = rest_offset + 1 
		end
        local relic_str = ''
        while rest_offset < #itemSplit do
          n_bonus_ids = tonumber(itemSplit[rest_offset])
          rest_offset = rest_offset + 1

          if n_bonus_ids == 0 then
            relic_str = relic_str .. 0
          else
            for rbid = 1, n_bonus_ids do
              relic_str = relic_str .. itemSplit[rest_offset]
              if rbid < n_bonus_ids then
                relic_str = relic_str .. ':'
              end
              rest_offset = rest_offset + 1
            end
          end

          if rest_offset < #itemSplit then
            relic_str = relic_str .. '/'
          end
        end

        if relic_str ~= '' then
          simcItemOptions[#simcItemOptions + 1] = 'relic_id=' .. relic_str
        end
      end

	-- Gems
	if itemType=="main_hand" then --exception for relics
		local gems = {}
		for i=1, 4 do -- hardcoded here to just grab all 4 sockets
			local _,gemLink = GetItemGem(itemLink, i)
			if gemLink then
				local gemDetail = string.match(gemLink, "item[%-?%d:]+")
				gems[#gems + 1] = string.match(gemDetail, "item:(%d+):" )
			elseif flags == 256 then
				gems[#gems + 1] = "0"
			end
		end
		if #gems > 0 then
			simcItemOptions[#simcItemOptions + 1] = 'gem_id=' .. table.concat(gems, '/')
		end
	else
		local hasSocket=false
		local stats = GetItemStats(itemLink)
		local _,_,itemRarity = GetItemInfo(itemLink)
		--for some reason, GetItemStats doesn't gives sockets to neck and finger that have one by default
		if stats and stats['EMPTY_SOCKET_PRISMATIC']==1 or (itemRarity== 5 and (itemType== 'neck' or itemType== 'finger1' or itemType== 'finger2')) then
			hasSocket=true 
		end
		if base then
			if tonumber(itemSplit[OFFSET_GEM_ID_1]) ~= 0 then
				simcItemOptions[#simcItemOptions + 1] = 'gem_id=' .. itemSplit[OFFSET_GEM_ID_1]
			end
		else
			if actualForce and actualGem~=0 then
				if actualGem~=0 and (hasSocket or tonumber(itemSplit[OFFSET_GEM_ID_1]) ~= 0) then
					simcItemOptions[#simcItemOptions + 1] = 'gem_id=' .. actualGem
				end
			else
				if tonumber(itemSplit[OFFSET_GEM_ID_1]) ~= 0 then
					simcItemOptions[#simcItemOptions + 1] = 'gem_id=' .. itemSplit[OFFSET_GEM_ID_1]
				else
					if actualGem~=0 and hasSocket then
						simcItemOptions[#simcItemOptions + 1] = 'gem_id=' .. actualGem
					end
				end
			end
		end
	end
	
	return simcItemOptions,bonuspool
end

-- get all items equiped Strings
function SimPermut:GetItemStrings()
	local items = {}
	local itemsLinks = {}
	local slotId,itemLink
	local itemString = {}
	local pool={}
	local stats = {}
	
	equipedLegendaries = 0
	for i, value in pairs(statsString) do 
		pool[value]=0
	end
	

	for slotNum=1, #PermutSlotNames do
		slotId = GetInventorySlotInfo(PermutSlotNames[slotNum])
		itemLink = GetInventoryItemLink('player', slotId) 

		
		-- if we don't have an item link, we don't care
		if itemLink then
			local _,_,itemRarity = GetItemInfo(itemLink)
			if itemRarity==5 then
				equipedLegendaries= equipedLegendaries+1
			end
			itemString=SimPermut:GetItemString(itemLink,PermutSimcNames[slotNum],true)
			tableBaseString[slotNum]=table.concat(itemString, ',')
			itemsLinks[slotNum]=itemLink
			items[slotNum] = PermutSimcNames[slotNum] .. "=" .. table.concat(itemString, ',')

			--stats
			stats={}
			stats = GetItemStats(itemLink)
			for stat, value in pairs(statsString) do 
				if stats[value] then
					pool[value]=pool[value]+stats[value]
				end
			end
		end
	end

	return items,itemsLinks,pool
end

-- get the list of items of a slot
function SimPermut:GetListItem(strItem,itemLine)
	local texture, count, locked, quality, readable, lootable, isFiltered, hasNoValue, itemId, itemLink, itemstring, ilvl, name
	local permutTable={}
	local itemidTable={}
	local linkTable={}
	local equippableItems = {}
	local copyname
	
	local blizzardname,simcname,slotID
	if strItem=="head" then
		slotID=1
	elseif strItem=="neck" then
		slotID=2
	elseif strItem=="shoulder" then
		slotID=3
	elseif strItem=="back" then
		slotID=4
	elseif strItem=="chest" then
		slotID=5
	elseif strItem=="wrist" then
		slotID=8
	elseif strItem=="hands" then
		slotID=9
	elseif strItem=="waist" then
		slotID=10
	elseif strItem=="legs" then
		slotID=11
	elseif strItem=="feet" then
		slotID=12
	elseif strItem=="finger" then
		slotID=13
	elseif strItem=="trinket" then
		slotID=15
	--elseif strItem=="relic" then
	--	slotID=15
	end
	blizzardname=SimPermut.slotNames[slotID]
	simcname=simcSlotNames[slotID]
	local id, _, _ = GetInventorySlotInfo(blizzardname)
	GetInventoryItemsForSlot(id, equippableItems)
	for locationBitstring, itemID in pairs(equippableItems) do
		local player, bank, bags, voidstorage, slot, bag = EquipmentManager_UnpackLocation(locationBitstring)
		if bags then
			_, _, _, _, _, _, itemLink, _, _, itemId = GetContainerItemInfo(bag, slot)
			if itemLink~=nil then
				_,_,_,ilvl = GetItemInfo(itemLink)
				if ilvl>= ITEM_THRESHOLD then
					linkTable[#linkTable+1]=itemLink
				end
			end
		else
			itemLink = GetInventoryItemLink('player', slot)
			if itemLink~=nil then
				_,_,_,ilvl = GetItemInfo(itemLink)
				if ilvl>= ITEM_THRESHOLD then
					linkTable[#linkTable+1]=itemLink
				end
			end
		end
	end
	
	return linkTable
end

-- get the list of items of all selected items from dropdown
function SimPermut:GetListItems()
	for i=1,#listNames do
		tableListItems[i]={}
		--si l'item est sélectionné
		--if tableDropDown[i] then
			tableListItems[i]=SimPermut:GetListItem(listNames[i],i)
		--end
	end
end

-- generates tablelink to be ready for permuts
function SimPermut:GetTableLink()
	local returnvalue=true
	local slotid
	for i=1,#listNames do
		tableLinkPermut[i]={}
		if tableListItems[i] and #tableListItems[i]>0 then
			for j=1,#tableListItems[i] do
				if tableCheckBoxes[i][j]:GetValue() then
					tableLinkPermut[i][#tableLinkPermut[i] + 1] = tableListItems[i][j]
				end
			end
		end
		
		--if we have no items, we take the equiped one. exception for finger and trinket
		if #tableLinkPermut[i] == 0 and i<11 then
			if(i>=6) then
				slotid=i+2
			else
				slotid=i
			end
			tableLinkPermut[i][1]=GetInventoryItemLink('player', GetInventorySlotInfo(slotNames[slotid]))
		end
			
	end
	
	--manage fingers and trinkets
	if #tableLinkPermut[12]==0 then --if no trinket chosen, we take the equiped ones
		tableLinkPermut[13]={}
		tableLinkPermut[13][1]=GetInventoryItemLink('player', GetInventorySlotInfo(slotNames[15]))
		tableLinkPermut[14]={}
		tableLinkPermut[14][1]=GetInventoryItemLink('player', GetInventorySlotInfo(slotNames[16]))
	else --else we copy the selected ones on the second slot and reposition the slot in the good position
		if #tableLinkPermut[12]==1 then
			errorMessage="只有單一飾品時無法運算"
			returnvalue=false
		elseif #tableLinkPermut[12]==2 then
			tableLinkPermut[13]={}
			tableLinkPermut[13][1]=tableLinkPermut[12][1]
			tableLinkPermut[14]={}
			tableLinkPermut[14][1]=tableLinkPermut[12][2]
			tableLinkPermut[12]={}
		else
			tableLinkPermut[13]=tableLinkPermut[12]
			tableLinkPermut[14]=tableLinkPermut[13]
			tableLinkPermut[12]={}
		end
	end
	
	if #tableLinkPermut[11]==0 then --if no finger chosen, we take the equiped ones
		tableLinkPermut[11][1]=GetInventoryItemLink('player', GetInventorySlotInfo(slotNames[13]))
		tableLinkPermut[12][1]=GetInventoryItemLink('player', GetInventorySlotInfo(slotNames[14]))
	else --else we copy the selected ones on the second slot
		if #tableLinkPermut[11]==1 then
			errorMessage="只有單一戒指時無法運算"
			returnvalue=false
		elseif #tableLinkPermut[11]==2 then
			local temptable={}
			temptable[1]=tableLinkPermut[11]
			tableLinkPermut[11]={}
			tableLinkPermut[11][1]=temptable[1][1]
			tableLinkPermut[12][1]=temptable[1][2]
		else
			tableLinkPermut[12]=tableLinkPermut[11]
		end
	end
		
	
	return returnvalue
end

-- generates a raw list of all selected items for autoSimc
function SimPermut:GetItemListString()
	local returnString=""
	local actualString
	for i=1,#tableLinkPermut do
		actualString=""
		for j=1,#tableLinkPermut[i] do
			local _,_,itemRarity = GetItemInfo(tableLinkPermut[i][j])
			local itemString=SimPermut:GetItemString(tableLinkPermut[i][j],PermutSimcNames[i],false)
			actualString = actualString .. ((itemRarity== 5) and "L" or "")..table.concat(itemString, ',').."|"
		end
		actualString=actualString:sub(1, -2)
		returnString = returnString..PermutSimcNames[i] .. "="..actualString.."\n"
		
	end
	
	--mainhand
    local itemLink = GetInventoryItemLink('player', INVSLOT_MAINHAND)
	local itemString = {}

    -- if we don't have an item link, we don't care
    if itemLink then
		itemString=SimPermut:GetItemString(itemLink,'main_hand',true)
		returnString = returnString .. "main_hand=" .. table.concat(itemString, ',').. '\n'
    end
	
	--offhand
    itemLink = GetInventoryItemLink('player', INVSLOT_OFFHAND)
	itemString = {}

    -- if we don't have an item link, we don't care
    if itemLink then
		itemString=SimPermut:GetItemString(itemLink,'off_hand',true)
		returnString = returnString .. "off_hand=" .. table.concat(itemString, ',').. '\n'
    end
	
	
	return returnString
--SimPermut:GetItemString(itemLink,itemType,base)
end

-- generates the init string from autosimc
function SimPermut:GetAutoSimcString()
	local autoSimcString=""
	autoSimcString=autoSimcString .. "[Profile]".."\n"
	autoSimcString=autoSimcString .. "profilename="..UnitName('player').."\n"
	autoSimcString=autoSimcString .. "profileid=1".."\n"
	local _, playerClass = UnitClass('player')
	autoSimcString=autoSimcString .. "class="..PersoLib:tokenize(playerClass) .."\n"
	autoSimcString=autoSimcString .. "race="..PersoLib:tokenize(PersoLib:getRace()).."\n"
	autoSimcString=autoSimcString .. "level="..UnitLevel('player').."\n"
	autoSimcString=autoSimcString .. "spec="..PersoLib:tokenize(specNames[ PersoLib:getSpecID() ]).."\n"
	autoSimcString=autoSimcString .. "role="..PersoLib:translateRole(role).."\n"
	autoSimcString=autoSimcString .. "position=back".."\n"
	autoSimcString=autoSimcString .. "talents="..PersoLib:CreateSimcTalentString().."\n"
	autoSimcString=autoSimcString .. "artifact="..SimPermut:GetArtifactString().."\n"
	autoSimcString=autoSimcString .. "other=".."\n"
	autoSimcString=autoSimcString .. "[Gear]".."\n"
	
	return autoSimcString
end

-- generates all permutations for the tableLinkPermut
function SimPermut:GetAllPermutations()
	local returnTable={}

	returnTable=PersoLib:doCartesianALACON(tableLinkPermut)
	
	PersoLib:debugPrint("Nb of rings:"..tableNumberSelected[11],ad)
	PersoLib:debugPrint("Nb of trinkets:"..tableNumberSelected[12],ad)
	
	return returnTable
end

-- reorganize ring and trinket before print if only two
function SimPermut:ReorganizeEquip(tabletoPermut)
	local itemIdRing1,itemIdRing2
	local itemIdTrinket1,itemIdTrinket2 
	if tableNumberSelected[11]<=2 then
		PersoLib:debugPrint(tableNumberSelected[11].." rings. Re-organize",ad)
		itemIdRing1 = PersoLib:GetIDFromLink(tabletoPermut[11])
		itemIdRing2 = PersoLib:GetIDFromLink(tabletoPermut[12])
		PersoLib:debugPrint("fingerInf:"..tostring(fingerInf).."("..itemIdRing1.."-"..itemIdRing2..")",ad)
		if (fingerInf and itemIdRing1>itemIdRing2) or (not fingerInf and itemIdRing1<itemIdRing2) then
			local tempring = tabletoPermut[11]
			tabletoPermut[11] = tabletoPermut[12]
			tabletoPermut[12] = tempring
		end
	end
	if tableNumberSelected[12]<=2 then
		PersoLib:debugPrint(tableNumberSelected[12].." trinkets. Re-organize",ad)
		itemIdTrinket1 = PersoLib:GetIDFromLink(tabletoPermut[13])
		itemIdTrinket2 = PersoLib:GetIDFromLink(tabletoPermut[14])
		PersoLib:debugPrint("trinketInf:"..tostring(trinketInf).."("..itemIdTrinket1.."-"..itemIdTrinket2..")",ad)
		if (trinketInf and itemIdTrinket1>itemIdTrinket2) or (not trinketInf and itemIdTrinket1<itemIdTrinket2) then
			local temptrinket = tabletoPermut[13]
			tabletoPermut[13] = tabletoPermut[14]
			tabletoPermut[14] = temptrinket
		end
	end
	
	
end

-- prepare variables for permutations
function SimPermut:PreparePermutations(permuttable)
	local itemIdRing1,itemIdRing2
	local itemIdTrinket1,itemIdTrinket2 
	--preparing rings
	if (GetInventoryItemLink('player', INVSLOT_FINGER1)==permuttable[1][11] and GetInventoryItemLink('player', INVSLOT_FINGER2)==permuttable[1][12]) or 
		(GetInventoryItemLink('player', INVSLOT_FINGER1)==permuttable[1][12] and GetInventoryItemLink('player', INVSLOT_FINGER2)==permuttable[1][11]) then
		itemIdRing1 = PersoLib:GetIDFromLink(GetInventoryItemLink('player', INVSLOT_FINGER1))
		itemIdRing2 = PersoLib:GetIDFromLink(GetInventoryItemLink('player', INVSLOT_FINGER2))
	else
		itemIdRing1 = PersoLib:GetIDFromLink(permuttable[1][11])
		itemIdRing2 = PersoLib:GetIDFromLink(permuttable[1][12])
	end
	if itemIdRing1<itemIdRing2 then
		fingerInf=true
	end
	
	--prepare trinkets
	if (GetInventoryItemLink('player', INVSLOT_TRINKET1)==permuttable[1][13] and GetInventoryItemLink('player', INVSLOT_TRINKET2)==permuttable[1][14]) or 
		(GetInventoryItemLink('player', INVSLOT_TRINKET1)==permuttable[1][14] and GetInventoryItemLink('player', INVSLOT_TRINKET2)==permuttable[1][13]) then
		
		itemIdTrinket1 = PersoLib:GetIDFromLink(GetInventoryItemLink('player', INVSLOT_TRINKET1))
		itemIdTrinket2 = PersoLib:GetIDFromLink(GetInventoryItemLink('player', INVSLOT_TRINKET2))
	else
		itemIdTrinket1 = PersoLib:GetIDFromLink(permuttable[1][13])
		itemIdTrinket2 = PersoLib:GetIDFromLink(permuttable[1][14])
	end
	if itemIdTrinket1<itemIdTrinket2 then
		trinketInf=true
	end
	
	PersoLib:debugPrint("fingerInf:"..tostring(fingerInf).."("..itemIdRing1.."-"..itemIdRing2..")  ".."trinketInf:"..tostring(trinketInf).."("..itemIdTrinket1.."-"..itemIdTrinket2..")",ad)
		
end

-- generates the string of all permutations
function SimPermut:GetPermutationString(permuttable)
	local returnString="\n"
	
	local copynumber=1
	local stats
	local pool={}
	local itemString
	local itemStringFinal
	local itemString2
	local itemStringFinal2
	local bonuspool={}
	local currentString
	local nbLeg
	local itemRarity
	local nbitem
	local itemList
	local itemname
	local result
	local draw = true
	local str
	local T192p,T194p
	
	actualLegMin=tonumber(editLegMin:GetText())
	actualLegMax=tonumber(editLegMax:GetText())
	
	for i=1,#permuttable do
		T192p,T194p=SimPermut:HasTier("T19",permuttable[i])
		SimPermut:ReorganizeEquip(permuttable[i])
		result=SimPermut:CheckUsability(permuttable[i],tableBaseLink)
		if result=="" or ad then
		
			for i, value in pairs(statsString) do 
				pool[value]=0
				bonuspool[value]=0
			end
			currentString=""
			nbLeg=0
			nbitem=0
			itemList=""
			
			for j=1,#permuttable[i] do
				draw = true
				local _,_,itemRarity = GetItemInfo(permuttable[i][j])
				if(itemRarity==5) then 
					nbLeg=nbLeg+1
				end
				
				itemString,bonuspool=SimPermut:GetItemString(permuttable[i][j],PermutSimcNames[j],false)
				itemStringFinal=table.concat(itemString, ',')
				if (j>10) then
					if (j==11 or j==13) then
						itemString2 =SimPermut:GetItemString(permuttable[i][j+1],PermutSimcNames[j+1],false)
						itemStringFinal2 = table.concat(itemString2, ',')
						if(itemStringFinal==tableBaseString[j] or (itemStringFinal==tableBaseString[j+1] and itemStringFinal2==tableBaseString[j]))then
							draw=false
						else
							draw=true
						end
					else
						itemString2 =SimPermut:GetItemString(permuttable[i][j-1],PermutSimcNames[j-1],false)
						itemStringFinal2 = table.concat(itemString2, ',')
						if(itemStringFinal==tableBaseString[j] or (itemStringFinal==tableBaseString[j-1] and itemStringFinal2==tableBaseString[j]))then
							draw=false
						else
							draw=true
						end
					end
				else
					draw = (itemStringFinal ~= tableBaseString[j])
				end
				
				if draw or ad then
					local adString=""
					if ad and not draw then
						adString=" # Debug not drawn : "
					end
					currentString = currentString.. adString ..PermutSimcNames[j] .. "=" .. table.concat(itemString, ',').."\n"
					itemname = GetItemInfo(permuttable[i][j])
					nbitem=nbitem+1
					itemList=itemList..PersoLib:tokenize(itemname).."-"
					--stats
					stats={}
					stats = GetItemStats(permuttable[i][j])
					for stat, value in pairs(statsString) do 
						if stats[value] then
							pool[value]=pool[value]+stats[value]
						end
					end
				else
					PersoLib:debugPrint("Not printed: not drawn",ad)
				end
				
			end
			
			itemList=itemList:sub(1, -2)
			
			if((nbLeg >=actualLegMin and nbLeg<=actualLegMax and nbitem>0 and (actualSets==0 or (actualSets==2 and T192p) or (actualSets==4 and T194p))) or ad) then
				local adString=""
				if ad then
					if result ~= "" then
						adString=" # Debug print : "..result.."\n"
					elseif(nbLeg>actualLegMax) then
						adString=" # Debug print : Not printed:Too much Leg ("..nbLeg..")\n"
					elseif(nbLeg<actualLegMin) then
						adString=" # Debug print : Not printed:Too few Leg ("..nbLeg..")\n"
					elseif(not T192p and actualSets==2) then
						adString=" # Debug print : Not printed:No 2p T19\n"
					elseif(not T194p and actualSets==4) then
						adString=" # Debug print : Not printed:No 4p T19\n"
					end
				end
				returnString =  returnString .. adString..SimPermut:GetCopyName(copynumber,pool,nbitem,itemList,#permuttable) .. "\n".. currentString.."\n"
				copynumber=copynumber+1
			
			end
		else
			PersoLib:debugPrint("Not printed:"..result,ad)
		end
	end
	
	if copynumber > COPY_THRESHOLD then
		str="大量數字的拷貝，你或許沒有齊全的拷貝(框架限制)。考慮使用AutoSimC匯出"
		mainframe:SetStatusText(str)
		PersoLib:debugPrint(str,ad)
	end
	
	if copynumber==0 and selecteditems>14 then
		str="未生成拷貝，因為找不到其他可能的組合 (3 個橘裝, 同理如戒指/飾品...)"
		mainframe:SetStatusText(str)
		PersoLib:debugPrint(str,ad)
	end
	
	return returnString
end

-- get copy's stat
function SimPermut:GetCopyName(copynumber,pool,nbitem,itemList,nbitems)
	local returnString="copy="
	
	if report_type==1 then
		returnString=returnString..itemList
	else 
		local nbcopies = ''..nbitems
		local digits = string.len(nbcopies)
		local mask = '00000000000000000000000000000000000'
		local maskedProfileID=string.sub(mask..copynumber,-digits)
		returnString=returnString.."copy"..maskedProfileID
	end
	
	--for i, value in pairs(statsString) do 
	--	if pool[value]~=0 then
	--		returnString=returnString..statsStringCorres[statsString[i]]..pool[value].."_"
	--	end
	--end
	--returnString=returnString:sub(1, -2)
	
	returnString=returnString..",Base"
	return returnString
end

-- add enchant or gem to the stat pool
function SimPermut:StatAddBonus(bonuspool,bonusType,itemType,enchantID)
	local bonusString,amount,stat
	if bonusType=="enchant" then
		if itemType=="back" then
			bonusString=enchantCloak[enchantID]
		elseif itemType=="finger" then
			bonusString=enchantRing[enchantID]
		end
		local t = {}
		for word in arg:gmatch("%w+") do table.insert(t, word) end
		amount=t[1].sub(2)
		stat=t[2]
	elseif bonusType=="gem" then
	
	end
	return bonuspool
end

-- generates the string for artifact, equiped gear and player info
function SimPermut:GetBaseString()
	local playerName = UnitName('player')
	local playerClass
	_, playerClass,classID = UnitClass('player')
	local playerLevel = UnitLevel('player')
	local playerRealm = GetRealmName()
	local playerRegion = regionString[GetCurrentRegion()]
	local bPermut=false
	local slotId,itemLink
	local itemString = {}
	
	local stats={}
	local StatPool={}

	local playerRace = PersoLib:getRace()
	local playerTalents = PersoLib:CreateSimcTalentString()
	local playerArtifact = SimPermut:GetArtifactString()
	local playerSpec = specNames[ PersoLib:getSpecID() ]

	-- Construct SimC-compatible strings from the basic information
	local player = ""
	playerClass = PersoLib:tokenize(playerClass) 
	player = playerClass .. '="' .. playerName .. '"'
	playerLevel = 'level=' .. playerLevel
	playerRace = 'race=' .. PersoLib:tokenize(playerRace)
	playerRole = 'role=' .. PersoLib:translateRole(role)
	playerSpec = 'spec=' .. PersoLib:tokenize(playerSpec)
	playerRealm = 'server=' .. PersoLib:tokenize(playerRealm)
	playerRegion = 'region=' .. PersoLib:tokenize(playerRegion)
	playerTalents = 'talents=' .. playerTalents	

	-- Build the output string for the player (not including gear)
	local SimPermutProfile = player .. '\n'
	SimPermutProfile = SimPermutProfile .. playerLevel .. '\n'
	SimPermutProfile = SimPermutProfile .. playerRace .. '\n'
	SimPermutProfile = SimPermutProfile .. playerRegion .. '\n'
	SimPermutProfile = SimPermutProfile .. playerRealm .. '\n'
	SimPermutProfile = SimPermutProfile .. playerRole .. '\n'
	SimPermutProfile = SimPermutProfile .. playerTalents .. '\n'
	SimPermutProfile = SimPermutProfile .. playerSpec .. '\n'
	if playerArtifact ~= nil then
		SimPermutProfile = SimPermutProfile .. "artifact=".. playerArtifact .. '\n'
	end
	SimPermutProfile = SimPermutProfile .. '\n'

	-- Method that gets gear information
	local items,itemsLinks,StatPool = SimPermut:GetItemStrings()

	SimPermutProfile = SimPermutProfile .. "name=Base \n"
	-- output gear
	for slotNum=1, #PermutSlotNames do
		if items[slotNum] then
			SimPermutProfile = SimPermutProfile .. items[slotNum] .. '\n'
		end
	end
	
	--add weapons
    itemLink = GetInventoryItemLink('player', INVSLOT_MAINHAND)
	itemString = {}

    -- if we don't have an item link, we don't care
    if itemLink then
		itemString=SimPermut:GetItemString(itemLink,'main_hand',true)
		SimPermutProfile = SimPermutProfile .. "main_hand=" .. table.concat(itemString, ',').. '\n'
    end
	
	--slotId = GetInventorySlotInfo("SecondaryHandSlot")
    itemLink = GetInventoryItemLink('player', INVSLOT_OFFHAND)
	itemString = {}

    -- if we don't have an item link, we don't care
    if itemLink then
		itemString=SimPermut:GetItemString(itemLink,'off_hand',true)
		SimPermutProfile = SimPermutProfile .. "off_hand=" .. table.concat(itemString, ',').. '\n'
    end

	return SimPermutProfile,itemsLinks,StatPool
end

-- generates the string of base + permutations
function SimPermut:GetFinalString(basestring,permutstring)
	return basestring..'\n'..permutstring
end

-- check if table is usefull to simulate (same ring, same trinket)
function SimPermut:CheckUsability(table1,table2)
	local duplicate = true
	local itemString 
	local itemSplit = {}
	local itemIdR111,itemIdR112
	local itemIdT111,itemIdT112
	
	--checking different size
	if #table1~=#table2 then
		return "Different size"
	end
	
	--checking same ring
	if table1[11]==table1[12] then
		return "Same ring "..table1[11]
	end

	
	--checking ring inf
	itemIdR111 = PersoLib:GetIDFromLink(table1[11])
	itemIdR112 = PersoLib:GetIDFromLink(table1[12])
	
	if fingerInf then
		if itemIdR111>itemIdR112 then
			return "Ring copy duplication ("..itemIdR111.."-"..itemIdR112.." /fi: "..tostring(fingerInf)..")"
		end
	else
		if itemIdR111<itemIdR112 then
			return "Ring copy duplication ("..itemIdR111.."-"..itemIdR112.." /fi: "..tostring(fingerInf)..")"
		end
	end
	
	--checking same trinket
	if table1[13]==table1[14] then
		return "Same trinket "..table1[13]
	end
	
	--checking trinket inf
	itemIdT111 = PersoLib:GetIDFromLink(table1[13])
	itemIdT112 = PersoLib:GetIDFromLink(table1[14])
	
	if trinketInf then
		if itemIdT111>itemIdT112 then
			return "Trinket copy duplication ("..itemIdT111.."-"..itemIdT112.." /ti: "..tostring(trinketInf)..") "
		end
	else
		if itemIdT111<itemIdT112 then
			return "Trinket copy duplication ("..itemIdT111.."-"..itemIdT112.." /ti: "..tostring(trinketInf)..")"
		end
	end

	
	--checking Duplicate
	for i=1,#table1 do
		if duplicate then
			if table1[i]~=table2[i] then
				duplicate=false
			end
		end
	end
	
	if duplicate then
		return "Duplicate from base"
	end

	return ""
end

-- get Simc artifact string
function SimPermut:GetArtifactString()
	
	SocketInventoryItem(INVSLOT_MAINHAND)
	local str = artifactTable[artifactID] .. ':0:0:0:0'

	local powers = ArtifactUI.GetPowers()
	for i = 1, #powers do
		local power_id = powers[i]
		local info = ArtifactUI.GetPowerInfo(power_id)
		
		if info.currentRank > 0 and info.currentRank - info.bonusRanks > 0 then
			str = str .. ':' .. power_id .. ':' .. (info.currentRank - info.bonusRanks)
		end
	end
	Clear()
	return str
end

-- check for Tier Sets
function SimPermut:HasTier(stier,tableEquip)
	if HasTierSets[stier][classID] then
      local Count = 0;
      local Item;
      for Slot, ItemID in pairs(HasTierSets[stier][classID]) do
        Item = tonumber(PersoLib:GetIDFromLink(tableEquip[Slot]));
        if Item and Item == ItemID then
          Count = Count + 1;
        end
      end
      return HasTierSets[stier][0](Count);
    else
      return false;
    end
end
