local _, private = ...
if private.isRetail then return end

local Color = private.Aurora.Color

private.NORMAL_QUEST_DISPLAY = _G.NORMAL_QUEST_DISPLAY:gsub("ff000000", Color.white.colorStr)
private.TRIVIAL_QUEST_DISPLAY = _G.TRIVIAL_QUEST_DISPLAY:gsub("ff000000", Color.grayLight.colorStr)
private.IGNORED_QUEST_DISPLAY = _G.IGNORED_QUEST_DISPLAY:gsub("ff000000", Color.grayLight.colorStr)

private.FRAME_TITLE_HEIGHT = 27

local Enum = {}
Enum.ItemQuality = {
    Poor = _G.LE_ITEM_QUALITY_POOR or _G.Enum.ItemQuality.Poor,
    Common = _G.LE_ITEM_QUALITY_COMMON or _G.Enum.ItemQuality.Common,
    Uncommon = _G.LE_ITEM_QUALITY_UNCOMMON or _G.Enum.ItemQuality.Uncommon,
    Rare = _G.LE_ITEM_QUALITY_RARE or _G.Enum.ItemQuality.Rare,
    Epic = _G.LE_ITEM_QUALITY_EPIC or _G.Enum.ItemQuality.Epic,
    Legendary = _G.LE_ITEM_QUALITY_LEGENDARY or _G.Enum.ItemQuality.Legendary,
    Artifact = _G.LE_ITEM_QUALITY_ARTIFACT or _G.Enum.ItemQuality.Artifact,
    Heirloom = _G.LE_ITEM_QUALITY_HEIRLOOM or _G.Enum.ItemQuality.Heirloom,
    WoWToken = _G.LE_ITEM_QUALITY_WOW_TOKEN or _G.Enum.ItemQuality.WoWToken,
}
private.Enum = Enum

private.atlasColors = {
    ["_honorsystem-bar-fill"] = Color.Create(1.0, 0.24, 0),
    ["_pvpqueue-conquestbar-fill-yellow"] = Color.Create(.9529, 0.7569, 0.1804),
    ["ChallengeMode-TimerFill"] = Color.Create(0.1490, 0.6196, 1.0),
    ["objectivewidget-bar-fill-left"] = Color.Create(0.1176, 0.2823, 0.7176),
    ["objectivewidget-bar-fill-neutral"] = Color.Create(0.3608, 0.2980, 0.0),
    ["objectivewidget-bar-fill-right"] = Color.Create(0.5765, 0.0, 0.0),
    ["UI-Frame-Bar-Fill-Green"] = Color.Create(0.0941, 0.7647, 0.0157),
    ["UI-Frame-Bar-Fill-Red"] = Color.Create(0.7725, 0.0, 0.0),
    ["UI-Frame-Bar-Fill-Yellow"] = Color.Create(0.9608, 0.6314, 0.0),
    ["UI-Frame-Bar-Fill-Blue"] = Color.Create(0.0667, 0.4470, 0.8745),
}

private.CLASS_BACKGROUND_SETTINGS = {
	["DEFAULT"] = { desaturation = 0.5, alpha = 0.25 },
	["HUNTER"] = { desaturation = 0.5, alpha = 0.45 },
	["MAGE"] = { desaturation = 0.5, alpha = 0.45 },
	["PALADIN"] = { desaturation = 0.5, alpha = 0.21 },
	["ROGUE"] = { desaturation = 0.5, alpha = 0.65 },
	["SHAMAN"] = { desaturation = 0.5, alpha = 0.40 },
	["WARLOCK"] = { desaturation = 0.5, alpha = 0.40 },
}

--function private.FrameXML.Constants()
--end
