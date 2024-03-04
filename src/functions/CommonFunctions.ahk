start_game(){
    ; close a9
    WinClose , Asphalt 9: Legends
    Sleep , 1000

    Run, "Asphalt 9" %A_ScriptDir%

    Sleep, 2000
    ; restore a9 window
    WinRestore, Asphalt 9: Legends

    ; activate a9 window
    Sleep , 2000
    WinActivate , Asphalt 9: Legends
    Sleep , 1000

    ; resize a9 window to 720p
    WinMove , Asphalt 9: Legends, , 0, 0, 1280, 720
    Sleep, 1000

    ; restore a9 window
    WinRestore, Asphalt 9: Legends
}

PressEscape(count){
    Loop, %count%{
        Sleep, 500
        Send , {Escape}
        Sleep, 500
    }
}

StuckOnGlLogo() {

    isStuck := true

    Loop, 60 {
        CoordMode, Pixel, Screen
        PixelSearch, FoundX, FoundY, 627, 511, 653, 531, 0xCD0041, 0, Fast RGB
        If (ErrorLevel = 0) {
            Sleep, 1000
        } Else {
            isStuck := False
            Break
        }
    }

    return isStuck
}

StuckOnLoadingScreen() {

    isStuck := true

    Loop, 60 {

        Text:="|<>*118$18.zzzi0ziATiSRiSNiSNiSTiSTiSTiSTiANi0Nz0tzzzU"

        if (ok:=FindText(X, Y, 167, 56, 191, 77, 0, 0, Text)) {
            Sleep, 1000
        } Else {
            isStuck := False
            Break
        }
    }

    return isStuck
}

MainMenuLoadedCheck(){

    isLoaded := false

    Loop, 20 {
        CoordMode , Pixel, Screen
        PixelSearch, FoundX, FoundY, 10, 61, 35, 87, 0xB00039, 0, Fast RGB
        If (ErrorLevel = 0)
        {
            isLoaded := True
            Break
        } Else
        {
            PressEscape(1)
            CheckGame()
            FullScreenAD()
            ExitGamePopUp()
        }
        Sleep, 1000
    }
    return isLoaded
}

CheckInternet(){
    Text:="|<>*127$59.01zzU7z00y00Ts03y00Q00TU03w00M00z003s00EzVw7y7kzkVzVsTwDVzV3z3kzsT3z27y7Vzky7y4DwD3zVwDw8TsS7z3sTsEzkwDy7kzkVz3sTwDVzV3w7kzsT3w200DVzky00A00z3zVw00s07y7z3s03kwDwDy7ky7VwDsTwDVwD3sTkzsT3wC7sTVzky7sQDkz3zVwDsMTkz3y3sTkkzVy00DkzkVz1y00TVzV3z3y01z3z1"
    if (ok:=FindText(X, Y, 724, 201, 812, 244, 0, 0, Text)) {
        Sleep, 1000
        Click, 693, 500 Left, 1
        Sleep, 2500
        Gosub, script_start
    }
}

CheckGame(){
    If WinExist("Asphalt 9: Legends"){
        WinActivate, Asphalt 9: Legends
        WinMove , Asphalt 9: Legends, , 0, 0, 1280, 720
        WinRestore, Asphalt 9: Legends
    } Else {
        Gosub, script_start
    }
}

FullScreenAD(){

    Text:="|<>*48$29.bzzzm7zzz07zzw47zzkQ7zz1w7zw7w7zkTw7z1zw7w7zw7kTzw71zzw07zzw0Tzzw1zzzs7zzzk7zzz07zzw47zzkQ7zz1w7zw7w7zkTw7z1zw7w7zw7kTzw71zzw47zzw0TzzwNzzzxk"

    if (ok:=FindText(X, Y, 1030, 124, 1074, 172, 0, 0, Text)){
        Click, 1052, 147 Left, 1
        Sleep, 1000
    }

    Text:="|<>*65$29.bzzzW7zzz07zzw47zzkQ7zz1w7zs7w7zkTw7z1zw7w7zw7kTzw71zzw07zzw0Tzzw1zzzs3zzzk7zzz07zzw47zzkQ7zy1w7zw7w7zkTw7z1zw7w7zw7UTzw71zzw47zzw4TzzwNzzzxk"

    if (ok:=FindText(X, Y, 1030, 124, 1073, 172, 0, 0, Text)){
        Click, 1052, 147 Left, 1
        Sleep, 1000
    }
}

ExitGamePopUp(){

    Text:="|<>*116$63.U0D3zVwS00801sTsD1k0000D1z1sC00001wDsT1s011zzUy3sDw7sTzy7Uz1zkz3zzkQDsDy7sTzz31z1zkz3zzs8TsDy7sTzzU3z1zkz00zy0zsDy7s03zk7z1zkz00Ty0zsDy7s03zk7z1zkz1zzw0zsDy7sTzzU3z1zkz3zzs8TsDy7sTzz31z1zkz3zzkQ7sDy7sTzy7kz1zkz3zzUy3sDy7s3zwDsT1zkz00D1z1sDy7s01sTwD1zkz00D3zVwTyDw"

    if (ok:=FindText(X, Y, 556, 241, 633, 280, 0, 0, Text))
    {
        PressEscape(1)
        Sleep, 1000
    }

}
TdCheck(){
    CoordMode, Pixel, Screen
    PixelSearch, FoundX, FoundY, 897, 647, 916, 677, 0xC0F712, 0, Fast RGB
    If (ErrorLevel = 0)
    {
        Sleep, 1000
        Click, 858, 657 Left, 1
        Sleep, 1000
    }
}

TdCheckInRace(){
    CoordMode, Pixel, Screen
    PixelSearch, FoundX, FoundY, 208, 133, 244, 150, 0xFE0101, 0, Fast RGB
    If (ErrorLevel = 0) {
        Send, {Tab}
    }
}

