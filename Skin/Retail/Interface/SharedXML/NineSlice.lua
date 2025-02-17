local _, private = ...
if not private.isRetail then return end

--[[ Lua Globals ]]
-- luacheck: globals next

--[[ Core ]]
local Aurora = private.Aurora
local Base = Aurora.Base
local Hook, Skin = Aurora.Hook, Aurora.Skin
local Color, Util = Aurora.Color, Aurora.Util

do --[[ SharedXML\NineSlice.lua ]]
    local nineSliceSetup = {
        "TopLeftCorner",
        "TopRightCorner",
        "BottomLeftCorner",
        "BottomRightCorner",
        "TopEdge",
        "BottomEdge",
        "LeftEdge",
        "RightEdge",
        "Center",
    }

    local function BasicFrame(Frame, kit)
        Skin.FrameTypeFrame(Frame)
        Base.SetBackdropColor(Frame, kit.backdrop, Util.GetFrameAlpha())
    end

    local function InsetFrame(Frame, kit)
        Base.SetBackdrop(Frame, kit.backdrop, Color.frame.a)
    end

    local function HideFrame(Frame, kit)
        Base.SetBackdrop(Frame, kit.backdrop, 0)
        Frame:SetBackdropBorderColor(kit.backdrop, 0)
    end

    local layouts = {
        SimplePanelTemplate = BasicFrame,
        PortraitFrameTemplate = BasicFrame,
        PortraitFrameTemplateMinimizable = BasicFrame,
        ButtonFrameTemplateNoPortrait = BasicFrame,
        ButtonFrameTemplateNoPortraitMinimizable = BasicFrame,
        InsetFrameTemplate = HideFrame,
        BFAMissionHorde = BasicFrame,
        BFAMissionAlliance = BasicFrame,
        --CovenantMissionFrame = BasicFrame,
        GenericMetal = BasicFrame,
        Dialog = function(Frame, kit)
            BasicFrame(Frame, kit)
            Frame:SetBackdropOption("offsets", {
                left = 5,
                right = 5,
                top = 5,
                bottom = 5,
            })
        end,
        WoodenNeutralFrameTemplate = BasicFrame,
        Runeforge = BasicFrame,
        AdventuresMissionComplete = InsetFrame,
        CharacterCreateDropdown = BasicFrame,
        --ChatBubble = BasicFrame,
        UniqueCornersLayout = BasicFrame,
        --GMChatRequest = BasicFrame,
        TooltipDefaultLayout = BasicFrame,
        TooltipAzeriteLayout = BasicFrame,
        TooltipCorruptedLayout = BasicFrame,
        TooltipMawLayout = BasicFrame,
        --TooltipGluesLayout = BasicFrame,
        --IdenticalCornersLayoutNoCenter = BasicFrame,
        IdenticalCornersLayout = BasicFrame,

        -- Blizzard_OrderHallTalents
        BFAOrderTalentHorde = BasicFrame,
        BFAOrderTalentAlliance = BasicFrame,

        -- Blizzard_PartyPoseUI
        PartyPoseFrameTemplate = BasicFrame,
        PartyPoseKit = BasicFrame,
    }

    local layoutMap = {}
    for userLayoutName in next, layouts do
        local layout = _G.NineSliceUtil.GetLayout(userLayoutName)
        if layout then
            layoutMap[layout] = userLayoutName
        end
    end

    Hook.NineSliceUtil = {}
    function Hook.NineSliceUtil.ApplyLayout(container, userLayout, textureKit)
        if not container._auroraNineSlice then return end
        if container._applyLayout then return end

        container._applyLayout = true
        local userLayoutName = layoutMap[userLayout]
        if container.debug then
            _G.print("ApplyLayout", container.debug, userLayoutName, textureKit)
        end

        if layouts[userLayoutName] then
            if private.isDev then
                private.debug("Apply layout with textureKit", userLayoutName)
            end
            layouts[userLayoutName](container, Util.GetTextureKit(textureKit))
        else
            if userLayoutName then
                private.debug("Missing skin for nineslice layout", userLayoutName)
            end

            if not container._auroraBackdrop then return end
            container:SetBackdrop(private.backdrop)
            for i = 1, #nineSliceSetup do
                local piece = Util.GetNineSlicePiece(container, nineSliceSetup[i])
                if piece then
                    piece:SetTexture("")
                end
            end
        end
        container._applyLayout = false
    end
    function Hook.NineSliceUtil.AddLayout(userLayoutName, layout)
        layoutMap[layout] = userLayoutName
    end
end

function private.SharedXML.NineSlice()
    Util.Mixin(_G.NineSliceUtil, Hook.NineSliceUtil)
end
