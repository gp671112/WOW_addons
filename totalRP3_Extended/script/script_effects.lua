----------------------------------------------------------------------------------
-- Total RP 3
-- Scripts : Effects
--	---------------------------------------------------------------------------
--	Copyright 2015 Sylvain Cossement (telkostrasz@telkostrasz.be)
--
--	Licensed under the Apache License, Version 2.0 (the "License");
--	you may not use this file except in compliance with the License.
--	You may obtain a copy of the License at
--
--		http://www.apache.org/licenses/LICENSE-2.0
--
--	Unless required by applicable law or agreed to in writing, software
--	distributed under the License is distributed on an "AS IS" BASIS,
--	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
--	See the License for the specific language governing permissions and
--	limitations under the License.
----------------------------------------------------------------------------------

local assert, type, tostring, error, tonumber, pairs, unpack, wipe = assert, type, tostring, error, tonumber, pairs, unpack, wipe;
local loc = TRP3_API.locale.getText;

--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
-- NPC speech
--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

local SPEECH_PREFIX = {
	SAYS = "/s",
	YELLS = "/y",
	WHISPERS = "/w",
	EMOTES = "/e"
}
TRP3_API.ui.misc.SPEECH_PREFIX = SPEECH_PREFIX;

local SPEECH_CHANNEL = {
	[SPEECH_PREFIX.SAYS] = "SAY",
	[SPEECH_PREFIX.YELLS] = "YELL",
	[SPEECH_PREFIX.EMOTES] = "EMOTE",
}

local function getSpeechPrefixText(speechPrefix, npcName, text)
	if speechPrefix == SPEECH_PREFIX.SAYS then
		return ("%s %s: %s"):format(npcName, loc("NPC_SAYS"), text);
	elseif speechPrefix == SPEECH_PREFIX.YELLS then
		return ("%s %s: %s"):format(npcName, loc("NPC_YELLS"), text);
	elseif speechPrefix == SPEECH_PREFIX.WHISPERS then
		return ("%s %s: %s"):format(npcName, loc("NPC_WHISPERS"), text);
	elseif speechPrefix == SPEECH_PREFIX.EMOTES then
		return ("%s %s"):format(npcName, text);
	end
	return "(error in getSpeechPrefixText: " .. tostring(speechPrefix) .. ")";
end
TRP3_API.ui.misc.getSpeechPrefixText = getSpeechPrefixText;

local function getSpeechChannel(speechPrefix)
	return SPEECH_CHANNEL[speechPrefix or SPEECH_PREFIX.SAYS] or "SAY";
end

local function getSpeech(text, speechPrefix)
	return getSpeechPrefixText(speechPrefix, UnitName("player"), text);
end
TRP3_API.ui.misc.getSpeech = getSpeech;

--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
-- Effetc structure
--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

local security = TRP3_API.security.SECURITY_LEVEL;

