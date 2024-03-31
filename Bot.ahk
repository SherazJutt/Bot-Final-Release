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

script_start:
    t1:=A_TickCount, X:=Y:=""

    Sleep, 1000

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

    ; <======================== Showcase Start ==============================>
    If (!EnterEventsTab()) {
        Goto, main_menu_loaded_check_start
    }

    Sleep, 2000

    Loop, 2{
        Send, {Enter}
        Sleep, 1000
    }

    If (!isRaceScreen()){
        Goto, script_start
    }

    ; click on race button
    Click, 1177, 643 Left, 1
    Sleep, 2500

    ; checking if car is refueling
    If (LockedOrRefueling()){
        Click, 1199, 633 Left, 1
        Sleep, 2500
        Click, 740, 515 Left, 1
        Sleep, 2000
        Send , {Escape}
        Sleep, 2200
    }

    if(!ClickOnPlayButton()){
        Goto, script_start
    }

    Sleep, 8000

    If (!PlayRace()){
        Goto, script_start
    }

; <======================== Showcase Ended ==============================>

script_ended:

    MsgBox, Ended

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
#Include, %A_ScriptDir%\src\functions\Events.ahk
#Include, %A_ScriptDir%\src\functions\LegendPassShowCase.ahk
#Include, %A_ScriptDir%\src\functions\PlayRace.ahk

; libs
#Include, %A_ScriptDir%\src\libs\JSON.ahk
#Include, %A_ScriptDir%\src\libs\FindText.ahk