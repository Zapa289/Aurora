local _, private = ...
if not private.isRetail then return end

--[[ Lua Globals ]]
-- luacheck: globals

--[[ Core ]]
local Aurora = private.Aurora
local Skin = Aurora.Skin
local Color, Util = Aurora.Color, Aurora.Util

do --[[ FrameXML\CharacterFrameTemplates.xml ]]
    function Skin.CharacterFrameTabButtonTemplate(Button)
        Skin.FrameTypeButton(Button)
        Button:SetButtonColor(Color.frame, Util.GetFrameAlpha(), false)

        local name = Button:GetName()
        Button:SetHeight(28)

        _G[name.."LeftDisabled"]:SetTexture("")
        _G[name.."MiddleDisabled"]:SetTexture("")
        _G[name.."RightDisabled"]:SetTexture("")
        _G[name.."Left"]:SetTexture("")
        _G[name.."Middle"]:SetTexture("")
        _G[name.."Right"]:SetTexture("")
        _G[name.."Text"]:SetPoint("CENTER", Button, "CENTER")
        Button:SetHighlightTexture("")

        Button._auroraTabResize = true
    end
end

--function private.FrameXML.CharacterFrameTemplates()
--end
