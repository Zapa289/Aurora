local _, private = ...
if not private.isRetail then return end

--[[ Lua Globals ]]
-- luacheck: globals

--[[ Core ]]
local Aurora = private.Aurora
local Skin = Aurora.Skin
local Color = Aurora.Color

--do --[[ FrameXML\OptionsPanelTemplates.lua ]]
--end

do --[[ FrameXML\OptionsPanelTemplates.xml ]]
    function Skin.OptionsButtonTemplate(Button)
        Skin.UIPanelButtonTemplate(Button)
    end
    function Skin.OptionsBaseCheckButtonTemplate(CheckButton)
        Skin.UICheckButtonTemplate(CheckButton) -- BlizzWTF: Doesn't use the template
    end

    function Skin.OptionsCheckButtonTemplate(CheckButton)
        Skin.OptionsBaseCheckButtonTemplate(CheckButton)
        CheckButton.Text = _G[CheckButton:GetName().."Text"]
        CheckButton.Text:SetPoint("LEFT", CheckButton, "RIGHT", 3, 0)
    end
    function Skin.OptionsSmallCheckButtonTemplate(CheckButton)
        Skin.OptionsBaseCheckButtonTemplate(CheckButton)
        CheckButton.Text = _G[CheckButton:GetName().."Text"]
        CheckButton.Text:SetPoint("LEFT", CheckButton, "RIGHT", 3, 0)
    end
    function Skin.OptionsSliderTemplate(Slider)
        Skin.HorizontalSliderTemplate(Slider)

        --[[
            Blizz resets the backdrop for these in BlizzardOptionsPanel_OnEvent, so
            we set these vars to ensure our skin remains.
        ]]
        Slider.backdropColor = Color.frame
        Slider.backdropColorAlpha = Color.frame.a
        Slider.backdropBorderColor = Color.button
    end
    function Skin.OptionsDropdownTemplate(Frame)
        Skin.UIDropDownMenuTemplate(Frame)
    end
    function Skin.OptionsBoxTemplate(Frame)
        Skin.TooltipBorderBackdropTemplate(Frame)
    end
end

--function private.FrameXML.OptionsPanelTemplates()
--end
