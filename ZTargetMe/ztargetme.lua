local CamState = 0
local Target = false
local NoTar = false
local TLost = false
local OffScreen = false
local Pcheck = true
local SPlate = ""
local SPath = "Interface\\Addons\\ZTargetMe\\Sound"

function ZTMe_Load(self)
	if ZTMeConfig == nil then
		ZTMeConfig = { };
		ZTMeConfig.ModState = 1
	end

	BINDING_HEADER_ZTARGETME = "薩爾達目標提示"
	BINDING_CATEGORY_ZTARGETME = "薩爾達目標提示"

	self:RegisterEvent("PLAYER_ENTERING_WORLD"); 
	self:RegisterEvent("PLAYER_TARGET_CHANGED");
	self:RegisterEvent("NAME_PLATE_CREATED");
	self:RegisterEvent("NAME_PLATE_UNIT_ADDED");
	self:RegisterEvent("NAME_PLATE_UNIT_REMOVED");
	
	SLASH_ZTMe1 = "/ZTMe";
	SlashCmdList["ZTMe"] = ZTMe_Slash;
	ConsoleExec("ActionCam off")
	CamState = 0
end

function ZTarget()
	local tarplate = C_NamePlate.GetNamePlateForUnit("target")
	local PCheck = nil
	local delay = "0"
	
	if tarplate == nil and UnitExists("target") then
		PCheck = PlateCheck(ZTMeConfig.PlateEnable)
	
		if PCheck == true then
			delay = "0.1"
			
			C_Timer.After("0.05", function()
				tarplate = C_NamePlate.GetNamePlateForUnit("target")
			end)
		elseif PCheck == false then
			return
		end
	end
	
	C_Timer.After(delay, function()
		if (CamState == 0) and (ZTMeConfig.ModState == 1) then
			if(UnitExists("target")) and not (UnitIsUnit("target", "player")) and not UnitIsDead("target") then
				if tarplate ~= nil then
					ConsoleExec("ActionCam focusOn")
					CamState = 1
					Reticule(tarplate, event)	
					ZSound()
				elseif tarplate == nil and TLost == true then
					ConsoleExec("ActionCam off")
					CamState = 0
					TLost = false
				elseif (UnitExists("target")) and GetCVar("nameplateShowAll") == "0" and tarplate ~= nil then
					TLost = true
				end
			else
				if (CamState == 0) then
					CameraZoomIn(2)
					ConsoleExec("ActionCam full")
					CamState = 1
					NoTar = true
				
					PlaySoundFile(SPath .. "\\Core\\Core" .. ZTMeConfig.CoreVolume .. "\\centernormal.ogg")
				else
					ConsoleExec("ActionCam off")
					CamState = 0
				end
			end
		else
			ZOff()
		end
	end)
end

function ZOff()
	if CamState ~= 0 or TLost == true then
		Target = false
		ConsoleExec("ActionCam off")
		CamState = 0

		if NoTar == false and not TLost == true then
			PlaySoundFile(SPath .. "\\Core\\Core" .. ZTMeConfig.CoreVolume .. "\\cancel.ogg")
		end

		if NoTar == true then
			CameraZoomOut(2)
			NoTar = false
		end

		Reticule(tarplate, event)
		TLost = false
	end	
end

function ZChange(self, event)
	local tarplate = C_NamePlate.GetNamePlateForUnit("target")

	if event =="PLAYER_TARGET_CHANGED" then 
		if (CamState == 1) or (ZTMeConfig.AutoLock == true and UnitExists("target")) or TLost == true then
			if(UnitExists("target")) and not (UnitIsUnit("target", "player")) and tarplate ~= nil then
				if (ZTMeConfig.ModState == 1) then
					if ZTMeConfig.AutoLock == true then
						ConsoleExec("ActionCam focusOn")
						CamState = 1
					end
					
					Reticule(tarplate, event)
					ZSound()
					
					if NoTar == true then
						CameraZoomOut(2)
						NoTar = false
					end	
				end
			elseif GetCVar("nameplateShowAll") == "0" and (UnitExists("target")) then
				if (ZTMeConfig.ModState == 1) then
					local delay = "0.05"
					if NoTar == true and tarplate ~= nil then
						CameraZoomOut(2)
						NoTar = false
					end	
					
					TLost = true
					
					if tarplate == nil and UnitExists("target") then
						PCheck = PlateCheck(ZTMeConfig.PlateEnable)
					
						if PCheck == true then
							delay = "0.1"
							
							C_Timer.After("0.05", function()
								tarplate = C_NamePlate.GetNamePlateForUnit("target")
							end)
						elseif PCheck == false then
							return
						end
					end
					
					C_Timer.After(delay, function()
						tarplate = C_NamePlate.GetNamePlateForUnit("target")
						
						if tarplate == nil then
							ZOff()
						else
							TLost = false
						end
					end)
										
					return
				end
			else
				ZOff()
			end
		end
	end	
