--[[ 

    ADDON NAME: Maines

    DESCRIPTION: Take your main name to the chat frame then gtfo

    ADDON_AUTHOR: Dominic Hughes / Misamu - EU - Universe of Warcraft - Alliance - Silvermoon

    NOTES: Was so tired of seeing other addons not be customizable and up to scratch; then made this!

    STAMP: AWAKEN [ § ] 
    
    WHAT IS STAMP and AWAKEN [ § ]?
    getting bored of the version ; alpha, beta, release so changed it to stamps ;)
    you can decide; where it's at in development... by using it. (beta-update-3)

    AWAKEN
    
    PRESENT FEATURES:
    Slash commands   /main *mainname* *bracket type*   [ /main trashcan . ] [ /main trashcan : ] [ /main trashcan - ] [ /main trashcan ~ ]
    
    NEXT FEATURES TO IMPLEMENT:
    Graphical User Interface Improvements
    Aesthetic Brackets
    Aesthetic Features
    =========================

    Known Major Bug:
    If using whispering addons the main name might show in the message; just turn off maines for now until it's fixed
    everything else should work fine even using other addon commands if there supported; if not let me know what the command 
        is so it can be added.

    one or two graphics need reworking


    There could be another stamp?

    PLEASE DO POST COMMENTS , SUGGESTIONS, ETC 
    AT CURSEFORGE COMMENT SECTION 

 ]]

 local maines = LibStub("AceAddon-3.0"):NewAddon("Maines","AceHook-3.0")




 FontPath = [[Interface\AddOns\Maines\fonts\adventure\Adventure.ttf]]
 
 maines_frame = CreateFrame("Frame", "Maines_Frame", UIParent)
 maines_frame:RegisterEvent("ADDON_LOADED")
 maines_header_frame = CreateFrame("Frame", "Maines_Header_Frame", maines_frame)
 maines_stamp_frame = CreateFrame("Frame", "Maines_Stamp_Frame", maines_frame)
 maines_option_frame = CreateFrame("Frame", "Maines_Option_Frame", maines_frame)
 maines_command_frame = CreateFrame("ScrollFrame", "Maines_Command_Frame", maines_frame, "UIPanelScrollFrameTemplate")



 
 SLASH_MAINES1 = '/maines'
 SLASH_MAIN1 = '/main'
 SLASH_MAINS1 = '/mains'
 SLASH_MAINCHAT1 = '/mainchat'
 SLASH_MAINMUTE1 = '/mainmute'
 SLASH_MAINMUSIC1 = '/mainmusic'
 SLASH_MAINSTAMP1 = '/mainstamp'
 SLASH_MAINHELP1 = '/mainhelp'
 SLASH_BRACKET1 = '/bracket'
 
--[[  SLASH_CLEAR_CHAT1 = "/clear"

 SlashCmdList.CLEAR_CHAT = function()
	for i = 1, NUM_CHAT_WINDOWS do
		_G[format("ChatFrame%d", i)]:Clear()
	end
end ]]
 
 Maines_Bracket_Color = ""
 bracket_left_option = ""
 Maines_Name = ""
 bracket_right_option = ""
 
 
 _G["PlayedMusic_DB"] = "noplayed"
 _G["Space_Option_DB"] = ""
 
 
 Channel_Types = {
     "GUILD", "OFFICER",
     "RAID", "INSTANCE_CHAT",
     "PARTY", "WHISPER",
     "RAID_WARNING", "EMOTE",
     "VOICE_TEXT","CHANNEL",
     "AFK","DND","SAY","YELL"
    }
    
    
    Maines_Gate_List = {
        "!keys"
    }
    
    Bracket_Option = _G["Maines_Bracket_Option_DB"]

    
    SlashCmdList["MAINMUSIC"] = function(maines_name_command, editBox)
        _G["PlayedMusic_DB"] = "noplayed"  
    end 

SlashCmdList["MAINSTAMP"] = function(maines_name_command, editBox)
   print("The Awaken Stamp [ § ]" )
