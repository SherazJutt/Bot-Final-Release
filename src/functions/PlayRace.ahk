PlayRace(){
    isCompleted := False

    Loop, 200{
        Text:="|<>*127$64.00000000000k1UTwA0Azz7UC3zsw1nzyS0sDzVkDDztw3Us07Us3k7sC3U0C7UD0TUsC00wQ0w1z3Us01nU3k7wC3U07i0D0SssC00Dk0w1vXUzw0z03k7bC3zk1s0D0SQsDz0Dk0w1svUs00z03k7Xy3U07i0D0S7sC00Qs0w1sTUs03lk3k7Uy3U0C70D0S1sC01sC0w1s7Uzy70w3k7UC3zsw1kD0A0sDzXU70Q000000000008"
        if (ok:=FindText(X, Y, 1001, 621, 1079, 656, 0, 0, Text)){
            isCompleted := True
            Click, 1176, 645 Left, 1
            Sleep, 1000
            Break
        }Else{
            Sleep, 1000
            HuntRampsNitros()
            NitroManagemnet()
            TdCheckInRace()
            Resume()
            CheckInternet()
            WhereToGetBpsScreen()
            ConnectingToTheServer()
            CheckGame()
            If (TokensColorCheckToVerifyHomeScreen()){
                Gosub, script_start
            }
        }
    }
    Return isCompleted
}

HuntRampsNitros(){
    ; goto left
    Text:="|<>*157$28.y001zs007zU00T04000000000000k000A3zzk0TzzU1s0S07Tzs0RzzU1k0S06zyM0LwCU0kzw2"
    if (ok:=FindText(X, Y, 583, 147, 620, 172, 0, 0, Text)){
        Send, {Left 5}
        Return
    }

    ; nitro blue left
    Text:="|<>*144$20.zzzzzwzzy1zzkTzUDzU7zs1zw0Dz03zU0zs0Dw03z01zU0Ts0Dw03z01zk0Ts0Dy03z01zk0Ts07z03zw0zzkTzz7zzzzs"
    if (ok:=FindText(X, Y, 532, 122, 634, 192, 0, 0, Text)){
        Send, {Left 5}
        Return
    }

    ; barrel left
    Text:="|<>*142$23.zzzzzzxzzzvzzznzzz7zzyDzzsDzzkTzz0Tzy0zzs0zzU1zy03zs07z00Ds00S002k005k00PU01rU0DjU0zTU7yzU01zzzz"
    if (ok:=FindText(X, Y, 532, 122, 634, 192, 0, 0, Text)){
        Send, {Left 5}
        Return
    }

    ; barrel right
    Text:="|<>*167$23.zzzzyzzzxzzznzzzbzzy7zzwDzzkDzzUTzz0Tzw0Tzs0TzU0TzU0Ty00Dw003t000m001q007C00DT00wz03w00DzzzzU"
    if (ok:=FindText(X, Y, 637, 120, 747, 193, 0, 0, Text)){
        Send, {Right 5}
        Return
    }

}
RampsNitros(){

    ; nitro x2 bottle left
    Text:="|<>*155$28.zzzzzzzDzzzsDzzzkzzzs3zzy0zzzs1zzz03zzw0DzzU0zzy03zzk0SDz01UDsCS0TUa9lw2Nb7k4bwS0EzXs0XsT04D3w0GMTk2NXy09W0Q1zs1w1zzzw7zzzyzzzzzzzy"
    if (ok:=FindText(X, Y, 532, 122, 634, 192, 0, 0, Text)){
        Send, {Left 5}
        Return
    }

    ; nitro x2 bottle right
    Text:="|<>*155$28.zzzzzzzDzzzsDzzzkzzzs3zzy0zzzs1zzz03zzw0DzzU0zzy03zzk0SDz01UDsCS0TUa9lw2Nb7k4bwS0EzXs0XsT04D3w0GMTk2NXy09W0Q1zs1w1zzzw7zzzyzzzzzzzy"
    if (ok:=FindText(X, Y, 637, 120, 747, 193, 0, 0, Text)){
        Send, {Right 5}
        Return
    }

    ; nitro blue left
    Text:="|<>*144$20.zzzzzwzzy1zzkTzUDzU7zs1zw0Dz03zU0zs0Dw03z01zU0Ts0Dw03z01zk0Ts0Dy03z01zk0Ts07z03zw0zzkTzz7zzzzs"
    if (ok:=FindText(X, Y, 532, 122, 634, 192, 0, 0, Text)){
        Send, {Left 5}
        Return
    }

    ; nitro blue right
    Text:="|<>*144$20.zzzzzwzzy1zzkTzUDzU7zs1zw0Dz03zU0zs0Dw03z01zU0Ts0Dw03z01zk0Ts0Dy03z01zk0Ts07z03zw0zzkTzz7zzzzs"
    if (ok:=FindText(X, Y, 637, 120, 747, 193, 0, 0, Text)){
        Send, {Right 5}
        Return
    }

    ; barrel left
    Text:="|<>*142$23.zzzzzzxzzzvzzznzzz7zzyDzzsDzzkTzz0Tzy0zzs0zzU1zy03zs07z00Ds00S002k005k00PU01rU0DjU0zTU7yzU01zzzz"
    if (ok:=FindText(X, Y, 532, 122, 634, 192, 0, 0, Text)){
        Send, {Left 5}
        Return
    }

    ; barrel right
    Text:="|<>*167$23.zzzzyzzzxzzznzzzbzzy7zzwDzzkDzzUTzz0Tzw0Tzs0TzU0TzU0Ty00Dw003t000m001q007C00DT00wz03w00DzzzzU"
    if (ok:=FindText(X, Y, 637, 120, 747, 193, 0, 0, Text)){
        Send, {Right 5}
        Return
    }

    ; ramp left
    Text:="|<>*147$26.zzzzzzzbzzzUzzzk7zzk0zzk07zs00zs007s001s006M003b003tk01yS01zbU1ztw1zyT0007s001zzzzs"
    if (ok:=FindText(X, Y, 532, 122, 634, 192, 0, 0, Text)){
        Send, {Left 5}
        Return
    }

    ; ramp right
    Text:="|<>*147$26.zzzzzzzbzzzUzzzk7zzk0zzk07zs00zs007s001s006M003b003tk01yS01zbU1ztw1zyT0007s001zzzzs"
    if (ok:=FindText(X, Y, 637, 120, 747, 193, 0, 0, Text)){
        Send, {Right 5}
        Return

    }

    ; switch to right route
    Text:="|<>*151$24.zzzzzzxzzzsTzzU7zz01zzs7zzs7zzs3zzs3zzk3zzU3zw07zk0Dz00Ty03zw07zs0Dzk0Tzk0Tzk0zzk0zzk0zzU0zzU0zzU0zzU0TzzzzzU"
    if (ok:=FindText(X, Y, 637, 120, 747, 193, 0, 0, Text)){
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