end


-- Textures
local r = CreateFrame('frame', "tarframe", WorldFrame)
	r:SetFrameLevel(0)
	r:SetFrameStrata('BACKGROUND')
	r:SetSize(64, 64)

local ret = r:CreateTexture("Target", "BACKGROUND")
	ret:SetTexture([[Interface\addons\ZTargetMe\target]])
	ret:SetAllPoints(r)
	ret:SetAlpha(1)
	
local ani = ret:CreateAnimationGroup()
local rota = ani:CreateAnimation("Rotation")
	rota:SetDegrees(-360)
	rota:SetDuration(3)
	ani:SetLooping("REPEAT")
	ani:Play()

function ZSound()	
	local calc = ZLevelCalc()

	if UnitIsPlayer("target") then
		if UnitIsPVP("target") and UnitIsEnemy("player", "target") then
			if UnitIsPVP("player") then
				PlaySoundFile(SPath .. "\\Fairies\\Fairies" .. ZTMeConfig.FairyVolume .. "\\" .. ZTMeConfig.Fairy .. "\\WatchOut.ogg")
				PlaySoundFile(SPath .. "\\Core\\Core" .. ZTMeConfig.CoreVolume .. "\\targethostile.ogg")
				ret:SetVertexColor(1, 0, 0)
			else
				PlaySoundFile(SPath .. "\\Fairies\\Fairies" .. ZTMeConfig.FairyVolume .. "\\" .. ZTMeConfig.Fairy .. "\\Hey.ogg")
				PlaySoundFile(SPath .. "\\Core\\Core" .. ZTMeConfig.CoreVolume .. "\\targethostile.ogg")
				ret:SetVertexColor(1, 1, 0)
			end
		else
			if UnitIsPVP("player") then
				PlaySoundFile(SPath .. "\\Fairies\\Fairies" .. ZTMeConfig.FairyVolume .. "\\" .. ZTMeConfig.Fairy .. "\\WatchOut.ogg")
				PlaySoundFile(SPath .. "\\Core\\Core" .. ZTMeConfig.CoreVolume .. "\\targetfriendly.ogg")
				ret:SetVertexColor(0, 1, 0)
			else
				PlaySoundFile(SPath .. "\\Core\\Core" .. ZTMeConfig.CoreVolume .. "\\targetfriendly.ogg")
				ret:SetVertexColor(0, 1, 0)
			end
		end
	else
		if UnitIsEnemy("player", "target") then			
			if calc == "boss" or calc == "red" then
				PlaySoundFile(SPath .. "\\Fairies\\Fairies" .. ZTMeConfig.FairyVolume .. "\\" .. ZTMeConfig.Fairy .. "\\WatchOut.ogg")
				ret:SetVertexColor(1, 0, 0)
			else
				PlaySoundFile(SPath .. "\\Fairies\\Fairies" .. ZTMeConfig.FairyVolume .. "\\" .. ZTMeConfig.Fairy .. "\\Hey.ogg")
				
				if calc == "orange" then
					ret:SetVertexColor(1, 0.5, 0)
				else
					ret:SetVertexColor(1, 1, 0)
				end
			end
			
			PlaySoundFile(SPath .. "\\Core\\Core100\\targethostile.ogg")
		elseif UnitIsFriend("player", "target") then
			PlaySoundFile(SPath .. "\\Core\\Core" .. ZTMeConfig.CoreVolume .. "\\targetfriendly.ogg")
			ret:SetVertexColor(0, 1, 0)
		else
			if calc == "boss" or calc == "red" then
					PlaySoundFile(SPath .. "\\Fairies\\Fairies" .. ZTMeConfig.FairyVolume .. "\\" .. ZTMeConfig.Fairy .. "\\WatchOut.ogg")
				else
					PlaySoundFile(SPath .. "\\Fairies\\Fairies" .. ZTMeConfig.FairyVolume .. "\\" .. ZTMeConfig.Fairy .. "\\Hey.ogg")
			end
				
			ret:SetVertexColor(1, 1, 0)
			PlaySoundFile(SPath .. "\\Core\\Core" .. ZTMeConfig.CoreVolume .. "\\targethostile.ogg")
		end
	end