end 


 
 SlashCmdList["MAINES"] = function(maines_name_command, editBox)
   
    
    maines_close_button:Show()
    maines_frame:Show()
    maines_header_frame:Show()
    maines_command_frame:Show()
    maines_stamp_frame:Show()
    maines_option_frame:Show()
    
    
    if _G["PlayedMusic_DB"]  ~= "played" then
        PlaySoundFile("Interface\\Addons\\Maines\\music\\maines_intro.mp3")
    end
    _G["PlayedMusic_DB"] = "played"
     
 end


 SlashCmdList["MAINS"] = function(maines_name_command, editBox)
    
    
    Maines_Name = string.match(maines_name_command, "(%w+)")
    Maines_Bracket_Square = string.match(maines_name_command, "%[")
    Maines_Bracket_Circle = string.match(maines_name_command, "%(")
    Maines_Bracket_Crocodile = string.match(maines_name_command, "%<")
    Maines_Bracket_Butterfly = string.match(maines_name_command, "%{")
    Maines_Bracket_Dot = string.match(maines_name_command, "%.")
    Maines_Bracket_Double_Dot = string.match(maines_name_command, "%:")
    Maines_Bracket_Line = string.match(maines_name_command, "%-")
    Maines_Bracket_Wave = string.match(maines_name_command, "%~")
    
     if Maines_Bracket_Square == "[" then
        Maines_Name_DB = Maines_Name
        bracket_left_option = "["
        bracket_right_option = "] "
        Maines_Bracket_Color = "|cFF1E90FF"
        Maines_Bracket_Left_DB = bracket_left_option
        Maines_Bracket_Right_DB = bracket_right_option
        Maines_Bracket_Option_DB = "Square Bracket"
        
     end

     if Maines_Bracket_Circle == "(" then
        Maines_Name_DB = Maines_Name
        bracket_left_option = "("
        bracket_right_option = ") "
        Maines_Bracket_Color = "|cFFFF0000"
        Maines_Bracket_Left_DB = bracket_left_option
        Maines_Bracket_Right_DB = bracket_right_option
        Maines_Bracket_Option_DB = "Circle Bracket"
        
     end
     if  Maines_Bracket_Crocodile == "<" then
        Maines_Name_DB = Maines_Name
        bracket_left_option = "<"
        bracket_right_option = "> "
        Maines_Bracket_Color = "|cFF228B22"
        Maines_Bracket_Left_DB = bracket_left_option
        Maines_Bracket_Right_DB = bracket_right_option     
        Maines_Bracket_Option_DB = "Crocodile Bracket"
        
     end

     if  Maines_Bracket_Butterfly == "{" then
        Maines_Name_DB = Maines_Name
        bracket_left_option = "{"
        bracket_right_option = "} "
        Maines_Bracket_Color = "|cFFFFA500"
        Maines_Bracket_Left_DB = bracket_left_option
        Maines_Bracket_Right_DB = bracket_right_option
        Maines_Bracket_Option_DB = "ButterFly Bracket"
       
     end

     if Maines_Bracket_Dot == "." then
        Maines_Name_DB = Maines_Name
        bracket_left_option = "."
        bracket_right_option = ". "
        Maines_Bracket_Color = "|cFFF5F5F5"
        Maines_Bracket_Left_DB = bracket_left_option
        Maines_Bracket_Right_DB = bracket_right_option
        Maines_Bracket_Option_DB = "Dot Bracket"
      
     end

     if Maines_Bracket_Double_Dot == ":" then
        Maines_Name_DB = Maines_Name
        bracket_left_option = ":"
        bracket_right_option = ": "
        Maines_Bracket_Color = "|cFFC8C8C8"
        Maines_Bracket_Left_DB = bracket_left_option
        Maines_Bracket_Right_DB = bracket_right_option
        Maines_Bracket_Option_DB = "Double Dot Bracket"
       
        
     end

     
     if Maines_Bracket_Line == "-" then
        Maines_Name_DB = Maines_Name
        bracket_left_option = "-"
        bracket_right_option = "- "
        Maines_Bracket_Color = "|cFF778899"
        Maines_Bracket_Left_DB = bracket_left_option
        Maines_Bracket_Right_DB = bracket_right_option
        Maines_Bracket_Option_DB = "Line Bracket"
        
     end

     if Maines_Bracket_Wave == "~" then
        Maines_Name_DB = Maines_Name
        bracket_left_option = "~"
        bracket_right_option = "~ "
        Maines_Bracket_Color = "|cFFADD8E6"
        Maines_Bracket_Left_DB = bracket_left_option
        Maines_Bracket_Right_DB = bracket_right_option
        Maines_Bracket_Option_DB = "Wave Bracket"
        
     end

     print("|cFFF2DEA3", "Maines", "|r")
    Maines_Name_DB = Maines_Name
    Maines_Name =  _G["Maines_Name_DB"] 
    Maines_Bracket_Left_DB = _G["Maines_Bracket_Left_DB"] 
    Maines_Bracket_Right_DB = _G["Maines_Bracket_Right_DB"]
    Maines_Bracket_Option_DB = _G["Maines_Bracket_Option_DB"]

    print("|cFFD2C7B7", "Main Name |r", "|cFFFFE4B5", _G["Maines_Name_DB"], "|r")

    if _G["Maines_Bracket_Option_DB"] == "Crocodile Bracket" then
        print("|cFFC1B7A8", "Bracket Type", "|r",  "|cFF228B22", _G["Maines_Bracket_Option_DB"], "|r")
    end

    if _G["Maines_Bracket_Option_DB"] == "Wave Bracket" then
        print("|cFFC1B7A8", "Bracket Type", "|r", "|cFFADD8E6", _G["Maines_Bracket_Option_DB"], "|r")
    end

    if _G["Maines_Bracket_Option_DB"] == "Line Bracket" then
        print("|cFFC1B7A8", "Bracket Type", "|r", "|cFF778899", _G["Maines_Bracket_Option_DB"], "|r")
    end

    if _G["Maines_Bracket_Option_DB"] == "Dot Bracket" then
        print("|cFFC1B7A8", "Bracket Type", "|r", "|cFFF5F5F5", _G["Maines_Bracket_Option_DB"], "|r")
    end

    if _G["Maines_Bracket_Option_DB"] == "Double Dot Bracket" then
        print("|cFFC1B7A8", "Bracket Type", "|r", "|cFFC8C8C8", _G["Maines_Bracket_Option_DB"], "|r")
    end

    if _G["Maines_Bracket_Option_DB"] == "Circle Bracket" then
        print("|cFFC1B7A8", "Bracket Type", "|r", "|cFFFF0000", _G["Maines_Bracket_Option_DB"], "|r")
    end

    if _G["Maines_Bracket_Option_DB"] == "Square Bracket" then
        print("|cFFC1B7A8", "Bracket Type", "|r", "|cFF1E90FF", _G["Maines_Bracket_Option_DB"], "|r")
    end

    if _G["Maines_Bracket_Option_DB"] == "ButterFly Bracket" then
        print("|cFFC1B7A8", "Bracket Type", "|r", "|cFFFFA500", _G["Maines_Bracket_Option_DB"], "|r")
    end
  
        print("|cFFB8AEA0", "Left Bracket", "|r", Maines_Bracket_Color, _G["Maines_Bracket_Left_DB"], "|r")
        print("|cFFA9A193", "Right Bracket", "|r", Maines_Bracket_Color, _G["Maines_Bracket_Right_DB"], "|r")
    --  print("Main_Name / Command = ", Maines_Name .. _G["Maines_Name_DB"])

     if Maines_Name == nil then
        _G["Maines_Name_DB"] = _G["Maines_Name_DB"] 
        else
            _G["Maines_Name_DB"] = Maines_Name
            -- print("Main_Name Has Been Set At Addon Load  = ", _G["Maines_Name_DB"])
        end
