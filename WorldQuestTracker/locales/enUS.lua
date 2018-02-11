local L = LibStub("AceLocale-3.0"):NewLocale("WorldQuestTrackerAddon", "enUS", true) 
if not L then return end 

L["S_APOWER_AVAILABLE"] = "Available"
L["S_APOWER_DOWNVALUE"] = "Quests with %s means it has more time than the current research."
L["S_APOWER_NEXTLEVEL"] = "Next Level"
L["S_ENABLED"] = "Enabled"
L["S_ERROR_NOTIMELEFT"] = "This quest has no time left."
L["S_ERROR_NOTLOADEDYET"] = "This quest isn't loaded yet, please wait few seconds."
L["S_FLYMAP_SHOWTRACKEDONLY"] = "Tracked Only"
L["S_FLYMAP_SHOWTRACKEDONLY_DESC"] = "Show only quests being tracked"
L["S_FLYMAP_SHOWWORLDQUESTS"] = "Show World Quests"
L["S_GROUPFINDER_ACTIONS_CANCEL_APPLICATIONS"] = "click to cancel applications..."
L["S_GROUPFINDER_ACTIONS_CANCELING"] = "canceling..."
L["S_GROUPFINDER_ACTIONS_CREATE"] = "no group found?, click to start one"
L["S_GROUPFINDER_ACTIONS_CREATE_DIRECT"] = "create group"
L["S_GROUPFINDER_ACTIONS_LEAVEASK"] = "Leave the group?"
L["S_GROUPFINDER_ACTIONS_LEAVINGIN"] = "Leaving the group in (click to leave now):"
L["S_GROUPFINDER_ACTIONS_RETRYSEARCH"] = "retry search"
L["S_GROUPFINDER_ACTIONS_SEARCH"] = "click to start searching for groups"
L["S_GROUPFINDER_ACTIONS_SEARCH_RARENPC"] = "search for a group to kill this rare"
L["S_GROUPFINDER_ACTIONS_SEARCH_TOOLTIP"] = "Join a group doing this quest"
L["S_GROUPFINDER_ACTIONS_SEARCHING"] = "searching..."
L["S_GROUPFINDER_ACTIONS_SEARCHMORE"] = "click to search for more group members"
L["S_GROUPFINDER_ACTIONS_SEARCHOTHER"] = "Leave and Search a different group?"
L["S_GROUPFINDER_ACTIONS_UNAPPLY1"] = "click to remove the apply so we can create a new group"
L["S_GROUPFINDER_ACTIONS_UNLIST"] = "click to unlist your current group"
L["S_GROUPFINDER_ACTIONS_UNLISTING"] = "unlisting..."
L["S_GROUPFINDER_ACTIONS_WAITING"] = "waiting..."
L["S_GROUPFINDER_AUTOOPEN_RARENPC_TARGETED"] = "Auto Open on Target a Rare Mob"
L["S_GROUPFINDER_ENABLED"] = "Auto Open On New Quest"
L["S_GROUPFINDER_INVASION_ENABLED"] = "Auto Open on Invasion Point"
L["S_GROUPFINDER_LEAVEOPTIONS"] = "Leave Group Options"
L["S_GROUPFINDER_LEAVEOPTIONS_AFTERX"] = "Leave After X Seconds"
L["S_GROUPFINDER_LEAVEOPTIONS_ASKX"] = "Don't Auto Leave, Just Ask for X Seconds"
L["S_GROUPFINDER_LEAVEOPTIONS_DONTLEAVE"] = "Don't Show Leave Panel"
L["S_GROUPFINDER_LEAVEOPTIONS_IMMEDIATELY"] = "Leave Immediately on Quest Completed"
L["S_GROUPFINDER_NOPVP"] = "Avoid PVP Servers"
L["S_GROUPFINDER_OT_ENABLED"] = "Show Buttons on the Objective Tracker"
L["S_GROUPFINDER_QUEUEBUSY"] = "you are already in a queue."
L["S_GROUPFINDER_QUEUEBUSY2"] = "couldn't show the group finder window: you're already in group or in queue."
L["S_GROUPFINDER_RESULTS_APPLYING"] = "There's %d remaining groups, click again"
L["S_GROUPFINDER_RESULTS_APPLYING1"] = "There's 1 remaining group to join, click again"
L["S_GROUPFINDER_RESULTS_FOUND"] = [=[found %d groups
click to start joining]=]
L["S_GROUPFINDER_RESULTS_FOUND1"] = [=[found 1 group
click to start joining]=]
L["S_GROUPFINDER_RESULTS_UNAPPLY"] = "%d applications remaining..."
L["S_GROUPFINDER_RIGHTCLICKCLOSE"] = "right click to close"
L["S_GROUPFINDER_SECONDS"] = "Seconds"
L["S_GROUPFINDER_TITLE"] = "Group Finder"
L["S_GROUPFINDER_TUTORIAL1"] = "Do world quests faster by joining a group doing the same quest!"
L["S_MAPBAR_AUTOWORLDMAP"] = "Auto World Map"
L["S_MAPBAR_AUTOWORLDMAP_DESC"] = [=[When in Dalaran or Class Hall, pressing 'M' goes directly to Broken Isles map.

Double tap 'M' goes to the map you are standing in.]=]
L["S_MAPBAR_FILTER"] = "Filter"
L["S_MAPBAR_FILTERMENU_FACTIONOBJECTIVES"] = "Faction Objectives"
L["S_MAPBAR_FILTERMENU_FACTIONOBJECTIVES_DESC"] = "Show faction quests even if they has been filtered out."
L["S_MAPBAR_OPTIONS"] = "Options"
L["S_MAPBAR_OPTIONSMENU_ARROWSPEED"] = "Arrow Update Speed"
L["S_MAPBAR_OPTIONSMENU_ARROWSPEED_HIGH"] = "Fast"
L["S_MAPBAR_OPTIONSMENU_ARROWSPEED_MEDIUM"] = "Medium"
L["S_MAPBAR_OPTIONSMENU_ARROWSPEED_REALTIME"] = "Real Time"
L["S_MAPBAR_OPTIONSMENU_ARROWSPEED_SLOW"] = "Slow"
L["S_MAPBAR_OPTIONSMENU_EQUIPMENTICONS"] = "Equipment Icons"
L["S_MAPBAR_OPTIONSMENU_QUESTTRACKER"] = "Enable Quest Tracker"
L["S_MAPBAR_OPTIONSMENU_REFRESH"] = "Refresh"
L["S_MAPBAR_OPTIONSMENU_SHARE"] = "Share This AddOn"
L["S_MAPBAR_OPTIONSMENU_SOUNDENABLED"] = "Enable Sound"
L["S_MAPBAR_OPTIONSMENU_STATUSBARANCHOR"] = "Anchor on Top"
L["S_MAPBAR_OPTIONSMENU_TOMTOM_WPPERSISTENT"] = "Waypoint Persistent"
L["S_MAPBAR_OPTIONSMENU_TRACKER_CURRENTZONE"] = "Current Zone Only"
L["S_MAPBAR_OPTIONSMENU_TRACKER_SCALE"] = "Tracker Scale: %s"
L["S_MAPBAR_OPTIONSMENU_TRACKERCONFIG"] = "Tracker Config"
L["S_MAPBAR_OPTIONSMENU_TRACKERMOVABLE_AUTO"] = "Automatic"
L["S_MAPBAR_OPTIONSMENU_TRACKERMOVABLE_CUSTOM"] = "Custom Position"
L["S_MAPBAR_OPTIONSMENU_TRACKERMOVABLE_LOCKED"] = "Locked"
L["S_MAPBAR_OPTIONSMENU_UNTRACKQUESTS"] = "Untrack All Quests"
L["S_MAPBAR_OPTIONSMENU_WORLDMAPCONFIG"] = "World Map Config"
L["S_MAPBAR_OPTIONSMENU_YARDSDISTANCE"] = "Show Yards Distance"
L["S_MAPBAR_OPTIONSMENU_ZONE_QUESTSUMMARY"] = "Quest Summary (fullscreen)"
L["S_MAPBAR_OPTIONSMENU_ZONEMAPCONFIG"] = "Zone Map Config"
L["S_MAPBAR_RESOURCES_TOOLTIP_TRACKALL"] = "Click to track all: |cFFFFFFFF%s|r quests."
L["S_MAPBAR_SORTORDER"] = "Sort Order"
L["S_MAPBAR_SORTORDER_TIMELEFTPRIORITY_FADE"] = "Fade Quests"
L["S_MAPBAR_SORTORDER_TIMELEFTPRIORITY_OPTION"] = "Less Than %d Hours"
L["S_MAPBAR_SORTORDER_TIMELEFTPRIORITY_SHOWTEXT"] = "Time Left Text"
L["S_MAPBAR_SORTORDER_TIMELEFTPRIORITY_SORTBYTIME"] = "Sort by Time"
L["S_MAPBAR_SORTORDER_TIMELEFTPRIORITY_TITLE"] = "Time Left"
L["S_MAPBAR_SUMMARY"] = "Summary"
L["S_MAPBAR_SUMMARYMENU_ACCOUNTWIDE"] = "Account Wide"
L["S_MAPBAR_SUMMARYMENU_MOREINFO"] = "Click for more info"
L["S_MAPBAR_SUMMARYMENU_NOATTENTION"] = [=[No quest being tracked on your other
characters has less than 2 hours left!]=]
L["S_MAPBAR_SUMMARYMENU_REQUIREATTENTION"] = "Require Attention"
L["S_MAPBAR_SUMMARYMENU_TODAYREWARDS"] = "Today's Rewards"
L["S_OVERALL"] = "Overall"
L["S_PARTY"] = "Party"
L["S_PARTY_DESC1"] = "Quests with a blue star means all party members have the quest."
L["S_PARTY_DESC2"] = "If a red star is shown, a party member isn't elegible to world quests or doesn't have WQT installed yet."
L["S_PARTY_PLAYERSWITH"] = "Players in the party With WQT:"
L["S_PARTY_PLAYERSWITHOUT"] = "Players in the party Without WQT:"
L["S_QUESTSCOMPLETED"] = "Quests Completed"
L["S_QUESTTYPE_ARTIFACTPOWER"] = "Artifact Power"
L["S_QUESTTYPE_DUNGEON"] = "Dungeon"
L["S_QUESTTYPE_EQUIPMENT"] = "Equipment"
L["S_QUESTTYPE_GOLD"] = "Gold"
L["S_QUESTTYPE_PETBATTLE"] = "Pet Battle"
L["S_QUESTTYPE_PROFESSION"] = "Profession"
L["S_QUESTTYPE_PVP"] = "PvP"
L["S_QUESTTYPE_RESOURCE"] = "Resources"
L["S_QUESTTYPE_TRADESKILL"] = "Trade Skill"
L["S_RAREFINDER_ADDFROMPREMADE"] = "Add Rares Found on Premade Groups"
L["S_RAREFINDER_NPC_NOTREGISTERED"] = "rare not in the database"
L["S_RAREFINDER_OPTIONS_ENGLISHSEARCH"] = "Always Search in English"
L["S_RAREFINDER_OPTIONS_SHOWICONS"] = "Show Icons for Active Rares"
L["S_RAREFINDER_SOUND_ALWAYSPLAY"] = "Play Even When Sound Effects Are Disabled"
L["S_RAREFINDER_SOUND_ENABLED"] = "Play Sound for Rare on Minimap"
L["S_RAREFINDER_SOUNDWARNING"] = "sound played due to a rare on the minimap, you may disable this sound at the options menu > rare finder sub menu."
L["S_RAREFINDER_TITLE"] = "Rare Finder"
L["S_RAREFINDER_TOOLTIP_REMOVE"] = "Remove"
L["S_RAREFINDER_TOOLTIP_SEACHREALM"] = "Search on other realms"
L["S_RAREFINDER_TOOLTIP_SPOTTEDBY"] = "Spotted By"
L["S_RAREFINDER_TOOLTIP_TIMEAGO"] = "minutes ago"
L["S_SHAREPANEL_THANKS"] = [=[Thanks for Sharing World Quest Tracker!
Send our link to your friends on facebook, twitter, white house.]=]
L["S_SHAREPANEL_TITLE"] = "For All Those About to Rock!"
L["S_SUMMARYPANEL_EXPIRED"] = "EXPIRED"
L["S_SUMMARYPANEL_LAST15DAYS"] = "Last 15 Days"
L["S_SUMMARYPANEL_LIFETIMESTATISTICS_ACCOUNT"] = "Account Life Time Statistics"
L["S_SUMMARYPANEL_LIFETIMESTATISTICS_CHARACTER"] = "Character Life Time Statistics"
L["S_SUMMARYPANEL_OTHERCHARACTERS"] = "Other Characters"
L["S_TUTORIAL_AMOUNT"] = "indicates the amount to receive"
L["S_TUTORIAL_CLICKTOTRACK"] = "Click to track a quest."
L["S_TUTORIAL_CLOSE"] = "Close Tutorial"
L["S_TUTORIAL_FACTIONBOUNTY"] = "indicates the quest counts towards the selected faction."
L["S_TUTORIAL_FACTIONBOUNTY_AMOUNTQUESTS"] = "indicates how many quest are on the map for the selected faction."
L["S_TUTORIAL_HOWTOADDTRACKER"] = "Left click to track a quest. On the tracker, you may |cFFFFFFFFright click|r to untrack it."
L["S_TUTORIAL_PARTY"] = "When in party, a blue star is shown on quests that all party members have!"
L["S_TUTORIAL_RARITY"] = "indicates the rarity (common, rare, epic)"
L["S_TUTORIAL_REWARD"] = "indicates the reward (equipment, gold, artifact power, resources, reagents)"
L["S_TUTORIAL_TIMELEFT"] = "indicates the time left (+4 hours, +90 minutes, +30 minutes, less than 30 minutes)"
L["S_TUTORIAL_WORLDMAPBUTTON"] = "This button brings to you the Broken Isles map."
L["S_UNKNOWNQUEST"] = "Unknown Quest"
L["S_WORLDMAP_TOOGLEQUESTS"] = "Toggle Quests"
L["S_WORLDQUESTS"] = "World Quests"

