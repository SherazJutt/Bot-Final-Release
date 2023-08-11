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
#Include, %A_ScriptDir%\src\Auth\login.ahk

MsgBox, "exiting"
ExitApp
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

date_check:

    ; Create WinHttpRequest object
    WinHttp := ComObjCreate("WinHttp.WinHttpRequest.5.1")

    ; Set URL and disable asynchronous requests
    WinHttp.Open("GET", "http://worldtimeapi.org/api/ip", false)

    ; Loop until sucessful response is received
    Loop
    {
        ; Display alert message
        MsgBox, 262144, , Connecting to internet... [ctrl + Q to exit], 1

        ; Send request
        try
        {
            WinHttp.Send()
            break
        }
        catch
        {
            ; Wait for 1 second before retrying
            Sleep, 1000
        }
    }

    ; Response received, process data
    data := WinHttp.ResponseText
    Pos := InStr(data, "datetime")
    Pos += 11
    CurrentDate := StrReplace(SubStr(data, Pos, 10),"-", "")

    ; Year Month Day
    ExpirationDate := 2023 08 15
    PurchaseDate := 2023 07 20

    if (CurrentDate >= ExpirationDate or !data)
    {
        msgbox, The subscription period is over.
        ExitApp
    }Else if (CurrentDate <= PurchaseDate)
    {
        msgbox, Warning dont change the system date
        ExitApp
    }Else{
        ToolTip, ExpirationDate : 15 August 2023 , 640, 0,
    }

    t1:=A_TickCount, X:=Y:=""

    global SettingsIni := A_ScriptDir "\settings.ini"

    global carNames := ["Lancer", "Hellcat", "Peugeotsr1", "Lamborghinicountach25th", "Srt8", "Saleens1", "Ferrarimonzasp1", "Jaguarxesvproject", "Lamborghinimiura", "Bugattieb110", "Porsche911gscoupe", "Nissanr390", "Ferrarienzo", "Lamborghiniessenza", "Porschecarrera", "Vulkan", "Sennagtr", "Zondar", "Centenario", "RaesrTacheon", "Trion", "Naran"]
    global features := ["PlayHunt", "PlayMP1","PlayMPAds", "MuteSystemVolume", "LeagueDetection", "EventPassHolder","AutoRefillTickets"]

    #Include, %A_ScriptDir%\src\Guis\Main.ahk
    #Include, %A_ScriptDir%\src\Guis\HuntCars.ahk
    #Include, %A_ScriptDir%\src\Guis\CarsSkip.ahk

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
    if (LeagueDetection == "Checked"){
        bronze = 0xD88560
        silver = 0x96B2D4
        gold = 0xF1CB30
        platinum = 0x9365F8
        legend = 0xF5E2A4
    }

    Loop, 25{

        ; ============== Bronze =============
        CoordMode, Pixel, Screen
        PixelSearch, FoundX, FoundY, 395, 343, 417, 368, %bronze%, 0, Fast RGB
        If (ErrorLevel = 0)
        {
            i_check_to_play_start00:

                Sleep, 1000

                Text:="|<>*144$3.zz0zzzzzzzzU"

                if (ok:=FindText(X , Y, 1184, 184, 1223, 222, 0, 0, Text))
                {
                    Text:="|<>*155$33.zw0Ty7zs7zwzzUzzrUy7USw3kw1zUC7UDw1kw1zUC7UDw1kw1zUS7UDw3kw1zzw7UDzz0w1zzk7UDwC0w1zVs7UDwD0w1zUw7UDw7Uw1rUS7zyw3kzzb0C7zsU"

                    if (ok:=FindText(X , Y, 494, 623, 566, 655, 0, 0, Text))
                    {
                        Sleep, 500
                        Click, 967, 632 Left, 1
                        Sleep, 1000
                        Goto, i_check_to_play_start00
                    }
                    Click, 927, 634 Left, 1
                }
                else
                {
                    Sleep, 1000
                    CheckGame()
                }

            i_check_to_play_end00:

                Loop, 100
                {
                    ; car selection screen
                    CoordMode, Pixel, Screen
                    PixelSearch, FoundX, FoundY, 108, 178, 119, 184, 0xFF0054, 0, Fast RGB
                    If (ErrorLevel = 0)
                    {
                        Sleep, 750
                        Break
                    }
                    else
                    {
                        Sleep, 100
                        CheckGame()
                    }
                }

                Sleep, 3000
                Click, 805, 142 Left, 1
                Sleep, 2000

                Click, 370, 331 Left, 1
                Sleep, 2500

                bronze = ""
                silver = 0x96B2D4
                gold = 0xF1CB30
                platinum = 0x9365F8
                legend = 0xF5E2A4

                Goto, cars_skip_start
            }
        ; ============== Silver =============
        CoordMode, Pixel, Screen
        PixelSearch, FoundX, FoundY, 395, 343, 417, 368, %silver%, 0, Fast RGB
        If (ErrorLevel = 0)
        {
            i_check_to_play_start0:

                Sleep, 1000

                Text:="|<>*144$3.zz0zzzzzzzzU"

                if (ok:=FindText(X , Y, 1184, 184, 1223, 222, 0, 0, Text))
                {
                    Text:="|<>*155$33.zw0Ty7zs7zwzzUzzrUy7USw3kw1zUC7UDw1kw1zUC7UDw1kw1zUS7UDw3kw1zzw7UDzz0w1zzk7UDwC0w1zVs7UDwD0w1zUw7UDw7Uw1rUS7zyw3kzzb0C7zsU"

                    if (!ok:=FindText(X , Y, 494, 623, 566, 655, 0, 0, Text)){
                        Sleep, 500
                        Click, 967, 632 Left, 1
                        Sleep, 1000
                        Goto, i_check_to_play_start0
                    }
                    Click, 927, 634 Left, 1
                }
                else
                {
                    Sleep, 1000
                    CheckGame()
                }

            i_check_to_play_end0:

                Loop, 100
                {
                    ; car selection screen
                    CoordMode, Pixel, Screen
                    PixelSearch, FoundX, FoundY, 108, 178, 119, 184, 0xFF0054, 0, Fast RGB
                    If (ErrorLevel = 0)
                    {
                        Sleep, 750
                        Break
                    }
                    else
                    {
                        CheckGame()
                    }
                }

                Sleep, 3000
                Click, 879, 135 Left, 1
                Sleep, 2000

                Click, 370, 331 Left, 1
                Sleep, 2500

                bronze = 0xD88560
                silver = ""
                gold = 0xF1CB30
                platinum = 0x9365F8
                legend = 0xF5E2A4

                Goto, cars_skip_start
            }
        ; ============== Gold =============
        CoordMode, Pixel, Screen
        PixelSearch, FoundX, FoundY, 395, 343, 417, 368, %gold%, 0, Fast RGB
        If (ErrorLevel = 0)
        {
            i_check_to_play_start1:

                Sleep, 1000

                Text:="|<>*144$3.zz0zzzzzzzzU"

                if (ok:=FindText(X , Y, 1184, 184, 1223, 222, 0, 0, Text))
                {
                    Text:="|<>*155$33.zw0Ty7zs7zwzzUzzrUy7USw3kw1zUC7UDw1kw1zUC7UDw1kw1zUS7UDw3kw1zzw7UDzz0w1zzk7UDwC0w1zVs7UDwD0w1zUw7UDw7Uw1rUS7zyw3kzzb0C7zsU"

                    if (!ok:=FindText(X , Y, 494, 623, 566, 655, 0, 0, Text)) {
                        Sleep, 500
                        Click, 967, 632 Left, 1
                        Sleep, 1000
                        Goto, i_check_to_play_start1
                    }
                    Click, 927, 634 Left, 1
                }
                else
                {
                    CheckGame()
                }

            i_check_to_play_end1:

                Loop, 100
                {
                    ; car selection screen
                    CoordMode, Pixel, Screen
                    PixelSearch, FoundX, FoundY, 108, 178, 119, 184, 0xFF0054, 0, Fast RGB
                    If (ErrorLevel = 0)
                    {
                        Sleep, 750
                        Break
                    }
                    else
                    {
                        Sleep, 100
                        CheckGame()
                    }
                }

                Sleep, 3000
                Click, 953, 141 Left, 1
                Sleep, 2000

                Click, 370, 331 Left, 1
                Sleep, 2500

                bronze = 0xD88560
                silver = 0x96B2D4
                gold = ""
                platinum = 0x9365F8
                legend = 0xF5E2A4

                Goto, cars_skip_start
            }

        ; ============== Platinum =============
        CoordMode, Pixel, Screen
        PixelSearch, FoundX, FoundY, 395, 343, 417, 368, %platinum%, 0, Fast RGB
        If (ErrorLevel = 0)
        {
            i_check_to_play_start2:

                Sleep, 1000

                Text:="|<>*144$3.zz0zzzzzzzzU"

                if (ok:=FindText(X , Y, 1184, 184, 1223, 222, 0, 0, Text))
                {
                    Text:="|<>*155$33.zw0Ty7zs7zwzzUzzrUy7USw3kw1zUC7UDw1kw1zUC7UDw1kw1zUS7UDw3kw1zzw7UDzz0w1zzk7UDwC0w1zVs7UDwD0w1zUw7UDw7Uw1rUS7zyw3kzzb0C7zsU"

                    if (!ok:=FindText(X , Y, 494, 623, 566, 655, 0, 0, Text)) {
                        Sleep, 500
                        Click, 967, 632 Left, 1
                        Sleep, 1000
                        Goto, i_check_to_play_start2
                    }
                    Click, 927, 634 Left, 1
                }
                else
                {
                    CheckGame()
                }

            i_check_to_play_end2:

                Loop, 100
                {
                    ; car selection screen
                    CoordMode, Pixel, Screen
                    PixelSearch, FoundX, FoundY, 108, 178, 119, 184, 0xFF0054, 0, Fast RGB
                    If (ErrorLevel = 0)
                    {
                        Sleep, 750
                        Break
                    }
                    else
                    {
                        CheckGame()
                    }
                }

                Sleep, 3000
                Click, 1023, 142 Left, 1
                Sleep, 2000

                Click, 370, 331 Left, 1
                Sleep, 2500

                bronze = 0xD88560
                silver = 0x96B2D4
                gold = 0xF1CB30
                platinum = ""
                legend = 0xF5E2A4

                Goto, cars_skip_start
            }
        ; ============== Legend =============

        CoordMode, Pixel, Screen
        PixelSearch, FoundX, FoundY, 395, 343, 417, 368, %legend%, 0, Fast RGB
        If (ErrorLevel = 0)
        {
            i_check_to_play_start3:

                Sleep, 1000

                Text:="|<>*144$3.zz0zzzzzzzzU"

                if (ok:=FindText(X , Y, 1184, 184, 1223, 222, 0, 0, Text))
                {
                    Text:="|<>*155$33.zw0Ty7zs7zwzzUzzrUy7USw3kw1zUC7UDw1kw1zUC7UDw1kw1zUS7UDw3kw1zzw7UDzz0w1zzk7UDwC0w1zVs7UDwD0w1zUw7UDw7Uw1rUS7zyw3kzzb0C7zsU"

                    if (!ok:=FindText(X , Y, 494, 623, 566, 655, 0, 0, Text)) {
                        Sleep, 500
                        Click, 967, 632 Left, 1
                        Sleep, 1000
                        Goto, i_check_to_play_start3
                    }
                    Click, 927, 634 Left, 1
                }
                else
                {
                    CheckGame()
                }

            i_check_to_play_end3:

                Loop, 100
                {
                    ; car selection screen
                    CoordMode, Pixel, Screen
                    PixelSearch, FoundX, FoundY, 108, 178, 119, 184, 0xFF0054, 0, Fast RGB
                    If (ErrorLevel = 0)
                    {
                        Sleep, 750
                        Break
                    }
                    else
                    {
                        CheckGame()
                    }
                }

                Sleep, 3000
                Click, 1095, 138 Left, 1
                Sleep, 2000

                Click, 370, 331 Left, 1
                Sleep, 2500

                bronze = 0xD88560
                silver = 0x96B2D4
                gold = 0xF1CB30
                platinum = 0x9365F8
                legend = ""

                Goto, cars_skip_start
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