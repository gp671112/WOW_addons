--
-- Class Mods - default settings
--

local L = LibStub("AceLocale-3.0"):GetLocale("ClassMods")

ClassMods.myAddonName = select(1, ...)
ClassMods.myVersion = GetAddOnMetadata( ..., "Version" ):match( "^([aAbBvVrR%d.]+)" )
ClassMods.myVersionRaw = GetAddOnMetadata( ..., "Version" )
ClassMods.myRevision = 0 -- Needed for database upgrades
ClassMods.wowBuild = tonumber(select(4, GetBuildInfo() ), 10)
ClassMods.playerClass = select(2, UnitClass("player"))

ClassMods.timerPositions = {
	["TOP"]			= L["TOP"],
	["CENTER"]	= L["CENTER"],
	["BOTTOM"]	= L["BOTTOM"],
	["LEFT"]		= L["LEFT"],
	["RIGHT"]		= L["RIGHT"],
}

ClassMods.stationaryTimerAnchors = {
	["FORWARD"]	= L["LEFT/BOTTOM"],
	["CENTER"]		= L["CENTER"],
	["REVERSE"]		= L["RIGHT/TOP"],
}

ClassMods.chatChannels = {
	["AUTO"]					= L["Automatic"],
	["RAID"]					= L["Raid"],
	["YELL"]					= L["Yell"],
	["OFFICER"]				= L["Officer"],
	["GUILD"]					= L["Guild"],
	["BATTLEGROUND"]	= L["Battleground"],
	["PARTY"]					= L["Party"],
	["EMOTE"]					= L["Emote"],
	["SAY"]						= L["Say"],
	["SELFWHISPER"]		= L["Self Whisper"],
	["NONE"]					= L["No Announce"],
}

ClassMods.timerOwners = {
	["PLAYERS"]	= L["Yours"],
	["ANY"]			= L["Any"],
}

ClassMods.whenToShow = {
	[0] = L["Always"],
	[1] = L["Active"],
}

ClassMods.alertTypes = {
	["BUFF"]			= L["Buff"],
	["DEBUFF"]		= L["Debuff"],
	["CAST"]			= L["Spell Cast Start"],
	["HEALTH"]		= L["Player Health"],
	["PETHEALTH"]	= L["Pet Health"],
}

ClassMods.indicatorTypes = {
	["BUFF"]			= L["Buff"],
	["DEBUFF"]		= L["Debuff"],
}

ClassMods.targets = {
	["target"]		= L["Target"],
	["player"]		= L["Player"],
	["pet"]			= L["Pet"],
	["focus"]		= L["Focus"],
	["boss"]		= L["Any Boss"],
	["boss1"]		= L["Boss 1"],
	["boss2"]		= L["Boss 2"],
	["boss3"]		= L["Boss 3"],
	["boss4"]		= L["Boss 4"],
	["arena"]		= L["Any Arena Enemy"],
	["arena1"]		= L["Arena Enemy 1"],
	["arena2"]		= L["Arena Enemy 2"],
	["arena3"]		= L["Arena Enemy 3"],
	["arena4"]		= L["Arena Enemy 4"],
	["arena5"]		= L["Arena Enemy 5"],
	["party"]		= L["Any Party Member"],
	["partypet"]	= L["Any Party Pet"],
	["raid"]			= L["Any Raid Member"],
	["raidpet"]		= L["Any Raid Pet"],
	["vehicle"]		= L["Vehicle"],
}

-- This is a workaround for spells that have a duration but can not be tracked via UnitAura etc.
ClassMods.spellTracker = CreateFrame("Frame", "CLASSMODS_DURATIONTRACKER")
ClassMods.spellTracker.spells = ClassMods.spellTrackerSpells
ClassMods.spellTracker:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
ClassMods.spellTracker:RegisterEvent("UNIT_INVENTORY_CHANGED")
ClassMods.spellTracker:SetScript("OnEvent",
	function(self, event, ...)
		if (event == "COMBAT_LOG_EVENT_UNFILTERED") then
			local timeStamp, subEvent, hideCaster, sourceGUID, sourceName, sourceFlags,
				sourceFlags2, destGUID, destName, destFlags, destFlags2, spellId, spellName,
				spellSchool, extraSpellID, extraSpellName, extraSchool, auraType = ...
			if (sourceGUID == UnitGUID("player")) and (subEvent == "SPELL_CAST_SUCCESS") then
				if (ClassMods.spellTracker.spells[tostring(spellId)]) then
					ClassMods.spellTracker.spells[tostring(spellId)][1] = (destGUID and tonumber(destGUID) and (tonumber(destGUID) > 0) ) and destGUID or sourceGUID
					ClassMods.spellTracker.spells[tostring(spellId)][2] = GetTime() + (ClassMods.spellTracker.spells[tostring(spellId)][3])
				end
			end
		end
	end
)

