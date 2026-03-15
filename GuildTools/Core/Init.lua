local addonName, GuildTools = ...
GuildTools.version = "4.3.0-dev"
GuildTools.build = 20260315
GuildTools.db = {}
GuildTools.config = {}
GuildTools.cache = {}
GuildTools.modules = {}

function GuildTools:InitializeSavedVariables()
    if not GuildToolsDB then
        GuildToolsDB = {
            version = self.version,
            lastUpdate = time(),
            professions = {},
            economy = {},
            members = {},
        }
    end

    if not GuildToolsConfig then
        GuildToolsConfig = {
            uiScale = 1,
            theme = "default",
            minimap = {
                hide = false,
                minimapPos = 225,
            },
            permissions = {},
        }
    end

    self.db = GuildToolsDB
    self.config = GuildToolsConfig
end

function GuildTools:RegisterEvents()
    self.frame = CreateFrame("Frame")
    self.frame:RegisterEvent("ADDON_LOADED")
    self.frame:RegisterEvent("GUILD_ROSTER_UPDATE")
    self.frame:RegisterEvent("PLAYER_LOGIN")
    self.frame:SetScript("OnEvent", function(frame, event, ...)
        GuildTools:OnEvent(event, ...)
    end)
end

function GuildTools:OnEvent(event, ...)
    if event == "ADDON_LOADED" then
        local loadedAddon = ...
        if loadedAddon == addonName then
            self:InitializeSavedVariables()
            self:OnLoad()
        end
    elseif event == "PLAYER_LOGIN" then
        self:OnPlayerLogin()
    elseif event == "GUILD_ROSTER_UPDATE" then
        self:OnGuildRosterUpdate()
    end
end

function GuildTools:OnLoad()
    print("|cFF33FF99GuildTools|r v" .. self.version .. " loaded. Type |cFFFFD700/gt|r for help.")
end

function GuildTools:OnPlayerLogin()
end

function GuildTools:OnGuildRosterUpdate()
end

return GuildTools