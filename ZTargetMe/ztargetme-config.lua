local panel = CreateFrame("FRAME")
panel.name = "目標提示"
local SPath = "Interface\\Addons\\ZTargetMe\\Sound"
local mstate = ""

local ZTMeFairy = {
	"Navi",
	"Tatl",
	"Midna",
	"無"
	}
	
local FairyV = {
	"100",
	"75",
	"50",
	"25",
	"Off"
	}
	
local CoreV = {
	"100",
	"75",
	"50",
	"25",
	"Off"
	}
	
function ZTMe_Panel_Close()
	if ZTMe_GUIFrame_ZTMe:GetChecked() == true then
		mstate = "On"
		ZTMeConfig.ModState = 1
	else
		mstate = "Off"
		ZTMeConfig.ModState = 0
	end
		
	ZTMeConfig.Fairy = UIDropDownMenu_GetText(ZTMe_FairyDropDown);
	ZTMeConfig.CoreVolume = VolConvert(ZTMe_GUIFrame_CoreVolSlider:GetValue());
	ZTMeConfig.FairyVolume = VolConvert(ZTMe_GUIFrame_FairyVolSlider:GetValue());
	ZTMeConfig.AutoLock = ZTMe_GUIFrame_AutoLock:GetChecked();
	ZTMeConfig.PlateEnable = ZTMe_GUIFrame_PlateEnable:GetChecked();
	-- ZTMeConfig.DunJo = ZTMe_GUIFrame_AutoLock:GetChecked();
	ZTMe_GUIFrame_DunJo:SetChecked(false); -- NYI
end

function ZTMe_Panel_Cancel()
	if ZTMeConfig.ModState == 1 then
		ZTMe_GUIFrame_ZTMe:SetChecked(true)
		mstate = "On"
	else
		ZTMe_GUIFrame_ZTMe:SetChecked(false)
		mstate = "Off"
	end
	
	ZTMe_GUIFrame_ZTMe:SetChecked(ZTMeConfig.ModState);
	UIDropDownMenu_SetText(ZTMe_FairyDropDown, ZTMeConfig.Fairy);
	ZTMe_GUIFrame_CoreVolSlider:SetValue(VolConvert(ZTMeConfig.CoreVolume, true))
	ZTMe_GUIFrame_FairyVolSlider:SetValue(VolConvert(ZTMeConfig.FairyVolume, true))
	ZTMe_GUIFrame_AutoLock:SetChecked(ZTMeConfig.AutoLock);
	ZTMe_GUIFrame_PlateEnable:SetChecked(ZTMeConfig.PlateEnable);
	-- ZTMe_GUIFrame_DunJo:SetChecked(ZTMeConfig.Journal);
	ZTMe_GUIFrame_DunJo:SetChecked(false); -- NYI
end

function ZTMe_Panel_OnLoad(panel)
	ZTMe_GUIFrame_Play:SetText("測試");
	ZTMe_GUIFrame_CVPlay:SetText("測試");
	ZTMe_GUIFrame_FVPlay:SetText("測試");
	ZTMe_GUIFrame_AutoLockText:SetText("  自動對焦: 自動對焦到選取的目標，並且顯示三角箭頭提示。");
	ZTMe_GUIFrame_DunJoText:SetText("  地城冒險日誌連結: 即將推出™!");	
	ZTMe_GUIFrame_ZTMeText:SetText("  啟用目標提示")
	ZTMe_GUIFrame_PlateEnableText:SetText("  自動對焦時自動開啟血條")
	panel.name = "目標提示";
	panel.okay = function (self) ZTMe_Panel_Close(); end;
	panel.cancel = function (self)  ZTMe_Panel_Cancel();  end;
	InterfaceOptions_AddCategory(panel);
end

function CoreVolSlider_OnClick()
	local voltemp = ZTMe_GUIFrame_CoreVolSlider:GetValue();
	math.floor(voltemp + 0.5)	
	ZTMe_GUIFrame_CoreVolSlider:SetValue(voltemp);
end

function FairyVolSlider_OnClick()
	local voltemp = ZTMe_GUIFrame_FairyVolSlider:GetValue();
	math.floor(voltemp + 0.5)	
	ZTMe_GUIFrame_FairyVolSlider:SetValue(voltemp);
