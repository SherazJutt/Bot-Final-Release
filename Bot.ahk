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

    ; Sleep, 1000

    ; start_game()
    ; Sleep, 5000

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

    Sleep, 2000
    Click, 836, 444, 0
    Sleep, 1000

    Loop , 15{
        Click , WheelDown, 1
        Sleep , 100
    }

    Sleep, 1000
    Click, 330, 444 Left, 1
    Sleep, 1000

checkRaceScreen:

    Sleep, 2000

    ; check stage text on left card after selecting stage
    Text:="|<>*134$19.07wS7zD7zrXzzlkTss7wQ3yC1zz3zznzztxzww00000000000000000000000000000000k86MC3A71a3Un1kNksQzzyTzz0000000000000DDsDbyDXzb1Vn0kNU8Ak0CQ07DzzXzzUTz000000000300TU1zkDz0zz0z1US0kDkM3zw0Dz00Tw00y0000006003001U00s00TzzDzzb003001U00k0000000000A1sTkwTssCCMC7A71a3UnVUtvkwTsw7sQU"
    if (ok:=FindText(X, Y, 87, 262, 119, 358, 0, 0, Text)){
        TicketCheck()
    }Else{
        Goto, script_start
    }

    Sleep, 1000
    Click, 1187, 649 Left, 1
    Sleep, 2000

    TdCheck()

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