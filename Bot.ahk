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

    ; Loop until successful response is received
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
    ExpirationDate := 2023 06 25
    PurchaseDate := 2023 06 01

    if (CurrentDate >= ExpirationDate or !data)
    {
        msgbox, The subscription period is over.
        ExitApp
    }Else if (CurrentDate <= PurchaseDate)
    {
        msgbox, Warning dont change the system date
        ExitApp
    }Else{
        ToolTip, ExpirationDate : 25 June 2023 , 640, 0,
    }

    t1:=A_TickCount, X:=Y:=""

    global SettingsIni := A_ScriptDir "\settings.ini"

    global carNames := ["Lancer", "Hellcat", "Peugeotsr1", "Lamborghinicountach25th", "Srt8", "Saleens1", "Ferrarimonzasp1", "Jaguarxesvproject", "Lamborghinimiura", "Bugattieb110", "Porsche911gscoupe", "Nissanr390", "Ferrarienzo", "Lamborghiniessenza", "Porschecarrera", "Vulkan", "Sennagtr", "Zondar", "Centenario", "RaesrTacheon", "Trion", "Naran"]
    global features := ["PlayHunt", "PlayMPAds", "MuteSystemVolume", "LeagueDetection", "EventPassHolder","AutoRefillTickets"]

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

    CheckGame()
    FullScreenAD()
    ExitGamePopUp()
    RewardsNext()

    If (!SeasonalEvents()) {
        Goto, script_start
    }

    Sleep, 1000

    ; <======================== Hunt Start ==============================>

    if (PlayHunt == 0){
        Goto, hunt_ended
    }

hunt_start:

    If (!EnterEventsTab()) {
        Goto, main_menu_loaded_check_start
    }

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

    Sleep, 2000

    TicketCheck()

