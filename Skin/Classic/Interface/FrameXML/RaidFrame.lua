local _, private = ...
if private.isRetail then return end

--[[ Lua Globals ]]
-- luacheck: globals

--[[ Core ]]
local Aurora = private.Aurora
local Skin = Aurora.Skin

--do --[[ FrameXML\RaidFrame.lua ]]
--end

do --[[ FrameXML\RaidFrame.xml ]]
    function Skin.RaidInfoHeaderTemplate(Frame)
        Frame:DisableDrawLayer("BACKGROUND")
    end
end

function private.FrameXML.RaidFrame()
    Skin.UICheckButtonTemplate(_G.RaidFrameAllAssistCheckButton)
    Skin.UIPanelButtonTemplate(_G.RaidFrameConvertToRaidButton)
    Skin.UIPanelButtonTemplate(_G.RaidFrameRaidInfoButton)


    Skin.DialogBorderDarkTemplate(_G.RaidInfoFrame)

    _G.RaidInfoDetailHeader:Hide()
    _G.RaidInfoDetailCorner:Hide()
    _G.RaidInfoHeader:ClearAllPoints()
    _G.RaidInfoHeader:SetPoint("TOPLEFT", 0, -5)
    _G.RaidInfoHeader:SetPoint("BOTTOMRIGHT", _G.RaidInfoFrame, "TOPRIGHT", 0, -private.FRAME_TITLE_HEIGHT)
    _G.RaidInfoFrame:SetPoint("TOPLEFT", _G.RaidFrame, "TOPRIGHT", 1, -28)

    Skin.UIPanelCloseButton(_G.RaidInfoCloseButton)
    Skin.UIPanelScrollFrameTemplate(_G.RaidInfoScrollFrame)
    _G.RaidInfoScrollFrameTop:Hide()
    _G.RaidInfoScrollFrameBottom:Hide()
    
    _G.RaidInfoSubheader:SetPoint("TOPLEFT", _G.RaidInfoHeader, "BOTTOMLEFT", 20, -5)
    _G.RaidInfoInstanceLabel:SetPoint("TOPLEFT", _G.RaidInfoSubheader, "BOTTOMLEFT", 0, -13)
    _G.RaidInfoIDLabel:SetPoint("LEFT", _G.RaidInfoInstanceLabel, "RIGHT", 120, 0)
    
    for i = 1, 5 do
        infoInstance = _G["RaidInfoInstance"..i]
        infoInstanceID = _G["RaidInfoInstance"..i.."ID"]
        infoInstanceID:SetPoint("TOPRIGHT", infoInstance, "TOPRIGHT", 0, -12)
    end
    
end
