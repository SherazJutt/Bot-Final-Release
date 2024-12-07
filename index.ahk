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
CoordMode "Pixel", "Screen"

features := ["PlayHunt", "PlayMP1", "PlayMPAds", "MuteSystemVolume", "LeagueDetection", "EventPassHolder", "AutoRefillTickets", "PlayAdafterhuntrace", "ShutdownPCAfterHunt"]
user := { name: 'sheraz', id: '7185614526153', plan: 'free', isLoggedInOnDevice: false, lastLogin: '02 march 2024' }
settings := { EventPassHolder: true, AutoRefillTickets: true, PlayAdafterhuntrace: true, hunt: { maxcars: 1, cars: [21, 15, 27, 28, 29, 31, 33, 48] } }

script_start:
    start_game()

script_end:

    ^q:: ExitApp

    ; includes
    #Include %A_ScriptDir%\helpers\global.ahk
    #Include %A_ScriptDir%\helpers\start_game.ahk

    ; libs
    #Include %A_ScriptDir%\libs\IMG_tool.ahk