end



SlashCmdList["MAIN"] = function(maines_name_command, editBox)

    print("|cFFF2DEA3", "Maines", "|r")

    Maines_Name =  _G["Maines_Name_DB"] 
    Maines_Bracket_Left_DB = _G["Maines_Bracket_Left_DB"] 
    Maines_Bracket_Right_DB = _G["Maines_Bracket_Right_DB"]
    Maines_Bracket_Option_DB = _G["Maines_Bracket_Option_DB"]
    

    print("|cFFD2C7B7", "Main Name |r", "|cFFFFE4B5", Maines_Name, "|r")

    if _G["Maines_Bracket_Option_DB"] == "Crocodile Bracket" then
        print("|cFFC1B7A8", "Bracket Type", "|r",  "|cFF228B22", _G["Maines_Bracket_Option_DB"], "|r")
        print("|cFFB8AEA0", "Left Bracket", "|r", "|cFF228B22", _G["Maines_Bracket_Left_DB"], "|r")
        print("|cFFA9A193", "Right Bracket", "|r", "|cFF228B22", _G["Maines_Bracket_Right_DB"], "|r")
    end

    if _G["Maines_Bracket_Option_DB"] == "Wave Bracket" then
        print("|cFFC1B7A8", "Bracket Type", "|r", "|cFFADD8E6", _G["Maines_Bracket_Option_DB"], "|r")
        print("|cFFB8AEA0", "Left Bracket", "|r", "|cFFADD8E6", _G["Maines_Bracket_Left_DB"], "|r")
        print("|cFFA9A193", "Right Bracket", "|r", "|cFFADD8E6", _G["Maines_Bracket_Right_DB"], "|r")
    end

    if _G["Maines_Bracket_Option_DB"] == "Line Bracket" then
        print("|cFFC1B7A8", "Bracket Type", "|r", "|cFF778899", _G["Maines_Bracket_Option_DB"], "|r")
        print("|cFFB8AEA0", "Left Bracket", "|r", "|cFF778899", _G["Maines_Bracket_Left_DB"], "|r")
        print("|cFFA9A193", "Right Bracket", "|r", "|cFF778899", _G["Maines_Bracket_Right_DB"], "|r")
    end

    if _G["Maines_Bracket_Option_DB"] == "Dot Bracket" then
        print("|cFFC1B7A8", "Bracket Type", "|r", "|cFFF5F5F5", _G["Maines_Bracket_Option_DB"], "|r")
        print("|cFFB8AEA0", "Left Bracket", "|r", "|cFFF5F5F5", _G["Maines_Bracket_Left_DB"], "|r")
        print("|cFFA9A193", "Right Bracket", "|r", "|cFFF5F5F5", _G["Maines_Bracket_Right_DB"], "|r")
    end

    if _G["Maines_Bracket_Option_DB"] == "Double Dot Bracket" then
        print("|cFFC1B7A8", "Bracket Type", "|r", "|cFFC8C8C8", _G["Maines_Bracket_Option_DB"], "|r")
        print("|cFFB8AEA0", "Left Bracket", "|r", "|cFFC8C8C8", _G["Maines_Bracket_Left_DB"], "|r")
        print("|cFFA9A193", "Right Bracket", "|r", "|cFFC8C8C8", _G["Maines_Bracket_Right_DB"], "|r")
    end

    if _G["Maines_Bracket_Option_DB"] == "Circle Bracket" then
        print("|cFFC1B7A8", "Bracket Type", "|r", "|cFFFF0000", _G["Maines_Bracket_Option_DB"], "|r")
        print("|cFFB8AEA0", "Left Bracket", "|r", "|cFFFF0000", _G["Maines_Bracket_Left_DB"], "|r")
        print("|cFFA9A193", "Right Bracket", "|r", "|cFFFF0000", _G["Maines_Bracket_Right_DB"], "|r")
    end

    if _G["Maines_Bracket_Option_DB"] == "Square Bracket" then
        print("|cFFC1B7A8", "Bracket Type", "|r", "|cFF1E90FF", _G["Maines_Bracket_Option_DB"], "|r")
        print("|cFFB8AEA0", "Left Bracket", "|r", "|cFF1E90FF", _G["Maines_Bracket_Left_DB"], "|r")
        print("|cFFA9A193", "Right Bracket", "|r", "|cFF1E90FF", _G["Maines_Bracket_Right_DB"], "|r")
    end

    if _G["Maines_Bracket_Option_DB"] == "ButterFly Bracket" then
        print("|cFFC1B7A8", "Bracket Type", "|r", "|cFFFFA500", _G["Maines_Bracket_Option_DB"], "|r")
        print("|cFFB8AEA0", "Left Bracket", "|r", "|cFFFFA500", _G["Maines_Bracket_Left_DB"], "|r")
        print("|cFFA9A193", "Right Bracket", "|r", "|cFFFFA500", _G["Maines_Bracket_Right_DB"], "|r")
    end
  
     

