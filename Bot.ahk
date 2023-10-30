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

global carNames := ["Lancer", "Hellcat", "Peugeotsr1", "Lamborghinicountach25th", "Srt8", "Saleens1", "Ferrarimonzasp1", "Jaguarxesvproject", "Lamborghinimiura", "Bugattieb110", "Porsche911gscoupe", "Nissanr390", "Ferrarienzo", "Lamborghiniessenza", "Porschecarrera", "Vulkan", "Sennagtr", "Zondar", "Centenario", "RaesrTacheon", "Trion", "Naran"]
global features := ["PlayHunt", "PlayMP1","PlayMPAds", "MuteSystemVolume", "LeagueDetection", "EventPassHolder","AutoRefillTickets"]

#Include, %A_ScriptDir%\src\Auth\login.ahk
#Include, %A_ScriptDir%\src\Guis\Main.ahk
#Include, %A_ScriptDir%\src\Guis\HuntCars.ahk
#Include, %A_ScriptDir%\src\Guis\CarsSkip.ahk
#Include, %A_ScriptDir%\src\Guis\Delays.ahk

GuiEscape:
GuiClose:
ExitApp

script_start:

    Gui, Destroy

    If (MuteSystemVolume == "Checked"){
        SoundSet,+1,,Mute
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

    ; <======================== Hunt Start ==============================>

    if (PlayHunt == 0){
        Goto, hunt_ended
    }

hunt_start:

    If (!EnterEventsTab()) {
        Goto, main_menu_loaded_check_start
    }

    Sleep, 2000

    If (!EnterHuntTab()) {
        If (!MainMenuLoadedCheck()) {
            Goto, script_start
        }
        Goto, hunt_ended
    }

HuntRaceScreen:

    If (!isRaceScreen()) {
        Goto, script_start
    }

    TicketCheck()

    SelectCarToPlayHunt()

    TdCheck()

    if(!ClickOnPlayButton()){
        Goto, script_start
    }

    Sleep, 8000

    If (!PlayHuntRace()){
        Goto, script_start
    }

    If (HuntRewardsSkip()){
        Goto, HuntRaceScreen
    }Else{
        Goto, script_start
    }

hunt_ended:

    ; <======================== Hunt ended ==============================>
    If (PlayMP1 == 0){
        MsgBox, 4,Play MP1 is not checked, Do you want to close the game ?
        IfMsgBox Yes
        {
            WinClose , Asphalt 9: Legends
            ExitApp
        }Else
        {
            ExitApp
        }
    }

MP1Start:
    If (!MainMenuLoadedCheck()) {
        Goto, script_start
    }
    If (!SeasonalEvents()) {
        Goto, script_start
    }

    ; entering mp
    Loop, 2{
        Click, 686, 644 Left, 1
        Sleep, 1000
    }

    authIndex := 0
    If (!XboxAuthentication()){
        If (authIndex == 60){
            Goto, script_start
        }Else{
            authIndex ++
            Goto, MP1Start
        }
    }Else{
        Sleep, 1000
    }

LeagueDetectionLabel:
    currLeague := ""

    Sleep, 3000
    Loop, 20{

        ; check if league detection is checked from ui
        if (LeagueDetection == "Checked"){
            ; (i) icon to confirm mp screen
            Text:="|<>*144$3.zz0zzzzzzzzU"
            if (ok:=FindText(X , Y, 1184, 184, 1223, 222, 0, 0, Text)){
                isMpScreen := False

                Loop, 30{
                    ; leaderboard last chracters check to confirm if leaderboard button is available

                    Text:="|<>*152$191.s07zs0w0Dz0DzkTw0Ty01y00y0Dz07zVk0Dzk3w0zzUTzVzy0zz0TzU1w0TzUTznU0TzU7s1zzUzz3zy1zz1zz03w0zzUzzr00s00Dk3kD1s07US3US3kD0Ds1sDVs7i01k00zk7UD3k0D0Q70Q70C0Rk3kD3k7w03U01nUD0S7U0S0sC0sC0Q0vk7UC7UDs07003b0S0wD00w1kQ1kQ0s1rUD0QD0Tk0C007C0w1sS01s3Us3Us1k7b0S0sS0zU0Q00SS1s3kw03k71k71k3UCC0w1kw1z00s00sQ3k7Vs07UC3US3U70QS1s3Vs3y01zw1ks7UD3zsD0w7zs70C1sQ3kD3k7w03zs7VsD0S7zkTzkDzkC0Q3Us7zw7UDs07zUD3kS0wDz0zzUQ3kQ0s71kDzkD0Tk0C00Q3Uw1sS01zw0s3ks1kS3kTz0S0zU0Q00zz1s3kw03ks1k7Vk3UzzUwC0w1z00s03zz3k7Vs07Vs3UD3U71zz1sS1s3y01k07zy7UD3k0D1k70S70C3zz3kw3k7w03U0C0QD0S7U0S3kC0wC0QD0S7Uw7UDs0700w0wS0wD00w3UQ1sS1sS0QD1sD0RzyDzls1szzkTzVs7UzzUzzks0sS1sTzvzwTzXU1lzzUzz3k71zz0zz3k1sw3kzzbzszz703Vzw1zy7UD3zs0zw7U1lk3Vzy8"

                    if (ok:=FindText(X, Y, 359, 620, 566, 656, 0, 0, Text)) {
                        Sleep, 1000
                        isMpScreen := True
                        Break
                    }Else{
                        Click, 970, 634 Left, 1
                        Sleep, 1000
                    }
                }
                If (!isMpScreen){
                    Gosub, script_start
                }
            }

            ; league detection main
            LeagueColors := [{id:1, label: "bronze", color: 0xD88560, clickX: 805, clickY: 142},{id:2, label: "silver", color: 0x96B2D4, clickX: 879, clickY: 135},{id:3, label: "gold", color: 0xF1CB30, clickX: 953, clickY: 141},{id:4, label: "platinum", color: 0x9365F8, clickX: 1023, clickY: 142},{id:5, label: "legend", color: 0xF5E2A4, clickX: 1095, clickY: 138}]

            for index, car in LeagueColors{
                CoordMode, Pixel, Screen
                PixelSearch, FoundX, FoundY, 395, 343, 417, 368, car.color, 0, Fast RGB
                If (ErrorLevel = 0) {
                    currLabel := car.label
                    If (currLeague == currLabel){
                        Break
                    }Else{
                        currLeague = car.label
                        Sleep, 500
                        Click, 927, 632 Left, 1

                        ; get current value from settings.ini file
                        IniRead, mp_play_button_click_delay, %SettingsIni%, DELAYS, mp_play_button_click_delay
                        Sleep, %mp_play_button_click_delay%

                        ; car selection screen
                        Text:="|<>*133$247.w0Tzw7zs07zzzk1zs01yDzy00Tw0Tk00wDz07zXzss03zw1zw00zzzU0Dw00y7zz00Ds03s00S7y00zkzw800zy0zy00DzzU03y00T3zzU07s00w00D3y00DsTy000Dz0Tz003zzk01z00DVzzk03s00C007Vy003w7z07w7z07zVz1zzkTkTVzzkzzsTzw7w7z3zkz1z1y1zU7z3zV3zkzkzzsTwDkzzsTzwDzy7z3zVzsTVzkz0zk3zVzkVzsTsTzwDy7sTzwDzy7zz3zVzkzwDkzsTUDs1zkzsMTwDwDzy7z3wDzy7zz3zzVzkzsTy7sTwDk7w0zsTsQDy7y7zz3zzy7zz3zzVzzkzsTwDz3wDy7s1y0TzzwC7z3z3zzVzzz3zzVzzkzzsTzzy7zVy7z3w0z0Dzzy73zVzVzzkTzzVzzkzzsTzwDzzz3zkz3zVy4DU7zzy3kzkzkzzs0zzkzzsTzwDzy7zzzVzsTVzkz23k3zzz3sTsTkTzy01zs03wDzy00z3zzzkzwDkzsTVVs1zzzVwDw00DzzU0Dw01y7zz00TVzzzsTy7sTwDkkQ0zzzkz3y00Dzzw03y00z3zzU0DkzzzwDz3wDy7sQC0TzzkTVz00Dzzzs0z3zzVzzkzzsTzzy7zVy7z3wD30DzzsTkzU0DzzzzkTVzzkzzsTzwDzzz3zkz3zVy7VU7zzw00Tky7zzzzwDkzzsTzwDzy7zzzVzsTVzkz3sE3zVy007sT3zzyTy7sTzwDzy7zz3zVzkzwDkzsTVw01zky003wDkzzy7z3wDzy7zz3zzVzkzsTy7sTwDkz00zsT001y7sTzz3zVy7zz3zzVzzkzsTwDz3wDy7sTU0TwDVzkT3w7zzVzkz3zzVzzkzzsTwDy7zVy7z3wDs07w7UzwDVz3zzkTkTVzzkzzsTzw7w7z3zkz1z1y7y0003kzy7kzUzzw00Dk03s00w00y003zVzsTU00z3z0U03sTz3sTsTzy00Ds01w00S00TU03zkzwDs00zVzkM03wDzkwDw7zzU0Dw00y00D00Ds03zsTy7y00zkzsD07yDzsSDz3zzw0Ty00TU07U07z07zwDz3zk1zszyA"
                        if (ok:=FindText(X:="wait", Y:=10, 100, 109, 368, 155, 0, 0, Text)){
                            Sleep, 2000

                            PosX:=car.clickX
                            PosY:=car.clickY
                            Click, %PosX%, %PosY% Left, 1
                            Sleep, 2000

                            Click, 370, 331 Left, 1
                            Sleep, 2500

                            Goto, cars_skip_start
                        }Else{
                            Gosub, script_start
                        }
                    }
                }
            }
        }

        i_check_to_play_start:

            SelectMPCarToPlay()

            ; check upgrade text to verify selected car
            Text:="|<>*148$145.s1kTz01z07zU0DU1zs0zz0DsQ0sDzs3zs7zw07k1zz0TzUTzC0Q7zy3zy3zz07s0zzkDzkTzr0C3kD1sD1s7U3y0S1w700T1vU71s3Vs3kw1s1r0D0S3U0D0Rk3Uw1kw1sS0w1vU7U71k070Cs1kS0sS0wD0S0xs3k3Us03U7Q0sD0QD0A7UD0QQ1s1kQ01k0C0Q7UC7U03k7UCC0w0sC00w070C3k73k01s3kD7US0Q700TU3U71s3Vs00w1k73kD0C3zs7z1k3Uw3kwTsTzs3Us7U71zw1zws1kTzsSDwDzs3kQ3k3Uzy0DzQ0sDzsD3y7zs1sD1s1kQ000Ti0Q7zk7UD3kw0s7Uw0sC0001z0C3k03k7VsS0TzkS0Q70000zU71s01s3kw7UTzsD0C3U0C0Tk3Uw00w1sS3kDzy7U71k070Ds1kS00S0wD0s7073k7Us03k7y1sD00DUw7US7U3Vs7kQ01s7jzw7U03zy3k73k1szzkDzkTznzw3k00zy1s3lk0wTzk7zsDzkTs1k007w0w0ss0CDzk3zw1zV"
            if (!ok:=FindText(X:="wait", Y:=10, 103, 617, 274, 663, 0, 0, Text)){
                Goto, script_start
            }

        tiers_lock_check_start:

            TiersCheck()

        cars_skip_start:

            If (CarsSkip()){
                Goto, tiers_lock_check_start
            }Else{
                Sleep, 2000
            }

            If (!OwnsThisCar()){
                Send, {PgDn}
                Sleep, 2000
                Goto, tiers_lock_check_start
            }
            If (isRefueling()){
                Send, {PgDn}
                Sleep, 2000
                Goto, tiers_lock_check_start
            }

            TdCheck()
            If (!ClickOnPlayButton()){
                Goto, script_start
            }

            Sleep, 10000

            SyncingToTheServer()

            SearchingForPlayers()

        Space_loop_in_race_start:
            ; this will complete the race and clicks twice to check the ads screen if available
            If (!PlayMpRace()){
                Goto, script_start
            }

        watch_AD_start:
            ; skip Ads
            if (PlayMPAds != "Checked"){
                Goto, watch_AD_end
            }

            If (watch_AD_if_1st_2nd_OR_3rd()){
                ; click on (watch ad) button
                Text:="|<>*125$143.w1s3k3s3zz1zs3U7000y0Dzls3k7UDk7zy7zsD0C001w0TznkDkD0TUDzwTzsS0Q007w0zzrUTUS0zU0w0w3kw0s00Ds1s7b0z0s1r01s1k3Vs1k00Rk3k7j1y1k7i03k3U73k3U01vU7UDS3C7UCQ07U70C7U7003rUD0SwCQD0Qw0D0C0QD0C00770S0xsQsS1ss0S0Q00S0Q00CC0w1tktks3Vk0w0s00w0s00wS1s3nVnVk73k1s1k01zzk01kw3k7bb3XUC3U3k3U03zzU03Us7UDDC7D0w707U7007zz0071kD0SSQCS1kD0D0C00D0C00S3kS0wwsQs3zy0S0Q00S0Q00zzUw1stkNkDzw0w0s1kw0s01zz1s3lr0vUTzs1s1k3Vs1k07zz3k7Xi1r0s1s3k3U73k3U0D0S7UD7w3y1k3k7U70S7U700Q0QD0SDs3w7U3UD0DzwD0C01s0sTzsDU7kD07US0DzkS0Q03k1szzkT0DUQ0D0w0Dz0w0s0701lzy8"
                if (ok:=FindText(X:="wait", Y:=5, 984, 516, 1141, 553, 0, 0, Text))
                {
                    Sleep, 1000
                    Click, 962, 523 Left, 1
                    Sleep, 3000

                    If (Close_AD()){
                        Sleep, 1000
                        ; AD Next button
                        Text:="|<>*128$62.000000000030A3zlk37zls3VzwS1vzyS0sTz3UQTzbkC700wD0Q1w3Vk073U70TUsQ01tk1k7wC700CQ0Q1r3Vk03y070RssTw0TU1k7CC7zU7k0Q1lnVzs1w070QQsQ00TU1k73i700Ds0Q1kzVk03b070Q7sQ01tk1k71y700QC0Q1kDVk0D3k70Q1sTz3UQ1k70S7zls7UQ1k3VzwQ0s7000000000008"
                        if (ok:=FindText(X:="wait", Y:=10, 1006, 628, 1083, 661, 0, 0, Text)){
                            Sleep, 1000
                            Click, 1154, 639 Left, 1
                            Sleep, 1000
                            ; move the mouse little bit up to see the next button
                            Click, 1242, 409, 0
                        }Else{
                            Goto, script_start
                        }
                    }Else{
                        Goto, script_start
                    }
                }Else{
                    Goto, script_start
                }
            }Else{
                ; move the mouse little bit up to see the next button like done if ad is closed
                Click, 1242, 409, 0
            }

        watch_AD_end:

            If (!ConfirmIfRaceIsCompleted()){
                Goto, script_start
            }

        }

        Goto, main_menu_loaded_check_start
        ExitApp
        ^p:: Pause
        ^q::
            SoundSet, 0, , mute
        ExitApp

        ; common functions
        #Include, %A_ScriptDir%\src\functions\CommonFunctions.ahk

        ; Events
        #Include, %A_ScriptDir%\src\functions\Events\Events.ahk
        #Include, %A_ScriptDir%\src\functions\Events\Hunt.ahk

        ; MP1
        #Include, %A_ScriptDir%\src\functions\MP1\MP1.ahk
        #Include, %A_ScriptDir%\src\functions\MP1\CarsSkip.ahk
        #Include, %A_ScriptDir%\src\functions\MP1\RewardsSkip.ahk
        #Include, %A_ScriptDir%\src\functions\MP1\Ads.ahk

        ; Play Race
        #Include, %A_ScriptDir%\src\functions\PlayRace.ahk

        ; libs
        #Include, %A_ScriptDir%\src\libs\JSON.ahk
        #Include, %A_ScriptDir%\src\libs\FindText.ahk