tickets_check_end_label:

    Sleep, 1000
    SelectCarToPlayHunt()

    Sleep, 1000
    TdCheck()

    if(PlayButton()){
        Click, 1183, 634 Left, 1
    }Else{
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

MP1Start:
    If (!MainMenuLoadedCheck()) {
        Goto, script_start
    }
    If (!SeasonalEvents()) {
        Goto, script_start
    }

    Sleep, 2000
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
                        ;///////
                    }
                    else
                    {
                        Sleep, 500
                        Click, 977, 632 Left, 1
                        Sleep, 1000
                        Goto, i_check_to_play_start00
                    }
                    Click, 927, 634 Left, 1
                }
                else
                {
                    Sleep, 1000
                    IfWinExist, Asphalt 9: Legends
                    {
                        WinActivate, Asphalt 9: Legends
                        WinMove , Asphalt 9: Legends, , 0, 0, 1280, 720
                        WinRestore, Asphalt 9: Legends
                    }
                    else
                    {
                        ToolTip, i check to play, 640, 0,
                        Sleep, 1000
                        Goto, script_start
                    }

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
                        IfWinExist, Asphalt 9: Legends
                        {
                            WinActivate, Asphalt 9: Legends
                            WinMove , Asphalt 9: Legends, , 0, 0, 1280, 720
                            WinRestore, Asphalt 9: Legends
                        }
                        else
                        {
                            ToolTip, car selection screen, 640, 0,
                            Sleep, 1000
                            Goto, script_start
                        }
                    }
                }

                Sleep, 1000

                Click, 805, 142 Left, 1
                Sleep, 1000

                Click, 370, 331 Left, 1
                Sleep, 2000

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

                    if (ok:=FindText(X , Y, 494, 623, 566, 655, 0, 0, Text))
                    {
                    }
                    else
                    {
                        Sleep, 500
                        Click, 977, 632 Left, 1
                        Sleep, 1000
                        Goto, i_check_to_play_start0
                    }
                    Click, 927, 634 Left, 1
                }
                else
                {
                    Sleep, 1000
                    IfWinExist, Asphalt 9: Legends
                    {
                        WinActivate, Asphalt 9: Legends
                        WinMove , Asphalt 9: Legends, , 0, 0, 1280, 720
                        WinRestore, Asphalt 9: Legends
                    }
                    else
                    {
                        ToolTip, i check to play, 640, 0,
                        Sleep, 1000
                        Goto, script_start
                    }

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
                        Sleep, 100
                        IfWinExist, Asphalt 9: Legends
                        {
                            WinActivate, Asphalt 9: Legends
                            WinMove , Asphalt 9: Legends, , 0, 0, 1280, 720
                            WinRestore, Asphalt 9: Legends
                        }
                        else
                        {
                            ToolTip, car selection screen, 640, 0,
                            Sleep, 1000
                            Goto, script_start
                        }
                    }
                }

                Sleep, 1000

                Click, 879, 135 Left, 1
                Sleep, 1000

                Click, 370, 331 Left, 1
                Sleep, 2000

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

                    if (ok:=FindText(X , Y, 494, 623, 566, 655, 0, 0, Text))
                    {
                    }
                    else
                    {
                        Sleep, 500
                        Click, 977, 632 Left, 1
                        Sleep, 1000
                        Goto, i_check_to_play_start1
                    }
                    Click, 927, 634 Left, 1
                }
                else
                {
                    Sleep, 1000
                    IfWinExist, Asphalt 9: Legends
                    {
                        WinActivate, Asphalt 9: Legends
                        WinMove , Asphalt 9: Legends, , 0, 0, 1280, 720
                        WinRestore, Asphalt 9: Legends
                    }
                    else
                    {
                        ToolTip, i check to play, 640, 0,
                        Sleep, 1000
                        Goto, script_start
                    }

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
                        IfWinExist, Asphalt 9: Legends
                        {
                            WinActivate, Asphalt 9: Legends
                            WinMove , Asphalt 9: Legends, , 0, 0, 1280, 720
                            WinRestore, Asphalt 9: Legends
                        }
                        else
                        {
                            ToolTip, car selection screen, 640, 0,
                            Sleep, 1000
                            Goto, script_start
                        }
                    }
                }

                Sleep, 1000

                Click, 953, 141 Left, 1
                Sleep, 1000

                Click, 370, 331 Left, 1
                Sleep, 2000

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

                    if (ok:=FindText(X , Y, 494, 623, 566, 655, 0, 0, Text))
                    {
                    }
                    else
                    {
                        Sleep, 500
                        Click, 977, 632 Left, 1
                        Sleep, 1000
                        Goto, i_check_to_play_start2
                    }
                    Click, 927, 634 Left, 1
                }
                else
                {
                    Sleep, 1000
                    IfWinExist, Asphalt 9: Legends
                    {
                        WinActivate, Asphalt 9: Legends
                        WinMove , Asphalt 9: Legends, , 0, 0, 1280, 720
                        WinRestore, Asphalt 9: Legends
                    }
                    else
                    {
                        ToolTip, i check to play, 640, 0,
                        Sleep, 1000
                        Goto, script_start
                    }

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
                        Sleep, 100
                        IfWinExist, Asphalt 9: Legends
                        {
                            WinActivate, Asphalt 9: Legends
                            WinMove , Asphalt 9: Legends, , 0, 0, 1280, 720
                            WinRestore, Asphalt 9: Legends
                        }
                        else
                        {
                            ToolTip, car selection screen, 640, 0,
                            Sleep, 1000
                            Goto, script_start
                        }
                    }
                }

                Sleep, 1000

                Click, 1023, 142 Left, 1
                Sleep, 1000

                Click, 370, 331 Left, 1
                Sleep, 2000

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

                    if (ok:=FindText(X , Y, 494, 623, 566, 655, 0, 0, Text))
                    {
                    }
                    else
                    {
                        Sleep, 500
                        Click, 977, 632 Left, 1
                        Sleep, 1000
                        Goto, i_check_to_play_start3
                    }
                    Click, 927, 634 Left, 1
                }
                else
                {
                    Sleep, 1000
                    IfWinExist, Asphalt 9: Legends
                    {
                        WinActivate, Asphalt 9: Legends
                        WinMove , Asphalt 9: Legends, , 0, 0, 1280, 720
                        WinRestore, Asphalt 9: Legends
                    }
                    else
                    {
                        ToolTip, i check to play, 640, 0,
                        Sleep, 1000
                        Goto, script_start
                    }

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
                        Sleep, 100
                        IfWinExist, Asphalt 9: Legends
                        {
                            WinActivate, Asphalt 9: Legends
                            WinMove , Asphalt 9: Legends, , 0, 0, 1280, 720
                            WinRestore, Asphalt 9: Legends
                        }
                        else
                        {
                            ToolTip, car selection screen, 640, 0,
                            Sleep, 1000
                            Goto, script_start
                        }
                    }
                }

                Sleep, 1000
                Click, 1095, 138 Left, 1
                Sleep, 1000

                Click, 370, 331 Left, 1
                Sleep, 2000

                bronze = 0xD88560
                silver = 0x96B2D4
                gold = 0xF1CB30
                platinum = 0x9365F8
                legend = ""

                Goto, cars_skip_start
            }

        i_check_to_play_start:

            Sleep, 1000

            SelectMPCarToPlay()

        tiers_lock_check_start:

            TiersCheck()

        cars_skip_start:

            If (CarsSkip()){
                Goto, tiers_lock_check_start
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
            StartMPRace()

            Sleep, 10000

            ; syncing to the server start
            Loop, 30
            {
                Text:="|<>*127$33.zzzzzwwz7k7bXsw0QwD73XbVssyAw777lbUsszwwX77zbaMszwwl761bb8ssAww77lbbUsyAwy77lbbkswQwz7U3bbsy0zzzzzzU"
                if (ok:=FindText(X, Y, 1221, 604, 1261, 631, 0, 0, Text))
                {
                    Sleep, 1000
                }
                else
                {
                    Sleep, 1000
                    Break
                }
            }
            Text:="|<>*127$33.zzzzzwwz7k7bXsw0QwD73XbVssyAw777lbUsszwwX77zbaMszwwl761bb8ssAww77lbbUsyAwy77lbbkswQwz7U3bbsy0zzzzzzU"

            if (ok:=FindText(X, Y, 1221, 604, 1261, 631, 0, 0, Text))
            {
                Goto, script_start
            }
            ; syncing to the server end

            ; searching for players start
            Loop, 60
            {
                Text:="|<>*118$37.zzzzzzy7tws1z3wyQ0TVyDCD7Uz3b7XmDVnXltbkNlswntAswQswmQSCSSNCD70DC77X03b3XlXlnllsnwtss0tyQyQ0Tzzzzzy"

                if (ok:=FindText(X, Y, 712, 559, 756, 579, 0, 0, Text))
                {
                    Sleep, 1000
                }
                else
                {
                    Break
                }
            }
            Text:="|<>*118$37.zzzzzzy7tws1z3wyQ0TVyDCD7Uz3b7XmDVnXltbkNlswntAswQswmQSCSSNCD70DC77X03b3XlXlnllsnwtss0tyQyQ0Tzzzzzy"

            if (ok:=FindText(X, Y, 712, 559, 756, 579, 0, 0, Text))
            {
                Goto, script_start
            }
        ; searching for players end

        Space_loop_in_race_start:
            If (!PlayMpRace()){
                Goto, script_start
            }

        rewards_skip_start:

            Loop, 120{
                ; mp rewards skip
                Text:="|<>*144$3.zz0zzzzzzzzU"
                if (ok:=FindText(X, Y, 1184, 184, 1223, 222, 0, 0, Text)){
                    Click, 1188, 649 Left, 1
                    Break
                }Else{
                    Sleep, 1000
                    Click, 1188, 649 Left, 1
                    MpSkipCheck()
                    if (PlayMPAds == "Checked"){
                        If (watch_AD_if_1st_2nd_OR_3rd()){
                            If (close_AD()){
                                Break
                            }Else{
                                Goto, script_start
                            }
                        }
                    }
                }
            }

            If (!homeCheck()){
                Goto, script_start
            }

        }
        Goto, main_menu_loaded_check_start
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