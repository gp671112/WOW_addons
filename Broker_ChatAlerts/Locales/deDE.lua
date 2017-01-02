--[[ *******************************************************************
Project                 : Broker_ChatAlerts
Description             : German translation file (deDE)
Author                  : 
Translator              : 
Revision                : $Rev: 1 $
********************************************************************* ]]

local ADDON = ...

local L = LibStub:GetLibrary("AceLocale-3.0"):NewLocale(ADDON, "deDE")
if not L then return end

L["Deactivated"] = "Deaktiviert"
L["Activated"] = "Aktiviert"
L["Filtered"] = "Gefiltert"

L["Settings"] = "Einstellungen"

L["General"] = "Allgemein"
L["Setup general options."] = "Allgemeine Einstellungen vornehmen."

L["Default Alert Location"] = "Standardausgabeposition"
L["Choose what method you would like to use for displaying text alerts. SCT, Mik's Scrolling Battle Text, Parrot, Blizzard Scrolling Text, and the default UI are supported. Grayed-out entries are currently not active."] = "Methode zum Anzeigen der Nachrichten wählen. SCT, Mik's Scrolling Battle Text, Parrot, Blizzard Scrolling Text und der Standard-UI-Error-Frame werden unterstützt. Ausgegraute Einträge sind derzeit nicht aktiv."
L["Message Filters"] = "Nachrichtenfilter"
L["Message filters will be applied before processing channel messages. Message filters are introduced by other addons such as spam filtering addons."] = "Einsatz installierter Nachrichtenfilter vor der Anzeige der Alarme. Nachrichtenfilter werden durch andere Addons angelegt, wie etwa Spam-Schutz-Addons."
L["Notification Sound"] = "Alarmton"
L["Choose sound to be played on notifications."] = "Wähle Alarmton, der bei Benachrichtigungen gespielt werden soll."
L["Play Sound"] = "Abspielen"
L["Play selected notification sound."] = "Gewählten Alarmton abspielen"
L["Show in Combat"] = "Im Kampf"
L["Show alerts while engaged in combat."] = "Zeige Alarme im Kampf"
L["Show own Messages"] = "Zeige eigene Nachrichten"
L["Show your own messages."] = "Zeige eigene Nachrichten"

L["Message Format"] =  "Nachrichtenformat"
L["Setup message format."] = "Konfiguriere Nachrichtenformat"
L["Show out of Combat"] = "Außerhalb des Kampfes"
L["Show alerts while out of combat."] = "Zeige Alarme, wenn nicht im Kampf."
L["Wrap Lines"] = "Zeilenumbrüche"
L["Wrap lines before displaying text alerts."] = "Verwende fixe Zeilenumbrüche bei der Anzeige von Textalarmen."
L["Line Length"] = "Zeilenlänge"
L["Wrap message for text alerts to this line length if wrapping is active."] = "Zeilenlänge, auf die umgebrochen wird, wenn Zeilenumbrüche aktiviert wurden."
L["Show Sender Icon"] = "Zeige Sender-Icon"
L["Show icon indicating race and gender of sender character."] = "Zeige Icon für Rasse und Geschlecht des Charakters des Senders."
L["Show Client Icon"] = "Zeige Client-Icon"
L["Show icon indicating client of sender in Battle.Net conversations."] = "Zeige Client-Icon des Senders in Battle.Net-Unterhaltungen."
L["Icon Size"] = "Icon-Größe"
L["Size of displayed icons."] = "Größe der angezeigten Icons."

L["Display Addons"] = "Anzeige Addons"
L["Setup supported display addons."] = "Einstellungen für Addons zur anzeige von Textalamen."

L["Scroll Area"] = "Anzeigebereich"
L["Select display area used by provider."] = "Wähle Anzeigebereich des Addons"
L["Sticky"] = "Fixiert"
L["Make alert text sicky in scroll area."] = "Fixiere Anzeigeposition im Anzeigebereich."

L["Message Events"] = "Nachrichtenereignisse"
L["Set up alerts for message events"] = "Alarmeinstellungen für Nachrichtenereignisse"
L["Channel Alerts"] = "Channel-Alarme"
L["Set up alerts for specific channels"] = "Alarmeinstellungen für spezifische Channel"

L["Text Message Alerts"] = "Textalarm"
L["Choose message types where you want text displayed."] = "Nachrichtentypen wählen, deren Text angezeigt werden soll"
L["Set text alerts for specific channels"] = "Textausgabe für spezifische Channel"
L["Sound Alerts"] = "Audioalarm"
L["Choose message types where you to hear a notify sound."] = "Nachrichtentypen wählen, für die ein Nachrichtenton gespielt werden soll"
L["Set sounds for specific channels"] = "Audioalarm für spezifische Channel"
L["Scroll Area"] = "Scroll-Bereich"
L["Choose a specific location for the message alert other than the default location."] = "Zielbereich wählen, in dem der Text angezeigt werden soll"
L["Choose a specific location for the channel alert other than the default location."] = "Zielbereich wählen, in dem der Text angezeigt werden soll"