local EFFECTS = {

	["MISSING"] = {
		method = function(structure, args, eArgs)
			TRP3_API.utils.message.displayMessage("|cffff0000" .. loc("SCRIPT_UNKNOWN_EFFECT"), 1);
			eArgs.LAST = 0;
		end,
		secured = security.HIGH,
	},

	-- Graphic
	["text"] = {
		getCArgs = function(args)
			local text = args[1] or "";
			local type = tonumber(args[2]) or 1;
			return text, type;
		end,
		method = function(structure, args, eArgs)
			local text, type = structure.getCArgs(args);
			TRP3_API.utils.message.displayMessage(TRP3_API.script.parseArgs(text, eArgs), type);
			eArgs.LAST = 0;
		end,
		secured = security.HIGH,
	},

	-- Speech
	["speech_env"] = {
		method = function(structure, cArgs, eArgs)
			local text = cArgs[1] or "";
			SendChatMessage(TRP3_API.script.parseArgs("|| " .. text, eArgs), 'EMOTE');
			eArgs.LAST = 0;
		end,
		securedMethod = function(structure, cArgs, eArgs)
			local text = cArgs[1] or "";
			TRP3_API.utils.message.displayMessage(TRP3_API.script.parseArgs(text, eArgs), 1);
			eArgs.LAST = 0;
		end,
		secured = security.LOW,
	},
	["speech_npc"] = {
		getCArgs = function(args)
			local name = args[1] or "";
			local type = args[2] or TRP3_API.ui.misc.SPEECH_PREFIX.SAYS;
			local text = args[3] or "";
			return name, type, text;
		end,
		method = function(structure, cArgs, eArgs)
			local name, type, text = structure.getCArgs(cArgs);
			SendChatMessage(TRP3_API.script.parseArgs("|| " .. getSpeechPrefixText(type, name, text), eArgs), 'EMOTE');
			eArgs.LAST = 0;
		end,
		securedMethod = function(structure, cArgs, eArgs)
			local name, type, text = structure.getCArgs(cArgs);
			TRP3_API.utils.message.displayMessage(TRP3_API.script.parseArgs(getSpeechPrefixText(type, name, text), eArgs), 1);
			eArgs.LAST = 0;
		end,
		secured = security.LOW,
	},
	["speech_player"] = {
		getCArgs = function(args)
			local channel = args[1] or TRP3_API.ui.misc.SPEECH_PREFIX.SAYS;
			local text = args[2] or "";
			return channel, text;
		end,
		method = function(structure, cArgs, eArgs)
			local channel, text = structure.getCArgs(cArgs);
			SendChatMessage(TRP3_API.script.parseArgs(text, eArgs), getSpeechChannel(channel));
			eArgs.LAST = 0;
		end,
		securedMethod = function(structure, cArgs, eArgs)
			local prefix, text = structure.getCArgs(cArgs);
			TRP3_API.utils.message.displayMessage(TRP3_API.script.parseArgs(getSpeech(text, prefix), eArgs), 1);
			eArgs.LAST = 0;
		end,
		secured = security.LOW,
	},

	-- Expert
	["var_object"] = {
		getCArgs = function(args)
			local source = args[1] or "w";
			local operationType = args[2] or "i";
			local varName = args[3] or "var";
			local varValue = args[4] or "0";
			return source, operationType, varName, varValue;
		end,
		method = function(structure, cArgs, eArgs)
			local source, operationType, varName, varValue = structure.getCArgs(cArgs);
			TRP3_API.script.setVar(eArgs, source, operationType, varName, TRP3_API.script.parseArgs(varValue, eArgs));
			eArgs.LAST = 0;
		end,
		secured = security.HIGH,
	},

	["var_operand"] = {
		getCArgs = function(args)
			local varName = args[1] or "var";
			local source = args[2] or "w";
			local operandID = args[3] or "random";
			local operandArgs = args[4];
			local operand = TRP3_API.script.getOperand(operandID);
			local code = "";
			if operand and operand.codeReplacement then
				code = operand.codeReplacement(operandArgs);
			end
			return source, varName, code, operand;
		end,
		method = function(structure, cArgs, eArgs)
			local source, varName, code, operand = structure.getCArgs(cArgs);
			code = "return function(args)\nreturn " .. code .. ";\nend;";
			-- Generating factory
			local func, errorMessage = loadstring(code, "Generated operand code");
			if not func then
				print(errorMessage);
				return nil, code;
			end
			TRP3_API.script.setVar(eArgs, source, "=", varName, func()(eArgs)); -- Use operand method
			eArgs.LAST = 0;
		end,
		secured = security.HIGH,
	},

	["signal_send"] = {
		getCArgs = function(args)
			local varName = args[1] or "";
			local varValue = args[2] or "";
			return varName, varValue;
		end,
		method = function(structure, cArgs, eArgs)
			local varName, varValue = structure.getCArgs(cArgs);
			TRP3_API.extended.sendSignal(varName, TRP3_API.script.parseArgs(varValue, eArgs));
			eArgs.LAST = 0;
		end,
		secured = security.HIGH,
	},

	["run_workflow"] = {
		getCArgs = function(args)
			local source = args[1] or "o";
			local id = args[2] or "";
			return source, id;
		end,
		method = function(structure, cArgs, eArgs)
			local varName, varValue = structure.getCArgs(cArgs);
			TRP3_API.script.runWorkflow(eArgs, varName, varValue);
			eArgs.LAST = 0;
		end,
		secured = security.HIGH,
	},

	-- Sounds
	["sound_id_self"] = {
		getCArgs = function(args)
			local soundID = tonumber(args[2] or 0);
			local channel = args[1] or "SFX";
			local source = "Script"; -- TODO: get source
			return soundID, channel, source;
		end,
		method = function(structure, cArgs, eArgs)
			local soundID, channel, source = structure.getCArgs(cArgs);
			eArgs.LAST = TRP3_API.utils.music.playSoundID(soundID, channel, source);
		end,
		secured = security.HIGH,
	},

	["sound_music_self"] = {
		method = function(structure, cArgs, eArgs)
			local path = cArgs[1] or "";
			print(path);
			eArgs.LAST = TRP3_API.utils.music.playMusic(path);
		end,
		secured = security.HIGH,
	},

	["sound_music_stop"] = {
		method = function(structure, cArgs, eArgs)
			TRP3_API.utils.music.stopMusic();
			eArgs.LAST = 0;
		end,
		secured = security.HIGH,
	},

	["sound_id_local"] = {
		getCArgs = function(args)
			local soundID = tonumber(args[2] or 0);
			local channel = args[1] or "SFX";
			local distance = tonumber(args[3] or 0);
			local source = "Script"; -- TODO: get source
			return soundID, channel, distance, source;
		end,
		method = function(structure, cArgs, eArgs)
			local soundID, channel, distance, source = structure.getCArgs(cArgs);
			eArgs.LAST = TRP3_API.utils.music.playLocalSoundID(soundID, channel, distance, source);
		end,
		securedMethod = function(structure, cArgs, eArgs)
			local soundID, channel, _, source = structure.getCArgs(cArgs);
			eArgs.LAST = TRP3_API.utils.music.playSoundID(soundID, channel, source);
		end,
		secured = security.MEDIUM,
	},

	["sound_music_local"] = {
		getCArgs = function(args)
			local musicPath = args[1] or "";
			local distance = tonumber(args[2] or 0);
			local source = "Script"; -- TODO: get source
			return musicPath, distance, source;
		end,
		method = function(structure, cArgs, eArgs)
			local musicPath, distance, source = structure.getCArgs(cArgs);
			eArgs.LAST = TRP3_API.utils.music.playLocalMusic(musicPath, distance, source);
		end,
		securedMethod = function(structure, cArgs, eArgs)
			local musicPath = structure.getCArgs(cArgs);
			eArgs.LAST = TRP3_API.utils.music.playMusic(musicPath);
		end,
		secured = security.MEDIUM,
	},

	-- Companions
	["companion_dismiss_mount"] = {
		method = function(structure, cArgs, eArgs)
			DismissCompanion("MOUNT");
			eArgs.LAST = 0;
		end,
		securedMethod = function(structure, cArgs, eArgs)
			eArgs.LAST = 0;
		end,
		secured = security.MEDIUM,
	},

	["companion_dismiss_critter"] = {
		method = function(structure, cArgs, eArgs)
			if C_PetJournal.GetSummonedPetGUID() then
				C_PetJournal.SummonPetByGUID(C_PetJournal.GetSummonedPetGUID());
			end
			eArgs.LAST = 0;
		end,
		secured = security.HIGH,
	},

	["companion_random_critter"] = {
		method = function(structure, cArgs, eArgs)
			C_PetJournal.SummonRandomPet();
			eArgs.LAST = 0;
		end,
		secured = security.HIGH,
	},

	["companion_summon_mount"] = {
		method = function(structure, cArgs, eArgs)
			local mountId = tonumber(cArgs[1] or 0);
			SummonByID(mountId);
			eArgs.LAST = 0;
		end,
		securedMethod = function(structure, cArgs, eArgs)
			eArgs.LAST = 0;
		end,
		secured = security.MEDIUM,
	},

	-- Camera effects
	["cam_zoom_in"] = {
		method = function(structure, cArgs, eArgs)
			local distance = cArgs[1] or "0";
			CameraZoomIn(tonumber(TRP3_API.script.parseArgs(distance, eArgs)) or 0);
			eArgs.LAST = 0;
		end,
		secured = security.HIGH,
	},
	["cam_zoom_out"] = {
		method = function(structure, cArgs, eArgs)
			local distance = cArgs[1] or "0";
			CameraZoomOut(tonumber(TRP3_API.script.parseArgs(distance, eArgs)) or 0);
			eArgs.LAST = 0;
		end,
		secured = security.HIGH,
	},
	["cam_save"] = {
		method = function(structure, cArgs, eArgs)
			local slot = tonumber(cArgs[1]) or 1;
			SaveView(slot);
			eArgs.LAST = 0;
		end,
		secured = security.HIGH,
	},
	["cam_load"] = {
		method = function(structure, cArgs, eArgs)
			local slot = tonumber(cArgs[1]) or 1;
			SetView(slot);
			eArgs.LAST = 0;
		end,
		secured = security.HIGH,
	},

	-- SCRIPT
	["script"] = {
		method = function(structure, cArgs, eArgs)
			local value = tostring(cArgs[1]);
			TRP3_API.script.runLuaScriptEffect(value, eArgs, false);
			eArgs.LAST = 0;
		end,
		securedMethod = function(structure, cArgs, eArgs)
			local value = tostring(cArgs[1]);
			TRP3_API.script.runLuaScriptEffect(value, eArgs, true);
			eArgs.LAST = 0;
		end,
		secured = security.LOW,
	},
}


--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
-- Logic
--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

local function registerEffect(effectID, effect)
	assert(type(effect) == "table" and effectID, "Effect must have an id.");
	assert(not EFFECTS[effectID], "Already registered effect id: " .. effectID);
	EFFECTS[effectID] = effect;
end
TRP3_API.script.registerEffect = registerEffect;

TRP3_API.script.registerEffects = function(effects)
	for effectID, effect in pairs(effects) do
		registerEffect(effectID, effect);
	end
end

TRP3_API.script.getEffect = function(effectID)
	return EFFECTS[effectID];
end
