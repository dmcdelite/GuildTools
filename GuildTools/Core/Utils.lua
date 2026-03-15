-- GuildTools/Core/Utils.lua
-- Utility functions for GuildTools addon

local addonName, GuildTools = ...

local Utils = {}

-- String utilities
function Utils:Trim(str)
    return str:match("^%s*(.-)%s*$")
end

function Utils:Split(str, delimiter)
    local result = {}
    for match in (str .. delimiter):gmatch("(.-)" .. delimiter) do
        table.insert(result, match)
    end
    return result
end

function Utils:StartsWith(str, prefix)
    return str:sub(1, #prefix) == prefix
end

function Utils:EndsWith(str, suffix)
    return str:sub(-#suffix) == suffix
end

-- Table utilities
function Utils:TableLength(t)
    local count = 0
    for _ in pairs(t) do count = count + 1 end
    return count
end

function Utils:TableCopy(t)
    local result = {}
    for k, v in pairs(t) do
        if type(v) == "table" then
            result[k] = Utils:TableCopy(v)
        else
            result[k] = v
        end
    end
    return result
end

function Utils:TableMerge(t1, t2)
    local result = Utils:TableCopy(t1)
    for k, v in pairs(t2) do
        result[k] = v
    end
    return result
end

function Utils:TableFilter(t, predicate)
    local result = {}
    for k, v in pairs(t) do
        if predicate(v, k) then
            result[k] = v
        end
    end
    return result
end

function Utils:TableMap(t, fn)
    local result = {}
    for k, v in pairs(t) do
        result[k] = fn(v, k)
    end
    return result
end

-- Number utilities
function Utils:FormatNumber(num)
    if num >= 1000000 then
        return string.format("%.1fM", num / 1000000)
    elseif num >= 1000 then
        return string.format("%.1fK", num / 1000)
    else
        return tostring(num)
    end
end

function Utils:FormatCurrency(amount)
    local gold = math.floor(amount / 10000)
    local silver = math.floor((amount % 10000) / 100)
    local copper = amount % 100
    return string.format("%dg %ds %dc", gold, silver, copper)
end

function Utils:Round(num, decimals)
    local multiplier = 10 ^ (decimals or 0)
    return math.floor(num * multiplier + 0.5) / multiplier
end

-- Time utilities
function Utils:FormatTime(seconds)
    if seconds < 60 then
        return math.floor(seconds) .. "s"
    elseif seconds < 3600 then
        return math.floor(seconds / 60) .. "m"
    elseif seconds < 86400 then
        return math.floor(seconds / 3600) .. "h"
    else
        return math.floor(seconds / 86400) .. "d"
    end
end

function Utils:FormatDate(timestamp)
    return date("%Y-%m-%d %H:%M:%S", timestamp)
end

function Utils:GetDaysSince(timestamp)
    return math.floor((time() - timestamp) / 86400)
end

-- Color utilities
function Utils:GetClassColor(className)
    local colors = {
        ["WARRIOR"] = "C79C6E",
        ["MAGE"] = "3FC7EB",
        ["ROGUE"] = "FFF569",
        ["DRUID"] = "FF7D0A",
        ["HUNTER"] = "ABD473",
        ["PRIEST"] = "FFFFFF",
        ["WARLOCK"] = "9482CA",
        ["PALADIN"] = "F58CBA",
        ["DEATHKNIGHT"] = "C41E3A",
        ["SHAMAN"] = "0070DD",
        ["MONK"] = "00FF96",
        ["DEMONHUNTER"] = "A335EE",
        ["EVOKER"] = "33937F",
    }
    return colors[className] or "FFFFFF"
end

function Utils:FormatColor(text, colorHex)
    return string.format("|cff%s%s|r", colorHex, text)
end

-- Array/List utilities
function Utils:Contains(list, value)
    for _, v in ipairs(list) do
        if v == value then return true end
    end
    return false
end

function Utils:IndexOf(list, value)
    for i, v in ipairs(list) do
        if v == value then return i end
    end
    return -1
end

function Utils:RemoveValue(list, value)
    for i, v in ipairs(list) do
        if v == value then
            table.remove(list, i)
            return true
        end
    end
    return false
end

-- Validation utilities
function Utils:IsValidPlayer(name)
    return name and name ~= "" and name ~= "Unknown"
end

function Utils:IsValidGuild(name)
    return name and name ~= "" and IsInGuild()
end

function Utils:IsValidItemLink(itemLink)
    return itemLink and string.find(itemLink, "|H") ~= nil
end

GuildTools.Utils = Utils
return Utils
