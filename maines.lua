--[[ 

    ADDON NAME: Maines

    DESCRIPTION: Take your main name to the chat frame then gtfo

    ADDON_AUTHOR: Dominic / Radine - EU - Alliance - Silvermoon

    NOTES: Was so tired of seeing other addons not be customizable and up to scratch; then made this!

    STAMP: SIGHT [o] 
    

    WHAT IS STAMP and SIGHT [o]?
    getting bored of the version ; alpha, beta, release so changed it to stamps ;)
    you can decide; where it's at in development... by using it. (beta)
    

    NEXT FEATURES TO IMPLEMENT:
    Slash commands to set your maines
    more customizable nameology features for your maines
    much better aesthetics for maines interface,etc
    paypal donation button for those who are kindest

    "you'll have to watch out for the next update"

    What will the stamp be next time?

    PLEASE DO POST COMMENTS , SUGGESTIONS, ETC 
    AT CURSEFORGE COMMENT SECTION

 ]]

local maines = LibStub("AceAddon-3.0"):NewAddon("Maines", "AceConsole-3.0", "AceHook-3.0")

local AceGUI = LibStub("AceGUI-3.0")
edited_message = ""
bracket_left_option = ""
bracket_right_option = ""
FontPath = [[Interface\AddOns\Maines\fonts\adventure\Adventure.ttf]]

Mains_Name = ""
maines_frame = CreateFrame("Frame", "Maines_Frame", UIParent)

command_toggle = false

SLASH_MAINES1 = '/maines';

function maines:OnInitialize()
    self:RawHook("SendChatMessage", true)

    character_name = UnitName("player")

    maines_frame:SetPoint("CENTER")
    maines_frame:SetSize(512, 512)
    maines_frame:SetMovable(true)
    maines_frame:EnableMouse(true);
    maines_frame:SetFrameStrata("BACKGROUND")
    maines_frame:RegisterForDrag("LeftButton");
    maines_frame:SetScript("OnDragStart", maines_frame.StartMoving);
    maines_frame:SetScript("OnDragStop", maines_frame.StopMovingOrSizing);
    maines_close_button:Hide()
    maines_frame:Hide()
    maines_frame.tex = maines_frame:CreateTexture()
    maines_frame.tex:SetAllPoints(maines_frame)

    maines_frame.tex:SetTexture("Interface\\Addons\\Maines\\img\\bg")
    maines_frame.tex:SetAllPoints()
    
    maines_editbox = CreateFrame("EditBox", nil, maines_frame, "InputBoxTemplate")
    maines_editbox:SetSize(120,20)
    maines_editbox:SetWidth(200)
    maines_editbox:SetPoint("CENTER", 0, -8)
    maines_editbox:SetFrameStrata("LOW")
    maines_editbox:SetAutoFocus(false)
    maines_editbox:SetTextInsets(74,20,0,0)

    maines_editbox:SetScript("OnEnterPressed", function(self)
        Mains_Name = self:GetText()
        print("Your maines is", Mains_Name .. ": D")
    end)

end


Maines_Option_Panel = CreateFrame("Frame", "Maines_Option_Panel", UIParent)
Maines_Option_Panel.name = "Maines"
Maines_Option_Panel.cancel = function (self) 
    print("you canceled shit!")

end


Maines_Option_Panel.initialized = true



maines_close_button = CreateFrame("Button", "maines_close_button", maines_frame)

maines_close_button:SetPoint("CENTER", 232, 232)
maines_close_button:SetWidth(64)
maines_close_button:SetHeight(64)
maines_close_button:SetNormalFontObject("GameFontNormal")

maines_close_button_texture = maines_close_button:CreateTexture()

maines_close_button_texture:SetTexture("Interface\\Addons\\Maines\\img\\closebutton")
maines_close_button_texture:SetAllPoints()
maines_close_button:SetNormalTexture(maines_close_button_texture)

maines_close_button:SetScript("OnClick", function(self, button, down)
        if button == "LeftButton" then
            maines_close_button:Hide()
            maines_frame:Hide()
            print("YOU CLICKED THE LEFT BUTTON")
        elseif button == "RightButton" then
            print("You clicked the right button")
    end
end)

local Maines_Option_Panel_BG = CreateFrame("Frame", "Maines_Option_Panel_BG", Maines_Option_Panel, UIParent)
Maines_Option_Panel_BG:SetPoint("CENTER")
Maines_Option_Panel_BG:SetSize(512, 512)

Maines_Option_Panel_BG.tex = Maines_Option_Panel_BG:CreateTexture()
Maines_Option_Panel_BG.tex:SetAllPoints(Maines_Option_Panel_BG )
Maines_Option_Panel_BG.tex:SetTexture("Interface\\Addons\\Maines\\img\\maines_option_panel_bg")

