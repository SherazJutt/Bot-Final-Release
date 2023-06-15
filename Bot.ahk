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
    ExpirationDate := 2023 06 20
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
        ToolTip, ExpirationDate : 20 June 2023 , 640, 0,
    }

    t1:=A_TickCount, X:=Y:=""

    global SettingsIni := A_ScriptDir "\settings.ini"

    global carNames := ["Lancer", "Hellcat", "Peugeotsr1", "Lamborghinicountach25th", "Srt8", "Saleens1", "Ferrarimonzasp1", "Jaguarxesvproject", "Lamborghinimiura", "Bugattieb110", "Porsche911gscoupe", "Nissanr390", "Ferrarienzo", "Lamborghiniessenza", "Porschecarrera", "Vulkan", "Sennagtr", "Zondar", "Centenario", "RaesrTacheon", "Trion", "Naran"]

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

    If (!TicketCheck()) {
        Goto, MP1Start
    }

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

    ; entering mp
    Click, 686, 644 Left, 1
    Sleep, 2000

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

            Loop, 150
            {
                Text:="|<>*144$3.zz0zzzzzzzzU"

                if (ok:=FindText(X , Y, 1184, 184, 1223, 222, 0, 0, Text))
                {
                    Break
                }
                else
                {
                    Sleep, 100
                    MouseMove, 1188, 649
                    Click, 1188, 649 Left, 1
                }

            }

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
                    Goto, i_check_to_play_start
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
                ; star up check it later
                Text:="|<>*149$211.Dz0Q0wDzs7z0S0w03VzzU0s00T0DzwzzVzwDzkC0S7zw7zsD0w01kzzk0Q00Dk7zyTzkzzbzw70D3zw7zy7UQ00sTzk0C007s3zyDzkTzrUC3U7Vs03UD3kS00Q0Q007007w03U7U0C0zU7Vk3kw03k7VsS00C0C003U03z01k3k070Tk3ks1sS01s1kwS00707001k01nU0s1s03UDs1sQ0wD00w0sSD003U3U00s00tk0Q0w01k7w00C0S7U0S00DD001k1k00Q00ww0C0S00s3y0070D3k0D007j000s0s00C00QS070D00Q1z003zzVzw7U03r000Q0Q00700C703U7zkC0zU01zzkzy3k01zk00C0C003U073U1k3zs70xk00zzsTz1s00zs00707001k07Vs0s1zw3zys00Q0wD00w00Ty003U3U00s03UQ0Q0w01zyQ00C0S7U0S00DbU01k1k00Q01kC0C0S00wyC0A70D3k0D0C7Vk00s0s00C01zzU70D00Q770D3U7Vs07U73kw00Q0Q00700zzk3U7U0C3nU7Vk3kw03k3VsD00C0C003U0Tzs1k3k071tk3ks1sS01s3kw3U0707001k0C0Q0s1s03USw3kQ0wD00Q1sS1s03U3U00s0D0D0Q0w01kDDzsC0S7zwDzsD0S01k1k00Tzb03UC0Tzks3rzs70D3zy3zw7U700s0s00DznU1k70DzsQ1szs3U71zy0zs3U3k0Q0Q007zvk0s3U7zwC0S"

                if (ok:=FindText(X, Y, 328, 617, 553, 653, 0, 0, Text))
                {
                    Send, {Escape}
                    Sleep, 1000
                    Goto, i_check_to_play_start
                }

                ; connection error retry
                Text:="|<>*127$59.01zzU7z00y00Ts03y00Q00TU03w00M00z003s00EzVw7y7kzkVzVsTwDVzV3z3kzsT3z27y7Vzky7y4DwD3zVwDw8TsS7z3sTsEzkwDy7kzkVz3sTwDVzV3w7kzsT3w200DVzky00A00z3zVw00s07y7z3s03kwDwDy7ky7VwDsTwDVwD3sTkzsT3wC7sTVzky7sQDkz3zVwDsMTkz3y3sTkkzVy00DkzkVz1y00TVzV3z3y01z3z1"

                if (ok:=FindText(X, Y, 724, 201, 812, 244, 0, 0, Text))
                {
                    Goto, script_start
                }

                ; club ms claim later
                Text:="|<>*148$74.w00S0zzXzsTyD00DkDzszy7zvk03w3zyDzVzyw00z01k3U0Q3z00Cs0Q0s070Tk07C070C01k7w01nU1k3U0Q1z00Qs0Q0s070Tk0D7070C01k7w03Vk1k3zkQ3z00sQ0Q0zw7zvk0C7U70C01zww070s1k3U0TyD01zy0Q0s073Xk0TzU70C01kww0Dzw1k3U0Q7D03U70Q0s071vk0s1k70C01kCzzC0S1k3zsQ3zzr03UQ0zy70S"

                if (ok:=FindText(X, Y, 452, 578, 544, 615, 0, 0, Text))
                {
                    Send, {Escape}
                    Sleep, 1000
                    Goto, i_check_to_play_start
                }

                ; tier unlocked
                Text:="|<>*110$82.1w0Q007k1kDk3szy3s00zU7Uz0TrzwDU07y0S3y1zzzky00Ts1sDs7zsDXs01zU7UzUzz0yDU07z0S3y3zw3sy00yw1sDwDzkDXs03nk7Uxlvz00DU0DD0S3r7jw00y00wy1sDSQzk03s07ls7Uxtnz00DU0S7US3njDw00y01sS1sDDszk03s07Vw7UwzXz0QDU0zzkS3lyDw3sy03zz1sD7szkDXs0Dzw7UwT3z0yDU0zzsS3ksDy7sy07k7VsD00zzz3zyS0S7Uw03rzwDzts1wS3k0DDzUzzbU7lsD00y"

                if (ok:=FindText(X, Y, 562, 536, 705, 597, 0, 0, Text))
                {
                    Send, {Escape}
                    Sleep, 1000
                    Goto, i_check_to_play_start
                }

                ; Demoted
                Text:="|<>*154$35.DzUS0wzzUw3lzz1sD7UD3kQD0S7VsS0wD7Uw1sSS1s3kww3k7Vvk7UD3z0D0S7z0S0wDz0w1sTC1s3kyS3k7VsS7UD3kQD0S7UwS0wD0wT7kS0szzUw1szy1s1w"

                if (ok:=FindText(X, Y, 609, 520, 659, 554, 0, 0, Text))
                {
                    Send, {Escape}
                    Sleep, 1000
                    Goto, i_check_to_play_start
                }

                ; rewards next
                Text:="|<>*151$68.w0w7zsw0wzzz0D1zy7UDDzzs3kTzVs7Xzzy0w700D1s1sDkD1k01kw0S3y3kQ00SD07UzUw7003bU1sDwD1k00xs0S3r3kQ007w07Uxsw7zk1y01sDCD1zw0DU0S3nnkTz07s07UwQw7001z01sD7j1k00zk0S3kzkQ00DS07Uw7w7007XU1sD1z1k01sw0S3kDkQ00w707Uw3w700D1s1sD0T1zw7UC0S3k7kTzVs3k7Uw0w7zsw0Q1s6061zwC030A2"

                if (ok:=FindText(X, Y, 1106, 635, 1187, 666, 0, 0, Text))
                {
                    Sleep, 250
                    MouseMove, 1188, 649
                    Click, 1188, 649 Left, 1
                    Sleep, 1500
                    Goto, i_check_to_play_start
                }
                else
                {
                    Sleep, 1000
                    MouseMove, 1188, 649
                    Click, 1188, 649 Left, 1
                    Sleep, 1500

                    Text:="|<>*144$3.zz0zzzzzzzzU"

                    if (ok:=FindText(X , Y, 1184, 184, 1223, 222, 0, 0, Text))
                    {
                        Goto, i_check_to_play_start
                    }
                    else
                    {
                        Goto, script_start
                    }

                }

            }

        i_check_to_play_end:

        car_select_start:

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

            CoordMode, Pixel, Screen
            PixelSearch, FoundX, FoundY, 108, 178, 119, 184, 0xFF0054, 0, Fast RGB
            If (ErrorLevel = 0)
            {
                loop 2
                {
                    Sleep, 350
                    Send, {enter}
                }
            }
            else
            {
                Goto, script_start
            }

        car_select_end:

            ; car selected screen confirm

            Loop, 100
            {
                ; upgrade text color check to verify car selection screen
                CoordMode, Pixel, Screen
                PixelSearch, FoundX, FoundY, 114, 628, 151, 656, 0x0D2240, 0, Fast RGB
                If (ErrorLevel = 0)
                {
                    Sleep, 1000
                    Break
                }
                else
                {

                    Sleep, 100

                    ; GEt key / BP
                    Text:="|<>*150$45.007zzzzs00zzzzz0070zzzs00k1zzz00607zzs3wk0Tzz7z601zzzzUk0007y060000vU0k0007Q060000vU0k0007A060000tk0k0007C0607s0tk0k1zU76060Ty0ss0k3zk77060zy0ss0k7zs77060zz0sM0k3zk73U60Ty0sQ0k1zU73U607s0sA0k00071k60000sC0k00071k60000s60k00070s60000s70k00070s7zzU0s30zzy070Q7zzs0s3UzzzU70Q7zzy0s3Uzzzzz0A7zzzzs1k000000C0000001zz000007zk00000z0000006000004"

                    if (ok:=FindText(X, Y, 913, 602, 975, 660, 0, 0, Text))
                    {
                        Goto, tiers_lock_check_start
                    }
                    IfWinExist, Asphalt 9: Legends
                    {
                        WinActivate, Asphalt 9: Legends
                        WinMove , Asphalt 9: Legends, , 0, 0, 1280, 720
                        WinRestore, Asphalt 9: Legends
                    }
                    else
                    {
                        ToolTip, get key / bp, 640, 0,
                        Sleep, 1000
                        Goto, script_start
                    }
                    ; silver
                    CoordMode, Pixel, Screen
                    PixelSearch, FoundX, FoundY, 1024, 619, 1042, 635, 0x96B2D4, 0, Fast RGB
                    If (ErrorLevel = 0)
                    {
                        Goto, tiers_lock_check_start
                    }
                    ; Gold
                    CoordMode, Pixel, Screen
                    PixelSearch, FoundX, FoundY, 1042, 617, 1062, 637, 0xF1CB30, 0, Fast RGB
                    If (ErrorLevel = 0)
                    {
                        Goto, tiers_lock_check_start
                    }
                    ; Platinum
                    CoordMode, Pixel, Screen
                    PixelSearch, FoundX, FoundY, 992, 618, 1006, 635, 0x9365F8, 0, Fast RGB
                    If (ErrorLevel = 0)
                    {
                        Goto, tiers_lock_check_start
                    }
                    ; Legend
                    CoordMode, Pixel, Screen
                    PixelSearch, FoundX, FoundY, 1018, 619, 1034, 635, 0xF0DDA1, 0, Fast RGB
                    If (ErrorLevel = 0)
                    {
                        Goto, tiers_lock_check_start
                    }

                }
            }

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

            Sleep, 1000

            IfWinExist, Asphalt 9: Legends
            {
                WinActivate, Asphalt 9: Legends
                WinMove , Asphalt 9: Legends, , 0, 0, 1280, 720
                WinRestore, Asphalt 9: Legends
            }
            else
            {
                ToolTip, rewards skip start, 640, 0,
                Sleep, 1000
                Goto, script_start
            }

            Text:="|<>*144$3.zz0zzzzzzzzU"

            if (ok:=FindText(X, Y, 1184, 184, 1223, 222, 0, 0, Text))
            {
                Sleep, 250
                MouseMove, 1188, 649
                Click, 1188, 649 Left, 1
                Sleep, 250
            }
            else
            {

                Sleep, 1000
                MouseMove, 1188, 649
                Click, 1188, 649 Left, 1
                Sleep, 1000

                ; Demoted
                Text:="|<>*154$35.DzUS0wzzUw3lzz1sD7UD3kQD0S7VsS0wD7Uw1sSS1s3kww3k7Vvk7UD3z0D0S7z0S0wDz0w1sTC1s3kyS3k7VsS7UD3kQD0S7UwS0wD0wT7kS0szzUw1szy1s1w"

                if (ok:=FindText(X, Y, 609, 520, 659, 554, 0, 0, Text))
                {
                    Send, {Escape}
                }
                ; club ms claim later
                Text:="|<>*148$74.w00S0zzXzsTyD00DkDzszy7zvk03w3zyDzVzyw00z01k3U0Q3z00Cs0Q0s070Tk07C070C01k7w01nU1k3U0Q1z00Qs0Q0s070Tk0D7070C01k7w03Vk1k3zkQ3z00sQ0Q0zw7zvk0C7U70C01zww070s1k3U0TyD01zy0Q0s073Xk0TzU70C01kww0Dzw1k3U0Q7D03U70Q0s071vk0s1k70C01kCzzC0S1k3zsQ3zzr03UQ0zy70S"

                if (ok:=FindText(X, Y, 452, 578, 544, 615, 0, 0, Text))
                {
                    Send, {Escape}
                }

                ; tier unlocked
                Text:="|<>*110$82.1w0Q007k1kDk3szy3s00zU7Uz0TrzwDU07y0S3y1zzzky00Ts1sDs7zsDXs01zU7UzUzz0yDU07z0S3y3zw3sy00yw1sDwDzkDXs03nk7Uxlvz00DU0DD0S3r7jw00y00wy1sDSQzk03s07ls7Uxtnz00DU0S7US3njDw00y01sS1sDDszk03s07Vw7UwzXz0QDU0zzkS3lyDw3sy03zz1sD7szkDXs0Dzw7UwT3z0yDU0zzsS3ksDy7sy07k7VsD00zzz3zyS0S7Uw03rzwDzts1wS3k0DDzUzzbU7lsD00y"

                if (ok:=FindText(X, Y, 562, 536, 705, 597, 0, 0, Text))
                {
                    Send, {Escape}
                }

                ; star up check it later
                Text:="|<>*149$211.Dz0Q0wDzs7z0S0w03VzzU0s00T0DzwzzVzwDzkC0S7zw7zsD0w01kzzk0Q00Dk7zyTzkzzbzw70D3zw7zy7UQ00sTzk0C007s3zyDzkTzrUC3U7Vs03UD3kS00Q0Q007007w03U7U0C0zU7Vk3kw03k7VsS00C0C003U03z01k3k070Tk3ks1sS01s1kwS00707001k01nU0s1s03UDs1sQ0wD00w0sSD003U3U00s00tk0Q0w01k7w00C0S7U0S00DD001k1k00Q00ww0C0S00s3y0070D3k0D007j000s0s00C00QS070D00Q1z003zzVzw7U03r000Q0Q00700C703U7zkC0zU01zzkzy3k01zk00C0C003U073U1k3zs70xk00zzsTz1s00zs00707001k07Vs0s1zw3zys00Q0wD00w00Ty003U3U00s03UQ0Q0w01zyQ00C0S7U0S00DbU01k1k00Q01kC0C0S00wyC0A70D3k0D0C7Vk00s0s00C01zzU70D00Q770D3U7Vs07U73kw00Q0Q00700zzk3U7U0C3nU7Vk3kw03k3VsD00C0C003U0Tzs1k3k071tk3ks1sS01s3kw3U0707001k0C0Q0s1s03USw3kQ0wD00Q1sS1s03U3U00s0D0D0Q0w01kDDzsC0S7zwDzsD0S01k1k00Tzb03UC0Tzks3rzs70D3zy3zw7U700s0s00DznU1k70DzsQ1szs3U71zy0zs3U3k0Q0Q007zvk0s3U7zwC0S"

                if (ok:=FindText(X, Y, 328, 617, 553, 653, 0, 0, Text))
                {
                    Send, {Escape}
                }

                ; connection error retry
                Text:="|<>*127$59.01zzU7z00y00Ts03y00Q00TU03w00M00z003s00EzVw7y7kzkVzVsTwDVzV3z3kzsT3z27y7Vzky7y4DwD3zVwDw8TsS7z3sTsEzkwDy7kzkVz3sTwDVzV3w7kzsT3w200DVzky00A00z3zVw00s07y7z3s03kwDwDy7ky7VwDsTwDVwD3sTkzsT3wC7sTVzky7sQDkz3zVwDsMTkz3y3sTkkzVy00DkzkVz1y00TVzV3z3y01z3z1"

                if (ok:=FindText(X, Y, 724, 201, 812, 244, 0, 0, Text))
                {
                    Goto, script_start
                }
                ; asphalt 9 loading screen stuck
                Loop, 30
                {

                    Text:="|<>*53$36.zzzzzzy00001w00001k00001k00001U7zzzzUDzzzzUDzzzzUDzzzzU7zwvzk0000Dk00007s00003w00003zzzzk3zzzzw1zzzzw1zzzzw1zzzzs3U00003U00007U0000DU0001zzzzzzzU"

                    if (ok:=FindText(X, Y, 745, 429, 795, 468, 0, 0, Text))
                    {
                        Sleep, 1000
                    }
                    else
                    {
                        Break
                    }
                }
                Text:="|<>*53$36.zzzzzzy00001w00001k00001k00001U7zzzzUDzzzzUDzzzzUDzzzzU7zwvzk0000Dk00007s00003w00003zzzzk3zzzzw1zzzzw1zzzzw1zzzzs3U00003U00007U0000DU0001zzzzzzzU"

                if (ok:=FindText(X, Y, 745, 429, 795, 468, 0, 0, Text))
                {
                    Goto, script_start
                }

                ; skip Ads
                if (PlayMPAds == 0){
                    Goto, watch_AD_end
                }

                ; <========== AD Start ==========>

                ; watch_AD_if_1st_2nd_OR_3rd

                ; 1st

                Text:="|<>*162$38.zzzs00Tzzs003zzw000zzw000Dzw0007zw0001zw0000Tw00007y00001y00000z00000DU00003s00000y00000D000007k00001w00000T000007k03001s03U00y03s00DU3y003s3zU00y1zs00D1zw007tzz001zzzk00Tzzw007zzz001zzzU00zzzs00Dzzy003zzzU00zzzs00Dzzw007zzz001zzzk00Tzzw007zzz001zzzU00zzzs00Dzzy003zzzU00zzzs00Dzzw007zzz001zzzk00Tzzw007zzz001zzzU00zzzs00Dzzy003zzzU00zzzs00Dzzw007zzz001zzzk00Tzzw007zzz001zzzU00zzzs00Dzzy003zzzU00zzzs00Dzzw007zzz001zzzk00Tzzw007zzz001zzzU00zzzs00Dzzy003zzzU00zzzs00Dzzw007zzz001zzzk00Tzzw007zzz001zzzU00zzzs00Dzzy003zzzU00zzzs00Tzzy007zzzU03zzy"

                if (ok:=FindText(X, Y, 106, 82, 159, 178, 0, 0, Text))
                {
                    Goto, watch_AD_start
                }
                else
                {
                    ; 2nd
                    Text:="|<>*163$51.zzzzzzzzzwDz3y00zz0zkDk00zs7y1w003y0zkTU00Tk3y3w003y0TUTUTUDk3w3w7y1y0DUT0zkTU1w7s7y3w0DUz0zUTU0s7sDw3w070z1zUTUUs7kDw7s431y1zUz0kMDkDs7s621y3z0z1k0DkTs7sD01w3z1y1s0TUTsDkD03w3y1y1w0TUzkDkTU3w7y1y3w0T0zkTUTk7s7s3w3y0z000TUTk7s007w7z0z001zUzs7k00zwDzVz00zzzzzzzzzzw"

                    if (ok:=FindText(X, Y, 156, 86, 212, 125, 0, 0, Text))
                    {
                        Goto, watch_AD_start
                    }
                    else
                    {
                        ; 3rd
                        Text:="|<>*164$50.zzzzzzzzzs07zs03zy00Dy007z001z000zk00Dk00Dw003w003z0y0z0z0TkTkDkTs7s7w3s7y3y1z0y1zUzUTkDUTkDsDw7sDw3y3z1y3z0z0zUT0zkTkDkDkDw7w003w3y1z001z1zUTk00zkTs7s00zs7y3y1kDy1zUzUS3zUTkDsDUTsDw3y3s7y3z0z0y1z0zkTkDkDkDk7w3w3w001z1z0z000zkTk7k00Ts7y1s00Tz3zUz00zzzzzzzzzzs"

                        if (ok:=FindText(X, Y, 158, 90, 214, 124, 0, 0, Text))
                        {
                            Goto, watch_AD_start
                        }
                        else
                        {
                            Goto, watch_AD_end
                        }
                    }
                }

                watch_AD_start:

                    Sleep, 500

                    ; click on ad text
                    Text:="|<>*126$37.0000000DU3zw07k1zz07w0zzk3y0S1s1r0D0S1vU7UD0xs3k7UQQ1s3kCC0w1sD7US0w73kD0S3Us7UD1kQ3k7VsD1s3kzzUw1sTzkS0wTzwD0SD0S7UD7073k7bU3VzzXk1szzlk0QTzk000000U"

                    if (ok:=FindText(X, Y, 1094, 519, 1139, 548, 0, 0, Text))
                    {
                        Sleep, 1000
                        Click, 962, 523 Left, 1
                        Sleep, 1000
                    }
                    Else
                    {
                        Goto, watch_AD_end
                    }

                close_AD:

                    Loop, 60
                    {
                        Sleep, 1000
                        CheckGame()

                        Sleep, 250
                        WinClose, Microsoft Store

                        Sleep, 250
                        WinClose, Privacy - Vungle - Google Chrome

                        CoordMode, Pixel, Screen
                        PixelSearch, FoundX, FoundY, 1218, 43, 1261, 54, 0xFFFFFF, 0, Fast RGB
                        If (ErrorLevel = 0)
                        {
                            Sleep, 250
                            Click, 1228, 73 Left, 1
                            Sleep, 250

                        }
                        CoordMode, Pixel, Screen
                        PixelSearch, FoundX, FoundY, 1203, 40, 1249, 64, 0xE8E8E8, 0, Fast RGB
                        If (ErrorLevel = 0)
                        {
                            Sleep, 250
                            Click, 1228, 73 Left, 1
                            Sleep, 250
                        }
                        CoordMode, Pixel, Screen
                        PixelSearch, FoundX, FoundY, 1203, 43, 1257, 58, 0xF5F5F6, 0, Fast RGB
                        If (ErrorLevel = 0)
                        {
                            Sleep, 250
                            Click, 1228, 73 Left, 1
                            Sleep, 250
                        }
                        ; ad with close text
                        Text:="|<>*165$58.zzyTzzzzzzs1tzzzzzzz03bzzzzzzlzyTzzzzzzDztzzzzzztzzbzzzzzzjzyTUTkDUQzztsMyAwAnzzb7ttzntDzyQznbyTkzztrzCTtz3zzaTwwzbwDzyNznsy00zztbzDsvztzzbTwztbzbzyQznzaTz7ztvyTyQzS03bVXlXlly0STUTUTkC"
                        if (ok:=FindText(X, Y, 1147, 39, 1264, 89, 0, 0, Text))
                        {
                            Sleep, 250
                            Click, 1225, 61 Left, 1
                            Sleep, 5000
                        }
                        ; close this ad with green button
                        Text:="|<>*137$48.00001s0000001s7s00001sTy00001szy00001ssT00001s0D00001s0D00001s0D3y07ts0DDz0Dxs0SDzUTzs0yA7Uy7s1w03kw3s1s03ls1s3k0zls1s3UDzls1s7UTzls1s7US3ls1s3Uw3ls1s00w3kw3s00w7ky7s3UTzkzzs7kTvkTxs7k7nk7ls3UU"

                        if (ok:=FindText(X, Y, 682, 433, 746, 474, 0, 0, Text))
                        {
                            Sleep, 250
                            Click, 447, 572 Left, 1
                            Sleep, 250
                        }

                        ; circle close

                        Text:="|<>*133$22.Xzz47zs0Dz00Ts20z0Q1s3s30Tk03zU0Tz03zy0Tzs1zz03zs07z00Ds30T0S0s3w10Ts03zk0TzUXzz6"

                        if (ok:=FindText(X, Y, 1208, 51, 1252, 101, 0, 0, Text))
                        {
                            Sleep, 250
                            Click, 1228, 71 Left, 1
                            Sleep, 250

                        }

                        ; march of empires

                        Text:="|<>*161$22.Xzz47zs0Dz00Ts20z0Q1s3s30Tk03zU0Tz03zy0Tzs1zz03zs07z00Ds30T0S0s3w10Ts03zk8TzVnzzC"

                        if (ok:=FindText(X, Y, 1213, 58, 1248, 91, 0, 0, Text))
                        {
                            Sleep, 250
                            Click, 1229, 72 Left, 1
                            Sleep, 250

                        }

                        ; resume ad
                        Text:="|<>*123$77.03z00000000000zzk0000000003zzs000000000Tzzs000000001zzzs000000003z0zk00000000Ds0Tk00000000zU0TU00000001y00zU1zU003w7w00k0Tzs1yTyDs0001zzs3xzyTU0007zzk7zzyz0000DzzkDzzxy0000zUzUTwDzw0001y0z0zkDzs0000Q1y1z0Tzk000003w3w0TzU00000Ds7s0zz00000DzkDk1zy00007zzUTU3zw00M0Tzz0z07zw00y3zty1y0Dzs03y7w3w3w0Tjk07wTU7s7s0zTk0Tkz0DkDk1yTk1zVy0zUTU3wzs7y3y3z0z07szzzs7zzy1y0Dkzzzk7zzw3w0TUTzy07zvw7s0z0Tzs07zbsDk1y07y003w7kTU3y"

                        if (ok:=FindText(X, Y, 478, 266, 592, 326, 0, 0, Text))
                        {
                            Sleep, 500
                            Click, 857, 448 Left, 1
                            Sleep, 500
                        }
                        ; Australian ads system

                        Text:="|<>*101$21.zUDzk0TwDVz7z7lzwQTzlbaD8yHsDszVz7wDszVy3wDmTUwtsbzzATzllzwT7z7wDVzk0TzUDw"
                        if (ok:=FindText(X, Y, 951, 89, 993, 127, 0, 0, Text)){
                            Click, 974, 104 Left, 1
                        }
                        Text:="|<>*82$60.s1zzzzzznzs1zzzzzznznszzzzzznz7zw70ks3nk7ztn668tn67znvDC9wmD7zrvDC9ym07zrvDC9ym07zrvDC9ym0nwnnDC9wmDlttnDC8tn6w3w7DC83nkzzzzzztzzzzzzzzztzzzzzzzzztzzzU"

                        if (ok:=FindText(X, Y, 501, 98, 581, 122, 0, 0, Text)){
                            Click, 974, 104 Left, 1
                        }

                        Text:="|<>*177$23.XzzW3zy03zs03zU83y0s3s3s3UDs20zs03zs0Dzs0zzs3zzU3zy03zs03zU83y0s3s3s3UDs20zs03zs0Dzs8zzsk"

                        if (ok:=FindText(X, Y, 1206, 60, 1245, 99, 0, 0, Text))
                        {
                            Sleep, 250
                            Click, 1229, 72 Left, 1
                            Sleep, 250
                        }

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

                        ; ad next
                        Text:="|<>*128$62.000000000030A3zlk37zls3VzwS1vzyS0sTz3UQTzbkC700wD0Q1w3Vk073U70TUsQ01tk1k7wC700CQ0Q1r3Vk03y070RssTw0TU1k7CC7zU7k0Q1lnVzs1w070QQsQ00TU1k73i700Ds0Q1kzVk03b070Q7sQ01tk1k71y700QC0Q1kDVk0D3k70Q1sTz3UQ1k70S7zls7UQ1k3VzwQ0s7000000000008"

                        if (ok:=FindText(X, Y, 1006, 628, 1083, 661, 0, 0, Text))
                        {
                            Sleep, 250
                            Click, 1154, 639 Left, 1
                            Sleep, 250
                            Break
                        }

                        ; token color check to verify home screen to break loop

                        Text:="|<>*72$29.zzrzzzy3zzzs3zzz01zzw01zzk00zy000zs0k0z03k0Q07k0E0Tk0E0nU1U37U3067070Tz0S1zy0w3zy1wA0S7sM0QDk000Tk001zU003z0007z000Ty000zw001y"

                        if (ok:=FindText(X, Y, 787, 42, 823, 80, 0, 0, Text))
                        {
                            Break
                        }

                    }

                    Loop, 20
                    {
                        ; i check to break loop
                        Text:="|<>*144$3.zz0zzzzzzzzU"

                        if (ok:=FindText(X , Y, 1184, 184, 1223, 222, 0, 0, Text))
                        {
                            Break
                        }
                        else
                        {
                            Sleep, 500
                            MouseMove, 1188, 649
                            Click, 1188, 649 Left, 1
                            Sleep, 500
                            ; star up check it later
                            Text:="|<>*149$211.Dz0Q0wDzs7z0S0w03VzzU0s00T0DzwzzVzwDzkC0S7zw7zsD0w01kzzk0Q00Dk7zyTzkzzbzw70D3zw7zy7UQ00sTzk0C007s3zyDzkTzrUC3U7Vs03UD3kS00Q0Q007007w03U7U0C0zU7Vk3kw03k7VsS00C0C003U03z01k3k070Tk3ks1sS01s1kwS00707001k01nU0s1s03UDs1sQ0wD00w0sSD003U3U00s00tk0Q0w01k7w00C0S7U0S00DD001k1k00Q00ww0C0S00s3y0070D3k0D007j000s0s00C00QS070D00Q1z003zzVzw7U03r000Q0Q00700C703U7zkC0zU01zzkzy3k01zk00C0C003U073U1k3zs70xk00zzsTz1s00zs00707001k07Vs0s1zw3zys00Q0wD00w00Ty003U3U00s03UQ0Q0w01zyQ00C0S7U0S00DbU01k1k00Q01kC0C0S00wyC0A70D3k0D0C7Vk00s0s00C01zzU70D00Q770D3U7Vs07U73kw00Q0Q00700zzk3U7U0C3nU7Vk3kw03k3VsD00C0C003U0Tzs1k3k071tk3ks1sS01s3kw3U0707001k0C0Q0s1s03USw3kQ0wD00Q1sS1s03U3U00s0D0D0Q0w01kDDzsC0S7zwDzsD0S01k1k00Tzb03UC0Tzks3rzs70D3zy3zw7U700s0s00DznU1k70DzsQ1szs3U71zy0zs3U3k0Q0Q007zvk0s3U7zwC0S"

                            if (ok:=FindText(X, Y, 328, 617, 553, 653, 0, 0, Text))
                            {
                                Send, {Escape}
                            }

                            ; connection error retry
                            Text:="|<>*127$59.01zzU7z00y00Ts03y00Q00TU03w00M00z003s00EzVw7y7kzkVzVsTwDVzV3z3kzsT3z27y7Vzky7y4DwD3zVwDw8TsS7z3sTsEzkwDy7kzkVz3sTwDVzV3w7kzsT3w200DVzky00A00z3zVw00s07y7z3s03kwDwDy7ky7VwDsTwDVwD3sTkzsT3wC7sTVzky7sQDkz3zVwDsMTkz3y3sTkkzVy00DkzkVz1y00TVzV3z3y01z3z1"

                            if (ok:=FindText(X, Y, 724, 201, 812, 244, 0, 0, Text))
                            {
                                Goto, script_start
                            }

                            ; club ms claim later
                            Text:="|<>*148$74.w00S0zzXzsTyD00DkDzszy7zvk03w3zyDzVzyw00z01k3U0Q3z00Cs0Q0s070Tk07C070C01k7w01nU1k3U0Q1z00Qs0Q0s070Tk0D7070C01k7w03Vk1k3zkQ3z00sQ0Q0zw7zvk0C7U70C01zww070s1k3U0TyD01zy0Q0s073Xk0TzU70C01kww0Dzw1k3U0Q7D03U70Q0s071vk0s1k70C01kCzzC0S1k3zsQ3zzr03UQ0zy70S"

                            if (ok:=FindText(X, Y, 452, 578, 544, 615, 0, 0, Text))
                            {
                                Send, {Escape}
                            }

                            ; tier unlocked
                            Text:="|<>*110$82.1w0Q007k1kDk3szy3s00zU7Uz0TrzwDU07y0S3y1zzzky00Ts1sDs7zsDXs01zU7UzUzz0yDU07z0S3y3zw3sy00yw1sDwDzkDXs03nk7Uxlvz00DU0DD0S3r7jw00y00wy1sDSQzk03s07ls7Uxtnz00DU0S7US3njDw00y01sS1sDDszk03s07Vw7UwzXz0QDU0zzkS3lyDw3sy03zz1sD7szkDXs0Dzw7UwT3z0yDU0zzsS3ksDy7sy07k7VsD00zzz3zyS0S7Uw03rzwDzts1wS3k0DDzUzzbU7lsD00y"

                            if (ok:=FindText(X, Y, 562, 536, 705, 597, 0, 0, Text))
                            {
                                Send, {Escape}
                            }

                            ; Demoted
                            Text:="|<>*154$35.DzUS0wzzUw3lzz1sD7UD3kQD0S7VsS0wD7Uw1sSS1s3kww3k7Vvk7UD3z0D0S7z0S0wDz0w1sTC1s3kyS3k7VsS7UD3kQD0S7UwS0wD0wT7kS0szzUw1szy1s1w"

                            if (ok:=FindText(X, Y, 609, 520, 659, 554, 0, 0, Text))
                            {
                                Send, {Escape}
                            }

                            ; rewards next
                            Text:="|<>*151$68.w0w7zsw0wzzz0D1zy7UDDzzs3kTzVs7Xzzy0w700D1s1sDkD1k01kw0S3y3kQ00SD07UzUw7003bU1sDwD1k00xs0S3r3kQ007w07Uxsw7zk1y01sDCD1zw0DU0S3nnkTz07s07UwQw7001z01sD7j1k00zk0S3kzkQ00DS07Uw7w7007XU1sD1z1k01sw0S3kDkQ00w707Uw3w700D1s1sD0T1zw7UC0S3k7kTzVs3k7Uw0w7zsw0Q1s6061zwC030A2"

                            if (ok:=FindText(X, Y, 1106, 635, 1187, 666, 0, 0, Text))
                            {
                                Sleep, 250
                                MouseMove, 1188, 649
                                Click, 1188, 649 Left, 1
                                Sleep, 1500
                                Goto, i_check_to_play_start
                            }
                            else
                            {
                                Sleep, 1000
                                MouseMove, 1188, 649
                                Click, 1188, 649 Left, 1
                                Sleep, 1500
                                ; in activity
                                Text:="|<>*131$60.3zkT01zVzkVzky00TVzkVzUw00TVzkkzVwDsDVzkkz1wDwDVzkkT3sTwDVzksT3sTwDVzksC7sTwDVzkwC7sTwDVzkw4DsTwDVzky4DsTwDVzky0TsTwDVzkz0TsTwDVzkz0zsTwDVzkzUzsTwDVzkzVzsTwDVzkzVzsTwDVzkzVzsTwDVzkzVzsTwDVzkzVzsTwDVzkzVzwDwDVzUzVzw7kDkT1zVzw00Tk01zVzy00zs03zVzzU1zy0DU"

                                if (ok:=FindText(X, Y, 189, 231, 271, 283, 0, 0, Text))
                                {
                                    Goto, script_start
                                }

                            }

                            IfWinExist, Asphalt 9: Legends
                            {
                                WinActivate, Asphalt 9: Legends
                                WinMove , Asphalt 9: Legends, , 0, 0, 1280, 720
                                WinRestore, Asphalt 9: Legends
                            }
                            else
                            {
                                ToolTip, Close AD rewards check, 640, 0,
                                Sleep, 1000
                                Goto, script_start
                            }

                        }
                    }

                    ; i check
                    Text:="|<>*144$3.zz0zzzzzzzzU"

                    if (ok:=FindText(X , Y, 1184, 184, 1223, 222, 0, 0, Text)){
                    }
                    else
                    {
                        Goto, script_start
                    }

                watch_AD_end:

                    ; <========== AD End ==========>

                    Goto, rewards_skip_start
                }

                rewards_skip_end:
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