end

function BossInfo()
	if ZTMeConfig.Journal == true then
		local tarplate = C_NamePlate.GetNamePlateForUnit("target")

		if CamState == 1 and UnitExists("target") and tarplate ~= nil then
			local ins = EJ_GetCurrentInstance()
			local dif = EJ_GetDifficulty()
			local ind = 1
			local boss, desc, encID, secID, lk = ""
			local tarNam = UnitName("target")
			
			-- EncounterJournal_OpenJournal(dif, ins, nil, nil, nil, nil)

			-- repeat
				-- boss, desc, encID, secID, lk = EJ_GetEncounterInfoByIndex(ind, ins)

				-- if boss == nil then
					-- print("Unit has no entry.");
					-- print("DEBUG: Boss:" .. boss .. " EncID: " .. encID .. " ind: " .. ind); -- DEBUG
					-- return
				-- else
					-- ind = (ind + 1)
				-- end
			-- until boss == tarNam

			-- if boss == "" then
				-- return "noboss"
			-- else
				-- local bossID, bname, bdesc, dInfo, icImg = EJ_GetCreatureInfo(ind, encID)

				-- if pcall(EncounterJournal_OpenJournal(dif, ins, encID, secID, bossID, nil)) then
					PlaySoundFile(SPath .. "\\Fairies\\Fairies" .. ZTMeConfig.FairyVolume .. "\\" .. ZTMeConfig.Fairy .. "\\Listen.ogg")
					print("Dungeon Journal not yet implemented!");
					-- return
				-- else
					-- print("Error in Dungeon Journal handling!");
					-- print("DEBUG: Boss:" .. boss .. " EncID: " .. encID .. " ind: " .. ind); -- DEBUG
					-- return
				-- end
			-- end
		end



		-- if CamState == 1 and UnitExists("target") then
		-- -- EJ_GetCurrentInstance() -- for Instance ID
		-- -- EJ_GetEncounterInfoByIndex -- to find encounter info
		-- -- Loop until name matches target name, grab encounter info for journal stuff
		
		
		
		
			-- local difficulty = EJ_GetDifficulty()
			-- local boss, x, server, instance, zone, id, spawn = UnitGUID("target")
			
			-- EncounterJournal_OpenJournal(difficulty, instance, nil, nil, id, nil)

			-- print("This will hopefully give targeted boss info later.");
			-- PlaySoundFile(SPath .. "\\Fairies\\Fairies\\" .. ZTMeConfig.Fairy .. "\\Listen.ogg")
		-- end
	end
end

function ZLevelCalc()
	local TLvl = 0
	local PLvl = UnitLevel("player")
	local LvlDif = 0

	TLvl = UnitLevel("target")
			
	if not (TLvl == -1) then
		LvlDif = (TLvl - PLvl)
	else
		LvlDif = 666
	end
			
	if LvlDif == 666 then 
		return "boss"
	elseif LvlDif >= 5 then	
		return "red"
	elseif LvlDif == 3 or LvlDif == 4 then
		return "orange"
	elseif LvlDif > -3 and LvlDif < 3 then
		return "yellow"
	end 	
end

function Reticule(tarplate, event)
	if CamState == 1 and UnitExists("target") then	
		tarplate = C_NamePlate.GetNamePlateForUnit("target")
		
		if tarplate ~= nil then
			local x, y = tarplate:GetCenter()
				
			r:SetAlpha(1)	
			r:SetPoint("CENTER", tarplate, 0, -60)
		end
	else
		r:SetAlpha(0)
	end
end

-- function zdebug(event) -- To test functions, calls, etc.
	-- if event == "NAME_PLATE_CREATED" then
		-- print("Debug event: " .. event);
	-- elseif event == "NAME_PLATE_UNIT_ADDED" then
		-- print("Debug event: " .. event);
	-- end
