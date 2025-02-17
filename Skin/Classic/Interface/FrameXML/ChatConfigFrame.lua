local _, private = ...
if private.isRetail then return end

--[[ Lua Globals ]]
-- luacheck: globals ipairs type select

--[[ Core ]]
local Aurora = private.Aurora
local Base = Aurora.Base
local Hook, Skin = Aurora.Hook, Aurora.Skin
local Color, Util = Aurora.Color, Aurora.Util

do --[[ FrameXML\ChatConfigFrame.lua ]]
    function Hook.ChatConfig_CreateCheckboxes(frame, checkBoxTable, checkBoxTemplate, title)
        local checkBoxNameString = frame:GetName().."CheckBox"

        for index, value in ipairs(checkBoxTable) do
            local checkBoxName = checkBoxNameString..index
            if not _G[checkBoxName]._auroraSkinned then
                Skin[checkBoxTemplate](_G[checkBoxName])
                _G[checkBoxName]._auroraSkinned = true
            end
        end
    end
    function Hook.ChatConfig_CreateTieredCheckboxes(frame, checkBoxTable, checkBoxTemplate, subCheckBoxTemplate, columns, spacing)
        local checkBoxNameString = frame:GetName().."CheckBox"

        for index, value in ipairs(checkBoxTable) do
            local checkBoxName = checkBoxNameString..index
            Skin[checkBoxTemplate](_G[checkBoxName])

            if value.subTypes then
                local subCheckBoxNameString = checkBoxName.."_"
                for i, v in ipairs(value.subTypes) do
                    Skin[subCheckBoxTemplate](_G[subCheckBoxNameString..i])
                end
            end
        end
    end
    function Hook.ChatConfig_CreateColorSwatches(frame, swatchTable, swatchTemplate, title)
        local nameString = frame:GetName().."Swatch"

        for index, value in ipairs(swatchTable) do
            local swatchName = nameString..index
            Skin[swatchTemplate](_G[swatchName])
        end
    end
    function Hook.TextToSpeechFrame_CreateCheckboxes(frame, checkBoxTable, checkBoxTemplate)
        local checkBoxNameString = frame:GetName().."CheckBox"

        for index, value in ipairs(checkBoxTable) do
            local checkBoxName = checkBoxNameString..index
            Skin[checkBoxTemplate](_G[checkBoxName])

            if value.subTypes then
                local subCheckBoxNameString = checkBoxName.."_"
                for i, v in ipairs(value.subTypes) do
                    Skin[subCheckBoxTemplate](_G[subCheckBoxNameString..i])
                end
            end
        end
    end
end

