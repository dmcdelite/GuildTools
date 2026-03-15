-- GuildTools/Core/Locale.lua
-- Localization support for GuildTools addon

local addonName, GuildTools = ...

local Locale = {}
Locale.language = GetLocale()
Locale.strings = {}

Locale.strings.enUS = {
    ADDON_NAME = "GuildTools",
    ADDON_VERSION = "4.3.0-dev",
    
    CMD_HELP = "GuildTools help",
    CMD_CONFIG = "Open settings",
    CMD_ROSTER = "Open roster",
    CMD_EVENTS = "Open events",
    CMD_ECONOMY = "Open economy",
    
    BUTTON_CLOSE = "Close",
    BUTTON_SAVE = "Save",
    BUTTON_CANCEL = "Cancel",
    BUTTON_DELETE = "Delete",
    BUTTON_RESET = "Reset",
    BUTTON_EXPORT = "Export",
    BUTTON_IMPORT = "Import",
    
    TAB_HOME = "Home",
    TAB_ROSTER = "Roster",
    TAB_RECRUITMENT = "Recruitment",
    TAB_EVENTS = "Events",
    TAB_ECONOMY = "Economy",
    TAB_LOGISTICS = "Logistics",
    TAB_PROFESSIONS = "Professions",
    TAB_RAID = "Raid",
    TAB_OFFICERS = "Officers",
    TAB_SETTINGS = "Settings",
    
    ROSTER_TITLE = "Guild Roster",
    ROSTER_NAME = "Name",
    ROSTER_CLASS = "Class",
    ROSTER_LEVEL = "Level",
    ROSTER_ZONE = "Zone",
    ROSTER_RANK = "Rank",
    ROSTER_STATUS = "Status",
    ROSTER_ONLINE = "Online",
    ROSTER_OFFLINE = "Offline",
    ROSTER_ACTIVITY_AGE = "Last Seen",
    
    PROF_TITLE = "Guild Professions",
    PROF_MEMBER = "Member",
    PROF_PROFESSION = "Profession",
    PROF_SKILL = "Skill",
    PROF_RECIPES = "Recipes",
    PROF_MATERIALS = "Materials",
    PROF_SYNC = "Sync Professions",
    PROF_SYNCING = "Syncing...",
    PROF_SYNC_COMPLETE = "Professions synced",
    PROF_SYNC_ERROR = "Sync error: %s",
    
    ECON_TITLE = "Guild Economy",
    ECON_BANK_VALUE = "Bank Value",
    ECON_TRANSACTIONS = "Transactions",
    ECON_CONTRIBUTORS = "Top Contributors",
    ECON_WITHDRAWALS = "Top Withdrawals",
    ECON_WEEKLY_FLOW = "Weekly Net Flow",
    ECON_DEPOSIT = "Deposit",
    ECON_WITHDRAWAL = "Withdrawal",
    ECON_SCAN = "Scan Bank",
    ECON_SCANNING = "Scanning...",
    ECON_SCAN_COMPLETE = "Bank scan complete",
    
    MSG_LOADED = "loaded. Type %s for help.",
    MSG_ERROR = "Error: %s",
    MSG_SUCCESS = "Success: %s",
    MSG_WARNING = "Warning: %s",
    MSG_NOT_IN_GUILD = "You are not in a guild",
    MSG_NO_PERMISSION = "You do not have permission to do this",
    MSG_INVALID_INPUT = "Invalid input",
}

Locale.strings.deDE = Locale.strings.enUS
Locale.strings.frFR = Locale.strings.enUS
Locale.strings.esES = Locale.strings.enUS

function Locale:Get(key)
    local strings = self.strings[self.language] or self.strings.enUS
    return strings[key] or "[" .. key .. "]"
end

function Locale:Format(key, ...)
    return string.format(self:Get(key), ...)
end

GuildTools.Locale = Locale
return Locale