-- end

function ZOffScreen(self, event)
	if ZTMeConfig.ModState == 1 then
		if event == "NAME_PLATE_UNIT_REMOVED" and CamState == 1 and NoTar == false then
			C_Timer.After(0.25, function() 
				if TLost == false then
					local tarplate = C_NamePlate.GetNamePlateForUnit("target")
					local done = false
				
					tarplate = C_NamePlate.GetNamePlateForUnit("target")
					
					if done == false then -- keeps the wait from firing more than once
						if UnitExists("target") and tarplate == nil then	
							r:SetAlpha(0)
							Target = false
							ConsoleExec("ActionCam off")
							CamState = 0
							TLost = true
							PlaySoundFile(SPath .. "\\Core\\Core" .. ZTMeConfig.CoreVolume .. "\\cancel.ogg")
						end
						
						done = true
					end
				end
			end)
			
			done = false
		end
	end
end

function ZOnScreen(self, event)
	if ZTMeConfig.ModState == 1 then
		if (CamState == 0 or GetCVar("nameplateShowAll") == "0") and TLost == true and not UnitIsDead("target") then
			if event == "NAME_PLATE_UNIT_ADDED" then
				local tarplate = C_NamePlate.GetNamePlateForUnit("target")
			
				if tarplate ~= nil then
					ConsoleExec("ActionCam focusOn")
					CamState = 1
					Reticule(tarplate, event)	
					ZSound()
					NoTar = false
					TLost = false
				end
			end
		end
	end
end

function ZSet()
	if ZTMeConfig.ModState ~= 0 then
		if GetCVar("nameplateTargetBehindMaxDistance") ~= "0" then
			SetCVar("nameplateTargetBehindMaxDistance", 0)
		end		
		
		if not IsAddOnLoaded("Blizzard_EncounterJournal") and ZTMeConfig.Journal == true then
			LoadAddOn("Blizzard_EncounterJournal")
		end
	end
end

function PlateCheck(enable)
	if UnitExists("target") and not UnitIsUnit("target", "player") then
		if UnitIsEnemy("player", "target") or UnitCanAttack("player", "target") then
			if GetCVar("nameplateShowEnemies") == "0" then
				if enable then
					print("Enabling enemy nameplates.")
					SetCVar("nameplateShowEnemies", "1")				
					return true
				else
					if ZTMeConfig.AutoLock == false then 
						RaidNotice_AddMessage(RaidWarningFrame, "Enemy nameplates are not enabled!", ChatTypeInfo["RAID_WARNING"])
						PlaySoundFile(SPath .. "\\Core\\Core" .. ZTMeConfig.CoreVolume .. "\\error.ogg")
					end
					
					return false
				end
			else
				return
			end
		else
			if GetCVar("nameplateShowFriends") == "0" then
				if enable then
					print("Enabling friendly nameplates.")
					SetCVar("nameplateShowFriends", "1")					
					return true
				else
					if ZTMeConfig.AutoLock == false then 
						RaidNotice_AddMessage(RaidWarningFrame, "Friendly nameplates are not enabled!", ChatTypeInfo["RAID_WARNING"])
						PlaySoundFile(SPath .. "\\Core\\Core" .. ZTMeConfig.CoreVolume .. "\\error.ogg")	
					end
					
					return false
				end
			else
				return
			end
		end
	end
end

