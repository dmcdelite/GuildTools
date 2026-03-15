-- GuildTools/Core/Debug.lua
-- Debug and logging utilities for GuildTools addon

local addonName, GuildTools = ...

local Debug = {}
Debug.enabled = false
Debug.logLevel = "info"
Debug.logs = {}
Debug.maxLogs = 1000

function Debug:Enable()
    self.enabled = true
    self:Print("Debug mode enabled")
end

function Debug:Disable()
    self.enabled = false
end

function Debug:Toggle()
    if self.enabled then
        self:Disable()
    else
        self:Enable()
    end
end

function Debug:Print(msg, level)
    level = level or "info"
    local prefix = string.format("|cFF33FF99[GuildTools]|r")
    
    if level == "error" then
        prefix = prefix .. " |cFFFF6B6B[ERROR]|r"
    elseif level == "warning" then
        prefix = prefix .. " |cFFFFA500[WARN]|r"
    elseif level == "debug" then
        if not self.enabled then return end
        prefix = prefix .. " |cFF87CEEB[DEBUG]|r"
    end
    
    print(prefix .. " " .. msg)
end

function Debug:Log(msg, level)
    level = level or "info"
    
    local logEntry = {
        timestamp = time(),
        level = level,
        message = msg,
    }
    
    table.insert(self.logs, logEntry)
    
    if #self.logs > self.maxLogs then
        table.remove(self.logs, 1)
    end
end

function Debug:PrintLog(msg, level)
    self:Print(msg, level)
    self:Log(msg, level)
end

function Debug:LogDebug(msg)
    self:PrintLog(msg, "debug")
end

function Debug:LogInfo(msg)
    self:PrintLog(msg, "info")
end

function Debug:LogWarning(msg)
    self:PrintLog(msg, "warning")
end

function Debug:LogError(msg)
    self:PrintLog(msg, "error")
end

function Debug:GetLogs(level)
    if not level then
        return self.logs
    end
    
    local filtered = {}
    for _, entry in ipairs(self.logs) do
        if entry.level == level then
            table.insert(filtered, entry)
        end
    end
    return filtered
end

function Debug:ClearLogs()
    self.logs = {}
    self:Print("Debug logs cleared")
end

function Debug:DumpTable(t, name, indent)
    indent = indent or 0
    name = name or "table"
    local prefix = string.rep("  ", indent)
    
    print(prefix .. name .. " = {")
    for k, v in pairs(t) do
        if type(v) == "table" then
            self:DumpTable(v, k, indent + 1)
        else
            print(prefix .. "  " .. k .. " = " .. tostring(v))
        end
    end
    print(prefix .. "}")
end

function Debug:Assert(condition, msg)
    if not condition then
        self:LogError("Assertion failed: " .. (msg or "no message"))
        return false
    end
    return true
end

GuildTools.Debug = Debug
return Debug