Resume(){
    Text:="|<>*152$13.zzTzzzzzvU1k0s0Q0C0703ztzwzyQ0C0703U1k0s0Q0D07zzzzzyU"
    if (ok:=FindText(X, Y, 1130, 227, 1150, 257, 0, 0, Text)){
        Send, {Escape}
    }
}

TokensColorCheckToVerifyHomeScreen(){

    Text:="|<>*72$29.zzrzzzy3zzzs3zzz01zzw01zzk00zy000zs0k0z03k0Q07k0E0Tk0E0nU1U37U3067070Tz0S1zy0w3zy1wA0S7sM0QDk000Tk001zU003z0007z000Ty000zw001y"
    if (ok:=FindText(X, Y, 787, 42, 823, 80, 0, 0, Text)){
        Return True
    }
}

SyncingToTheServer(){
    Loop, 30{
        Text:="|<>*127$33.zzzzzwwz7k7bXsw0QwD73XbVssyAw777lbUsszwwX77zbaMszwwl761bb8ssAww77lbbUsyAwy77lbbkswQwz7U3bbsy0zzzzzzU"
        if (ok:=FindText(X, Y, 1221, 604, 1261, 631, 0, 0, Text)){
            Sleep, 1000
        }else{
            Break
        }
    }
    Text:="|<>*127$33.zzzzzwwz7k7bXsw0QwD73XbVssyAw777lbUsszwwX77zbaMszwwl761bb8ssAww77lbbUsyAwy77lbbkswQwz7U3bbsy0zzzzzzU"
    if (ok:=FindText(X, Y, 1221, 604, 1261, 631, 0, 0, Text)){
        Gosub, script_start
    }
}

; This shows sometimes After the MP race is completed
ConnectingToTheServer(){
    isError := True

    Loop, 60{
        Text:="|<>*71$43.zzzzzzzs0Dzzzzs00zzzzw00Dzzzy007zzzz3z3zzzzVzkzzzzkzsTzzzsTwDzzzwDy7zzzy7z3zzzz3zVzzzzVzUzzzzkTUzzzzs00Tzzzw00Tzzzy00zzzzz1sTzzzzVw7zzzzkz3zzzzsTUzzzzwDsTVsS67w7kwD33z3sS7VVzUwD3kkzsS7VsQTwD3kwDzzzzzzy"
        if (ok:=FindText(X, Y, 578, 624, 628, 658, 0, 0, Text))
        {
            Sleep, 1000
        }Else{
            isError := False
            Break
        }
    }

    if(isError){
        Gosub, script_start
    }
}

XboxAuthentication(){
    isAuthenticated := True

    Text:="|<>*128$260.zUTy7z3U01kzsT00DVzks00SDy03zw3z003ly7zXz01zs7zVzks00QDy7k03sTwC007Xy00Tz0Tk00wTUzszU0Dy0zsTwC0073zVw00y3z3U01szU03zk7w00D7sDyDk01z0Dy7z3zVzkzsT3zzUTkzsTyDkTkzs1zz3zly1zXwDsDk3zVzkzsTwDy7kzzs7wDy7zXwDwDy4TzkzwTUTsz3z3w8TsTwDy7z3zVwDzy0z3zVzsz3zVzV3zwDz7s3yDlzky67y7z3zVzkzsT3zzUDkzsTyDkzsTskzz3zly0zXwTwDVVzVzkzsTwDy7kzzs1wDy7zXwDy7wADzkzwTU7sz7z3sQTsTwDy7z3zVwDzy0T3zVzsz3zzz3VzwDz7sEyDlzzyD3y7z3zVzkzsT3zzV3kzsTyDkzzzksTz3zly4DXwTzz3kzVzkzsTwDw7kTzsEwDy7zXwDzzsS7zkzwTVVsz7zzkwDsTwDy7z001w01y673zVzsz3zzy7lzwDz7sMSDlw1wDVy7z3zVzk00T00TVkkzsTyDkzzzVwDz3zly73XwT0C7sTVzkzsTw007k07sQADy7zXwDzzsz3zkzwTVksz7k3Vy7sTwDy7z3zVwDzy7V3zVzsz3zzwDkzwDz7sS6Dlw0sTVy7z3zVzkzsT3zzVsEzsTyDkzzz3yDz3zly7lXwTwC00DVzkzsTwDy7kzzsT0Dy7zXwDyDk01zkzwTVw8z7z3003sTwDy7z3zVwDzy7k3zVzsz3zVs00TwDz7sTUDlzkk00y7z3zVzkzsT3zzVy0zsTyDkzsS007z3zly7s3wTwADw7VzkzsTwDy7kzzsTkDy7zXwDy7VzkzkzwTVz0z7z27zVsTsDy7z3zVwDzy7w3zVzsz3z3sTwDwDz7sTkDkzkVzsT1w7zVzkzsT3zzVzUzsTyDkDUwDz3z3zly7y3w7kMTy7k01zsTwDy7k03sTsDy7zXy00D3zszkzwTVzkzU067zky00zy7z3zVw00y7z3zVzszk07kzy7wDz7sTwDs033zwDs0zzVzkzsT00DVzkzsTyDy07wTzVz3zly7zXzU3s"
    if (ok:=FindText(X, Y, 188, 238, 466, 276, 0, 0, Text)){
        PressEscape(1)
        isAuthenticated := False
    }
    ; check it later
    Text:="|<>*147$171.3zy07k0T0zzz07zw0D01y003kTzzszzw0y03s7zzs3zzs1s0TU00S3zzzDzzk7k0T0zzz0zzz0D03s003kTzzvzzy0y03s7zzk7zzw1s0y000S3zzyT07s7k0T0y001y0DUD0Dk003k0DU7k0T0y03s7k00DU0y1s3w000S01w0y03s7k0T0y001w07kD0T0003k0DU7k0T0y03s7k00DU0y1s7k000S01w0y03s7k0T0y001w07kD1y0003k0DU7k0T0y03s7k00DU0y1sDU000S01w0y0007k0T0y001w000D3s0003k0DU7k000y03s7k00DU001sz0000S01w0y0007k0T0y001w000DDk0003k0DU7k000zzzs7zzUDU001tw0000S01w0y0007zzz0zzw1w000Dzk0003k0DU7k000zzzs7zzUDU001zy0000S01w0y0007zzz0zzw1w000Dzs0003k0DU7k000y07s7k00DU001zzU000S01w0y0007k0T0y001w000Dtw0003k0DU7k000y03s7k00DU001y7k000S01w0y03s7k0T0y001w07kDUz0003k0DU7k0T0y03s7k00DU0y1s3s000S01w0y03s7k0T0y001w07kD0DU003k0DU7k0T0y03s7k00DU0y1s1y000S01w0y03s7k0T0y001w07kD07k003k0DU7s0T0y03s7k00DU1y1s0T000S01w0TUDk7k0T0y000z0TUD03s003k0DU3zzy0y03s7zzs7zzw1s0DU00S01w0DzzU7k0T0zzz0Tzz0D01y003k0DU0zzs0y03s7zzs1zzk1s07k00S01w01zw07U0S0Tzz03zs0D00T003k0DU4"
    if (ok:=FindText(X, Y, 797, 834, 991, 889, 0, 0, Text)){
        PressEscape(1)
        isAuthenticated := False
    }

    Sleep, 1000
    Return isAuthenticated
}