end


 Maines_Load = false

 local function CloseWindow(self, key)
    -- print(self:GetName(), key)
    if key == "ESCAPE" then 
        maines_close_button:Hide()
        maines_frame:Hide()
        maines_command_frame:Hide()
        maines_stamp_frame:Hide()
        maines_option_frame:Hide()
    end
 end
  
 maines_frame:SetScript("OnKeyDown", CloseWindow)
maines_frame:SetPropagateKeyboardInput(true)

function OnAddonLoaded(Event, Function, AddonName)

    
    if AddonName == "Maines" then 
        Maines_Load = true
        print("|cFFB8860B","=====================================", "|r")

         print("|cFFF2DEA3",AddonName, "|r")
        
        Maines_Name = _G["Maines_Name_DB"]
        Maines_Bracket_Left_DB = _G["Maines_Bracket_Left_DB"] 
        Maines_Bracket_Right_DB = _G["Maines_Bracket_Right_DB"]
        Maines_Bracket_Option_DB = _G["Maines_Bracket_Option_DB"]

        print("|cFFE2C478", "Main Name  ", "|r", _G["Maines_Name_DB"] )

        if _G["Maines_Bracket_Option_DB"] == "Crocodile Bracket" then
            print("|cFFE2C478","Bracket Option  ","|r", "|cFF228B22", _G["Maines_Bracket_Option_DB"], "|r")
            print("|cFFE2C478","Left Bracket  ","|r","|cFF228B22", _G["Maines_Bracket_Left_DB"], "|r")
            print("|cFFE2C478","Right Bracket  ","|r","|cFF228B22", _G["Maines_Bracket_Right_DB"], "|r")
        end

        if _G["Maines_Bracket_Option_DB"] == "Wave Bracket" then
            print("|cFFE2C478","Bracket Option  ","|r", "|cFFADD8E6", _G["Maines_Bracket_Option_DB"], "|r")
            print("|cFFE2C478","Left Bracket  ","|r","|cFFADD8E6", _G["Maines_Bracket_Left_DB"], "|r")
            print("|cFFE2C478","Right Bracket  ","|r","|cFFADD8E6", _G["Maines_Bracket_Right_DB"], "|r")
        end

        if _G["Maines_Bracket_Option_DB"] == "Line Bracket" then
            print("|cFFE2C478","Bracket Option  ","|r", "|cFF778899", _G["Maines_Bracket_Option_DB"], "|r")
            print("|cFFE2C478","Left Bracket  ","|r","|cFF778899", _G["Maines_Bracket_Left_DB"], "|r")
            print("|cFFE2C478","Right Bracket  ","|r","|cFF778899", _G["Maines_Bracket_Right_DB"], "|r")
        end

        if _G["Maines_Bracket_Option_DB"] == "Dot Bracket" then
            print("|cFFE2C478","Bracket Option  ","|r", "|cFFF5F5F5", _G["Maines_Bracket_Option_DB"], "|r")
            print("|cFFE2C478","Left Bracket  ","|r","|cFFF5F5F5", _G["Maines_Bracket_Left_DB"], "|r")
            print("|cFFE2C478","Right Bracket  ","|r","|cFFF5F5F5", _G["Maines_Bracket_Right_DB"], "|r")
        end

        if _G["Maines_Bracket_Option_DB"] == "Double Dot Bracket" then
            print("|cFFE2C478","Bracket Option  ","|r", "|cFFC8C8C8", _G["Maines_Bracket_Option_DB"], "|r")
            print("|cFFE2C478","Left Bracket  ","|r","|cFFC8C8C8", _G["Maines_Bracket_Left_DB"], "|r")
            print("|cFFE2C478","Right Bracket  ","|r","|cFFC8C8C8", _G["Maines_Bracket_Right_DB"], "|r")
        end

        if _G["Maines_Bracket_Option_DB"] == "Circle Bracket" then
            print("|cFFE2C478","Bracket Option  ","|r", "|cFFFF0000", _G["Maines_Bracket_Option_DB"], "|r")
            print("|cFFE2C478","Left Bracket  ","|r","|cFFFF0000", _G["Maines_Bracket_Left_DB"], "|r")
            print("|cFFE2C478","Right Bracket  ","|r","|cFFFF0000", _G["Maines_Bracket_Right_DB"], "|r")
        end

        if _G["Maines_Bracket_Option_DB"] == "Square Bracket" then
            print("|cFFE2C478","Bracket Option  ","|r", "|cFF1E90FF", _G["Maines_Bracket_Option_DB"], "|r")
            print("|cFFE2C478","Left Bracket  ","|r","|cFF1E90FF", _G["Maines_Bracket_Left_DB"], "|r")
            print("|cFFE2C478","Right Bracket  ","|r","|cFF1E90FF", _G["Maines_Bracket_Right_DB"], "|r")
        end

        if _G["Maines_Bracket_Option_DB"] == "ButterFly Bracket" then
            print("|cFFE2C478","Bracket Option  ","|r","|cFFFFA500", _G["Maines_Bracket_Option_DB"], "|r")
            print("|cFFE2C478","Left Bracket  ","|r","|cFFFFA500", _G["Maines_Bracket_Left_DB"], "|r")
            print("|cFFE2C478","Right Bracket  ","|r","|cFFFFA500", _G["Maines_Bracket_Right_DB"], "|r")
            
        end
      
        print("|cFFDEB887","=====================================", "|r")

    end
    

    
