PressEscape(count){
    Loop, %count%{
        Sleep, 500
        Send , {Escape}
        Sleep, 500
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

RewardsNext(){

    Text:="|<>*149$70.000000000001s1sDzls1tzzbU7Uzz3k7bzyT0S3zwD0wTztw1sC00S3k3k7s7Us00sS0D0TkS3U03ls0w1z1sC007D03k7y7Us00Sw0D0SsS3U00zU0w1vlsDz03w03k7b7Uzy07k0D0SSS3zs0z00w1stsC003y03k7XrUs00Ts0D0S7y3U01vk0w1sDsC00D703k7UzUs00wS0D0S1y3U07Us0w1s7sC00S3k3k7UDUzy3k70D0S0y3zwD0S0w1s1sDzls0s3k3030zy301U60U"

    if (ok:=FindText(X, Y, 1103, 628, 1190, 672, 0, 0, Text))
    {
        Click, 1207, 642 Left, 1
        Sleep, 3000
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

    Text:="|<>*146$198.Dz0s1kzz1zs70S03Xzy03U03s3zyTzVzwTzUs1kzz3zw70w03Xzy03U03s3zyTzVzyS3ks1kw03kS71s03U7U03U03w0D0S01kSw1ks1ks07UC71k03U7003U07Q070S01kDs1ks1ks070C73k03U7003U07Q070S01k7s1ks1ks070C77U03U7003U07Q070S01k7s1ks1ks070C77003U7003U0CC070S01k7s00s1ks07007C003U7003U0CC070S01k7s00s3kzw7007S003U7003U0CC070Ty1k7s00zzkzy7007S003U7003U0CD070Tz1kDs00zzkzy7007z003U7003U0Q7070Tz1zys00s3kw07007r003U7003U0Q7070S01zws00s1ks07007bU03U7003U0Q7070S01lss1ks1ks070C7Xk03U7003U0zzU70S01kss1ks1ks070C71k03U7003U0zzU70S01kws1ks1ks070C71s03U7003U0zzU70S01kQw1ks1ks07UC70s03U7003U0s3k70S01kSS7ks1kw03ky70Q03U7003U1k1k70S01kCTzUs1kzz3zw70S03U7003ztk1k70TzVkDDz0s1kzz1zs70C03U7003ztk1s70TzVk7U"

    if (ok:=FindText(X, Y, 640-150000, 597-150000, 640+150000, 597+150000, 0, 0, Text)){
        PressEscape(1)
        isAuthenticated := False
    }
    Sleep, 1000
    Return isAuthenticated
}

PlayButton(){
    isPlayButton:= False

    Text:="|<>*148$145.s1kTz01z07zU0DU1zs0zz0DsQ0sDzs3zs7zw07k1zz0TzUTzC0Q7zy3zy3zz07s0zzkDzkTzr0C3kD1sD1s7U3y0S1w700T1vU71s3Vs3kw1s1r0D0S3U0D0Rk3Uw1kw1sS0w1vU7U71k070Cs1kS0sS0wD0S0xs3k3Us03U7Q0sD0QD0A7UD0QQ1s1kQ01k0C0Q7UC7U03k7UCC0w0sC00w070C3k73k01s3kD7US0Q700TU3U71s3Vs00w1k73kD0C3zs7z1k3Uw3kwTsTzs3Us7U71zw1zws1kTzsSDwDzs3kQ3k3Uzy0DzQ0sDzsD3y7zs1sD1s1kQ000Ti0Q7zk7UD3kw0s7Uw0sC0001z0C3k03k7VsS0TzkS0Q70000zU71s01s3kw7UTzsD0C3U0C0Tk3Uw00w1sS3kDzy7U71k070Ds1kS00S0wD0s7073k7Us03k7y1sD00DUw7US7U3Vs7kQ01s7jzw7U03zy3k73k1szzkDzkTznzw3k00zy1s3lk0wTzk7zsDzkTs1k007w0w0ss0CDzk3zw1zV"
    if (ok:=FindText(X:="wait", Y:=10, 103, 617, 274, 663, 0, 0, Text)){
        isPlayButton:= True
    }
    Return isPlayButton
}

; You Have Been Disconnected From Server Due To Inactivity
YouHaveBeenDisconnectedFromServerDueToInactivity(){
    Text:="|<>*113$488.1zkT01zVzkzzkzsTz1zkzw700Dzw01zU07k03kzwDzw00zkzk0Ty03zs0TwTy7kzwTU07w07k00s01w01kTwDU07sTwDzwDy7zUDw7z3k03zz00Ds01w00w7z3zz007wDs03z00Ds01z3zVw7z7s01y00w00C00T0067y3k00y7z3zz3zVzs3z1zkw00zzk01y00T00D0zkzzk00z3w00TU01w00DkzsT1zly00T007003U07k00kzVw7sDVzkzzkzsTy0zsTsD3zzzwDsTVzzkzzkDwDzwDwDkz3y7sDkT1y3w7y7kDwTVzzkzVzkzsTzwDsADkS3z3sTwDzwDy7z27y7y3kzzzz3z3sTzwDzw1z3zz3zVwDVzky7y7kzkz0zVw3z7sTzsTwDwDy7zz3z31wDVzky7z3zz3zVzkVzVzVwDzzzkzky7zz3zz0TkzzkzsT3sTwDXzlwTyDkDsT0Tly7zy7z3z3zVzzkzssT3sTwDVzkzzkzsTw8TsDsT3zzzwDwDVzzkzzk3wDzwDy7ky7z3szwT7zXw1y7k7wTVzzVzkzkzsTzwDyC3Vy7z3sTwDzwDy7z33z3y7kzzzz3z3sTzwDzw0z3zz3zVwDVzzyDz7lzsz0TVw0z7sTzsTwDwDy7zz3zXksTVzky7z3zz3zVzVkzkz3wDzzzkzky7zz3zz27kzzkzsT3sTzzXzzwTyDl3sT2Dly7zy7zzz3zVzzkzsw4DsTwDVzkzzkzsTsQDwDkz3zzzwDsTVzzkzzkVwDzwDy7ky3zzszzz7zXwMy7kVwTVzzVzzzkzsTzwDyDV3y7z3sTwDzwDy7y7XzVwDk0Dzz007s07w03wAD3zz3zVwDk3zyDzzlzsz67VwAD7sTzsTzzwDy7zz3zXs1zVzky7z3zz001z3sTsS3w03zzk03y00z00z3VkzzkzsT3y03zXzzwTyDllsT33ly01y7zzz3zU0Dkzsz0TsTwDVzkzzk00Tky7y7Vz00zzw00zU0Dk0DksQDzwDy7kzk0Dszzz7zXwQCDksQTU0TVzzzkzs03wDyDkDy7z3sTwDzw007wDVzVsTk0Dzz007s03w03wD33zz3zVwDz01yDzzlzsz7XXwC77s07sTzzwDy00z3zXy3zVzky7z3zz3zVy3wDwC7wDzzzkzky7zz3zz3kkzzkzsT3zzUTXzzwTyDlsMz3kly7zy7zzz3zVzzkzszUzsTwDVzkzzkzsTVz3z3Xz3zzzwDwDVzzkzzky4DzwDy7kzzy3szzz7zXwT2DkyATVzzVzzzkzsTzwDyDsTy7z3sTwDzwDy7s00zkkzkzzzz3z3sTzwDzwDV3zz3zVwDzzkyDz7lzsz7kXwDU7sTzsTwTwDy7zz3zXy7zVzky7z3zz3zVy00DyADwDzzzkzky7zz3zz3w0zzkzsT3sTwDXzlwTyDly0z3w1y7zy7z3z3zlzzkzszVzsTwDVzkzzkzsT001zV3z3zzzwDwDVzzkzzkz0DzwDy7ky7z3szwT7zXwTkDkz0TVzzVzkzkzwTzwDyDsTy7z3sTwDzwDy7kzsTsFzkzzzz3z3sTzwDzwDs3zz3zVwDVzkyDy7lzsz7w3wDs7sTzsTwDwDz7zz3zXy7zUzky7y3zz3zVwDy7y0TwDzzzkzky7zz3zz3z0zzkzkT3sDwDVzVwDwDlzUz3y1y7zy7z7z3zlzzkzkzVzw3kDUS1zzkzsS3zUzk7z3zzzwDkDVzzkzzkzkDzwDsDkz1w7sDkT1y3wTsDkzkTVzzkz1zkzwTzwDsDsTz007w00TzwDy7VzwDw1zk03zz007s01w00wDy3zz003wDk01z00Ds01z7z3wDy7s01w00TwDz00T007y7zs03zU0Dzz3zVsTz3z0zw00zzk03y00T00D3zUzzk01z3y00zk07z00zlzkz3zVy00TU0Dz3zk07k03zVzzU1zw0DzzkzsS7zkzsDz00Dzw01zU07k03szwTzw01zkzs0zz03zs0zwTyDkzwTU0Dy0Dzkzw01w03s"

    if (ok:=FindText(X, Y, 189, 232, 700, 282, 0, 0, Text))
    {
        ; FindText().Click(X, Y, "L")
    }
}

; need to include funtions like if gotany rewards or completed milestone or any other
; add network check

