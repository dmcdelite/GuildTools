-- GuildTools/Core/Constants.lua
-- Global constants for GuildTools addon

local addonName, GuildTools = ...

local Constants = {}

-- Game constants
Constants.GAME_VERSION = select(4, GetBuildInfo())
Constants.EXPANSION = GetExpansionLevel()

-- Addon constants
Constants.ADDON_NAME = addonName
Constants.ADDON_VERSION = "4.3.0-dev"
Constants.ADDON_BUILD = 20260315

-- UI constants
Constants.UI_SCALE = 1.0
Constants.FRAME_WIDTH = 1000
Constants.FRAME_HEIGHT = 700
Constants.MIN_FRAME_WIDTH = 600
Constants.MIN_FRAME_HEIGHT = 400

-- Color constants
Constants.COLORS = {
    PRIMARY = "33FF99",
    ACCENT = "FFD700",
    ERROR = "FF6B6B",
    WARNING = "FFA500",
    SUCCESS = "33FF99",
    INFO = "87CEEB",
    DISABLED = "808080",
    WHITE = "FFFFFF",
    BLACK = "000000",
}

-- Permission levels
Constants.PERMISSIONS = {
    ANYONE = 0,
    MEMBER = 1,
    OFFICER = 2,
    GUILDMASTER = 3,
}

-- Profession names
Constants.PROFESSIONS = {
    [164] = "Blacksmithing",
    [165] = "Leatherworking",
    [171] = "Alchemy",
    [182] = "Herbalism",
    [186] = "Mining",
    [201] = "Engineering",
    [202] = "Enchanting",
    [333] = "Skinning",
    [393] = "Tailoring",
    [755] = "Jewelcrafting",
    [773] = "Inscription",
    [794] = "Archaeology",
    [821] = "Cooking",
    [822] = "First Aid",
    [823] = "Fishing",
}

-- Activity status indicators
Constants.ACTIVITY_STATUS = {
    ONLINE = "online",
    AWAY = "away",
    OFFLINE = "offline",
}

-- Transaction types
Constants.TRANSACTION_TYPES = {
    DEPOSIT = "deposit",
    WITHDRAWAL = "withdrawal",
    MOVE = "move",
}

-- Rank thresholds (in days)
Constants.ACTIVITY_THRESHOLDS = {
    ACTIVE = 7,
    INACTIVE = 30,
    DORMANT = 90,
    STALE = 180,
}

-- Event types
Constants.EVENT_TYPES = {
    JOINED = "joined",
    LEFT = "left",
    KICKED = "kicked",
    PROMOTED = "promoted",
    DEMOTED = "demoted",
    BANK_DEPOSIT = "bank_deposit",
    BANK_WITHDRAWAL = "bank_withdrawal",
    PROFESSION_UPDATED = "profession_updated",
}

GuildTools.Constants = Constants
return Constants
