local _, private = ...
if private.isRetail then return end

--[[ Lua Globals ]]
-- luacheck: globals

--[[ Core ]]
local Aurora = private.Aurora
local Skin = Aurora.Skin

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