Circle_Bracket_Button = CreateFrame("CheckButton", "Circle_Bracket_Button_GN", Maines_Option_Panel, "UIRadioButtonTemplate")
Circle_Bracket_Button:SetPoint("CENTER", -67, 19)  -- Set the position of the checkbox
Circle_Bracket_Button:SetFrameStrata("DIALOG")
Circle_Bracket_Button.tooltip = "Circle Bracket ( MAIN NAME )"  -- Set the checkbox label

Circle_Bracket_Button:HookScript("OnClick", function()
    Extra_Space = ""
  bracket_left_option = " ( "
  bracket_right_option = " ) "
end)

Square_Bracket_Button = CreateFrame("CheckButton", "Square_Bracket_Button_GN", Maines_Option_Panel, "UIRadioButtonTemplate")
Square_Bracket_Button:SetPoint("CENTER", -21, 19)  -- Set the position of the checkbox
Square_Bracket_Button:SetFrameStrata("DIALOG")
Square_Bracket_Button.tooltip = "Square Bracket ( MAIN NAME )"  -- Set the checkbox label
Square_Bracket_Button:HookScript("OnClick", function()
    Extra_Space = ""
    bracket_left_option = " [ "
    bracket_right_option = " ] "
  end)


ButterFly_Bracket_Button = CreateFrame("CheckButton", "ButterFly_Bracket_Button_GN", Maines_Option_Panel, "UIRadioButtonTemplate")
ButterFly_Bracket_Button:SetPoint("CENTER", 23, 19)  -- Set the position of the checkbox
ButterFly_Bracket_Button:SetFrameStrata("DIALOG")
ButterFly_Bracket_Button.tooltip = "ButterFly Bracket ( MAIN NAME )"  -- Set the checkbox label
ButterFly_Bracket_Button:HookScript("OnClick", function()
    Extra_Space = ""
    bracket_left_option = " { "
    bracket_right_option = " } "
  end)


Crocodile_Bracket_Button = CreateFrame("CheckButton", "Crocodile_Bracket_Button_GN", Maines_Option_Panel, "UIRadioButtonTemplate")
Crocodile_Bracket_Button:SetPoint("CENTER", 66, 19)  -- Set the position of the checkbox
Crocodile_Bracket_Button:SetFrameStrata("DIALOG")
Crocodile_Bracket_Button.tooltip = "Crocodile Bracket ( MAIN NAME )"  -- Set the checkbox label
Crocodile_Bracket_Button:HookScript("OnClick", function()
    Extra_Space = ""
    bracket_left_option = " < "
    bracket_right_option = " > "
  end)

InterfaceOptions_AddCategory(Maines_Option_Panel)

function maines:SendChatMessage(msg, chatType, language, channel)
 
   if chatType == "GUILD" then
    Extra_Space = ""
    edited_message = bracket_left_option .. Mains_Name .. bracket_right_option ..  msg 
   end 

   if chatType == "OFFICER" then

    edited_message =  bracket_left_option .. Mains_Name .. bracket_right_option ..  msg 
   end

   if chatType == "RAID" then
 
    edited_message =  bracket_left_option .. Mains_Name .. bracket_right_option ..  msg 
   end

   if chatType == "INSTANCE_CHAT" then

    edited_message =  bracket_left_option .. Mains_Name .. bracket_right_option ..  msg 
   end

   if chatType == "SAY" then
 
    edited_message =  bracket_left_option .. Mains_Name .. bracket_right_option ..  msg 
   end

   if chatType == "WHISPER" then
    
    msg = msg
    edited_message =  bracket_left_option .. Mains_Name .. bracket_right_option ..  msg 
   end
 

   self.hooks.SendChatMessage(edited_message, chatType, language, channel)
end

SlashCmdList["MAINES"] = function(maines_name_command, editBox)

    maines_close_button:Show()
    maines_frame:Show()

end

local miniButton = LibStub("LibDataBroker-1.1"):NewDataObject("Maines", {

	type = "data source",
	
	text = "maines",
	
	icon = "interface\\AddOns\\Maines\\img\\maines_minimap_icon",
	
	OnClick = function(self, btn)
	
		if FrameToggle == false then
			FrameToggle = true
            maines_close_button:Hide()
			maines_frame:Hide()

		else 
			FrameToggle = false
            maines_close_button:Show()
			maines_frame:Show()
		end
		
	end,
	
	OnTooltipShow = function(tooltip)
	
		if not tooltip or not tooltip.AddLine then return end
	
		tooltip:AddLine("Maines")
	
	end,
	
	})
	
	local icon = LibStub("LibDBIcon-1.0", true)
	
	icon:Register("Maines", miniButton, Maines_DB)


	icon:Show(Maines_DB)
