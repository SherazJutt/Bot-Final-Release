main_gui:
    features := ["PlayHunt", "PlayMPAds", "MuteSystemVolume", "LeagueDetection", "EventPassHolder","AutoRefillTickets"]

    for index, feature in features {
        IniRead, ini%feature%, %SettingsIni%, Main, %feature%
        %feature% := ini%feature% == 1 ? "Checked" : 0
    }

    Gui -MinimizeBox -MaximizeBox -DPIScale ;-Caption

    Gui Add, Button, gscript_start x3 y3 w130 h60 , Play
    Gui Add, Button, gexitscript x134 y3 w70 h60, Exit

    Gui Add, CheckBox, gToggleFeatures %PlayHunt% x7 y70 w80 h25 , Play Hunt
    Gui Add, Button, gHunt_Cars_Label x90 y70 w75 h25 , Hunt Cars

    Gui Add, CheckBox, gToggleFeatures %PlayMPAds% x7 y100 w100 h25 , Play MP Ads
    Gui Add, CheckBox, gToggleFeatures %MuteSystemVolume% x7 y130 w150 h25, Mute System Volume
    Gui Add, CheckBox, gToggleFeatures %LeagueDetection% x7 y160 w150 h25, League Detection

    Gui Add, CheckBox, gToggleFeatures %EventPassHolder% x7 y190 w150 h25, Event Pass Holder
    Gui Add, CheckBox, gToggleFeatures %AutoRefillTickets% x7 y220 w150 h25, Auto Refill Tickets

    Gui Add, Button, gSkip_MP_Cars_Label x7 y250 w100 h25 , Skip MP Cars

    Gui Show, w210 h300, Asphat 9 Autobot
    WinSet, Style, -0x80000, Asphat 9 Autobot

Return

;  *--------------------------------------------------*
;        |     Toggling bot options      |
;  *--------------------------------------------------*

; ToggleCarToSkip
ToggleFeatures:
    GuiControlGet, checkboxState, , %A_GuiControl%
    CurrFeature := SubStr(A_GuiControl, 1)
    feature := StrReplace(CurrFeature, " ")

    IniRead, Clickedfeature, %SettingsIni%, Main, %feature%

    featureState := Clickedfeature = "1" ? 0 : 1
    IniWrite, %featureState%, %SettingsIni%, Main, %feature%
Return

;  *--------------------------------------------------*
;        |     Functions Labels      |
;  *--------------------------------------------------*
exitscript:
    SoundSet,0,,Mute
ExitApp
Return