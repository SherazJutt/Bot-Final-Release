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
CoordMode("Pixel", "Screen")

features := ["PlayHunt", "PlayMP1", "PlayMPAds", "MuteSystemVolume", "LeagueDetection", "EventPassHolder", "AutoRefillTickets", "PlayAdafterhuntrace", "ShutdownPCAfterHunt"]

user := {
    name: 'sheraz',
    id: '7185614526153',
    plan: 'free',
    isLoggedInOnDevice: false,
    lastLogin: '02 march 2024'
}

settings := {
    EventPassHolder: true,
    AutoRefillTickets: true,
    PlayAdafterhuntrace: true,
    hunt: {
        maxcars: 1,
        cars: [21, 15, 27, 28, 29, 31, 33, 48]
    }
}

script_start:

    start_game()

    Sleep(5000)

    ; checks if game is started and not stuck on GL logo (checks the gameloft (id-w) text to confirm if game is running)
    Text := "|<>*158$35.i0zzzyQMzzzwttzzztnnDn63baTWA7DDz49CSTy8GQwzy4Yttzw89nnDsEnU6Tklr0QzVXU"
    if (!ok := FindText(&X := "Wait", &Y := 16, 170, 45, 216, 75, 0, 0, Text)) {
        Goto('script_start')
    }

main_menu_loaded_check_start:

    If !MainMenuLoadedCheck() {
        Goto('script_start')
    }

    Sleep(3000)

    If !SeasonalEvents() {
        Goto('script_start')
    }

hunt_start:

    If (!EnterEventsTab()) {
        Goto('script_start')
    }

    If !EnterHuntTab() {
        Goto('script_start')
    }

HuntRaceScreen:

    If !isRaceScreen() {
        Goto('script_start')
    }

    ticketRes := TicketCheck()

    if (ticketRes.doRestart) {
        Goto('script_start')
    } else if (!ticketRes.canPlay) {
        Goto('hunt_end')
    }

    Sleep(2000)

    SelectCarToPlayHuntRace()
    TdCheck()

    if !HuntClickOnPlayButton() {
        Goto('script_start')
    }

    Sleep(8000)

    if !PlayHuntRace() {
        Goto('script_start')
    }


    If (HuntRewardsSkip()) {
        Goto('HuntRaceScreen')
    } Else {
        Goto('script_start')
    }

hunt_end:
    MsgBox("hunt ended")

script_end:

    ^q:: ExitApp

    ; includes
    #Include %A_ScriptDir%\functions\Global.ahk
    #Include %A_ScriptDir%\functions\GameFunctions.ahk
    #Include %A_ScriptDir%\functions\Startup.ahk
    #Include %A_ScriptDir%\functions\Hunt.ahk
    #Include %A_ScriptDir%\functions\MP.ahk
    #Include %A_ScriptDir%\functions\Ads.ahk

    ; libs
    #Include %A_ScriptDir%\libs\IMG_tool.ahk