do --[[ FrameXML\ChatConfigFrame.xml ]]
    Skin.ConfigCategoryButtonTemplate = private.nop
    function Skin.ConfigFilterButtonTemplate(Button)
        Skin.ConfigCategoryButtonTemplate(Button)
    end
    function Skin.ChatConfigBoxTemplate(Frame)
        Util.HideNineSlice(Frame)
    end
    function Skin.ChatConfigBoxWithHeaderTemplate(Frame)
        Skin.ChatConfigBoxTemplate(Frame)
    end
    function Skin.WideChatConfigBoxWithHeaderAndClassColorsTemplate(Frame)
        Skin.ChatConfigBoxWithHeaderTemplate(Frame)
    end

    function Skin.ChatConfigBaseCheckButtonTemplate(CheckButton)
        Skin.UICheckButtonTemplate(CheckButton) -- BlizzWTF: Doesn't use the template
    end
    function Skin.ChatConfigCheckButtonTemplate(CheckButton)
        Skin.ChatConfigBaseCheckButtonTemplate(CheckButton)
    end
    function Skin.ChatConfigSmallCheckButtonTemplate(CheckButton)
        Skin.ChatConfigBaseCheckButtonTemplate(CheckButton)
    end
    function Skin.ChatConfigCheckBoxTemplate(Frame)
        Base.SetBackdrop(Frame, Color.frame)
        Frame:SetBackdropBorderColor(Color.button)
        Frame:SetBackdropOption("offsets", {
            left = 3,
            right = 2,
            top = 2,
            bottom = 2,
        })

        Skin.ChatConfigCheckButtonTemplate(Frame.CheckButton)
    end
    function Skin.ChatConfigCheckBoxSmallTemplate(Frame)
        Skin.ChatConfigBaseCheckButtonTemplate(Frame.CheckButton)
    end
    function Skin.ChatConfigCheckButtonTemplate(CheckButton)
        Skin.ChatConfigBaseCheckButtonTemplate(CheckButton)
    end
    function Skin.TextToSpeechChatTypeCheckButtonTemplate(CheckButton)
        Skin.ChatConfigBaseCheckButtonTemplate(CheckButton)
    end
    function Skin.ChatConfigCheckBoxWithSwatchTemplate(Frame)
        Skin.ChatConfigCheckBoxTemplate(Frame)
        Skin.ColorSwatchTemplate(Frame.ColorSwatch)
    end
    function Skin.ChatConfigWideCheckBoxWithSwatchTemplate(Frame)
        Skin.ChatConfigCheckBoxWithSwatchTemplate(Frame)
    end
    function Skin.MovableChatConfigWideCheckBoxWithSwatchTemplate(Frame)
        Skin.ChatConfigWideCheckBoxWithSwatchTemplate(Frame)
        Frame.ArtOverlay.GrayedOut:SetPoint("TOPLEFT")
    end
    function Skin.ChatConfigSwatchTemplate(Frame)
        Base.SetBackdrop(Frame, Color.frame)
        Frame:SetBackdropBorderColor(Color.button)
        Frame:SetBackdropOption("offsets", {
            left = 3,
            right = 2,
            top = 2,
            bottom = 2,
        })

        Skin.ColorSwatchTemplate(_G[Frame:GetName().."ColorSwatch"])
    end
    function Skin.ChatConfigTabTemplate(Button)
        local name = Button:GetName()
        _G[name.."Left"]:Hide()
        _G[name.."Middle"]:Hide()
        _G[name.."Right"]:Hide()

        _G[name.."Text"]:SetHeight(0)
        _G[name.."Text"]:SetPoint("LEFT", 0, -5)
        _G[name.."Text"]:SetPoint("RIGHT", 0, -5)
        Button:GetHighlightTexture():Hide()
    end
    function Skin.ChatWindowTab(Button)
        Skin.ChatTabArtTemplate(Button)
    end


    -- not a template
    function Skin.ChatConfigMoveFilter(Button, direction)
        Skin.FrameTypeButton(Button)
        Button:SetBackdropOption("offsets", {
            left = 6,
            right = 6,
            top = 7,
            bottom = 7,
        })

        local bg = Button:GetBackdropTexture("bg")
        local arrow = Button:CreateTexture(nil, "ARTWORK")
        arrow:SetPoint("TOPLEFT", bg, 2, -4)
        arrow:SetSize(10, 5)

        Base.SetTexture(arrow, "arrow"..direction)
        Button._auroraTextures = {arrow}
    end
end

