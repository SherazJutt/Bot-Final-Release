EnterHuntTab(){

    isFound:= False

    Loop, 30{

        ; barchetta
        ; Text:="|<>*125$52.1zz1zU00w3zw7w001kDzkTk0030zz1z00043zw7w3z00DzkTkDz00zz1z0zy03zw7w3zs0DzkTkDzU0zz1z0zy03zw7w3zs0DzkTkDzU0zz1z0zy03zw7w3zs0000TkDzU0001z0zw00007w3zU0000Tk0010001z00043zw7w000kDzkTk0070zz1z007w3zw7w3zzkDzkTkDzz0zz1z0zzw3zw7w3zzkDzkTkDzz0zz1z0zzw3zw7w3zzkDzkTkDzz0zz1z0zzw3zw7w3zzkDzkTkDzzVzz3zVzzy"

        ; if (ok:=FindText(X, Y, 478, 215, 543, 266, 0, 0, Text))

        ; nsx gt3
        ; Text:="|<>*135$72.w01zk001zk0Ds00Tk001z007k00Dk001y003U007k001w001U7k7zs3zw1y00zw3zw7zw7z01zw3zw7zs7zU1zy3zw7zsDzU1zy3zw7zsDzU1zy3zw7zsDzU1zy3zw7zzzzU1zzzzw7zzzzU1zzzzw7zzzzU1zzzzw7zzzz01zzzzw7zzzw11zzzzw7zzz031y03zw7zzy071y03zw7zzz031y03zw7zzz011y03zw7zzzz01zw3zw7zzzzU1zy3zw7zzzzU1zy3zw7zzzzU1zy3zw7zwDzU1zy3zw7zsDzU1zy3zw7zsDzU1zw3zw7zsDzU0zw3zw7zw7zU0zs3zw7zw3z0U007zw7zw001U00Dzw7zy001k00Dzw7zz003w00zzw7zzU07z07zzyDzzw0zU"

        ; if (ok:=FindText(X, Y, 419, 217, 509, 266, 0, 0, Text))

        ; bacalar
        ; Text:="|<>*139$80.001zzz0Dzzk07k007zzk3zzk00Q000zzw0zzs0030007zy07zw000EDy1zzU1zz0Tk47zkDzs0TzkTz11zw3zw43zw7zk0TzUzz1Uzy1zy07zsDzkMDzUzzU1zy3zw63zsDzs0TzUzy3UTy3zy07zsDzUw7zUzzz1zw3zsD1zsDzzkTy1zw3kDy3zzw000Tz1y3zUzzz000TzkTUzsDzzk007zw7sDy3zzw000zy3y1zUzzz0007zUzkTsDzzkTz0zsDw7y1zzw7zsDw3z0zUTzz1zy3z0zkDsDzzkTzUzk003y3zy47zsDs000zUzzU1zy3y0007s7zs0TzUzU001y1zy07zsDsDzkTUTz01zy3w3zw3w7zk0Tz0z0zz0z0zs4000DkTzsDk0010007s7zy3y000k003y1zzUTk00A001zUzzw7y00DU03zsDzz3zs0Ds"

        ; if (ok:=FindText(X, Y, 317, 217, 419, 271, 0, 0, Text))

        ; trezor

        ; Text:="|<>*128$135.0007zzzzzzzs001zzzzzzzs000zzzzzzzy000Dzzzzzzz0007zzzzzzzk001zzzzzzzs000zzzzzzzz000DzzzzzzzzUDzzzzzzzzs001zzzzzzzzy3zzzzzzzzzzzkDzzzzzzzzkTzzzzzzzzzzw3zzzzzzzzy3zw70zU0Dzzz0Tz00zy70zkTzUU7s00zzzs7zU01zkE7y3zw00y003zzy1zs007w00zkTzU07U00DzzkDz000zU07y3zw0zw1y1zzw3zk7s3w0zzkTzUTz0zs7zz0zy3zkTUDzy3zw3zs7z0zzs7zkTy3y3zzkTzUzz1zw7zy1zy3zkTkTzy3zw7zsDzUzzUTzkTy3y3zzkTzUzz1zw7zw3zy3zkTkTzy3zw7zsDzUzz0zzkTy3y3zzkTzUzz0zs7zkDzy3zkTUTzy3zw7zs000zy1zzkTy1w3zzkTzUzz0007zUTzy3zkDUTzy3zw7zs000zw7zzkTy1w3zzkTzUzz000Dz0zzy3zkDUTzy3zw7zsDzzzkDzzkTy1w3zzkTzUzz1zzzy1zzy3zkDUTzy3zw7zsDzzzUTzzkTy1w3zzkTzUzz1zzzs7zzy3zkTUTzy3zw7zs7zzz0zzzkTy3w3zzkTzUzzUTzzkDzzy1zUTUTzy3zw7zw001y000Dk003w3zzkTzUzzk007k000z000zUTzy3zw7zy000y0007w00Dw3zzkTzUzzw007k001zk03zkTzz7zy7zzs01y000Dzk3zy7zU"

        ; if (ok:=FindText(X, Y, 537-150000, 242-150000, 537+150000, 242+150000, 0, 0, Text))

        ; apollo ie

        ; Text:="|<>*155$70.Vzzz1zzzw01w3zzw7zzz001kDzzkTzzs0030zzz1zzz00043zzw7zzw1z0EDzzkTzzUTy10zzz1zzy1zw43zzw7zzsDzk0DzzkTzzUzz00zzz1zzy3zw03zzw7zzsDzk0DzzkTzzUzz00zzz1zzy3zw03zzw7zzsDzk0DzzkTzzUzz00zzz1zzy3zw03zzw7zzsDzk0DzzkTzzUzz00zzz1zzy3zw03zzw7zzsDzk0DzzkTzzUzz00zzz1zzy3zw03zzw7zzsDzk0DzzkTzzUzz00zzz1zzy3zw03zzw7zzsDzk0DzzkTzzUzz10zzz1zzy1zw43zzw7zzw3zUE007k007k001000T000TU00A001w001y001s007k007y00DU00TU00zy07y"

        ; if (ok:=FindText(X, Y, 408, 218, 490, 268, 0, 0, Text))

        ; c7r
        ; Text:="|<>*139$89.w00zy000TzzU01zU00zw000zzz000y000zs001zzy000w000zk003zzw000k7w0zk007zzs7w1UTy1zzzkTzzkTy11zy3zzz0zzzUzw23zw7zzy1zzz1zw47zsDzzw7zzy3zs8DzkTzzkDzzw7zkETzUzzzUzzzsDzUUzzzzzy1zzzkTz11zzzzzw3zzzUzy23zzzzzsDzzz1zw47zzzzzUTzzy3zk8Dzzzzz1zzzw7zUETzzzzw3zzzs001Uzzzzzs7zzzk0031zzzzzkTzzzU00C3zzzzz0zzzz001w7zzzzy1zzzy007sDzzzzs7zzzw7s7kTzUzzkDzzzsDsDUzz1zzUzzzzkTkD1zy3zy1zzzzUzUS3zw7zw3zzVz1zUw7zsDzkDzy3y3z0sDzUTzUTzw7w7z1kDy0zz1zzsDsDy1U003zw3zzkTkTy3U007zs7zzUzUzw3U00TzUTzz1z1zw7U01zz0zzy3y3zs7s0Tzy3zzy7wDzs8"

        ; if (ok:=FindText(X, Y, 321, 216, 429, 267, 0, 0, Text))

        ; one 77
        ; Text:="|<>*148$134.zs1zzy00zs000zk03zsDzsDy0Tzy003y000Ds00Dy1zy3zU7zz000TU003w001zUDzUzk0zzU007s000y000Ts3zsDw0Dzs3y0zz0zz0Dk3y0Ty3z03zy3zkDzsDzkDz0zU7zUzkUTz0zy3zy3zw7zsDs0zsDsA7zkDzUzzUzz1zy3y0Dy3y31zw3zsDzsDzkTzUzU1zUzUkTz0zy3zy3zw7zsDs0TsDkS3zkDzzzzUzz1zy3y03y3w7Uzw3zzzzsDzkTzUzU0TUz1sDzUTzzzy3zw7zsDsA7sDUS1zs3zzzzUzz1zy3y30y3sDkTy01zzzsDzkTzUzUsDUy3w7zk01zzy3zw7zsDsD1sDUz1zy007zzUzz1zy3y3kS3kDsDzk00zzsDzkTzUzUy3Uw7y3zzU07zy3zw7zsDsDUsD1zUzzzk0zzUzz1zy3y3w63UTs7zzzkDzsDzkTzUzUz1Us7y1zzzy3zy3zw7zsDsDs8C000TzzzUTzUzz1zy3y3y03U007y7zw7zsDzkTzUzUzk0k000z0zz1zy3zw7zsDsDw0A000DkDzkTzUzz1zy3y3zU31zy3w3zs7zsDzkTzUzUzw0UTzUTUzy3zy3zw3zsDsDz087zw7s7z0zzUzz0zw3y3zs23zz1y000DzsDzs000zUzy0UzzkTk007zy3zy000TsDzk0Dzw3y003zzUzzk00Dy3zw07zzUzk01zzsDzy007zUzzUVzzsTzU3zzy7zzw0DzwDzw8"

        ; if (ok:=FindText(X, Y, 321, 222, 468, 262, 0, 0, Text))
        ; viper gts
        ; Text:="|<>*152$80.000zzs01zw003k007zw007z000A000Tw000zk0010007z000Dw000EDy0zU7s1z0zk07zkDs7zUTkTz01zy3y3zw7w7zs0TzUzUzz1z1zy07zsDsDzkTkTzU1zy3y3zw7w7zs0TzUzUzz1z1zy07zsDsDzkTkTzU1zy3y3zw7w7zs0TzUzUzz1z1zy07zsDsDzkTkTzU1zy3y3zw7w7zs0TzUzUzz1z1zy07zsDsDzkTkTzU1zy3y3zw7w7zs0TzUzUzz1z1zy07zsDsDzkTkTzU1zy3y3zw7w7zs0TzUzUzz1z1zy07zsDsDzkTkTzU1zy3y3zw7w7zs0TzUzUzz1z1zy07zsDsDzkTkTzU1zy3y3zs7w7zs0Tz0zUTy1z1zw0000Dw000zk0000007z000Dw000E003zs007z000A001zz003zk007U03zzy07zy00Ds"

        ; if (ok:=FindText(X, Y, 322, 219, 415, 265, 0, 0, Text))

        ; italdesign zerouno
        Text:="|<>*163$64.1zy00zy3zy07zU01zs7zs0Tw003zUTzU1zU007y0zy07y0z0Ts3zs0TsDz0zU7zU1z1zy3y0Dy07w7zsDs0zs0TkTzUzU1zU1z1zy3y07y07w7zsDs0Ds0TkTzzzU0zU1z1zzzy31y07w7zzzsA7s0TkTzzzUsDU1z1zzzy3US07w7s0DsD1s0TkTU0zUw3U1z1y03y3sC07w7w0DsDkM0TkTzUzUz1U1z1zy3y3y207w7zsDsDs00TkTzUzUzk01z1zy3y3z007w7zsDsDy00TkTzUzUzs01z0zw3y3zk07y1zkDsDzU0Ts001zUzy01zk007y3zw07z000zsDzk0Tz007zUzzUXzz03zz3zz6"

        if (ok:=FindText(X, Y, 496, 220, 571, 268, 0, 0, Text))

        ; roma
        ; Text:="|<>*144$71.000z000TU00y000y000z000Q001w001y000M007s003w000EDzzkDzzs7w0UzzzUzzzkTy11zzz1zzzUzy03zzy3zzz1zw07zzw7zzy3zs0DzzsDzzw7zk0TzzkTzzsDzU0zzzUzzzkTz01zzz1zzzUzy03zzy3zzz1zw03zzw007y3zs000Ds00Dw7zUE00Tk00Ts000U00zU00zk003001z001zU00C003y3zzz000w3zzw7zzy003sDzzsDzzw7s7kTzzkTzzsDs7UzzzUzzzkTkD1zzz1zzzUzkC3zzy3zzz1zUQ7zzw7zzy3zUMDzzsDzzw7z0kTzzkTzzsDz0UzzzU00TkTy11zzz000TUzy03zzy000z1zw07zzw001y3zw4Dzzw007yDzw8"

        ; if (ok:=FindText(X, Y, 323, 220, 406, 266, 0, 0, Text))
        {
            Loop, 2{
                Send, {Enter}
                Sleep, 1000
            }

            isFound:= True
            Break

        }Else{

            Send, {PgDn}
            Sleep, 1800
            ; green underline check to verify events tab start
            CoordMode, Pixel, Screen
            PixelSearch, FoundX, FoundY, 1088, 692, 1141, 703, 0xC3FB12, 0, Fast RGB
            If (ErrorLevel = 0){
                Break
            }
        }
    }

    Return isFound
}