end


maines_frame:SetScript("OnEvent", OnAddonLoaded)

 function maines:OnInitialize()
    
    
     character_name = UnitName("player")
 
     maines_frame:SetPoint("CENTER")
     maines_frame:SetSize(512, 512)
     maines_frame:SetMovable(true)
     maines_frame:EnableMouse(true);

     maines_frame:SetFrameStrata("DIALOG")
     maines_frame:RegisterForDrag("LeftButton");
     maines_frame:SetScript("OnDragStart", maines_frame.StartMoving);
     maines_frame:SetScript("OnDragStop", maines_frame.StopMovingOrSizing);
     maines_close_button:Hide()
     maines_frame:Hide()
     maines_frame.tex = maines_frame:CreateTexture()
     maines_frame.tex:SetAllPoints(maines_frame)
 
     maines_frame.tex:SetTexture("Interface\\Addons\\Maines\\img\\bg")
     maines_frame.tex:SetAllPoints()

     maines_header_frame.tex = maines_header_frame:CreateTexture()
     maines_header_frame.tex:SetTexture("Interface\\Addons\\Maines\\img\\header")
     maines_header_frame.tex:SetAllPoints()
     maines_header_frame:SetPoint("CENTER", 0,320)
     maines_header_frame:SetSize(512,128)

     maines_header_frame:SetScript("OnDragStart",maines_frame.StartMoving);
     maines_header_frame:SetScript("OnDragStop", maines_frame.StopMovingOrSizing);
     maines_header_frame:Hide()


     
     maines_command_frame.tex = maines_command_frame:CreateTexture()
     maines_command_frame.tex:SetTexture("Interface\\Addons\\Maines\\img\\command_bg")
     maines_command_frame.tex:SetAllPoints()
     maines_command_frame:SetPoint("LEFT", -256,3)
     maines_command_frame:SetSize(256,512)
     maines_command_frame:SetFrameStrata("HIGH")
     maines_command_frame:SetScript("OnDragStart",maines_frame.StartMoving);
     maines_command_frame:SetScript("OnDragStop", maines_frame.StopMovingOrSizing);
     maines_command_frame:Hide()
     
     local maines_command_list = CreateFrame("Frame", "Maines_Command_List", maines_command_frame)
     maines_command_list.tex = maines_command_list:CreateTexture()
     maines_command_list.tex:SetTexture("Interface\\Addons\\Maines\\img\\command")
     maines_command_list.tex:SetAllPoints()
     maines_command_list:SetFrameStrata("MEDIUM")
     maines_command_list:SetSize(256, 1024)
     maines_command_frame:SetScrollChild(maines_command_list)
 

     maines_option_frame.tex = maines_option_frame:CreateTexture()
     maines_option_frame.tex:SetTexture("Interface\\Addons\\Maines\\img\\option")
     maines_option_frame.tex:SetAllPoints()
     maines_option_frame:SetPoint("CENTER", 0,-320)
     maines_option_frame:SetSize(512,128)
     maines_option_frame:SetFrameStrata("HIGH")
     maines_option_frame:SetScript("OnDragStart",maines_frame.StartMoving);
     maines_option_frame:SetScript("OnDragStop", maines_frame.StopMovingOrSizing);
     maines_option_frame:Hide()

     
     maines_stamp_frame:SetPoint("RIGHT", 256,-3)
     maines_stamp_frame:SetSize(256,512)
     maines_stamp_frame:SetFrameStrata("HIGH")
     maines_stamp_frame:SetScript("OnDragStart",maines_frame.StartMoving);
     maines_stamp_frame:SetScript("OnDragStop", maines_frame.StopMovingOrSizing);
     maines_stamp_frame:Hide()
     maines_stamp_frame.tex =  maines_stamp_frame:CreateTexture()
     maines_stamp_frame.tex:SetAllPoints( maines_stamp_frame)

     maines_stamp_frame.tex:SetTexture("Interface\\Addons\\Maines\\img\\stamp")
     maines_stamp_frame.tex:SetAllPoints()

     
     maines_editbox = CreateFrame("EditBox", nil, maines_frame, "InputBoxTemplate")
     maines_editbox:SetSize(120,120)
     maines_editbox:SetWidth(200)
     maines_editbox:SetPoint("CENTER", 0,-318)
     maines_editbox:SetFrameStrata("DIALOG")
     maines_editbox:SetAutoFocus(false)
     maines_editbox:SetTextInsets(68,24,0,0)
     maines_editbox:SetText("Main Name")

     Spaces_Button = CreateFrame("CheckButton", "Space_Button", maines_option_frame, "UIRadioButtonTemplate")
     Spaces_Button:SetPoint("CENTER", 0, -46)  -- Set the position of the checkbox
     Spaces_Button:SetFrameStrata("DIALOG")
     Spaces_Button.tooltip = "Do You Want; Spaces Or Not?"  -- Set the checkbox label
     Spaces_Button:SetChecked(false)
     Spaces_Button:SetScript("OnClick", function(self, button, down)
    if self:GetChecked() then
            space_option = " "
            Space_Option_DB = space_option
            print("Main Name Has Spaces = " .. Maines_Bracket_Left_DB .. Space_Option_DB .. Maines_Name .. Space_Option_DB .. Maines_Bracket_Right_DB)

        else 
         
            space_option = ""
            Space_Option_DB = space_option
            print("Main Name Has No Spaces = " .. Maines_Bracket_Left_DB .. Space_Option_DB .. Maines_Name .. Space_Option_DB .. Maines_Bracket_Right_DB)
        end
     end)


     self:RawHook("SendChatMessage", true)
     
     maines_editbox:SetScript("OnEnterPressed", function(self)
         Mains_Name = self:GetText()
      
         _G["Maines_Name_DB"]  = Mains_Name
         Maines_Name = _G["Maines_Name_DB"]
      --  print("Main Name : ", _G["Maines_Name_DB"])
        end)

    end
    

 Maines_Option_Panel = CreateFrame("Frame", "Maines_Option_Panel", UIParent)
 Maines_Option_Panel.name = "Maines"
 
 maines_close_button = CreateFrame("Button", "maines_close_button", maines_frame)
 
 maines_close_button:SetPoint("CENTER", 282, 284)
 maines_close_button:SetWidth(64)
 maines_close_button:SetHeight(64)
 maines_close_button:SetFrameStrata("DIALOG")
 maines_close_button:SetNormalFontObject("GameFontNormal")
 
 maines_close_button_texture = maines_close_button:CreateTexture()
 
 maines_close_button_texture:SetTexture("Interface\\Addons\\Maines\\img\\closebutton")
 maines_close_button_texture:SetAllPoints()
 maines_close_button:SetNormalTexture(maines_close_button_texture)
 
 maines_close_button:SetScript("OnClick", function(self, button, down)
         if button == "LeftButton" then
             maines_close_button:Hide()
             maines_frame:Hide()
             maines_command_frame:Hide()
             maines_stamp_frame:Hide()
             maines_option_frame:Hide()
             
          
         elseif button == "RightButton" then
             print("You clicked the right button")
     end
 end)
 
 Maines_Option_Panel_BG = CreateFrame("Frame", "Maines_Option_Panel_BG", Maines_Option_Panel, UIParent)
 Maines_Option_Panel_BG:SetPoint("CENTER")
 Maines_Option_Panel_BG:SetSize(512, 512)
 
 Maines_Option_Panel_BG.tex = Maines_Option_Panel_BG:CreateTexture()
 Maines_Option_Panel_BG.tex:SetAllPoints(Maines_Option_Panel_BG )
 Maines_Option_Panel_BG.tex:SetTexture("Interface\\Addons\\Maines\\img\\maines_option_panel_bg")

 
 
 InterfaceOptions_AddCategory(Maines_Option_Panel)


