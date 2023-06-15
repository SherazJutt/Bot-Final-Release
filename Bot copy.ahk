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

t1:=A_TickCount, X:=Y:=""

global SettingsIni := A_ScriptDir "\settings.ini"

global carNames := ["Lancer", "Hellcat", "Peugeotsr1", "Lamborghinicountach25th", "Srt8", "Saleens1", "Ferrarimonzasp1", "Jaguarxesvproject", "Lamborghinimiura", "Bugattieb110", "Porsche911gscoupe", "Nissanr390", "Ferrarienzo", "Lamborghiniessenza", "Porschecarrera", "Vulkan", "Sennagtr", "Zondar", "Centenario", "RaesrTacheon", "Trion", "Naran"]

#Include, %A_ScriptDir%\src\Boot.ahk
#Include, %A_ScriptDir%\src\Guis\Main.ahk
#Include, %A_ScriptDir%\src\Guis\HuntCars.ahk
#Include, %A_ScriptDir%\src\Guis\CarsSkip.ahk

ScriptStart:

    ; <========== Hunt Start ==========>

    If (!EnterEventsTab()) {
        Goto, MainMenuLoadedCheck
    }

HuntStart:

    If (!EnterHuntTab()) {
        If (!MainMenuLoadedCheck()) {
            Goto, ScriptStart
        }
        Goto, MP1Start
    }

HuntRaceScreen:

    If (!isRaceScreen()) {
        Goto, ScriptStart
    }

    Sleep, 2000

    If (!TicketCheck()) {
        If (!MainMenuLoadedCheck()) {
            Goto, ScriptStart
        }
        Goto, MP1Start
    }

    Sleep, 1000
    SelectCarToPlayHunt()

    Sleep, 1000
    TdCheck()

    if(PlayButton()){
        Click, 1183, 634 Left, 1
    }

    Sleep, 8000

    If (!PlayHuntRace()){
        Goto, ScriptStart
    }

    If (HuntRewardsSkip()){
        Sleep, 1000
        Goto, HuntRaceScreen
    }Else{
        Goto, ScriptStart
    }

HuntEnded:

; <========== Hunt Ended ==========>

MP1Start:
    If (!MainMenuLoadedCheck()) {
        Goto, ScriptStart
    }
    ; entering mp
    Loop, 2
    {
        Click, 686, 644 Left, 1
        Sleep, 1000
    }

    authIndex := 0
    If (!XboxAuthentication()){
        If (authIndex == 60){
            Goto, ScriptStart
        }Else{
            authIndex ++
            Goto, MP1Start
        }
    }
LeagueDetectionLabel:
    If (LeagueDetection()){
        Goto, TiersCheckLabel
    }Else{
        SelectMPCarToPlay()
    }

    Sleep, 3000

TiersCheckLabel:

    TiersCheck()
    CheckGame()

CarsSkipLabel:
    If (CarsSkip()){
        Goto, TiersCheckLabel
    }

OwnsThisCarLabel:
    If (!OwnsThisCar()){
        Send, {PgDn}
        Sleep, 2000
        Goto, OwnsThisCarLabel
    }

    If (isRefueling){
        Send, {PgDn}
        Sleep, 2000
        Goto, OwnsThisCarLabel
    }

    TdCheck()
    StartMPRace()
    If (!PlayMpRace()){
        Goto, ScriptStart
    }

    Sleep, 2000

    Loop, 120{
        ; mp rewards skip
        Text:="|<>*144$3.zz0zzzzzzzzU"
        if (ok:=FindText(X, Y, 1184, 184, 1223, 222, 0, 0, Text))
        {
            Click, 1188, 649 Left, 1
            Sleep, 1000
            Break
        }Else{
            MpSkipCheck()
            Sleep, 2000
            if (PlayMPAds == "Checked"){
                Goto, watch_AD_end
                If (watch_AD_if_1st_2nd_OR_3rd()){
                    If (!close_AD()){
                        Goto, ScriptStart
                    }
                }
            }
            Click, 1188, 649 Left, 1
        }
    }

    If (!homeCheck()){
        Goto, ScriptStart
    }
    Goto, LeagueDetectionLabel

ExitApp

^p:: Pause
^q::
    SoundSet, 0, , mute
ExitApp

#Include, %A_ScriptDir%\src\functions\StartGame.ahk
#Include, %A_ScriptDir%\src\functions\StuckOnGlLogo.ahk
#Include, %A_ScriptDir%\src\functions\StuckOnLoadingScreen.ahk
#Include, %A_ScriptDir%\src\functions\MainMenuLoadedCheck.ahk
#Include, %A_ScriptDir%\src\functions\Events.ahk
#Include, %A_ScriptDir%\src\functions\Hunt.ahk
#Include, %A_ScriptDir%\src\functions\PlayRace.ahk
#Include, %A_ScriptDir%\src\functions\MP1.ahk
#Include, %A_ScriptDir%\src\functions\CarsSkip.ahk

#Include, %A_ScriptDir%\src\functions\CommonFunctions.ahk

#Include, %A_ScriptDir%\src\libs\JSON.ahk
#Include, %A_ScriptDir%\src\libs\FindText.ahk