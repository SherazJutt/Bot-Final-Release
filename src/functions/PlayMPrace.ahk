PlayHuntRace(){
    Loop, 3{
        Text:="|<>*127$64.00000000000k1UTwA0Azz7UC3zsw1nzyS0sDzVkDDztw3Us07Us3k7sC3U0C7UD0TUsC00wQ0w1z3Us01nU3k7wC3U07i0D0SssC00Dk0w1vXUzw0z03k7bC3zk1s0D0SQsDz0Dk0w1svUs00z03k7Xy3U07i0D0S7sC00Qs0w1sTUs03lk3k7Uy3U0C70D0S1sC01sC0w1s7Uzy70w3k7UC3zsw1kD0A0sDzXU70Q000000000008"
        if (ok:=FindText(X, Y, 1001, 621, 1079, 656, 0, 0, Text)){
            Click, 1176, 645 Left, 1
            Sleep, 1000
            MsgBox, RETURNING
            Return True
            Break
        }Else{

            CheckInRaceIssues()

            ; ramps / nitros

            ; nitro x2 bottle left
            Text:="|<>*155$28.zzzzzzzDzzzsDzzzkzzzs3zzy0zzzs1zzz03zzw0DzzU0zzy03zzk0SDz01UDsCS0TUa9lw2Nb7k4bwS0EzXs0XsT04D3w0GMTk2NXy09W0Q1zs1w1zzzw7zzzyzzzzzzzy"
            if (ok:=FindText(X, Y, 532, 122, 634, 192, 0, 0, Text)){
                Send, {Left 5}
            }

            ; nitro x2 bottle right
            Text:="|<>*155$28.zzzzzzzDzzzsDzzzkzzzs3zzy0zzzs1zzz03zzw0DzzU0zzy03zzk0SDz01UDsCS0TUa9lw2Nb7k4bwS0EzXs0XsT04D3w0GMTk2NXy09W0Q1zs1w1zzzw7zzzyzzzzzzzy"
            if (ok:=FindText(X, Y, 637, 120, 747, 193, 0, 0, Text)){
                Send, {Right 5}
            }

            ; nitro blue left
            Text:="|<>*144$20.zzzzzwzzy1zzkTzUDzU7zs1zw0Dz03zU0zs0Dw03z01zU0Ts0Dw03z01zk0Ts0Dy03z01zk0Ts07z03zw0zzkTzz7zzzzs"
            if (ok:=FindText(X, Y, 532, 122, 634, 192, 0, 0, Text)){
                Send, {Left 5}
            }

            ; nitro blue right
            Text:="|<>*144$20.zzzzzwzzy1zzkTzUDzU7zs1zw0Dz03zU0zs0Dw03z01zU0Ts0Dw03z01zk0Ts0Dy03z01zk0Ts07z03zw0zzkTzz7zzzzs"
            if (ok:=FindText(X, Y, 637, 120, 747, 193, 0, 0, Text)){
                Send, {Right 5}
            }

            ; barrel left
            Text:="|<>*142$23.zzzzzzxzzzvzzznzzz7zzyDzzsDzzkTzz0Tzy0zzs0zzU1zy03zs07z00Ds00S002k005k00PU01rU0DjU0zTU7yzU01zzzz"
            if (ok:=FindText(X, Y, 532, 122, 634, 192, 0, 0, Text)){
                Send, {Left 5}
            }

            ; barrel right
            Text:="|<>*167$23.zzzzyzzzxzzznzzzbzzy7zzwDzzkDzzUTzz0Tzw0Tzs0TzU0TzU0Ty00Dw003t000m001q007C00DT00wz03w00DzzzzU"
            if (ok:=FindText(X, Y, 637, 120, 747, 193, 0, 0, Text)){
                Send, {Right 5}
            }

            ; ramp left
            Text:="|<>*147$26.zzzzzzzbzzzUzzzk7zzk0zzk07zs00zs007s001s006M003b003tk01yS01zbU1ztw1zyT0007s001zzzzs"
            if (ok:=FindText(X, Y, 532, 122, 634, 192, 0, 0, Text)){
                Send, {Left 5}

            }

            ; ramp right
            Text:="|<>*147$26.zzzzzzzbzzzUzzzk7zzk0zzk07zs00zs007s001s006M003b003tk01yS01zbU1ztw1zyT0007s001zzzzs"
            if (ok:=FindText(X, Y, 637, 120, 747, 193, 0, 0, Text)){
                Send, {Right 5}

            }

            ; switch to right route
            Text:="|<>*151$24.zzzzzzxzzzsTzzU7zz01zzs7zzs7zzs3zzs3zzk3zzU3zw07zk0Dz00Ty03zw07zs0Dzk0Tzk0Tzk0zzk0zzk0zzU0zzU0zzU0zzU0TzzzzzU"
            if (ok:=FindText(X, Y, 637, 120, 747, 193, 0, 0, Text)){
                Send, {Right 5}
            }

            ; nitro management

            ; start
            CoordMode, Pixel, Screen
            PixelSearch, FoundX, FoundY, 437, 62, 555, 97, 0xFFFF00, 0, Fast RGB
            If (ErrorLevel = 0){
                Send, {Space 1}
                Sleep, 250
                Send, {Space 1}
            }

            ; mid
            CoordMode, Pixel, Screen
            PixelSearch, FoundX, FoundY, 554, 59, 667, 97, 0xFFFF00, 0, Fast RGB
            If (ErrorLevel = 0){
                Send, {Space}
                Sleep, 1000
                Send, {Space}
            }

            ; almost end
            CoordMode, Pixel, Screen
            PixelSearch, FoundX, FoundY, 668, 61, 800, 98, 0xFFFF00, 0, Fast RGB
            If (ErrorLevel = 0){
                Send, {Space 1}
                Sleep, 250
                Send, {Space 1}
            }

            ; shockwave
            Send, {Space 1}
            Sleep, 250
            Send, {Space 1}
            Sleep, 1000

            ; application interuppted / no opponent / no connection to the game server start
            Text:="|<>*159$33.zzzzzzTzzzrlzzzwQ7zzz1UTzzkC1zzw3s7zz0zUTzkDy1zw3zs7z0zzUTkDzy1w3zzs70zzzU0Dzzy03zzzs0zzzzUDzzzw1zzzz07zzzk0Tzzw21zzz0s7zzkDUTzw3y1zz0zs7zkDzUTw3zy1z0zzs7kDzzUQ3zzy1UzzzsCDzzzXzzzzyzzzzzzU"

            if (ok:=FindText(X, Y, 1066, 234, 1108, 279, 0, 0, Text)){
                Loop, 10{
                    Send, {Escape}
                    Sleep, 1000
                }
                Gosub, starting_mp1
            }
            ; application interuppted / no opponent / no connection to the game server end

            ; you have been disconnected from server start
            ; still disconnected
            Text:="|<>*117$71.7z7zUzkzwQ00DwDz0zVzks00TsTw1zXzVk00zkzs3z3z3VzlzVzl7y7wD3zXz3zW7yDsS7z7y7y4DwDkwDyDwDwQTsTXsTwTsTssTky7kzszkzVkzlwDVzk01z3lzXsT00U03yDXz3ly01007wT3y7Xw02DwDky7yC7sTwTsTVyDwQDkzszkz00DsMzVzlzVw00Tklz3zXz3s00zl3y7z7y7lzlzWDwDyDwDXzVz0TsTwTsS7z3z0zk00zkwDz7y1zU01zVszy7w7z00E"

            if (ok:=FindText(X, Y, 331, 103, 410, 128, 0, 0, Text))
            {
                Sleep, 2500
                Gosub, script_start
            }
            ; you have been disconnected from server start

            ; token color check to verify home screen
            Text:="|<>*72$29.zzrzzzy3zzzs3zzz01zzw01zzk00zy000zs0k0z03k0Q07k0E0Tk0E0nU1U37U3067070Tz0S1zy0w3zy1wA0S7sM0QDk000Tk001zU003z0007z000Ty000zw001y"
            if (ok:=FindText(X, Y, 787, 42, 823, 80, 0, 0, Text)){
                Gosub, starting_mp1
            }

            ; where to get bps screen
            Text:="|<>*160$32.zzzzzyTzzyD3zzz3UTzzUy3zzkTkTzsDy3zw7zUTy3zw3z1zzkTUzzy3kTzzkMDzzy07zzzU3zzzw1zzzzUTzzzk3zzzs0Tzzw43zzy3UTzz1y3zzUzkTzkTy3zsDzkTw7zw3y3zzkT1zzy3UzzzkQTzzyDjzzzrzzzzzs"
            if (ok:=FindText(X, Y, 1142, 92, 1188, 136, 0, 0, Text)){
                Click, 1163, 116 Left, 1
                Gosub, starting_mp1
            }

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

            ; connecting to the server mp start
            Loop, 60{

                Text:="|<>*71$43.zzzzzzzs0Dzzzzs00zzzzw00Dzzzy007zzzz3z3zzzzVzkzzzzkzsTzzzsTwDzzzwDy7zzzy7z3zzzz3zVzzzzVzUzzzzkTUzzzzs00Tzzzw00Tzzzy00zzzzz1sTzzzzVw7zzzzkz3zzzzsTUzzzzwDsTVsS67w7kwD33z3sS7VVzUwD3kkzsS7VsQTwD3kwDzzzzzzy"
                if (ok:=FindText(X, Y, 578, 624, 628, 658, 0, 0, Text)){
                    Sleep, 1000
                }Else{
                    Break
                }
            }

            Text:="|<>*71$43.zzzzzzzs0Dzzzzs00zzzzw00Dzzzy007zzzz3z3zzzzVzkzzzzkzsTzzzsTwDzzzwDy7zzzy7z3zzzz3zVzzzzVzUzzzzkTUzzzzs00Tzzzw00Tzzzy00zzzzz1sTzzzzVw7zzzzkz3zzzzsTUzzzzwDsTVsS67w7kwD33z3sS7VVzUwD3kkzsS7VsQTwD3kwDzzzzzzy"
            if (ok:=FindText(X, Y, 578, 624, 628, 658, 0, 0, Text)){
                Gosub, script_start
            }
            ; connecting to the server mp end

            ; tokens check
            Text:="|<>*72$29.zzrzzzy3zzzs3zzz01zzw01zzk00zy000zs0k0z03k0Q07k0E0Tk0E0nU1U37U3067070Tz0S1zy0w3zy1wA0S7sM0QDk000Tk001zU003z0007z000Ty000zw001y"
            if (ok:=FindText(X, Y, 787, 42, 823, 80, 0, 0, Text)){
                Gosub, script_start

            }
        }
        MsgBox, looping
    }

    MsgBox, completed loop

    Return False
}