-- New alert defaults
ClassMods.newAlertDefaults = {
	enabled = true,
	alerttype = "DEBUFF",
	enablesound = true,
	sound = "Raid Warning",
	aura = L["ENTER NAME OR ID"],
	target = "target",
	sparkles = true,
	healthpercent = 0.4,
}

-- New indicator defaults
ClassMods.newIndicatorDefaults = {
	enabled = true,
	indicatortype = "BUFF",
	aura = L["ENTER NAME OR ID"],
	target = "player",
	sparkles = true,
	combat = false,
	missing = false,
}

-- New announcement defaults
ClassMods.newAnnouncementDefaults = {
	enabled = true,
	spellid = L["ENTER NAME OR ID"],
	announceend = false,
	solochan = "AUTO",
	partychan = "AUTO",
	raidchan = "AUTO",
	arenachan = "AUTO",
	pvpchan = "AUTO",
}

-- New timer defaults
ClassMods.newTimerDefaults = {
	"*NEW TIMER",	--  1: Spell
	nil,					--  2: Item
	"player",			--  3: Check target
	"COOLDOWN",	--  4: Check type
	"PLAYERS",		--  5: Owner
	0,						--  6: What specilization (0 = all or 1 - 3 respectively)
	"CENTER",			--  7: Timer text position
	nil,					--  8: Flash when expiring?
	true,				--  9: Only if known flag (mandatory true)
	nil,					-- 10: <removed, was growth setting>
	nil,					-- 11:  - <removed, Grow start>
	nil,					-- 12:  - <removed, Grow size>
	nil,					-- 13: Change alpha over time?
	0.4,					-- 14:  - Alpha Start
	1,						-- 15:  - Alpha End
	0,						-- 16: Internal Cooldown time
	0,						-- 17: Last time for Internal Cooldown
	nil,					-- 18: Show the icon when? { 1 = Active / 0 or nil = Always }
	nil,					-- 19: Position on bar (values: 1 - total timers)
	0.5,					-- 20: Inactive Alpha when always on bar for stationary timers
	nil,					-- 21: Collapse flag, for options.
	nil,					-- 22: Conditions (conditions must evaluate to true to activate a timer):(this field is nil if no conditions are defined, otherwise a table of key=val){ "AURA_EXIST,SPELL=1978", "HEALTH,<=,20", "AURA_NOEXIST,SPELL=1978", ...more examples added when implemented }
}