Maines_Chat_Options = {}
Chat_Counter = 0

SlashCmdList["MAINCHAT"] = function(maines_chat_command, editbox)
    --CHECK DB
    
    for Chat_Selection in string.gmatch(maines_chat_command, "([^,]+)") do
        print("CHAT_SELECTION : " .. Chat_Selection)
        table.insert(Maines_Chat_Options, Chat_Selection)
    end  
    _G["Maines_Chat_Options_DB"] = Maines_Chat_Options

    ReloadUI()    
end


function maines:SendChatMessage(msg, chatType, language, channel)
    character_name = UnitName("player")
    --print(character_name)
    edited_message = ""
    maines_gate_match = false

    for _, value in pairs(Maines_Gate_List) do
        if msg == value then
            maines_gate_match = true
            break
        end
    end

    if maines_gate_match then 

        for _, value in pairs(Maines_Gate_List) do
           print(msg)
           if msg == value then
               for _, ct_value in pairs(Channel_Types) do
                   if chatType == ct_value then
                            edited_message = msg  
                            self.hooks.SendChatMessage(msg, chatType, language, channel)
                       return                 
                   end 
               end
           end
        end
    else
        for _, ct_value in pairs(Channel_Types) do
            if chatType == ct_value then
                local charCount = 0

                for i = 1, #msg do
                    local char = msg:sub(i, i)
                    if char ~= "|" then
                        charCount = charCount + 1
                    end
                end
                if charCount >= 220 then 
                    print("Character Count = ", charCount)
                  --  print(msg)
                    self.hooks.SendChatMessage(msg, chatType, language, channel)
                    break
                else
                    if Maines_Name_DB == character_name then
                        self.hooks.SendChatMessage(msg, chatType, language, channel)
                        break
                    else 
        
                      if  _G["Maines_Chat_Options_DB"] == nil then 
                        edited_message = Maines_Bracket_Left_DB .. Space_Option_DB .. Maines_Name .. Space_Option_DB .. Maines_Bracket_Right_DB ..  msg 
                        self.hooks.SendChatMessage(edited_message, chatType, language, channel) 

                      else if _G["Maines_Chat_Options_DB"] ~= nil  then 
                        for _, v in pairs(_G["Maines_Chat_Options_DB"]) do
                            if v ~= chatType then
                                edited_message = Maines_Bracket_Left_DB .. Space_Option_DB .. Maines_Name .. Space_Option_DB .. Maines_Bracket_Right_DB ..  msg 
                                break
                            elseif  v == chatType then
                                edited_message = msg   
                            end
                        end
                        
                        self.hooks.SendChatMessage(edited_message, chatType, language, channel)   

                      end
                    end

                 
--
                    end
            end
               
                return
           end 
        end
    end 
end

        
 
 