end
 
function VolConvert(int, rev)
	if not rev then
		if int == 0 then
			return "Off";
		elseif int == 1 then
			return "25";
		elseif int == 2 then
			return "50";
		elseif int == 3 then
			return "75";
		elseif int == 4 then
			return "100";
		end
	else
		if int == "100" then
			return 4;
		elseif int == "75" then
			return 3;
		elseif int == "50" then
			return 2;
		elseif int == "25" then
			return 1;
		elseif int == "Off" then
			return 0;
		end
	end
end

function ZTMe_Config_OnInit()
	if (ZTMeConfig == nil) then
        ZTMeConfig = { };
		ZTMeConfig.ModState = 1
        ZTMeConfig.Fairy = "Navi";
		ZTMeConfig.CoreVolume = "100";
		ZTMeConfig.FairyVolume = "100";
		ZTMeConfig.AutoLock = false;
		ZTMeConfig.PlateEnable = false;
		ZTMeConfig.Journal = false;		
    end;
	
	if (ZTMeConfig.ModState == nil) then
        ZTMeConfig.ModState = 1;
		onoff = "on"
    end;

    if (ZTMeConfig.Fairy == nil) then
        ZTMeConfig.Fairy = "Navi";
    end;

	if (ZTMeConfig.CoreVolume == nil) then
        ZTMeConfig.CoreVolume = "100";
    end;
	
    if (ZTMeConfig.FairyVolume == nil) then
        ZTMeConfig.FairyVolume = "100";
    end;

	if (ZTMeConfig.AutoLock == nil) then
        ZTMeConfig.AutoLock = true;
    end;	
	
	if (ZTMeConfig.PlateEnable == nil) then
        ZTMeConfig.PlateEnable = true;
    end;	
	
	if (ZTMeConfig.Journal == nil) then
        ZTMeConfig.Journal = false;
    end;	
		
	CreateFrame("Frame", "ZTMe_FairyDropDown", ZTMe_GUIFrame, "UIDropDownMenuTemplate");

	UIDropDownMenu_Initialize(ZTMe_FairyDropDown, ZTMe_FairyDropDown_Init);

    UIDropDownMenu_JustifyText(ZTMe_FairyDropDown, "LEFT");
	UIDropDownMenu_SetWidth(ZTMe_FairyDropDown, 120);
	UIDropDownMenu_SetText(ZTMe_FairyDropDown, ZTMeConfig.Fairy);
	
	if ZTMeConfig.ModState == 1 then
		mstate = "on"
	else
		mstate = "off"
	end

	-- print("Z-Target Me loaded! Z-Targeting is currently " .. mstate .. ". Type '/ZTMe help' for commands.");
	
	if ZTMe_Init then
		ConsoleExec("ActionCam focusOn")
		ConsoleExec("ActionCam off")
		return
	else	
		ZTMeWelcome()
		ZTMe_Init = true
	end
end

function ZTMe_FairyDropDown_Init(self)
	local ddtext = UIDropDownMenu_GetText(ZTMe_FairyDropDown);
	local info = UIDropDownMenu_CreateInfo();
	for index, filename in ipairs(ZTMeFairy) do
		info.text = filename;
		info.isNotRadio = true;
		info.checked = (filename == ddtext);
		
		info.func = function (self)
			UIDropDownMenu_SetText(ZTMe_FairyDropDown, self:GetText());
		end

		UIDropDownMenu_AddButton(info);
	end
end

function ZTMe_CoreVolDropDown_Init(self)
	local ddtext = UIDropDownMenu_GetText(ZTMe_CoreVolDropDown);
	local info = UIDropDownMenu_CreateInfo();
	for index, filename in ipairs(CoreV) do
		info.text = filename;
		info.isNotRadio = true;
		info.checked = (filename == ddtext);
		
		info.func = function (self)
			UIDropDownMenu_SetText(ZTMe_CoreVolDropDown, self:GetText());
		end

		UIDropDownMenu_AddButton(info);
	end
end