-- Create the defaults "profile" sub-key for AceDB
ClassMods.defaults = {
	profile = {
		newinstall = true,
		currentversion = nil,
		masteraudio = true,
		minimapbutton = true,
		minfortenths = 4,
		overrideinterval = false,
		updateinterval = 0.08,
		template = "ClassMods",
		resourcebar = {
			abbreviatenumber = false,
			activealpha = 1,
			updateinterval = 0.08,
			activestack = "",
			anchor = { "CENTER", nil, "CENTER", 0, -273.666687011719 },
			anchor_stacks = { "CENTER", nil, "CENTER", 90, -100 },
			backdropcolor = { 0, 0, 0, .5 },
			backdropinsets = { 0, 0, 0, 0 },
			backdropoffsets = { 0, 0, 0, 0 },
			backdroptexture = "Solid",
			barcolorenable = false,
			barcolor = { 0.6, 0.6, 0.6, 1},
			barcolorhigh = { 1, 0.55, 0, 1},
			barcolorlow = { 1, 0, 0, 1},
			bartexture = "Blizzard",
			bordercolor = { 1, 1, 1, 1 },
			bordertexture = "None",
			classcolored = false,
			colorbackdrop = true,
			deadoverride = true,
			deadoverridealpha = 0,
			edgesize = 16,
			embedstacks = true,
			enablebackdrop = true,
			enableborder = false,
			enabled = true,
			enableprediction = ClassMods.enableprediction,
			enablestacks = true,
			healthfont = { "Big Noodle", 14, "OUTLINE" },
			healthfontoffset = -80,
			height = 19,
			highwarn = ClassMods.highwarn,
			highwarnthreshold = 80,
			inactivealpha = .8,
			lowwarn = true,
			lowwarnthreshold = 20,
			mountoverride = true,
			mountoverridealpha = 0.2,
			oocoverride = true,
			oocoverridealpha = 0.2,
			resourcefont = { "Big Noodle", 17, "OUTLINE" },
			resourcefontcolor = { 1, 1, 1, 1 },
			resourcefontoffset = 0,
			resourcenumber = true,
			smoothbar = true,
			smoothbarautoattackbar = true,
			stacks = ClassMods.stacks,
			stackscolor = { 0.8, 0, 0 },
			stackssize = 40,
			autoattackbar = false,
			autoattackbarcolor = { 1, 1, 1, 1},
			autoattacktimer = false,
			autoattacktimerfont = { "Arial Narrow", 12, "OUTLINE" },
			autoattacktimerfontcolor = { 1, 1, 1, 1 },
			autoattacktimerfontoffset = 0,
			targethealth = false,
			ticks = ClassMods.ticks,
			tile = false,
			tilesize = 16,
			width = 200,
		},
		altresourcebar = {
			enabled = ClassMods.alternateResource,
			updateinterval = 0.08,
			activealpha = 1,
			anchor = { "CENTER", nil, "CENTER", 4.16595268249512, -293.333374023438 },
			backdropcolor = { 0, 0, 0, .5 },
			backdropinsets = { 0, 0, 0, 0 },
			backdropoffsets = { 0, 0, 0, 0 },
			backdroptexture = "None",
			bordercolor = { 1, 1, 1, 1 },
			bordertexture = "None",
			colorbackdrop = true,
			deadoverride = true,
			deadoverridealpha = 0,
			edgesize = 16,
			enablebackdrop = false,
			enableborder = false,
			height = 19,
			inactivealpha = .8,
			mountoverride = true,
			mountoverridealpha = 0.2,
			oocoverride = true,
			oocoverridealpha = 0.2,
			tile = false,
			tilesize = 16,
			width = 200,
			basicmode = false,
			barcoloron = { 1, 1, 1, 1},
			barcoloroff = { 0, 0, 0, 1},
			iconsize = 32,
			icon = {
				enablebackdrop = false,
				colorbackdrop = true,
				backdropcolor = { 0, 0, 0, .5 },
				backdroptexture = "Solid",
				tile = false,
				tilesize = 16,
				backdropoffsets = { 0, 0, 0, 0 },
				backdropinsets = { 0, 0, 0, 0 },
				enableborder = false,
				bordercolor = { 1, 1, 1, 1 },
				bordertexture = "None",
				edgesize = 16,
			}
		},
		healthbar = {
			updateinterval = 0.08,
			abbreviatenumber = true,
			incomingheals = true,
			activealpha = 1,
			anchor = { "CENTER", nil, "CENTER", 0, -250.000015258789 },
			backdropcolor = { 0, 0, 0, .5 },
			backdropinsets = { 0, 0, 0, 0 },
			backdropoffsets = { 0, 0, 0, 0 },
			backdroptexture = "Solid",
			barcolor = { 0, 1, 0, 1},
			barcolorlow = { 1, 0, 0, 1},
			bartexture = "Blizzard",
			bordercolor = { 1, 1, 1, 1 },
			bordertexture = "None",
			classcolored = false,
			colorbackdrop = true,
			deadoverride = true,
			deadoverridealpha = 0,
			edgesize = 16,
			enablebackdrop = true,
			enableborder = false,
			enabled = true,
			healthfont = { "Big Noodle", 17, "OUTLINE" },
			healthfontcolor = { 1, 1, 1, 1 },
			healthfontoffset = 0,
			healthnumber = true,
			height = 19,
			inactivealpha = .8,
			lowwarn = true,
			lowwarnthreshold = 0.25,
			mountoverride = true,
			mountoverridealpha = 0.2,
			oocoverride = true,
			oocoverridealpha = 0.2,
			pethealth = ClassMods.pethealth,
			pethealthfont = ClassMods.pethealthfont,
			pethealthfontoffset = ClassMods.pethealthfontoffset,
			smoothbar = true,
			tile = false,
			tilesize = 16,
			width = 200,
		},
		targetbar = {
			enabled = true,
			updateinterval = 0.08,
			incomingheals = true,
			activealpha = 1,
			inactivealpha = .8,
			oocoverride = true,
			oocoverridealpha = 0.2,
			mountoverride = true,
			mountoverridealpha = 0.2,
			deadoverride = true,
			deadoverridealpha = 0,
			anchor = { "CENTER", nil, "CENTER", 312.499450683594, 131.666809082031 },
			healthnumber = true,
			abbreviatenumber = true,
			targethealth = true,
			smoothbar = true,
			lowwarn = true,
			lowwarnthreshold = 0.20,
			width = 200,
			height = 19,
			healthfont = { "Big Noodle", 17, "OUTLINE" },
			healthfontoffset = 0,
			healthfontcolor = { 1, 1, 1, 1 },
			percentfont = { "Big Noodle", 14, "OUTLINE" },
			percentfontoffset = -80,
			percentfontcolor = { 1, 1, 1, 1 },
			bartexture = "Blizzard",
			classcolored = false,
			barcolor = { 0, 1, 0, 1},
			barcolorlow = { 1, 0, 0, 1},
			enablebackdrop = true,
			colorbackdrop = true,
			backdropcolor = { 0, 0, 0, .5 },
			backdroptexture = "Solid",
			backdropoffsets = { 0, 0, 0, 0 },
			enableborder = false,
			bordercolor = { 1, 1, 1, 1 },
			bordertexture = "None",
			backdropinsets = { 0, 0, 0, 0 },
			edgesize = 16,
			tile = false,
			tilesize = 16,
		},
		dispel = {
			enabled = true,
			updateinterval = 0.01,
			enablesound = true,
			sound = "Raid Warning",
			removednotify = true,
			solochan = "AUTO",
			partychan = "AUTO",
			raidchan = "AUTO",
			arenachan = "AUTO",
			pvpchan = "AUTO",
			anchor = { "CENTER", nil, "CENTER", 0, 120 },
			anchor_removables = { "CENTER", nil, "CENTER", 250, 250 },
			enableremovables = true,
			removablespvponly = true,
			removablestips = true,
			iconsize = 40,
			iconsizeremovables = 24,
			enablebackdrop = false,
			colorbackdrop = false,
			backdropcolor = { 0, 0, 0, .5 },
			backdroptexture = "Solid",
			backdropoffsets = { 0, 0, 0, 0 },
			enableborder = false,
			bordercolor = { 1, 1, 1, 1 },
			bordertexture = "None",
			backdropinsets = { 0, 0, 0, 0 },
			edgesize = 16,
			tile = false,
			tilesize = 16,
			enabletexcoords = false,
			texcoords = { 0.08, 0.92, 0.08, 0.92 },
			removablesenablebackdrop = false,
			removablescolorbackdrop = false,
			removablesbackdropcolor = { 0, 0, 0, .5 },
			removablesbackdroptexture = "Solid",
			removablesbackdropoffsets = { 0, 0, 0, 0 },
			removablesenableborder = false,
			removablesbordercolor = { 1, 1, 1, 1 },
			removablesbordertexture = "None",
			removablesbackdropinsets = { 0, 0, 0, 0 },
			removablesedgesize = 16,
			removablestile = false,
			removablestilesize = 16,
			removablesenabletexcoords = false,
			removablestexcoords = { 0.08, 0.92, 0.08, 0.92 },
		},
		cooldowns = {
			font = { "Arial Narrow", 18, "OUTLINE" },
			expiringcolor = { 1, 0, 0 },
			secondscolor = { 1, 1, 0 },
			minutescolor = { 1, 1, 1 },
			hourscolor = { 0.4, 1, 1 },
			dayscolor = { 0.4, 0.4, 1 },
			shadowcolor = { 0, 0, 0, 0.7 },
			enableshadow = true,
			fontshadowoffset = { 2, -2 },
		},
		crowdcontrol = {
			enabled = true,
			updateinterval = 0.15,
			anchor = { "CENTER", nil, "CENTER", -190, -170 },
			iconsize = 30,
			enablebackdrop = false,
			colorbackdrop = false,
			backdropcolor = { 0, 0, 0, .5 },
			backdroptexture = "Solid",
			backdropoffsets = { 0, 0, 0, 0 },
			enableborder = false,
			bordercolor = { 1, 1, 1, 1 },
			bordertexture = "None",
			backdropinsets = { 0, 0, 0, 0 },
			edgesize = 16,
			tile = false,
			tilesize = 16,
			enabletexcoords = false,
			texcoords = { 0.08, 0.92, 0.08, 0.92 },
			spells = ClassMods.crowdControlSpells,
		},
		totemtimers = {
			enabled = ClassMods.enableTotems,
			updateinterval = 0.15,
			anchor = { "CENTER", nil, "CENTER", 190, -170 },
			iconsize = 30,
			enablebackdrop = false,
			colorbackdrop = false,
			backdropcolor = { 0, 0, 0, .5 },
			backdroptexture = "Solid",
			backdropoffsets = { 0, 0, 0, 0 },
			enableborder = false,
			bordercolor = { 1, 1, 1, 1 },
			bordertexture = "None",
			backdropinsets = { 0, 0, 0, 0 },
			edgesize = 16,
			tile = false,
			tilesize = 16,
			enabletexcoords = false,
			texcoords = { 0.08, 0.92, 0.08, 0.92 },
			totems = ClassMods.totems,
		},
		timers = {
			timerbar1 = {
				enabled = true,
				updateinterval = 0.04,
				activealpha = 1.0,
				inactivealpha = .5,
				oocoverride = true,
				oocoverridealpha = 0,
				mountoverride = true,
				mountoverridealpha = 0,
				deadoverride = true,
				deadoverridealpha = 0,
				anchor = { "CENTER", nil, "CENTER", 99.1666259765625, -222.000015258789 },
				layout = "horizontal",
				reverse = false,
				showsettings = nil,
				stationaryanchorpoint = "REVERSE",
				logarithmic = nil,
				enablebackdrop = false,
				colorbackdrop = true,
				backdropcolor = { 0, 0, 0, .5 },
				backdroptexture = "Solid",
				backdropoffsets = { 0, 0, 0, 0 },
				enableborder = false,
				bordercolor = { 1, 1, 1, 1 },
				bordertexture = "None",
				backdropinsets = { 0, 0, 0, 0 },
				width = 200,
				height = 19,
				iconsize = 26,
				edgesize = 16,
				tile = false,
				tilesize = 16,
				timefont = { "Arial Narrow", 16, "OUTLINE" },
				timerfontcolorstatic = false,
				timerfontcolor = { 0.4, 0.4, 1 },
				enabletimershadow = false,
				timershadowcolor = { 0, 0, 0, 0.5 },
				timershadowoffset = { 2, -2 },
				stackfont = { "Arial Narrow", 15, "OUTLINE" },
				stackfontcolor = { .05, 1, .96 },
				timerenablebackdrop = false,
				timercolorbackdrop = true,
				timerbackdropcolor = { 0, 0, 0, .5 },
				timerbackdroptexture = "Solid",
				timertile = false,
				timertilesize = 16,
				timerbackdropoffsets = { 0, 0, 0, 0 },
				timerbackdropinsets = { 0, 0, 0, 0 },
				timerenableborder = false,
				timerbordercolor = { 1, 1, 1, 1 },
				timerbordertexture = "None",
				timeredgesize = 16,
				enabletexcoords = false,
				texcoords = { 0.08, 0.92, 0.08, 0.92 },
				stationary = true,
				prioritize = nil,
				showtimewithoneletter = nil,
				timers = {},
			},
			timerbar2 = {
				enabled = true,
				updateinterval = 0.04,
				activealpha = 1.0,
				inactivealpha = .5,
				oocoverride = true,
				oocoverridealpha = 0,
				mountoverride = true,
				mountoverridealpha = 0,
				deadoverride = true,
				deadoverridealpha = 0,
				anchor = { "CENTER", nil, "CENTER", 1.66638243198395, -316.666442871094 },
				layout = "horizontal",
				reverse = false,
				showsettings = nil,
				stationaryanchorpoint = nil,
				logarithmic = nil,
				enablebackdrop = false,
				colorbackdrop = true,
				backdropcolor = { 0, 0, 0, .5 },
				backdroptexture = "Solid",
				backdropoffsets = { 0, 0, 0, 0 },
				enableborder = false,
				bordercolor = { 1, 1, 1, 1 },
				bordertexture = "None",
				backdropinsets = { 0, 0, 0, 0 },
				width = 200,
				height = 19,
				iconsize = 19,
				edgesize = 16,
				tile = false,
				tilesize = 16,
				timefont = { "Arial Narrow", 13, "OUTLINE" },
				timerfontcolorstatic = false,
				timerfontcolor = { 0.4, 0.4, 1 },
				enabletimershadow = false,
				timershadowcolor = { 0, 0, 0, 0.5 },
				timershadowoffset = { 2, -2 },
				stackfont = { "Arial Narrow", 12, "OUTLINE" },
				stackfontcolor = { .05, 1, .96 },
				timerenablebackdrop = false,
				timercolorbackdrop = true,
				timerbackdropcolor = { 0, 0, 0, .5 },
				timerbackdroptexture = "Solid",
				timertile = false,
				timertilesize = 16,
				timerbackdropoffsets = { 0, 0, 0, 0 },
				timerbackdropinsets = { 0, 0, 0, 0 },
				timerenableborder = false,
				timerbordercolor = { 1, 1, 1, 1 },
				timerbordertexture = "None",
				timeredgesize = 16,
				enabletexcoords = false,
				texcoords = { 0.08, 0.92, 0.08, 0.92 },
				stationary = nil,
				prioritize = nil,
				showtimewithoneletter = nil,
				timers = {},
			},
			timerbar3 = {
				enabled = true,
				updateinterval = 0.04,
				activealpha = 1.0,
				inactivealpha = .5,
				oocoverride = true,
				oocoverridealpha = 0,
				mountoverride = true,
				mountoverridealpha = 0,
				deadoverride = true,
				deadoverridealpha = 0,
				anchor = { "CENTER", nil, "CENTER", 312.999633789063, 107.500129699707 },
				layout = "horizontal",
				reverse = false,
				showsettings = nil,
				stationaryanchorpoint = "REVERSE",
				logarithmic = nil,
				enablebackdrop = false,
				colorbackdrop = true,
				backdropcolor = { 0, 0, 0, .5 },
				backdroptexture = "Solid",
				backdropoffsets = { 0, 0, 0, 0 },
				enableborder = false,
				bordercolor = { 1, 1, 1, 1 },
				bordertexture = "None",
				backdropinsets = { 0, 0, 0, 0 },
				width = 200,
				height = 19,
				iconsize = 19,
				edgesize = 16,
				tile = false,
				tilesize = 16,
				timefont = { "Arial Narrow", 13, "OUTLINE" },
				timerfontcolorstatic = false,
				timerfontcolor = { 0.4, 0.4, 1 },
				enabletimershadow = false,
				timershadowcolor = { 0, 0, 0, 0.5 },
				timershadowoffset = { 2, -2 },
				stackfont = { "Arial Narrow", 12, "OUTLINE" },
				stackfontcolor = { .05, 1, .96 },
				timerenablebackdrop = false,
				timercolorbackdrop = true,
				timerbackdropcolor = { 0, 0, 0, .5 },
				timerbackdroptexture = "Solid",
				timertile = false,
				timertilesize = 16,
				timerbackdropoffsets = { 0, 0, 0, 0 },
				timerbackdropinsets = { 0, 0, 0, 0 },
				timerenableborder = false,
				timerbordercolor = { 1, 1, 1, 1 },
				timerbordertexture = "None",
				timeredgesize = 16,
				enabletexcoords = false,
				texcoords = { 0.08, 0.92, 0.08, 0.92 },
				stationary = nil,
				prioritize = nil,
				showtimewithoneletter = nil,
				timers = {},
			},
		},
		announcements = {
			interrupt = {
				enabled = true,
				solochan = "AUTO",
				partychan = "AUTO",
				raidchan = "AUTO",
				arenachan = "AUTO",
				pvpchan = "AUTO",
			},
			announcements = {},
		},
		alerts = {
			updateinterval = 0.08,
			enablebackdrop = false,
			colorbackdrop = false,
			backdropcolor = { 0, 0, 0, .5 },
			backdroptexture = "Solid",
			backdropoffsets = { 0, 0, 0, 0 },
			enableborder = false,
			bordercolor = { 1, 1, 1, 1 },
			bordertexture = "None",
			backdropinsets = { 0, 0, 0, 0 },
			iconsize = 32,
			edgesize = 16,
			tile = false,
			tilesize = 16,
			stackfont = { "Arial Narrow", 12, "OUTLINE" },
			stackfontcolor = { .05, 1, .96 },
			enabletexcoords = false,
			texcoords = { 0.08, 0.92, 0.08, 0.92 },
			icons = {
				enablebackdrop = false,
				colorbackdrop = false,
				backdropcolor = { 0, 0, 0, .5 },
				backdroptexture = "Solid",
				backdropoffsets = { 0, 0, 0, 0 },
				enableborder = false,
				bordercolor = { 1, 1, 1, 1 },
				bordertexture = "None",
				backdropinsets = { 0, 0, 0, 0 },
				iconsize = 32,
				edgesize = 16,
				tile = false,
				tilesize = 16,
				stackfont = { "Arial Narrow", 12, "OUTLINE" },
				stackfontcolor = { .05, 1, .96 },
				enabletexcoords = false,
				texcoords = { 0.08, 0.92, 0.08, 0.92 },
			},
			anchor = { "CENTER", nil, "CENTER", 20, 100 },
			alerts = {},
		},
		clicktocast = {
			enabled = true,
			updateinterval = 0.08,
			spell = ClassMods.clickToCastDefault,
			fTARGET = false,
			fPET = true,
			fFOCUS = true,
			fTOT = true,
			fPARTY = true,
			fPARTYPETS = true,
			fRAID = true,
			fRAIDPET = true,
		},
		indicators = {
			updateinterval = 0.08,
			enablebackdrop = false,
			colorbackdrop = false,
			backdropcolor = { 0, 0, 0, .5 },
			backdroptexture = "Solid",
			backdropoffsets = { 0, 0, 0, 0 },
			enableborder = false,
			bordercolor = { 1, 1, 1, 1 },
			bordertexture = "None",
			backdropinsets = { 0, 0, 0, 0 },
			iconsize = 32,
			edgesize = 16,
			tile = false,
			tilesize = 16,
			stackfont = { "Arial Narrow", 12, "OUTLINE" },
			stackfontcolor = { .05, 1, .96 },
			enabletexcoords = false,
			texcoords = { 0.08, 0.92, 0.08, 0.92 },
			icons = {
				enablebackdrop = false,
				colorbackdrop = false,
				backdropcolor = { 0, 0, 0, .5 },
				backdroptexture = "Solid",
				backdropoffsets = { 0, 0, 0, 0 },
				enableborder = false,
				bordercolor = { 1, 1, 1, 1 },
				bordertexture = "None",
				backdropinsets = { 0, 0, 0, 0 },
				iconsize = 32,
				edgesize = 16,
				tile = false,
				tilesize = 16,
				stackfont = { "Arial Narrow", 12, "OUTLINE" },
				stackfontcolor = { .05, 1, .96 },
				enabletexcoords = false,
				texcoords = { 0.08, 0.92, 0.08, 0.92 },
			},
			anchor = { "CENTER", nil, "CENTER", 312, 0 },
			indicators = {},
		},
	},
}