function ZTMe_Slash(cmd)
	if strlower(cmd) == "" then
		InterfaceOptionsFrame_OpenToCategory("目標提示"); --fires twice because it likes to be stupid
		InterfaceOptionsFrame_OpenToCategory("目標提示");

	elseif strlower(cmd) == "help" then
		print("Z-Target Me! Commands:");
		print("'/ZTMe' for options.");
		print("'/ZTMe on' or '/ZTMe off' for addon (de)activation.");		
		
	elseif strlower(cmd) == "on" then
		if (ZTMeConfig.ModState == 1) then
			print("Z-Targeting is already enabled.");
			PlaySoundFile(SPath .. "\\Fairies\\Fairies" .. ZTMeConfig.FairyVolume .. "\\" .. ZTMeConfig.Fairy .. "\\Hey.ogg")
		else
			ZTMeConfig.ModState = 1
			print("Z-Targeting enabled.");
			PlaySoundFile(SPath .. "\\Fairies\\Fairies" .. ZTMeConfig.FairyVolume .. "\\" .. ZTMeConfig.Fairy .. "\\Out.ogg")
		end
		
	elseif strlower(cmd) == "off" then
		if (ZTMeConfig.ModState == 0) then
			print("Z-Targeting is already disabled.");
			PlaySoundFile(SPath .. "\\Fairies\\Fairies" .. ZTMeConfig.FairyVolume .. "\\" .. ZTMeConfig.Fairy .. "\\Hey.ogg")
		else
			ZTMeConfig.ModState = 0
			
			if CamState ~= 0 then				
				ZOff()
			end
			
			if GetCVar("nameplateTargetBehindMaxDistance") == "0" then
				SetCVar("nameplateTargetBehindMaxDistance", 15)
			end
			
			print("Z-Targeting disabled.");
			PlaySoundFile(SPath .. "\\Fairies\\Fairies" .. ZTMeConfig.FairyVolume .. "\\" .. ZTMeConfig.Fairy .. "\\Away.ogg")
		end
		
	elseif strlower(cmd) == "fairy off" or strlower(cmd) == "fairy none" then
		PlaySoundFile(SPath .. "\\Fairies\\Fairies" .. ZTMeConfig.FairyVolume .. "\\" .. ZTMeConfig.Fairy .. "\\Away.ogg")
		ZTMeConfig.FairyVolume = "0"
		print("Fairy set to Silent.");
		
	elseif strlower(cmd) == "fairy shut up" or strlower(cmd) == "fairy shutup" or strlower(cmd) == "fairy fuck off" or strlower(cmd) == "fairy fuckoff" then
		PlaySoundFile(SPath .. "\\Fairies\\Fairies" .. ZTMeConfig.FairyVolume .. "\\" .. ZTMeConfig.Fairy .. "\\Sad.ogg")
		PlaySoundFile(SPath .. "\\Fairies\\Fairies" .. ZTMeConfig.FairyVolume .. "\\Bonk.ogg")
		ZTMeConfig.Fairy = "None"
		print("Fairy set to Silent... jerk.");
		
	elseif strlower(cmd) == "fairy navi" then
		ZTMeConfig.Fairy = "Navi"
		print("Fairy set to Navi.");
		PlaySoundFile(SPath .. "\\Fairies\\Fairies" .. ZTMeConfig.FairyVolume .. "\\" .. ZTMeConfig.Fairy .. "\\Hello.ogg")
	
	elseif strlower(cmd) == "fairy tatl" then
		ZTMeConfig.Fairy = "Tatl"
		print("Fairy set to Tatl.");
		PlaySoundFile(SPath .. "\\Fairies\\Fairies" .. ZTMeConfig.FairyVolume .. "\\" .. ZTMeConfig.Fairy .. "\\Hello.ogg")

	elseif strlower(cmd) == "auto on" then
		if ZTMeConfig.AutoLock == true then
			print("Auto-target is already enabled.");
			PlaySoundFile(SPath .. "\\Fairies\\Fairies" .. ZTMeConfig.FairyVolume .. "\\" .. ZTMeConfig.Fairy .. "\\Hey.ogg")
		else
			ZTMeConfig.AutoLock = true
			print("Auto-target enabled.");
			PlaySoundFile(SPath .. "\\Fairies\\Fairies" .. ZTMeConfig.FairyVolume .. "\\" .. ZTMeConfig.Fairy .. "\\Listen.ogg")
		end			

	elseif strlower(cmd) == "auto off" then
		if ZTMeConfig.AutoLock == false then
			print("Auto-target is already disabled.");
			PlaySoundFile(SPath .. "\\Fairies\\Fairies" .. ZTMeConfig.FairyVolume .. "\\" .. ZTMeConfig.Fairy .. "\\Hey.ogg")
		else
			ZTMeConfig.AutoLock = false
			print("Auto-target disabled.");
			PlaySoundFile(SPath .. "\\Fairies\\Fairies" .. ZTMeConfig.FairyVolume .. "\\" .. ZTMeConfig.Fairy .. "\\Listen.ogg")
		end
	end		
end