isRaceScreen(){

    isRaceScreen:= False

    Text:="|<>*119$69.zz01y03zk7zzzw0Dk0zz0zzzzk1y0Dzw7zz0S0Ts1k7Us0s1k3z0C0Q7070C0Qs3k3Us0s1k3b0S0Q7070C0ww3k00s0s1k73US007070C0sQ3k00zyw3k73US007zrzw1sS3k00zyzz0C1kS00707zk1kC3k00s0sC0TzsS0Q7071s3zz3k3Us0s70TzsS0Q7070w7U71k3Us0s3Uw0wC0w7070S703VzzUzzs1ks0Q7zs7zz0DD03kTy0zzU"
    if (ok:=FindText(X:="wait", Y:=10, 1046, 638, 1123, 667, 0, 0, Text)) {
        Sleep, 1000
        isRaceScreen:= True
    }

    Return isRaceScreen
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
            Sleep, 1000
            Loop, 5 {
                Sleep, 1000
                Text:="|<>*119$69.zz01y03zk7zzzw0Dk0zz0zzzzk1y0Dzw7zz0S0Ts1k7Us0s1k3z0C0Q7070C0Qs3k3Us0s1k3b0S0Q7070C0ww3k00s0s1k73US007070C0sQ3k00zyw3k73US007zrzw1sS3k00zyzz0C1kS00707zk1kC3k00s0sC0TzsS0Q7071s3zz3k3Us0s70TzsS0Q7070w7U71k3Us0s3Uw0wC0w7070S703VzzUzzs1ks0Q7zs7zz0DD03kTy0zzU"
                if (ok:=FindText(X, Y, 1046, 638, 1123, 667, 0, 0, Text)) {
                    Break
                }Else{
                    Text:="|<>*133$302.003zs007s007kTsDzzkzzzzs000w3zs03zkDz0T000Q000Tk07k00Dy001y001w7y3zzsDzzzy000D0zs00Dw1zk7k0070007s00Q001zU00TU00T1zUzzy3zzzzU003kDw001z0Ts3w001k001w003000Ts007s007kTsDzzUzzzzs000w3z000Dk7w0z000Q000S000kTs3y3zzy3zzw7y3zzsDzzzy000D0zU003w1z0Tk007000700047zUzUzzzUzzz1zUzzy3zzzzzU3zkDs0w0T0TUDw0zzzk1zk0k11zsDsDzzsDzzkTsDzzUzzzzzw1zw3y0zk7k7k7z0Tzzy1zw1zUETy3y3zzy3zzw7y3zzsDzzzzz0Tz0zUTw1w1s1zk7zzzUTz0zs07zUzUzzzUzzz1zUzzy3zzzzzk7zkDs7z0T0S0zw1zzzs7zkDy01zsDsDzzsDzzkTsDzzUzzzzzw1zw3y1zk7k70Tz0Tzzy1zw3zUETy3y3zzy3zzw7y3zzsDzzzzz0Tz0zUTw1w1k7zk7zzzUTz0zzw7zUzUzzzUzzz1zUzzy3zzzzzk7zkDs7zUz0M3zw1zzzs7zk7zz1zsDsDzzsDzzkTsDzzUzzzzzw1zw3y1zzzk41zz0Tzzy1zw0zzkTy3y3zzy3zzw7y3zzsDzzzzz0Tz0zUTzzw00zzk00TzUTz00Dw7zUzU01zUzzz1zUzzy3zzzzzk7zkDs7zzz00Dzw007zs7zk00T1zkDs00Ts00TkTsDzzUzzzzzw1zw3y1zzzk03zz001zy1zy001k007y007y007w7y3zzsDzzzzz0Tz0zUTzzw00Tzk00TzUTzk00A001zU01zU01z1zUzzy3zzzzzk7zkDs7zzz003zw007zs7zy001000zsDzzs00TkTsDzzUzzzzzw1zw3y1zzzk00zz001zy1zzw00E00zy3zzy3zzw7y3zzsDzzzzz0Tz0zUTzzw007zk7zzzUTzzw007sDzUzzzUzzz1zUzzy3zzzzzk7zkDs7zzz060zw1zzzs7zzzw01y3zsDzzsDzzkTsDzzUzzzzzw1zw3y1zk7k3UDz0Tzzy1zzzzU0TkTy3zzy3zzw7y3zzsDzzzzz0Tz0zUTw1w1w1zk7zzzUTz0zw07w3zUzzzUzzz1zUzzy3zzzzzk7zkDs7z0T0TUTw1zzzs7zkDz01z0zsDzzsDzzkTsDzzUzzzzzw1zw3y1zk7k7s3z0Tzzy1zw3zk0Ts7y3zzy3zzw7y3zzsDzzzzz0Tz0zUTw1w1z0Tk7zzzUTz0Ts07z1zUzzzUzzz1zUzzy3zzzzzk7zkDs3y0T0Tk7w1zzzs7zk7w01zkTsDzzsDzzkTsDzzUzzzzzw1zw3y000Dk7y0z000Ty1zw0000Tw3y001y3zzw7y001s007zzz0Tz0zk003w1zk7k007zUTzU0047zUzU00TUzzz1zU00S001zzzk7zkDw001z0Tw1w001zs7zs0011zs7s007sDzzkTs007U00Tzzw1zw3zU00zk7zUD000Ty1zz000kTz1y001y3zzw7y001s007zzz0Tz0zw00Tw1zw3k007zUTzw00yDzsTk00zlzzzXzk00z003zzzsDzsTzy1zzVzzky003zwDzzw3zU"
                    if (ok:=FindText(X, Y, 430, 169, 755, 224, 0, 0, Text)){
                        PressEscape(1)
                    }
                }
            }
        }Else{
            PressEscape(1)
            Gosub, hunt_ended
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

SelectCarToPlayHunt(){

    ; click on race button
    Click, 1177, 643 Left, 1

    ; checking the cars screen
    Text:="|<>*134$247.w0Tzw7zs07zzzk1zs01yDzy00Tw0Tk00wDz07zXzss03zw1zw00zzzU0Dw00y7zz00Ds03s00S7y00zkzw800zy0zy00DzzU03y00T3zzU07s00w00D3y00DsTy000Dz0Tz003zzk01z00DVzzk03s00C007Vy003w7z07w7z07zVz1zzkTkTVzzkzzsTzw7w7z3zkz3z1y1zU7z3zV3zkzkzzsTwDkzzsTzwDzy7z3zVzsTVzkz0zk3zVzkVzsTsTzwDy7sTzwDzy7zz3zVzkzwDkzsTUDs1zkzsMTwDwDzy7z3wDzy7zz3zzVzkzsTy7sTwDk7w0zsTsQDy7y7zz3zzy7zz3zzVzzkzsTwDz3wDy7s1y0TzzwC7z3z3zzVzzz3zzVzzkzzsTzzy7zVy7z3w0z0Dzzy73zVzVzzkTzzVzzkzzsTzwDzzz3zkz3zVy4DU7zzy3kzkzkzzs0zzkzzsTzwDzy7zzzVzsTVzkz23k3zzz3sTsTkTzy01zs03wDzy00z3zzzkzwDkzsTVVs1zzzVwDw00DzzU0Dw01y7zz00TVzzzsTy7sTwDksQ0zzzkz3y00Dzzw03y00z3zzU0DkzzzwDz3wDy7sQC0TzzkTVz00Dzzzs0z3zzVzzkzzsTzzy7zVy7z3wD30DzzsTkzU0DzzzzkTVzzkzzsTzwDzzz3zkz3zVy7VU7zzw00Tky7zzzzwDkzzsTzwDzy7zzzVzsTVzkz3sE3zVy007sT3zzyTy7sTzwDzy7zz3zVzkzwDkzsTVw01zky003wDkzzy7z3wDzy7zz3zzVzkzsTy7sTwDkz00zsT001y7sTzz3zVy7zz3zzVzzkzsTwDz3wDy7sTU0TwDVzkT3w7zzVzkz3zzVzzkzzsTwDy7zVy7z3wDs07w7UzwDVz3zzkTkTVzzkzzsTzw7w7z3zkz1z1y7y0003kzy7kzUzzw00Dk03s00w00y003zVzsTU00z3z0U03sTz3sTsTzy00Ds01w00S00TU03zkzwDs00zVzkM03wDzkwDw7zzU0Dw00y00D00Ds03zsTy7y00zkzsD07yDzsSDz3zzw0Ty00TU07U07z07zwDz3zk1zszyA"
    if (ok:=FindText(X:="wait", Y:=10, 102, 114, 367, 153, 0, 0, Text)){
        Sleep, 1000
        RandomSelect:
            ReselectIndex := 0

            Sleep, 2000
            ; move mosue to scroll
            Click , 880, 293, 0
            ; scroll back to select 1st car
            Loop , 200{
                Click , WheelUp, 1
                Sleep , 15
            }

            ; click on first car
            Click, 338, 389 Left, 1

            ; check upgrade text to verify selected car screen
            Text:="|<>*148$145.s1kTz01z07zU0DU1zs0zz0DsQ0sDzs3zs7zw07k1zz0TzUTzC0Q7zy3zy3zz07s0zzkDzkTzr0C3kD1sD1s7U3y0S1w700T1vU71s3Vs3kw1s1r0D0S3U0D0Rk3Uw1kw1sS0w1vU7U71k070Cs1kS0sS0wD0S0xs3k3Us03U7Q0sD0QD0A7UD0QQ1s1kQ01k0C0Q7UC7U03k7UCC0w0sC00w070C3k73k01s3kD7US0Q700TU3U71s3Vs00w1k73kD0C3zs7z1k3Uw3kwTsTzs3Us7U71zw1zws1kTzsSDwDzs3kQ3k3Uzy0DzQ0sDzsD3y7zs1sD1s1kQ000Ti0Q7zk7UD3kw0s7Uw0sC0001z0C3k03k7VsS0TzkS0Q70000zU71s01s3kw7UTzsD0C3U0C0Tk3Uw00w1sS3kDzy7U71k070Ds1kS00S0wD0s7073k7Us03k7y1sD00DUw7US7U3Vs7kQ01s7jzw7U03zy3k73k1szzkDzkTznzw3k00zy1s3lk0wTzk7zsDzkTs1k007w0w0ss0CDzk3zw1zV"
            if (ok:=FindText(X:="wait", Y:=10, 103, 617, 274, 663, 0, 0, Text)){
                Sleep, 2500
                ; random select car function
                IniRead, maxcars, %SettingsIni%, HUNT, max_cars
                Random, selectedcar, 1, maxcars
                IniRead, currcar, %SettingsIni%, HUNT, car_%selectedcar%
                Loop, %currcar%{
                    Send, {PgDn 1}
                    Sleep, 250
                }

                Sleep, 1000
                ; checking if car is refueling
                If (LockedOrRefueling()){
                    if(ReselectIndex == 8){
                        ReselectIndex := 0
                        ; selecting any available car to play with
                        loop 30{
                            Send, {PgDn 1}
                            Sleep, 1000
                            If (!LockedOrRefueling()){
                                Break
                            }
                        }
                    }Else{
                        ReselectIndex ++
                        PressEscape(1)
                        Sleep, 2000
                        Goto, RandomSelect
                    }

                }Else{
                    ReselectIndex := 0
                    Sleep, 1000
                }

            }Else{
                Gosub, script_start
            }
    }Else{
        Gosub, script_start
    }
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
            Click, 1211, 643 Left, 1
            Sleep, 1000
        }
    }
    Return isSkipped
}