function ZTMe_FairyVolDropDown_Init(self)
	local ddtext = UIDropDownMenu_GetText(ZTMe_FairyVolDropDown);
	local info = UIDropDownMenu_CreateInfo();
	for index, filename in ipairs(FairyV) do
		info.text = filename;
		info.isNotRadio = true;
		info.checked = (filename == ddtext);
		
		info.func = function (self)
			UIDropDownMenu_SetText(ZTMe_FairyVolDropDown, self:GetText());
		end

		UIDropDownMenu_AddButton(info);
	end
end

function ZTMe_Config_OnLoad(frame)
    frame:RegisterEvent("PLAYER_LOGIN");
end

function WorldEnter(frame, event, arg1, ...)    
    if (event == "PLAYER_LOGIN") then
        ZTMe_Config_OnInit();
        ZTMe_Panel_Cancel();

        Load_Time = GetTime();
    end;
end

function FairyTest(Test)
    PlaySoundFile(SPath .. "\\Fairies\\Fairies" .. ZTMeConfig.FairyVolume .. "\\" .. Test .. "\\Hey.ogg");
end

function CoreVTest(Test)
    PlaySoundFile(SPath .. "\\Core\\Core" .. Test .. "\\targetfriendly.ogg")
end

function FairyVTest(Test, Comp)
	if Comp == "無" then
		Comp = "Navi"
	end

    PlaySoundFile(SPath .. "\\Fairies\\Fairies" .. Test .. "\\" .. Comp .. "\\Hey.ogg");
end

function OptionsOpen()
	InterfaceOptionsFrame_OpenToCategory("目標提示"); --fires twice because it likes to be stupid
	InterfaceOptionsFrame_OpenToCategory("目標提示");
end

function AutoTarget()
	if ZTMeConfig.AutoLock == false then
		ZTMeConfig.AutoLock = true
		print("自動對焦目標已啟用。");
		ZTMe_GUIFrame_AutoLock:SetChecked(ZTMeConfig.AutoLock);
		PlaySoundFile(SPath .. "\\Fairies\\Fairies" .. ZTMeConfig.FairyVolume .. "\\" .. ZTMeConfig.Fairy .. "\\Listen.ogg")	
	else
		ZTMeConfig.AutoLock = false
		print("自動對焦目標已停用。");
		ZTMe_GUIFrame_AutoLock:SetChecked(ZTMeConfig.AutoLock);
		PlaySoundFile(SPath .. "\\Fairies\\Fairies" .. ZTMeConfig.FairyVolume .. "\\" .. ZTMeConfig.Fairy .. "\\Listen.ogg")
	end
end

function ZTMeWelcome()
	local welcometext = "歡迎使用薩爾達目標提示 Z-Target Me! \n \n 這個插件會使用動感鏡頭來模擬薩爾達傳說的選取目標提示功能! \n\n" ..
						"預設會自動對焦到選取的目標，也可以使用你喜愛的快速鍵開啟/關閉自動對焦。 \n" ..
						"從遊戲主選單的按鍵設定來設定快速鍵。 \n \n" ..
						"現在是否要先看看薩爾達目標提示的設定選項呢? "
						
	PlaySoundFile(SPath .. "\\Fairies\\Fairies100\\\Navi\\Hello.ogg")

	StaticPopupDialogs["ZTMeWelcome"] = {
		text = welcometext,
		button1 = "是",
		button2 = "否",
		OnAccept = function()
			InterfaceOptionsFrame_OpenToCategory("目標提示");
			InterfaceOptionsFrame_OpenToCategory("目標提示");
			ConsoleExec("ActionCam focusOn")
			ConsoleExec("ActionCam off")
			end,
		OnCancel = function()
			StaticPopup_Show("ZTMeWelcome2")
			end,
		timeout = 0,
		whileDead = true,
		hideOnEscape = true,
		preferredIndex = 3,
	}
	
	StaticPopupDialogs["ZTMeWelcome2"] = {
		text = "選項將會恢復為預設值。任何時候都可以從 Esc>介面>插件>目標提示，調整設定。",
		button1 = "Okay",
		OnAccept = function()
			ConsoleExec("ActionCam focusOn")
			ConsoleExec("ActionCam off")
			end,
		timeout = 0,
		whileDead = true,
		hideOnEscape = true,
		preferredIndex = 3,
	}
	
	StaticPopup_Show("ZTMeWelcome")
end