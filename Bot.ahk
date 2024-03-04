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

    Text:="|<>*136$55.znVlzX1nzztkszlktzy0sQQ0sQD70QCA0SC3XU7660Db1lk3b307nUszVnVy3NkQTktkzVisCDsAkTknw7707MA0Ny3XU3w60AT1lk1y306DUszkT1zX3kQTsD0zlVsCDs3UTkkM64"
    if (ok:=FindText(X, Y, 551, 220, 615, 245, 0, 0, Text)){
        Click, 335, 194 Left, 1
    }Else{
        Click, 335, 194 Left, 1
        Sleep, 1800
        Click, 335, 194 Left, 1
    }
    Sleep, 3500
    Click, 410, 402 Left, 1
    Sleep, 3000

checkRaceScreen:

    Sleep, 2000

    ; check stage text on left card after selecting stage

    Text:="|<>*136$27.1zzy0Tzzk3zzy0Tzzk1s000D0000w00000000000000000000000000000000000000000000000000000k86063Uk0kQ6063Uk0kQ6073Vk0zzy07zzk0000000000000000000DDs03tzU0zDy071Vk0kA6060Uk0k0C0701k0zzy03zzU07zk0000000000000k001y001zk03zk03zw00zVU07UA00z1U03zw003zk001zk000y000000000060000k00060000s0007zzk0zzy070000k00060000k00000000000000C00S7w03lzU0sCC063Vk0kQ6063Uk0sMC07j3k0Ttw01y70000000000000000000zzzzw"
    if (ok:=FindText(X, Y, 88, 264, 119, 356, 0, 0, Text)){
        TicketCheck()
    }Else{
        Goto, script_start
    }

    Sleep, 1000
    Click, 1187, 649 Left, 1
    Sleep, 2500
    Click, 214, 329 Left, 1
    Sleep, 2500

    TdCheck()
    if(!ClickOnPlayButton()){
        Goto, script_start
    }

    Sleep, 5000

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