local _, private = ...
if private.isRetail then return end

--[[ Lua Globals ]]
-- luacheck: globals

--[[ Core ]]
local Aurora = private.Aurora
local Skin = Aurora.Skin
local Util = Aurora.Util

--[[ do AddOns\Blizzard_BindingUI.lua
end ]]

do --[[ AddOns\Blizzard_BindingUI.xml ]]
    function Skin.KeyBindingFrameBindingButtonTemplate(Button)
        Skin.UIMenuButtonStretchTemplate(Button)
    end
    function Skin.KeyBindingFrameBindingTemplate(Frame)
        Skin.KeyBindingFrameBindingButtonTemplate(Frame.key1Button)
        Skin.KeyBindingFrameBindingButtonTemplate(Frame.key2Button)
    end
end

function private.AddOns.Blizzard_BindingUI()
    local KeyBindingFrame = _G.KeyBindingFrame
    Skin.DialogBorderTemplate(KeyBindingFrame)

    local header = KeyBindingFrame.header
    header:SetAlpha(0)
    header:GetRegions():Hide()
    header.text:SetParent(KeyBindingFrame)
    header.text:ClearAllPoints()
    header.text:SetPoint("TOPLEFT")
    header.text:SetPoint("BOTTOMRIGHT", KeyBindingFrame, "TOPRIGHT", 0, -private.FRAME_TITLE_HEIGHT)

    Skin.UICheckButtonTemplate(KeyBindingFrame.characterSpecificButton)
    Skin.UIPanelButtonTemplate(KeyBindingFrame.unbindButton)
    Skin.UIPanelButtonTemplate(KeyBindingFrame.okayButton)
    Skin.UIPanelButtonTemplate(KeyBindingFrame.cancelButton)
    Util.PositionRelative("BOTTOMRIGHT", KeyBindingFrame, "BOTTOMRIGHT", -15, 15, 5, "Left", {
        KeyBindingFrame.cancelButton,
        KeyBindingFrame.okayButton,
        KeyBindingFrame.unbindButton
    })

    Skin.UIPanelButtonTemplate(KeyBindingFrame.defaultsButton)
    KeyBindingFrame.defaultsButton:SetPoint("BOTTOMLEFT", 15, 15)

    Skin.OptionsFrameListTemplate(KeyBindingFrame.categoryList)
    Skin.TooltipBorderBackdropTemplate(KeyBindingFrame.bindingsContainer)
    Skin.FauxScrollFrameTemplate(KeyBindingFrame.scrollFrame)
    KeyBindingFrame.scrollFrame.scrollBorderTop:Hide()
    KeyBindingFrame.scrollFrame.scrollBorderBottom:Hide()
    KeyBindingFrame.scrollFrame.scrollBorderMiddle:Hide()
    KeyBindingFrame.scrollFrame.scrollFrameScrollBarBackground:Hide()


    for i = 1, _G.KEY_BINDINGS_DISPLAYED do
        Skin.KeyBindingFrameBindingTemplate(KeyBindingFrame.keyBindingRows[i])
    end
end