function private.FrameXML.ChatConfigFrame()
    _G.hooksecurefunc("ChatConfig_CreateCheckboxes", Hook.ChatConfig_CreateCheckboxes)
    _G.hooksecurefunc("ChatConfig_CreateTieredCheckboxes", Hook.ChatConfig_CreateTieredCheckboxes)
    _G.hooksecurefunc("ChatConfig_CreateColorSwatches", Hook.ChatConfig_CreateColorSwatches)
    _G.hooksecurefunc("TextToSpeechFrame_CreateCheckboxes", Hook.TextToSpeechFrame_CreateCheckboxes)

    local ChatConfigFrame = _G.ChatConfigFrame
    Skin.DialogBorderTemplate(ChatConfigFrame)

    _G.ChatConfigFrameHeader:Hide()
    _G.ChatConfigFrameHeaderText:ClearAllPoints()
    _G.ChatConfigFrameHeaderText:SetPoint("TOPLEFT")
    _G.ChatConfigFrameHeaderText:SetPoint("BOTTOMRIGHT", _G.ChatConfigFrame, "TOPRIGHT", 0, -private.FRAME_TITLE_HEIGHT)

    Skin.ChatConfigBoxTemplate(_G.ChatConfigCategoryFrame)
    Skin.ConfigCategoryButtonTemplate(_G.ChatConfigCategoryFrameButton1)
    Skin.ConfigCategoryButtonTemplate(_G.ChatConfigCategoryFrameButton2)
    Skin.ConfigCategoryButtonTemplate(_G.ChatConfigCategoryFrameButton3)
    Skin.ConfigCategoryButtonTemplate(_G.ChatConfigCategoryFrameButton4)
    Util.Mixin(ChatConfigFrame.ChatTabManager.tabPool, Hook.ObjectPoolMixin)
    Skin.ChatConfigBoxTemplate(_G.ChatConfigBackgroundFrame)

    local divider = _G.ChatConfigFrame:CreateTexture()
    divider:SetPoint("TOPLEFT", _G.ChatConfigCategoryFrame, "TOPRIGHT")
    divider:SetPoint("BOTTOMRIGHT", _G.ChatConfigBackgroundFrame, "BOTTOMLEFT", 0, 60)
    divider:SetColorTexture(1, 1, 1, .2)

    Skin.WideChatConfigBoxWithHeaderAndClassColorsTemplate(_G.ChatConfigChatSettingsLeft)
    Skin.WideChatConfigBoxWithHeaderAndClassColorsTemplate(_G.ChatConfigChannelSettingsLeft)
    Skin.ChatConfigBoxWithHeaderTemplate(_G.ChatConfigOtherSettingsCombat)
    Skin.ChatConfigBoxWithHeaderTemplate(_G.ChatConfigOtherSettingsPVP)
    Skin.ChatConfigBoxWithHeaderTemplate(_G.ChatConfigOtherSettingsSystem)
    Skin.ChatConfigBoxWithHeaderTemplate(_G.ChatConfigOtherSettingsCreature)

    Skin.UIPanelButtonTemplate(ChatConfigFrame.DefaultButton)
    ChatConfigFrame.DefaultButton:SetPoint("BOTTOMLEFT", 10, 10)
    Skin.UIPanelButtonTemplate(ChatConfigFrame.RedockButton)
    ChatConfigFrame.RedockButton:SetPoint("BOTTOMLEFT", ChatConfigFrame.DefaultButton, "BOTTOMRIGHT", 5, 0)
    Skin.UIPanelButtonTemplate(ChatConfigFrame.ToggleChatButton)
    ChatConfigFrame.ToggleChatButton:SetPoint("BOTTOMLEFT", ChatConfigFrame.RedockButton, "BOTTOMRIGHT", 5, 0)

    Skin.UIPanelButtonTemplate(_G.CombatLogDefaultButton)

    Skin.UIPanelButtonTemplate(_G.TextToSpeechDefaultButton)
    Skin.UICheckButtonTemplate(_G.TextToSpeechCharacterSpecificButton)

    --Skin.UIPanelButtonTemplate(_G.ChatConfigFrameCancelButton) -- BlizzWTF: Not used?
    Skin.UIPanelButtonTemplate(_G.ChatConfigFrameOkayButton)
    _G.ChatConfigFrameOkayButton:ClearAllPoints()
    _G.ChatConfigFrameOkayButton:SetPoint("BOTTOMRIGHT", -10, 10)

    -------------------------
    -- Combat Log Settings --
    -------------------------
    Skin.ChatConfigBoxTemplate(_G.ChatConfigCombatSettingsFilters)
    Skin.FauxScrollFrameTemplateLight(_G.ChatConfigCombatSettingsFiltersScrollFrame)
    _G.ChatConfigCombatSettingsFiltersScrollFrame:SetPoint("TOPLEFT", 5, -5)
    _G.ChatConfigCombatSettingsFiltersScrollFrame:SetPoint("BOTTOMRIGHT", -19, 5)
    Skin.ConfigFilterButtonTemplate(_G.ChatConfigCombatSettingsFiltersButton1)
    Skin.ConfigFilterButtonTemplate(_G.ChatConfigCombatSettingsFiltersButton2)
    Skin.ConfigFilterButtonTemplate(_G.ChatConfigCombatSettingsFiltersButton3)
    Skin.ConfigFilterButtonTemplate(_G.ChatConfigCombatSettingsFiltersButton4)
    Skin.UIPanelButtonTemplate(_G.ChatConfigCombatSettingsFiltersDeleteButton)
    Skin.UIPanelButtonTemplate(_G.ChatConfigCombatSettingsFiltersAddFilterButton)
    _G.ChatConfigCombatSettingsFiltersAddFilterButton:SetPoint("RIGHT", _G.ChatConfigCombatSettingsFiltersDeleteButton, "LEFT", -5, 0)
    Skin.UIPanelButtonTemplate(_G.ChatConfigCombatSettingsFiltersCopyFilterButton)
    _G.ChatConfigCombatSettingsFiltersCopyFilterButton:SetPoint("RIGHT", _G.ChatConfigCombatSettingsFiltersAddFilterButton, "LEFT", -5, 0)
    Skin.ChatConfigMoveFilter(_G.ChatConfigMoveFilterUpButton, "Up")
    Skin.ChatConfigMoveFilter(_G.ChatConfigMoveFilterDownButton, "Down")
    _G.ChatConfigMoveFilterDownButton:SetPoint("LEFT", _G.ChatConfigMoveFilterUpButton, "RIGHT", -5, 0)

    -- MessageSources --
    Skin.ChatConfigBoxWithHeaderTemplate(_G.CombatConfigMessageSourcesDoneBy)
    Skin.ChatConfigBoxWithHeaderTemplate(_G.CombatConfigMessageSourcesDoneTo)

    -- MessageTypes --

    -- Colors --
    Skin.ChatConfigBoxWithHeaderTemplate(_G.CombatConfigColorsUnitColors)
    Util.HideNineSlice(_G.CombatConfigColorsHighlighting)
    Skin.ChatConfigSmallCheckButtonTemplate(_G.CombatConfigColorsHighlightingLine)
    Skin.ChatConfigSmallCheckButtonTemplate(_G.CombatConfigColorsHighlightingAbility)
    Skin.ChatConfigSmallCheckButtonTemplate(_G.CombatConfigColorsHighlightingDamage)
    Skin.ChatConfigSmallCheckButtonTemplate(_G.CombatConfigColorsHighlightingSchool)

    Util.HideNineSlice(_G.CombatConfigColorsColorizeUnitName)
    Skin.ChatConfigCheckButtonTemplate(_G.CombatConfigColorsColorizeUnitNameCheck)
    Util.HideNineSlice(_G.CombatConfigColorsColorizeSpellNames)
    Skin.ChatConfigCheckButtonTemplate(_G.CombatConfigColorsColorizeSpellNamesCheck)
    Skin.ChatConfigSmallCheckButtonTemplate(_G.CombatConfigColorsColorizeSpellNamesSchoolColoring)
    Skin.ColorSwatchTemplate(_G.CombatConfigColorsColorizeSpellNamesColorSwatch)
    Util.HideNineSlice(_G.CombatConfigColorsColorizeDamageNumber)
    Skin.ChatConfigCheckButtonTemplate(_G.CombatConfigColorsColorizeDamageNumberCheck)
    Skin.ChatConfigSmallCheckButtonTemplate(_G.CombatConfigColorsColorizeDamageNumberSchoolColoring)
    Skin.ColorSwatchTemplate(_G.CombatConfigColorsColorizeDamageNumberColorSwatch)
    Util.HideNineSlice(_G.CombatConfigColorsColorizeDamageSchool)
    Skin.ChatConfigCheckButtonTemplate(_G.CombatConfigColorsColorizeDamageSchoolCheck)
    Util.HideNineSlice(_G.CombatConfigColorsColorizeEntireLine)
    Skin.ChatConfigCheckButtonTemplate(_G.CombatConfigColorsColorizeEntireLineCheck)
    Skin.UIRadioButtonTemplate(_G.CombatConfigColorsColorizeEntireLineBySource)
    Skin.UIRadioButtonTemplate(_G.CombatConfigColorsColorizeEntireLineByTarget)

    -- Formatting --
    Skin.ChatConfigCheckButtonTemplate(_G.CombatConfigFormattingShowTimeStamp)
    Skin.ChatConfigCheckButtonTemplate(_G.CombatConfigFormattingShowBraces)
    Skin.ChatConfigSmallCheckButtonTemplate(_G.CombatConfigFormattingUnitNames)
    Skin.ChatConfigSmallCheckButtonTemplate(_G.CombatConfigFormattingSpellNames)
    Skin.ChatConfigSmallCheckButtonTemplate(_G.CombatConfigFormattingItemNames)
    Skin.ChatConfigCheckButtonTemplate(_G.CombatConfigFormattingFullText)

    -- Settings --
    Skin.InputBoxTemplate(_G.CombatConfigSettingsNameEditBox)
    Skin.UIPanelButtonTemplate(_G.CombatConfigSettingsSaveButton)
    Skin.ChatConfigCheckButtonTemplate(_G.CombatConfigSettingsShowQuickButton)
    Skin.ChatConfigSmallCheckButtonTemplate(_G.CombatConfigSettingsSolo)
    Skin.ChatConfigSmallCheckButtonTemplate(_G.CombatConfigSettingsParty)
    Skin.ChatConfigSmallCheckButtonTemplate(_G.CombatConfigSettingsRaid)

    for index, value in ipairs(_G.COMBAT_CONFIG_TABS) do
        Skin.ChatConfigTabTemplate(_G[_G.CHAT_CONFIG_COMBAT_TAB_NAME..index])
    end

    -- Text to Speech --
    Skin.ChatConfigCheckButtonTemplate(_G.TextToSpeechFramePanelContainer.PlaySoundSeparatingChatLinesCheckButton)
    Skin.ChatConfigCheckButtonTemplate(_G.TextToSpeechFramePanelContainer.AddCharacterNameToSpeechCheckButton)
    Skin.ChatConfigCheckButtonTemplate(_G.TextToSpeechFramePanelContainer.PlayActivitySoundWhenNotFocusedCheckButton)
    Skin.ChatConfigCheckButtonTemplate(_G.TextToSpeechFramePanelContainer.NarrateMyMessagesCheckButton)
    Skin.ChatConfigCheckButtonTemplate(_G.TextToSpeechFramePanelContainer.UseAlternateVoiceForSystemMessagesCheckButton)
    Skin.UIPanelButtonTemplate(_G.TextToSpeechFramePlaySampleButton)
    Skin.UIPanelButtonTemplate(_G.TextToSpeechFramePlaySampleAlternateButton)
    Skin.UIDropDownMenuTemplate(_G.TextToSpeechFrameTtsVoiceDropdown)
    Skin.UIDropDownMenuTemplate(_G.TextToSpeechFrameTtsVoiceAlternateDropdown)
    Skin.OptionsSliderTemplate(_G.TextToSpeechFrameAdjustRateSlider)
    Skin.OptionsSliderTemplate(_G.TextToSpeechFrameAdjustVolumeSlider)


end