L["Loot Options"] = "Optionen Plündern"
L["Choose message types where you want text displayed."] = "Wähle Nachrichtentypen, für Textausgabe."

L["Minimum Rarity - Self"] = "Minimale Seltenheit - Selbst"
L["Choose the minimum rarity to alert when looting."] = "Wähle minimale Seltenheit, die beim Plündern angezeigt werden soll."
L["Minimum Rarity - Others"] = "Minimale Seltenheit - Andere"
L["Choose the minimum rarity to alert when OTHERS are looting."] = "Wähle minimale Seltenheit, die angezeigt werden soll wenn andere plündern."
L["Show my loot only"] = "Zeige nur meine Beute"
L["Toggle whether or not to show other looters or just your own."] = "Umschalten ob nur eigene oder auch fremde Beute gezeigt werden soll."
L["Show total quanity"] = "Zeige Gesamtmenge"
L["Toggle whether the total quantity in your bags should be shown in the loot text alert."] = "Umschalten ob Gesamtmenge der Beute in den Taschen beim Plündern angezeigt werden soll."
L["Show need and winner only"] = "Zeige nur Bedarf und Gewinner"
L["Toggle whether to show only Need and Winner on rolls."] = "Umschalten ob nur Bedarf und Gewinner beim Würfeln angezeigt werden soll."

L["Filter Options"] = "Filteroptionen"
L["Filter for events and channel messages."] = "Filter für Ereignisse und Nachrichten."

L["Player Name"] = "Spielername"
L["Message will be shown if it contains the player name."] = "Nachricht wird angezeigt, wenn der Spielername enthalten ist."
L["Keywords"] = "Schlüsselwörter"
L["List of keywords. Message will be shown if any keyword is matched."] = "Liste von Schlüsselwörtern. Nachricht wird angezeigt, wenn eines der Schlüsselwörter enthalten ist."

L["Minimap Button"] = "Minimap Button"
L["Show Minimap Button"] = "Zeige Minimap Button"
L["Hide Hint"] = "Hinweis verbergen"
L["Hide usage hint in tooltip."] = "Benutzungshinweise im Tooltip verbergen"

L["Default"] = "Vorgabe"

L["Version"] = "Version"

L["Usage:"] = "Verwendung:"
L["/bchatalerts arg"] = "/bchatalerts arg"
L["/bca arg"] = "/bca arg"
L["Args:"] = "Argumente:"
L["version - display version information"] = "version - Versionsinformation anzeigen"
L["menu - display options menu"] = "menu - Optionsmenü anzeigen"
L["help - display this help"] = "help - diese Hilfe anzeigen"

L["Poor"] = "Schlecht"
L["Common"] = "Verbreitet"
L["Uncommon"] = "Selten"
L["Rare"] = "Rar"
L["Epic"] = "Episch"
L["Legendary"] = "Legendär"
L["Artifact"] = "Artefakt"

L["system"] = "System"
L["whisper"] = "Flüstern"
L["party"] = "Gruppe"
L["raid"] = "Schlachtzug"
L["instance"] = "Instanz"
L["bg"] = "Schlachtfeld"
L["bnet"] = "Battle.net"
L["say"] = "Sagen"
L["yell"] = "Schreien"
L["emote"] = "Emote"
L["guild"] = "Gilde"
L["officer"] = "Offizier"
L["monster"] = "Monster"
L["boss"] = "Schlachtzugboss"
L["loot"] = "Plündern"

L["General"] = "Allgemein"
L["Trade"] = "Handel"
L["LocalDefense"] = "LokaleVerteidigung"
L["LookingForGroup"] = "SucheNachGruppe"
L["GuildRecruitment"] = "Gildenrekrutierung"

L["Toggle %s Messages"] = "(De-)aktiviere Nachricht %s"
L["Toggle %s Sound Alert"] = "(De-)aktiviere Alarmton %s"
L["Choose specific Alert Location for %s Messages."] = "Spezifische Ausgabeposition wählen für Nachricht %s"
L["Message"] = "Nachricht"
L["Channel"] = "Kanal"
L["Text"] = "Text"
L["Sound"] = "Alarm"

L["disabled"] = "deaktiviert"
L["enabled"] = "aktiviert"
L["filtered"] = "gefiltert"

L["Right-Click"] = "Rechtsklick"
L["Open option menu."] = "Optionsmenü öffnen."
L["Left-Click Tip"] = "Linksklick Tooltip"
L["Toggle selected setting."] = "Ausgewählte Einstellung umschalten."

-- L["default"] = "Default UI Frame"
-- L["rw"]      = "Raid Warning"
-- L["sct"]     = "SCT - Scrolling Combat Text"
-- L["msbt"]    = "Mik's Scrolling Battle Text"
-- L["parrot"]  = "Parrot"
-- L["blizz"]   = "Blizzard Scrolling Text"
L["Globally set Location"] = "Globale Position"

L["Toggle text for "] = "(De-)aktiviere Textausgabe für "
L["Toggle sound for "] = "(De-)aktiviere Alarmton für "

L["Location"] = "Position"
L["Choose specific Alert Location for "] = "Spezifische Ausgabeposition wählen für "
L["NEED"] = "Bedarf"