; need to include funtions like if got any rewards or completed milestone or any other
; add network check

SeasonalEvents(){

    isLoaded := False

    ; seasonal events red
    Loop, 60 {
        CoordMode, Pixel, Screen
        PixelSearch, FoundX, FoundY, 240, 603, 270, 625, 0xFF0049, 0, Fast RGB
        If (ErrorLevel = 0){
            ; click on seasonal events tabe to active
            Sleep, 1000
            Click, 349, 637 Left, 1
            Sleep, 1000
        }else{
            CoordMode, Pixel, Screen
            PixelSearch, FoundX, FoundY, 251, 648, 276, 674, 0xFFFFFF, 0, Fast RGB
            If (ErrorLevel = 0){
                isLoaded := True
                Break
            }else{
                If (MainMenuLoadedCheck()) {
                    Click, 349, 637 Left, 1
                    Sleep, 1500
                }Else{
                    Gosub, script_start
                }
            }
        }
    }
    Return isLoaded
}

TicketCheck(){

    canPlay := true

    Click, 1162, 135 Left, 1

    Sleep, 2000

    Text:="|<>*133$302.003zs007s007kTsDzzkzzzzs000w3zs03zkDz0T000Q000Tk07k00Dy001y001w7y3zzsDzzzy000D0zs00Dw1zk7k0070007s00Q001zU00TU00T1zUzzy3zzzzU003kDw001z0Ts3w001k001w003000Ts007s007kTsDzzUzzzzs000w3z000Dk7w0z000Q000S000kTs3y3zzy3zzw7y3zzsDzzzy000D0zU003w1z0Tk007000700047zUzUzzzUzzz1zUzzy3zzzzzU3zkDs0w0T0TUDw0zzzk1zk0k11zsDsDzzsDzzkTsDzzUzzzzzw1zw3y0zk7k7k7z0Tzzy1zw1zUETy3y3zzy3zzw7y3zzsDzzzzz0Tz0zUTw1w1s1zk7zzzUTz0zs07zUzUzzzUzzz1zUzzy3zzzzzk7zkDs7z0T0S0zw1zzzs7zkDy01zsDsDzzsDzzkTsDzzUzzzzzw1zw3y1zk7k70Tz0Tzzy1zw3zUETy3y3zzy3zzw7y3zzsDzzzzz0Tz0zUTw1w1k7zk7zzzUTz0zzw7zUzUzzzUzzz1zUzzy3zzzzzk7zkDs7zUz0M3zw1zzzs7zk7zz1zsDsDzzsDzzkTsDzzUzzzzzw1zw3y1zzzk41zz0Tzzy1zw0zzkTy3y3zzy3zzw7y3zzsDzzzzz0Tz0zUTzzw00zzk00TzUTz00Dw7zUzU01zUzzz1zUzzy3zzzzzk7zkDs7zzz00Dzw007zs7zk00T1zkDs00Ts00TkTsDzzUzzzzzw1zw3y1zzzk03zz001zy1zy001k007y007y007w7y3zzsDzzzzz0Tz0zUTzzw00Tzk00TzUTzk00A001zU01zU01z1zUzzy3zzzzzk7zkDs7zzz003zw007zs7zy001000zsDzzs00TkTsDzzUzzzzzw1zw3y1zzzk00zz001zy1zzw00E00zy3zzy3zzw7y3zzsDzzzzz0Tz0zUTzzw007zk7zzzUTzzw007sDzUzzzUzzz1zUzzy3zzzzzk7zkDs7zzz060zw1zzzs7zzzw01y3zsDzzsDzzkTsDzzUzzzzzw1zw3y1zk7k3UDz0Tzzy1zzzzU0TkTy3zzy3zzw7y3zzsDzzzzz0Tz0zUTw1w1w1zk7zzzUTz0zw07w3zUzzzUzzz1zUzzy3zzzzzk7zkDs7z0T0TUTw1zzzs7zkDz01z0zsDzzsDzzkTsDzzUzzzzzw1zw3y1zk7k7s3z0Tzzy1zw3zk0Ts7y3zzy3zzw7y3zzsDzzzzz0Tz0zUTw1w1z0Tk7zzzUTz0Ts07z1zUzzzUzzz1zUzzy3zzzzzk7zkDs3y0T0Tk7w1zzzs7zk7w01zkTsDzzsDzzkTsDzzUzzzzzw1zw3y000Dk7y0z000Ty1zw0000Tw3y001y3zzw7y001s007zzz0Tz0zk003w1zk7k007zUTzU0047zUzU00TUzzz1zU00S001zzzk7zkDw001z0Tw1w001zs7zs0011zs7s007sDzzkTs007U00Tzzw1zw3zU00zk7zUD000Ty1zz000kTz1y001y3zzw7y001s007zzz0Tz0zw00Tw1zw3k007zUTzw00yDzsTk00zlzzzXzk00z003zzzsDzsTzy1zzVzzky003zwDzzw3zU"

    if (ok:=FindText(X:="wait", Y:=10, 430, 169, 755, 224, 0, 0, Text)) {

        IniRead, EventPassHolder, %SettingsIni%, Main, EventPassHolder
        IniRead, AutoRefillTickets, %SettingsIni%, Main, AutoRefillTickets

        ; 0
        Text:="|<>*119$28.zzzzzz00TzU00Tw000zU001w0003k00060Ty0M3zw1UTzs61zzUM7zy1UTzs61zzUM7zy1UTzs61zzUM7zy1UTzs61zzUM7zy1UTzs61zzUM7zy1UTzs61zzUM7zy1UTzs61zzUM7zy1UTzs61zzUM7zy1UTzs61zzUM3zw1U7zk70000Q0003s000Tk003zU00Tzk07zzzzzs"
        if (ok:=FindText(X, Y, 625, 310, 676, 370, 0, 0, Text)){
            if (AutoRefillTickets == 1){
                Sleep, 1000
                If (!RefillTickets()){
                    canPlay:= false
                }
                Sleep, 2000
            }Else{
                canPlay:= false
            }
        }

        ; 1
        Text:="|<>*113$17.zzzzkDy0Ds0T00s01U030060UA70MS0nw1zs3zk7zUDz0Ty0zw1zs3zk7zUDz0Ty0zw1zs3zk7zUDz0Ty0zw1zs3zk7zUDz0Ty0zw1zs3zk7zUDz0Ty0zw1zs7zzy"
        if (ok:=FindText(X, Y, 627, 308, 671, 369, 0, 0, Text)){
            if (EventPassHolder == 1){
                canPlay:= true
            }Else{
                if (AutoRefillTickets == 1){
                    Sleep, 1000
                    If (!RefillTickets()){
                        canPlay:= false
                    }
                    Sleep, 2000
                }Else{
                    canPlay:= false
                }
            }
        }

    }Else{
        Gosub, script_start
    }

    ; close tickets popup
    Text:="|<>*133$302.003zs007s007kTsDzzkzzzzs000w3zs03zkDz0T000Q000Tk07k00Dy001y001w7y3zzsDzzzy000D0zs00Dw1zk7k0070007s00Q001zU00TU00T1zUzzy3zzzzU003kDw001z0Ts3w001k001w003000Ts007s007kTsDzzUzzzzs000w3z000Dk7w0z000Q000S000kTs3y3zzy3zzw7y3zzsDzzzy000D0zU003w1z0Tk007000700047zUzUzzzUzzz1zUzzy3zzzzzU3zkDs0w0T0TUDw0zzzk1zk0k11zsDsDzzsDzzkTsDzzUzzzzzw1zw3y0zk7k7k7z0Tzzy1zw1zUETy3y3zzy3zzw7y3zzsDzzzzz0Tz0zUTw1w1s1zk7zzzUTz0zs07zUzUzzzUzzz1zUzzy3zzzzzk7zkDs7z0T0S0zw1zzzs7zkDy01zsDsDzzsDzzkTsDzzUzzzzzw1zw3y1zk7k70Tz0Tzzy1zw3zUETy3y3zzy3zzw7y3zzsDzzzzz0Tz0zUTw1w1k7zk7zzzUTz0zzw7zUzUzzzUzzz1zUzzy3zzzzzk7zkDs7zUz0M3zw1zzzs7zk7zz1zsDsDzzsDzzkTsDzzUzzzzzw1zw3y1zzzk41zz0Tzzy1zw0zzkTy3y3zzy3zzw7y3zzsDzzzzz0Tz0zUTzzw00zzk00TzUTz00Dw7zUzU01zUzzz1zUzzy3zzzzzk7zkDs7zzz00Dzw007zs7zk00T1zkDs00Ts00TkTsDzzUzzzzzw1zw3y1zzzk03zz001zy1zy001k007y007y007w7y3zzsDzzzzz0Tz0zUTzzw00Tzk00TzUTzk00A001zU01zU01z1zUzzy3zzzzzk7zkDs7zzz003zw007zs7zy001000zsDzzs00TkTsDzzUzzzzzw1zw3y1zzzk00zz001zy1zzw00E00zy3zzy3zzw7y3zzsDzzzzz0Tz0zUTzzw007zk7zzzUTzzw007sDzUzzzUzzz1zUzzy3zzzzzk7zkDs7zzz060zw1zzzs7zzzw01y3zsDzzsDzzkTsDzzUzzzzzw1zw3y1zk7k3UDz0Tzzy1zzzzU0TkTy3zzy3zzw7y3zzsDzzzzz0Tz0zUTw1w1w1zk7zzzUTz0zw07w3zUzzzUzzz1zUzzy3zzzzzk7zkDs7z0T0TUTw1zzzs7zkDz01z0zsDzzsDzzkTsDzzUzzzzzw1zw3y1zk7k7s3z0Tzzy1zw3zk0Ts7y3zzy3zzw7y3zzsDzzzzz0Tz0zUTw1w1z0Tk7zzzUTz0Ts07z1zUzzzUzzz1zUzzy3zzzzzk7zkDs3y0T0Tk7w1zzzs7zk7w01zkTsDzzsDzzkTsDzzUzzzzzw1zw3y000Dk7y0z000Ty1zw0000Tw3y001y3zzw7y001s007zzz0Tz0zk003w1zk7k007zUTzU0047zUzU00TUzzz1zU00S001zzzk7zkDw001z0Tw1w001zs7zs0011zs7s007sDzzkTs007U00Tzzw1zw3zU00zk7zUD000Ty1zz000kTz1y001y3zzw7y001s007zzz0Tz0zw00Tw1zw3k007zUTzw00yDzsTk00zlzzzXzk00z003zzzsDzsTzy1zzVzzky003zwDzzw3zU"
    if (ok:=FindText(X:="wait", Y:=10, 430, 169, 755, 224, 0, 0, Text)){
        If (canPlay == true){
            PressEscape(1)
            Text:="|<>*133$302.003zs007s007kTsDzzkzzzzs000w3zs03zkDz0T000Q000Tk07k00Dy001y001w7y3zzsDzzzy000D0zs00Dw1zk7k0070007s00Q001zU00TU00T1zUzzy3zzzzU003kDw001z0Ts3w001k001w003000Ts007s007kTsDzzUzzzzs000w3z000Dk7w0z000Q000S000kTs3y3zzy3zzw7y3zzsDzzzy000D0zU003w1z0Tk007000700047zUzUzzzUzzz1zUzzy3zzzzzU3zkDs0w0T0TUDw0zzzk1zk0k11zsDsDzzsDzzkTsDzzUzzzzzw1zw3y0zk7k7k7z0Tzzy1zw1zUETy3y3zzy3zzw7y3zzsDzzzzz0Tz0zUTw1w1s1zk7zzzUTz0zs07zUzUzzzUzzz1zUzzy3zzzzzk7zkDs7z0T0S0zw1zzzs7zkDy01zsDsDzzsDzzkTsDzzUzzzzzw1zw3y1zk7k70Tz0Tzzy1zw3zUETy3y3zzy3zzw7y3zzsDzzzzz0Tz0zUTw1w1k7zk7zzzUTz0zzw7zUzUzzzUzzz1zUzzy3zzzzzk7zkDs7zUz0M3zw1zzzs7zk7zz1zsDsDzzsDzzkTsDzzUzzzzzw1zw3y1zzzk41zz0Tzzy1zw0zzkTy3y3zzy3zzw7y3zzsDzzzzz0Tz0zUTzzw00zzk00TzUTz00Dw7zUzU01zUzzz1zUzzy3zzzzzk7zkDs7zzz00Dzw007zs7zk00T1zkDs00Ts00TkTsDzzUzzzzzw1zw3y1zzzk03zz001zy1zy001k007y007y007w7y3zzsDzzzzz0Tz0zUTzzw00Tzk00TzUTzk00A001zU01zU01z1zUzzy3zzzzzk7zkDs7zzz003zw007zs7zy001000zsDzzs00TkTsDzzUzzzzzw1zw3y1zzzk00zz001zy1zzw00E00zy3zzy3zzw7y3zzsDzzzzz0Tz0zUTzzw007zk7zzzUTzzw007sDzUzzzUzzz1zUzzy3zzzzzk7zkDs7zzz060zw1zzzs7zzzw01y3zsDzzsDzzkTsDzzUzzzzzw1zw3y1zk7k3UDz0Tzzy1zzzzU0TkTy3zzy3zzw7y3zzsDzzzzz0Tz0zUTw1w1w1zk7zzzUTz0zw07w3zUzzzUzzz1zUzzy3zzzzzk7zkDs7z0T0TUTw1zzzs7zkDz01z0zsDzzsDzzkTsDzzUzzzzzw1zw3y1zk7k7s3z0Tzzy1zw3zk0Ts7y3zzy3zzw7y3zzsDzzzzz0Tz0zUTw1w1z0Tk7zzzUTz0Ts07z1zUzzzUzzz1zUzzy3zzzzzk7zkDs3y0T0Tk7w1zzzs7zk7w01zkTsDzzsDzzkTsDzzUzzzzzw1zw3y000Dk7y0z000Ty1zw0000Tw3y001y3zzw7y001s007zzz0Tz0zk003w1zk7k007zUTzU0047zUzU00TUzzz1zU00S001zzzk7zkDw001z0Tw1w001zs7zs0011zs7s007sDzzkTs007U00Tzzw1zw3zU00zk7zUD000Ty1zz000kTz1y001y3zzw7y001s007zzz0Tz0zw00Tw1zw3k007zUTzw00yDzsTk00zlzzzXzk00z003zzzsDzsTzy1zzVzzky003zwDzzw3zU"
            if (ok:=FindText(X, Y, 430, 169, 755, 224, 0, 0, Text)){
                PressEscape(1)
            }
        }Else{
            PressEscape(1)
            Gosub, shended
        }
    }

}

