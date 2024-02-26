#Requires AutoHotkey >=2.0 64-bit

#SingleInstance Force
SetWorkingDir A_InitialWorkingDir
SetTitleMatchMode 2
#WinActivateForce
SetControlDelay 1
SetWinDelay 0
SetKeyDelay 0
SetMouseDelay -1

; set coords screen base instead of focused window
CoordMode "ToolTip", "Screen"
CoordMode "Mouse", "Screen"

features := ["PlayHunt", "PlayMP1", "PlayMPAds", "MuteSystemVolume", "LeagueDetection", "EventPassHolder", "AutoRefillTickets", "PlayAdafterhuntrace", "ShutdownPCAfterHunt"]


script_start:

    ; start_game()

    ; Sleep(5000)

main_menu_loaded_check_start:

    If !MainMenuLoadedCheck() {
        Goto('script_start')
    }

    If !SeasonalEvents() {
        Goto('script_start')
    }

    If (!EnterEventsTab()) {
        Goto('script_start')
    }

    If !EnterHuntTab() {
        Goto('script_start')
    }


    ; exit app
    ExitApp
script_end:
    ^q:: ExitApp

    ; includes
    #Include %A_ScriptDir%\libs\IMG_tool.ahk
    #Include %A_ScriptDir%\functions\Global.ahk
    #Include %A_ScriptDir%\functions\GameFunctions.ahk
    #Include %A_ScriptDir%\functions\Startup.ahk
    #Include %A_ScriptDir%\functions\Hunt.ahk
    #Include %A_ScriptDir%\functions\MP.ahk