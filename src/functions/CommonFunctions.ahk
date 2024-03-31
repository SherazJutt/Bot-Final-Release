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
            RewardsNext()
            LeagueUpNext()
        }
        Sleep, 1000
    }
    return isLoaded
}

RewardsNext(){
    Text:="|<>*151$68.w0w7zsw0wzzz0D1zy7UDDzzs3kTzVs7Xzzy0w700D1s1sDkD1k01kw0S3y3kQ00SD07UzUw7003bU1sDwD1k00xs0S3r3kQ007w07Uxsw7zk1y01sDCD1zw0DU0S3nnkTz07s07UwQw7001z01sD7j1k00zk0S3kzkQ00DS07Uw7w7007XU1sD1z1k01sw0S3kDkQ00w707Uw3w700D1s1sD0T1zw7UC0S3k7kTzVs3k7Uw0w7zsw0Q1s6061zwC030A2"
    if (ok:=FindText(X, Y, 1106, 635, 1187, 666, 0, 0, Text)){
        PressEscape(1)
    }
}

LeagueUpNext(){
    Text:="|<>*143$65.s0sDzlk3nzzs1kTzXk7bzzs3Uzz3USDzzk71k07Uw0sDkC3U071k1kTUQ700D7U3UzUsC00CC071z1kQ00Ss0C3b3Us00Tk0Q7C71zs0T00sCCC3zs0y01kQSQ7zk1w03UsQsC007w071kxkQ00Cs0C3UvUs00xs0Q71z1k01lk0sC1y3U07Xk1kQ1w700C3k3Us3sC00w7U71k3kTzXk7UC3U7Uzz7UD0Q7071zyC0C0s8"
    if (ok:=FindText(X, Y, 1089, 633, 1163, 658, 0, 0, Text))
    {
        PressEscape(1)
    }
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

WhereToGetBpsScreen(){
    Text:="|<>*160$32.zzzzzyTzzyD3zzz3UTzzUy3zzkTkTzsDy3zw7zUTy3zw3z1zzkTUzzy3kTzzkMDzzy07zzzU3zzzw1zzzzUTzzzk3zzzs0Tzzw43zzy3UTzz1y3zzUzkTzkTy3zsDzkTw7zw3y3zzkT1zzy3UzzzkQTzzyDjzzzrzzzzzs"
    if (ok:=FindText(X, Y, 1142, 92, 1188, 136, 0, 0, Text))
    {
        Click, 1163, 116 Left, 1
        Gosub, script_start
    }
}

LockedOrRefueling(){

    isRefuelingOrLocked := False

    CoordMode, Pixel, Screen
    PixelSearch, FoundX, FoundY, 1200, 630, 1214, 657, 0xFFFFFF, 0, Fast RGB
    If (ErrorLevel = 0) {
        isRefuelingOrLocked := True
    }

    Return isRefuelingOrLocked
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

ClickOnPlayButton(){
    ; upgrade text check to confirm car screen
    Text:="|<>*148$145.s1kTz01z07zU0DU1zs0zz0DsQ0sDzs3zs7zw07k1zz0TzUTzC0Q7zy3zy3zz07s0zzkDzkTzr0C3kD1sD1s7U3y0S1w700T1vU71s3Vs3kw1s1r0D0S3U0D0Rk3Uw1kw1sS0w1vU7U71k070Cs1kS0sS0wD0S0xs3k3Us03U7Q0sD0QD0A7UD0QQ1s1kQ01k0C0Q7UC7U03k7UCC0w0sC00w070C3k73k01s3kD7US0Q700TU3U71s3Vs00w1k73kD0C3zs7z1k3Uw3kwTsTzs3Us7U71zw1zws1kTzsSDwDzs3kQ3k3Uzy0DzQ0sDzsD3y7zs1sD1s1kQ000Ti0Q7zk7UD3kw0s7Uw0sC0001z0C3k03k7VsS0TzkS0Q70000zU71s01s3kw7UTzsD0C3U0C0Tk3Uw00w1sS3kDzy7U71k070Ds1kS00S0wD0s7073k7Us03k7y1sD00DUw7US7U3Vs7kQ01s7jzw7U03zy3k73k1szzkDzkTznzw3k00zy1s3lk0wTzk7zsDzkTs1k007w0w0ss0CDzk3zw1zV"
    if (ok:=FindText(X:="wait", Y:=10, 103, 617, 274, 663, 0, 0, Text)){
        Sleep, 1000
        Click, 1183, 634 Left, 1
        Return True
    }
}

; need to include funtions like if got any rewards or completed milestone or any other
; add network check

