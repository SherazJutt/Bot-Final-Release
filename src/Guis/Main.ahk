main_gui:
    Gui, Destroy

    for index, feature in features {
        IniRead, ini%feature%, %SettingsIni%, Main, %feature%
        %feature% := ini%feature% == 1 ? "Checked" : 0
    }

    Gui -MinimizeBox -MaximizeBox -DPIScale ;-Caption

    ; buttons
    Gui Add, Button, gscript_start x3 y3 w130 h64 , Play
    Gui Add, Button, gexitscript x134 y3 w70 h30, Exit
    Gui Add, Button, gsettings x134 y35 w70 h30, Settings
    Gui Add, Button, gHunt_Cars_Label x105 y70 w100 h38 , Hunt Cars
    Gui Add, Button, gSkip_MP_Cars_Label x3 y70 w100 h38 , Skip MP Cars

    ; section sseparator
    Gui Add, Text, x5 y112 w200 h2 +0x10

    ; row 1
    Gui Add, CheckBox, gToggleFeatures %PlayHunt% x7 y115 w80 h25 , Play Hunt
    Gui Add, CheckBox, gToggleFeatures %PlayMP1% x105 y115 w80 h25 , Play MP1

    ; section sseparator
    Gui Add, Text, x5 y142 w200 h2 +0x10

    ; row 2
    Gui Add, CheckBox, gToggleFeatures %PlayMPAds% x7 y145 w100 h25 , Play MP Ads
    Gui Add, CheckBox, gToggleFeatures %LeagueDetection% x7 y167 w150 h25, League Detection

    ; row 3
    Gui Add, CheckBox, gToggleFeatures %MuteSystemVolume% x7 y189 w150 h25, Mute System Volume

    ; row 4
    Gui Add, CheckBox, gToggleFeatures %EventPassHolder% x7 y210 w150 h25, Event Pass Holder
    Gui Add, CheckBox, gToggleFeatures %AutoRefillTickets% x7 y232 w150 h25, Auto Refill Tickets

    Gui Add, CheckBox, gToggleFeatures %PlayAdafterhuntrace% x7 y255 w150 h25, Play Ad after hunt race

    ; section sseparator
    Gui Add, Text, x5 y285 w200 h2 +0x10

    ; row 5
    ; Gui Add, Text, x0 y290 w210 h25 +0x200 +0x1, Coming Soon

    ; row 6
    Gui Add, CheckBox, gToggleFeatures %ShutdownPCAfterHunt% x7 y288 w150 h25, Shutdown PC After Hunt


    ; row 7
    ; Gui, Add, Text, x7 y318 w150 h25, Goto Hunt After MP Races:
    ; Gui, Add, Edit, w32 h20 x166 y315

    Gui Show, w210 h325, Asphat 9 Autobot
    WinSet, Style, Asphat 9 Autobot
; -0x80000, to remove close button from ribbon

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
    Goto, main_gui
Return

;  *--------------------------------------------------*
;        |     Functions Labels      |
;  *--------------------------------------------------*
exitscript:
    SoundSet,0,,Mute
ExitApp
Return