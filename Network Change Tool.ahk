#Requires AutoHotkey v2.0

;Variable Declarations - Global
IPSetup := Gui()
vUserText := "User Host : "
vUserIPText := "Your IP Address | "
IPNetworkAdd1 := 10
IPNetworkAdd2 := 10
IPHostAdd := 10
vUserIP := IPNetworkAdd1 . "." . IPNetworkAdd2 . "."  IPHostAdd . "." ;"10.10.10."
vHostID := 133
vHostDefault := 1   
test := 2

;comment

;This is a change

;Adam was here

;GUI Structure
; Parameters just to make the window with buttons
IPSetup.Title := "IP Setup Tool"
vTextUser := IPSetup.AddText("w500 Center", vUserIPText . vUserText . vHostID)
UserIP := IPSetup.AddText("w500 h30 Center", vUserIP . vHostID)
UserIP.SetFont("s24")
;UserID := IPSetup.AddText("w500 h30 Center", vUserText . vHostID)


;Buttons to change IP Addresses to copy over
IPSetup.Add("Button", "w150 h50 x15", "Sphere Default `n10.10.10.1").OnEvent("Click", ChangeNetworkTen)
IPSetup.Add("Button", "w150 h50 x+10", "Planet Network Switch `n192.168.0.1").OnEvent("Click", ChangeNetworkZero) 
IPSetup.Add("Button", "w150 h50 x+10", "Waveshare/Dingtian Relay `n192.168.1.1").OnEvent("Click", ChangeNetworkOne)
IPSetup.Add("Button", "w150 h50 xm x15", "Shelly Relays `n192.168.33.1").OnEvent("Click", ChangeNetworkThirtyThree)
IPSetup.Add("Button", "w150 h50 x+10", "DJI Dock `n192.168.200.1").OnEvent("Click", ChangeNetworkTwoHundred)
IPSetup.Add("Button", "w150 h50 x+10", "Peplink Router `n192.168.50.1").OnEvent("Click", ChangeNetworkFifty)



; Button to customize IP Address Host ID
IPSetup.Add("Button", "w300 h80 x100", "Open Network Settings").OnEvent("Click", OpenNetworkSettings)
vShortcut := IPSetup.AddText("w500 xm Center", "Use ALT+Z to use `"copy`" shortcut")
vShortcut.SetFont("bold")

;Extra Feature, just to change the Host ID of user
IPSetup.Add("Button", "w100 h30 x145 Center", "Change User Host").OnEvent("Click", ChangeUser)
IPSetup.Add("Button", "w100 h30 x+10", "Known Default IPs").OnEvent("Click", KnownDefaultIP)

vSig := IPSetup.AddText("w480 h10 xm Right", "Script Written by: ")
vSig.SetFont("s6")
vName := IPSetup.AddText("w480 y+5 Right", "Joseph Tamayo")
vName.SetFont("s9")
vSig2 := IPSetup.AddText("w480 y+5 Right", "Copyright Sphere Group 2026 ")
vSig2.SetFont("s6")

;open gui
IPSetup.Show("w500 h375")


;Button Uses
ChangeUser(GuiBtnObj, Info)
{
    vInput := InputBox("What IP ID would you like? (Please enter a number between 2 and 254)"
    , "User IP ID", "")
        
    if(vInput.Result = "Cancel")
    {

    }
    else if (IsAlpha(vInput.Value))
    {
        MsgBox("You have not entered a valid response")
    }
    else If (IsNumber(vInput.value) && vInput.Value <= 254 && vInput.Value >= 1)
    {
        global vHostID := vInput.Value
        vTextUser.Text := vUserIPText . vUserText . vHostID
        IPSetup.Text := vUserIPText . vUserText . vHostID
        UserIP.Text := vUserIP . vHostID

    }
    else
    {
        MsgBox("You have not entered a valid response")
    }
    
}

KnownDefaultIP(GuiBtnObj, Info)
{
    MsgBox("Planet Network Switch: 192.168.0.200 `nWaveshare RS485: 192.168.1.100 `nDingtian Relay: 192.168.1.100 `nShelly Relay: 192.168.33.1 `nDJI Dock: 192.168.200.100 `nPeplink Router: 192.168.50.1",
     "Known Default IP Addresses")
}

OpenNetworkSettings(GuiBtnObj, Info)
{
    Run '::{7007acc7-3202-11d1-aad2-00805fc1270e}'
}