RefillTickets(){
    Text:="|<>*123$81.zy0zy7zlkQ0707zs7zkzyC3U0s0zzUzw7zVkQ0707UQ700s0C3U0s0w3Us0701kQ0707UQ700s0C3U0s0w3Us0701kQ0707UQ700s0C3U0s0w3Us0701kQ0707Uw7zUzwC3U0s0zzUzw7zVkQ0707zs700zwC3U0s0wS0s0701kQ0707Vk700s0C3U0s0wC0s0701kQ0707Us700s0C3U0s0w70s0701kQ0707Uw700s0C3k0w0w3Uzy701kTzbzzUS7zks0C3zwzzU"
    if (ok:=FindText(X, Y, 470, 495, 576, 530, 0, 0, Text)){
        Click, 594, 497 Left, 1
        Return true
    }
    Return False
}

; play race
PlayHuntRace(){
    Sleep, 2000
    Click, 1201, 632 Left, Down
    Sleep, 94
    Click, 1201, 632 Left, Up
    Sleep, 1000
    Text:="|<>*168$38.w0Dy07y01z00T00DU07U03s00sDkw7sC3wD1y3Vz3kTVsTkwDsS7sD3y71y3kzVkTUsDkQ7sC3w71y3Uz1kTUsDkQ7sS3w73y7Uz3kzVsDkwDsS7wD1w7Uy3U01s00s00y00SU0Tk0Di0Tz0Du"

    if (ok:=FindText(X:="wait", Y:=40, 1083, 130, 1126, 164, 0, 0, Text)){
        Sleep, 3000
        Send, {Right Down}
        Sleep, 125
        Send, {Right Up}
        Sleep, 2844
        Send, {Space Down}
        Sleep, 62
        Send, {Space Up}
        Sleep, 125
        Send, {Space Down}
        Sleep, 47
        Send, {Space Up}
        Sleep, 109
        Send, {Space Down}
        Sleep, 94
        Send, {Space Up}
        Sleep, 5516
        Send, {Space Down}
        Sleep, 109
        Send, {Space Up}
        Sleep, 125
        Send, {Space Down}
        Sleep, 78
        Send, {Space Up}
        Sleep, 110
        Send, {Space Down}
        Sleep, 78
        Send, {Space Up}
        Sleep, 109
        Send, {Space Down}
        Sleep, 125
        Send, {Space Up}
        Sleep, 2672
        Send, {Space Down}
        Sleep, 94
        Send, {Space Up}
        Sleep, 172
        Send, {Space Down}
        Sleep, 93
        Send, {Space Up}
        Sleep, 110
        Send, {Space Down}
        Sleep, 93
        Send, {Space Up}
        Sleep, 110
        Send, {Space Down}
        Sleep, 78
        Send, {Space Up}
        Sleep, 94
        Send, {Space Down}
        Sleep, 125
        Send, {Space Up}
        Sleep, 7187
        Send, {Down Down}
        Sleep, 3672
        Send, {Down Up}
        Sleep, 438
        Send, {Right Down}
        Sleep, 109
        Send, {Right Up}
        Sleep, 1641
        Send, {Space Down}
        Sleep, 78
        Send, {Space Up}
        Sleep, 140
        Send, {Space Down}
        Sleep, 94
        Send, {Space Up}
        Sleep, 109
        Send, {Space Down}
        Sleep, 79
        Send, {Space Up}
        Sleep, 2000
        Send, {Space Down}
        Sleep, 109
        Send, {Space Up}
        Sleep, 94
        Send, {Space Down}
        Sleep, 125
        Send, {Space Up}
        Sleep, 93
        Send, {Space Down}
        Sleep, 141
        Send, {Space Up}
        Sleep, 94
        Send, {Space Down}
        Sleep, 140
        Send, {Space Up}
        Sleep, 2000
    }Else{
        Gosub, script_start
    }

}

