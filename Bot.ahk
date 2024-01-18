#NoEnv
#SingleInstance Force
SetWorkingDir %A_ScriptDir%
CoordMode , Mouse, Screen
SendMode Input
SetTitleMatchMode 2
#WinActivateForce
SetControlDelay 1
SetWinDelay 0
SetKeyDelay 0
SetMouseDelay -1
SetBatchLines -1

#Include, %A_ScriptDir%\src\libs\ScriptGuards.ahk

; run as admin if not running as admin
CommandLine := DllCall("GetCommandLine", "Str")
If !(A_IsAdmin || RegExMatch(CommandLine, " /restart(?!\S)")) {
    Try {
        If (A_IsCompiled) {
            Run *RunAs "%A_ScriptFullPath%" /restart
        } Else {
            Run *RunAs "%A_AhkPath%" /restart "%A_ScriptFullPath%"
        }
    }
    ExitApp
}
; set tooltip coords screen base instead of focused window
CoordMode, ToolTip, Screen

t1:=A_TickCount, X:=Y:=""

global SettingsIni := A_ScriptDir "\settings.ini"

script_start:

    Gui, Destroy

    SoundGet, isMuted, , MUTE
    if (isMuted = "off" && MuteSystemVolume = "Checked") {
        SoundSet, +1, , Mute
    }

    t1:=A_TickCount, X:=Y:=""

    Sleep, 1000

    start_game()
    Sleep, 5000

    If (StuckOnGlLogo()) {
        Goto, script_start
    }

    If (StuckOnLoadingScreen()) {
        Goto, script_start
    }

main_menu_loaded_check_start:

    If (!MainMenuLoadedCheck()) {
        Goto, script_start
    }

    Sleep, 3000

    If (!SeasonalEvents()) {
        Goto, script_start
    }

    Sleep, 2000

    Text:="|<>*114$77.Dttzk0twTsTkyDnlzU1lsTkzVwTbXz03Xkz1z1szD7ztz7Uy3w3lySDznyD1w7sbXwwTzbwSHkDl77tszzDswXYT6CDnlzyTlta8yAQTbXzwzXnAFwQszD7ztz7a9XtslySDznyDC37XlXwwTzbwSQCD037tszzDswsQS02DnlzyTlttsw04T7XzwzXnzlly80D07tz7bzXXy80y07nyDDz7DwQ7y0TryyTzSTxU"
    if (ok:=FindText(X, Y, 461, 141, 555, 174, 0, 0, Text)){
        Click, 238, 416 Left, 1
    }Else{

        Click, 238, 416 Left, 1
        Sleep, 1800
        Click, 238, 416 Left, 1
    }

    Sleep, 3000
    Click, 1120, 442 Left, 1
    Sleep, 1000

checkRaceScreen:

    Sleep, 2000

    ; check stage text on left card after selecting stage
    Text:="|<>*130$18.TrwzzyzzzsyDkQ7kQ7s87s0Dy0zy0yS0w000000000000000000000000000000M43MC3MC3MC3MC3QC7TzzTzz0000000000007bwDbyT7zQ67M63M03M03Q07TzyDzy3zs00000000300z07z1zsDykTUkS0kTUkDzk1zs07z00T000000M00M00M00M00TzzTzzQ00M00M00M0000000000kD3yD7yQ77MC7MC3MC3QA7SwDDwS7sQU"
    if (ok:=FindText(X, Y, 88, 263, 117, 355, 0, 0, Text)){
        TicketCheck()
    }Else{
        Goto, script_start
    }

    Sleep, 1000
    Click, 1187, 649 Left, 1
    Sleep, 2000

    TdCheck()

    ; Click, 1175, 634 Left, 1
    ; Sleep, 5000

    ; If (!PlayHuntRace()){
    ;     Goto, script_start
    ; }
    PlayHuntRace()

    If (HuntRewardsSkip()){
        Goto, checkRaceScreen
    }Else{
        Goto, script_start
    }

shended:
    ; MsgBox, Completed
    Run, shutdown.exe /s /t 0

ExitApp
^p:: Pause
^q::
    SoundGet, isMuted, , MUTE
    if (isMuted = "on") {
        SoundSet, +1, , Mute
    }
ExitApp

; common functions
#Include, %A_ScriptDir%\src\functions\CommonFunctions.ahk
; libs
#Include, %A_ScriptDir%\src\libs\JSON.ahk
#Include, %A_ScriptDir%\src\libs\FindText.ahk