ChangeNetworkZero(GuiBtnObj, Submit)
{
    ;global vairables must declared
    global IPNetworkAdd1 := 192
    global IPNetworkAdd2 := 168
    global IPHostAdd := 0
    global vUserIP := IPNetworkAdd1 . "." . IPNetworkAdd2 . "."  IPHostAdd . "." 
    vTextUser.Text := vUserIPText . vUserText . vHostID
    IPSetup.Text := vUserIPText . vUserText . vHostID
    UserIP.Text := vUserIP . vHostID
}
ChangeNetworkOne(GuiBtnObj, Info)
{
    global IPNetworkAdd1 := 192
    global IPNetworkAdd2 := 168
    global IPHostAdd := 1
    global vUserIP := IPNetworkAdd1 . "." . IPNetworkAdd2 . "."  IPHostAdd . "." 
    vTextUser.Text := vUserIPText . vUserText . vHostID
    IPSetup.Text := vUserIPText . vUserText . vHostID
    UserIP.Text := vUserIP . vHostID
}
ChangeNetworkFifty(GuiBtnObj, Info)
{
    global IPNetworkAdd1 := 192
    global IPNetworkAdd2 := 168
    global IPHostAdd := 50
    global vUserIP := IPNetworkAdd1 . "." . IPNetworkAdd2 . "."  IPHostAdd . "." 
    vTextUser.Text := vUserIPText . vUserText . vHostID
    IPSetup.Text := vUserIPText . vUserText . vHostID
    UserIP.Text := vUserIP . vHostID
}
ChangeNetworkTen(GuiBtnObj, Info)
{
    global IPNetworkAdd1 := 10
    global IPNetworkAdd2 := 10
    global IPHostAdd := 10
    global vUserIP := IPNetworkAdd1 . "." . IPNetworkAdd2 . "."  IPHostAdd . "." 
    vTextUser.Text := vUserIPText . vUserText . vHostID
    IPSetup.Text := vUserIPText . vUserText . vHostID
    UserIP.Text := vUserIP . vHostID
}
ChangeNetworkThirtyThree(GuiBtnObj, Info)
{
    global IPNetworkAdd1 := 192
    global IPNetworkAdd2 := 168
    global IPHostAdd := 33
    global vUserIP := IPNetworkAdd1 . "." . IPNetworkAdd2 . "."  IPHostAdd . "." 
    vTextUser.Text := vUserIPText . vUserText . vHostID
    IPSetup.Text := vUserIPText . vUserText . vHostID
    UserIP.Text := vUserIP . vHostID
}
ChangeNetworkTwoHundred(GuiBtnObj, Info)
{
    global IPNetworkAdd1 := 192
    global IPNetworkAdd2 := 168
    global IPHostAdd := 200
    global vUserIP := IPNetworkAdd1 . "." . IPNetworkAdd2 . "."  IPHostAdd . "." 
    vTextUser.Text := vUserIPText . vUserText . vHostID
    IPSetup.Text := vUserIPText . vUserText . vHostID
    UserIP.Text := vUserIP . vHostID
}


;Shortcut = Alt+t to copy in the IP Address, Subnet Mask and Gateway IP with added extra feature
!t::
{
    ;Navigate to "Internett Protocol Version 4 (TCP/IP)", Tab to Properties, Press Enter and S for "Use Manual IP Address", Tab to first Inputbox
    Send "i"
    Send "{Tab}"
    Send "{Tab}"
    Send "{Enter}"
    Send "s"
    Send "{Tab}"

    ;Send User IP Address
    Send IPNetworkAdd1 ;variable = IPAdd1
    Send "."
    Send IPNetworkAdd2 ;variable = IPAdd2
    Send "."
    Send IPHostAdd ;variable = IPAdd3
    Send "."
    Send vHostID

    Send "{Tab}"

    ;Send default subnet - 255.255.255.0
    Send 255
    Send "."
    Send 255
    Send "."
    Send 255
    Send "."
    Send 0

    Send "{Tab}"

    ;Send User Default Gateway
    Send IPNetworkAdd1 ;variable = IPAdd1
    Send "."
    Send IPNetworkAdd2 ;variable = IPAdd2
    Send "."
    Send IPHostAdd ;variable = IPAdd3
    Send "."
    Send vHostDefault

    Send "{Tab}"
    Send "{Tab}"

    ;Copy Default Gateway as DNS Server
    Send IPNetworkAdd1 ;variable = IPAdd1
    Send "."
    Send IPNetworkAdd2 ;variable = IPAdd2
    Send "."
    Send IPHostAdd ;variable = IPAdd3
    Send "."
    Send vHostDefault

}

;Shortcut = Alt+z to copy in the IP Address, Subnet Mask and Gateway IP
!z::
{
    Send IPNetworkAdd1 ;variable = IPAdd1
    Send "."
    Send IPNetworkAdd2 ;variable = IPAdd2
    Send "."
    Send IPHostAdd ;variable = IPAdd3
    Send "."
    Send vHostID

    Send "{Tab}"

    ;Setup default subnet - 255.255.255.0
    Send 255
    Send "."
    Send 255
    Send "."
    Send 255
    Send "."
    Send 0

    Send "{Tab}"

    ;Send User Default Gateway
    Send IPNetworkAdd1 ;variable = IPAdd1
    Send "."
    Send IPNetworkAdd2 ;variable = IPAdd2
    Send "."
    Send IPHostAdd ;variable = IPAdd3
    Send "."
    Send vHostDefault

    Send "{Tab}"
    Send "{Tab}"

    ;Copy Default Gateway as DNS Server
    Send IPNetworkAdd1 ;variable = IPAdd1
    Send "."
    Send IPNetworkAdd2 ;variable = IPAdd2
    Send "."
    Send IPHostAdd ;variable = IPAdd3
    Send "."
    Send vHostDefault
}

IPSetup.OnEvent("Close", (*) => ExitApp())