CheckInRaceIssues(){
    ; you have been disconnected from server start
    ; still disconnected
    Text:="|<>*117$71.7z7zUzkzwQ00DwDz0zVzks00TsTw1zXzVk00zkzs3z3z3VzlzVzl7y7wD3zXz3zW7yDsS7z7y7y4DwDkwDyDwDwQTsTXsTwTsTssTky7kzszkzVkzlwDVzk01z3lzXsT00U03yDXz3ly01007wT3y7Xw02DwDky7yC7sTwTsTVyDwQDkzszkz00DsMzVzlzVw00Tklz3zXz3s00zl3y7z7y7lzlzWDwDyDwDXzVz0TsTwTsS7z3z0zk00zkwDz7y1zU01zVszy7w7z00E"

    if (ok:=FindText(X, Y, 331, 103, 410, 128, 0, 0, Text))
    {
        Sleep, 2500
        Gosub, script_start
    }
    ; you have been disconnected from server start

    ; searching for players
    Loop, 60{
        Text:="|<>*118$37.zzzzzzy7tws1z3wyQ0TVyDCD7Uz3b7XmDVnXltbkNlswntAswQswmQSCSSNCD70DC77X03b3XlXlnllsnwtss0tyQyQ0Tzzzzzy"
        if (ok:=FindText(X, Y, 712, 559, 756, 579, 0, 0, Text)){
            Sleep, 1000
        }Else{
            Break
        }
    }

    Text:="|<>*118$37.zzzzzzy7tws1z3wyQ0TVyDCD7Uz3b7XmDVnXltbkNlswntAswQswmQSCSSNCD70DC77X03b3XlXlnllsnwtss0tyQyQ0Tzzzzzy"
    if (ok:=FindText(X, Y, 712, 559, 756, 579, 0, 0, Text)){
        Gosub, script_start
    }

}

