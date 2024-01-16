PlayRace(){
    Text:="|<>*165$46.w0Dy07zzU0Tk07zw00y00TzU03s01zy3wD1y3zsTkw7sC7Vz3kTVsS7wD1y71sTUwDsQ71y3kz1kQ7sC3w7zkTUsDkTz1y3Uz1zw7sS3w7zkTVsDkTz3y7Uz3zsDsS3wDzUz1sDkwC1w7Uy3Us00S00C3U03s01sDU0Tk0DUz07zk3y7s"

    if (ok:=FindText(X, Y, 1082, 133, 1132, 163, 0, 0, Text))
    {
        ; FindText().Click(X, Y, "L")
    }
}

RampsNitros(){

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

    ; switch to left route
    Text:="|<>*153$28.y001zs007zU00T00000000000000k000A3zzk0TzzU1s0S07Tzs0RzzU1k0S06zzM0LwCU0kzw2"
    if (ok:=FindText(X, Y, 582, 147, 623, 172, 0, 0, Text)){
        Send, {Left 5}
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