RampsNitros(){

    ; x2 nitro center right

    Text:="|<>*162$26.zzbzzzkTzzy7zzw1zzw1zzz0DzzU1zzs0Tzw07zz01zzU0wTs0A1w7D0D1AHXUHAss2HyA0Vz704T3U27Vs0Yky0HAT04l083zk3UDzzy3zzzxzzy"

    if (ok:=FindText(X, Y, 659, 143, 695, 176, 0, 0, Text)){
        Send, {Right 5}
        Return
    }
}

NitroManagemnet(){
    ; start
    CoordMode, Pixel, Screen
    PixelSearch, FoundX, FoundY, 437, 62, 555, 97, 0xFFFF00, 0, Fast RGB
    If (ErrorLevel = 0){
        Send, {Space 1}
        Sleep, 250
        Send, {Space 1}
        Return
    }

    ; mid
    CoordMode, Pixel, Screen
    PixelSearch, FoundX, FoundY, 554, 59, 667, 97, 0xFFFF00, 0, Fast RGB
    If (ErrorLevel = 0){
        Send, {Space}
        Sleep, 1000
        Send, {Space}
        Return
    }

    ; almost end
    CoordMode, Pixel, Screen
    PixelSearch, FoundX, FoundY, 668, 61, 800, 98, 0xFFFF00, 0, Fast RGB
    If (ErrorLevel = 0){
        Send, {Space 1}
        Sleep, 250
        Send, {Space 1}
        Return
    }

    ; shockwave
    Send, {Space 1}
    Sleep, 250
    Send, {Space 1}
    Sleep, 1000

    Return
}

HuntRewardsSkip(){
    isSkipped := False

    Loop,30{
        Text:="|<>*153$70.000000000001s1sDzls1tzzbU7Uzz3k7bzyT0S3zwD0wTztw1sC00S3k3k7s7Us00sS0D0TkS3U03ls0w1z1sC007D03k7y7Us00Sw0D0SsS3U00zU0w1vlsDzU3w03k7b7Uzy07k0D0SSS3zs0z00w1stsC003y03k7XrUs00Ts0D0S7y3U01vk0w1sDsC00D703k7UzUs00wS0D0S1y3U07Us0w1s7sC00S3k3k7UDUzy3kD0D0S0y3zwD0S0w1s1sDzls0w3k3030zz701U60000000000002"
        if (ok:=FindText(X, Y, 1107, 631, 1187, 670, 0, 0, Text)){
            Click, 1211, 643 Left, 1
            isSkipped := True
            Sleep, 2000
            Break
        }Else{
            IniRead, PlayAdafterhuntrace, %SettingsIni%, Main, PlayAdafterhuntrace
            If (PlayAdafterhuntrace == 1){
                If (watch_AD_if_1st_2nd_OR_3rd()){
                    ; click on (watch ad) button
                    Text:="|<>*125$143.w1s3k3s3zz1zs3U7000y0Dzls3k7UDk7zy7zsD0C001w0TznkDkD0TUDzwTzsS0Q007w0zzrUTUS0zU0w0w3kw0s00Ds1s7b0z0s1r01s1k3Vs1k00Rk3k7j1y1k7i03k3U73k3U01vU7UDS3C7UCQ07U70C7U7003rUD0SwCQD0Qw0D0C0QD0C00770S0xsQsS1ss0S0Q00S0Q00CC0w1tktks3Vk0w0s00w0s00wS1s3nVnVk73k1s1k01zzk01kw3k7bb3XUC3U3k3U03zzU03Us7UDDC7D0w707U7007zz0071kD0SSQCS1kD0D0C00D0C00S3kS0wwsQs3zy0S0Q00S0Q00zzUw1stkNkDzw0w0s1kw0s01zz1s3lr0vUTzs1s1k3Vs1k07zz3k7Xi1r0s1s3k3U73k3U0D0S7UD7w3y1k3k7U70S7U700Q0QD0SDs3w7U3UD0DzwD0C01s0sTzsDU7kD07US0DzkS0Q03k1szzkT0DUQ0D0w0Dz0w0s0701lzy8"
                    if (ok:=FindText(X, Y, 984, 516, 1141, 553, 0, 0, Text))
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
                                Gosub, script_start
                            }
                        }Else{
                            Gosub, script_start
                        }
                    }
                }
            }
            Click, 1211, 643 Left, 1
            Sleep, 2500
        }
    }
    Return isSkipped
}

; watch_AD_if_1st_2nd_OR_3rd
watch_AD_if_1st_2nd_OR_3rd(){
    ; 1st
    Text:="|<>*162$38.zzzs00Tzzs003zzw000zzw000Dzw0007zw0001zw0000Tw00007y00001y00000z00000DU00003s00000y00000D000007k00001w00000T000007k03001s03U00y03s00DU3y003s3zU00y1zs00D1zw007tzz001zzzk00Tzzw007zzz001zzzU00zzzs00Dzzy003zzzU00zzzs00Dzzw007zzz001zzzk00Tzzw007zzz001zzzU00zzzs00Dzzy003zzzU00zzzs00Dzzw007zzz001zzzk00Tzzw007zzz001zzzU00zzzs00Dzzy003zzzU00zzzs00Dzzw007zzz001zzzk00Tzzw007zzz001zzzU00zzzs00Dzzy003zzzU00zzzs00Dzzw007zzz001zzzk00Tzzw007zzz001zzzU00zzzs00Dzzy003zzzU00zzzs00Dzzw007zzz001zzzk00Tzzw007zzz001zzzU00zzzs00Dzzy003zzzU00zzzs00Tzzy007zzzU03zzy"
    if (ok:=FindText(X, Y, 106, 82, 159, 178, 0, 0, Text)){
        Return true
    }
    ; 2nd
    Text:="|<>*163$51.zzzzzzzzzwDz3y00zz0zkDk00zs7y1w003y0zkTU00Tk3y3w003y0TUTUTUDk3w3w7y1y0DUT0zkTU1w7s7y3w0DUz0zUTU0s7sDw3w070z1zUTUUs7kDw7s431y1zUz0kMDkDs7s621y3z0z1k0DkTs7sD01w3z1y1s0TUTsDkD03w3y1y1w0TUzkDkTU3w7y1y3w0T0zkTUTk7s7s3w3y0z000TUTk7s007w7z0z001zUzs7k00zwDzVz00zzzzzzzzzzw"
    if (ok:=FindText(X, Y, 156, 86, 212, 125, 0, 0, Text)){
        Return true
    }
    ; 3rd
    Text:="|<>*164$50.zzzzzzzzzs07zs03zy00Dy007z001z000zk00Dk00Dw003w003z0y0z0z0TkTkDkTs7s7w3s7y3y1z0y1zUzUTkDUTkDsDw7sDw3y3z1y3z0z0zUT0zkTkDkDkDw7w003w3y1z001z1zUTk00zkTs7s00zs7y3y1kDy1zUzUS3zUTkDsDUTsDw3y3s7y3z0z0y1z0zkTkDkDkDk7w3w3w001z1z0z000zkTk7k00Ts7y1s00Tz3zUz00zzzzzzzzzzs"

    if (ok:=FindText(X, Y, 158, 90, 214, 124, 0, 0, Text)){
        Return true
    }
}

Close_AD(){
    Loop, 120{

        Sleep, 1000

        WinClose, Microsoft Store
        WinClose, Privacy - Vungle - Google Chrome

        ; ad close (X)
        Text:="|<>*161$22.Xzz47zs0Dz00Ts20z0Q1s3s30Tk03zU0Tz03zy0Tzs1zz03zs07z00Ds30T0S0s3w10Ts03zk8TzVnzzC"
        if (ok:=FindText(X, Y, 1213, 58, 1248, 91, 0, 0, Text))
        {
            Click, 1229, 72 Left, 1
            Return true
            Break
        }

        ; resume ad
        Text:="|<>*123$77.03z00000000000zzk0000000003zzs000000000Tzzs000000001zzzs000000003z0zk00000000Ds0Tk00000000zU0TU00000001y00zU1zU003w7w00k0Tzs1yTyDs0001zzs3xzyTU0007zzk7zzyz0000DzzkDzzxy0000zUzUTwDzw0001y0z0zkDzs0000Q1y1z0Tzk000003w3w0TzU00000Ds7s0zz00000DzkDk1zy00007zzUTU3zw00M0Tzz0z07zw00y3zty1y0Dzs03y7w3w3w0Tjk07wTU7s7s0zTk0Tkz0DkDk1yTk1zVy0zUTU3wzs7y3y3z0z07szzzs7zzy1y0Dkzzzk7zzw3w0TUTzy07zvw7s0z0Tzs07zbsDk1y07y003w7kTU3y"

        if (ok:=FindText(X, Y, 478, 266, 592, 326, 0, 0, Text))
        {
            Click, 857, 448 Left, 1
        }

        ; Australian ads system start
        Text:="|<>*101$21.zUDzk0TwDVz7z7lzwQTzlbaD8yHsDszVz7wDszVy3wDmTUwtsbzzATzllzwT7z7wDVzk0TzUDw"
        if (ok:=FindText(X, Y, 951, 89, 993, 127, 0, 0, Text)){
            Click, 974, 104 Left, 1
            Return true
            Break
        }

        Text:="|<>*82$60.s1zzzzzznzs1zzzzzznznszzzzzznz7zw70ks3nk7ztn668tn67znvDC9wmD7zrvDC9ym07zrvDC9ym07zrvDC9ym0nwnnDC9wmDlttnDC8tn6w3w7DC83nkzzzzzztzzzzzzzzztzzzzzzzzztzzzU"
        if (ok:=FindText(X, Y, 501, 98, 581, 122, 0, 0, Text)){
            Click, 974, 104 Left, 1
            Return true
            Break
        }

        Text:="|<>*177$23.XzzW3zy03zs03zU83y0s3s3s3UDs20zs03zs0Dzs0zzs3zzU3zy03zs03zU83y0s3s3s3UDs20zs03zs0Dzs8zzsk"
        if (ok:=FindText(X, Y, 1206, 60, 1245, 99, 0, 0, Text))
        {
            Click, 1229, 72 Left, 1
            Return true
            Break
        }
        ; Australian ads system end

        SyncingToTheServer()
    }
}

ClickOnPlayButton(){
    ; upgrade text check to confirm car screen
    Text:="|<>*148$145.s1kTz01z07zU0DU1zs0zz0DsQ0sDzs3zs7zw07k1zz0TzUTzC0Q7zy3zy3zz07s0zzkDzkTzr0C3kD1sD1s7U3y0S1w700T1vU71s3Vs3kw1s1r0D0S3U0D0Rk3Uw1kw1sS0w1vU7U71k070Cs1kS0sS0wD0S0xs3k3Us03U7Q0sD0QD0A7UD0QQ1s1kQ01k0C0Q7UC7U03k7UCC0w0sC00w070C3k73k01s3kD7US0Q700TU3U71s3Vs00w1k73kD0C3zs7z1k3Uw3kwTsTzs3Us7U71zw1zws1kTzsSDwDzs3kQ3k3Uzy0DzQ0sDzsD3y7zs1sD1s1kQ000Ti0Q7zk7UD3kw0s7Uw0sC0001z0C3k03k7VsS0TzkS0Q70000zU71s01s3kw7UTzsD0C3U0C0Tk3Uw00w1sS3kDzy7U71k070Ds1kS00S0wD0s7073k7Us03k7y1sD00DUw7US7U3Vs7kQ01s7jzw7U03zy3k73k1szzkDzkTznzw3k00zy1s3lk0wTzk7zsDzkTs1k007w0w0ss0CDzk3zw1zV"
    if (ok:=FindText(X:="wait", Y:=10, 103, 617, 274, 663, 0, 0, Text)){
        Sleep, 1000
        Click, 1183, 634 Left, 1
        Return True
    }
}