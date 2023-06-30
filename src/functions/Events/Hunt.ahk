EnterHuntTab(){

    isFound:= False

    Loop, 30{

        ; hunt card
        ; monza sp1
        ; Text:="|<>*155$91.U007zy0zzzzzU0Dk003zy0Dzzzz001s001zz07zzzz000Q000zzU3zzzzU00D000Tzk0zzzzU7s3zzkDzk0TzzzkDy1zzsDzs8DzzzsDzUzzs7zw43zzzs7zkDzs7zy31zzzw3zs7zw7zy3Uzzzy1zy7zw3zz1kDzzz0zzzzw3zzUw7zzzkTzzzy1zzUy3zzzs7zzzy1zzkT1zzzw0zzzy1zzsDUTzzy00zzz0zzw7sDzzzU03zz0zzw7w7zzzs00Tz0zzy3y3zzzy003zUTzz1zUzzzzs00zUTzz0zkTzzzzs0TUTzzUzsDzzzzzk7kDzzkDs3zzzzzw3kDzzs001zzzzzy1kDzzs000zzzkzzUs7zzw000TzzkDzkM7zzy0007zzs7zsA7zzy1zy3zzy3zw43zzz0zz1zzz1zw03zzzUzzUTzzUTw20007kTzsDzzk0010003kDzw7zzw001U001sDzy3zzz000k000w7zz0zzzk01w000y7zzkzzzz03y"

        ; if (ok:=FindText(X, Y, 579, 218, 684, 269, 0, 0, Text))

        ; nio ep9
        ; Text:="|<>*157$74.000Tk00Tzs07k007w003zs00Q001z000Tw003000Tk003y000EDzzw7y0TUDk43zzz1zs7s7z00zzzkTz1w3zk0Dzzw7zkT0zy03zzz1zw7kDzU0zzzkTz1w3zs0Dzzw7zkT0zy03zzz1zw7kDzU0zzzkTz1w3zs0Dzzw7zkT0zy0007z1zw7sDzU001zkTy1y1zs000Tw7z0TU3w0007z000Dw000001zk003z0000Dzzw001zs0003zzz000zzU000zzzk03zzzzs0Dzzw7zzzzzy03zzz1zzzzzzU0zzzkTzzzzzs0Dzzw7zzzzzy03zzz1zzzzzzU0zzzkTzzzzzk0Dzzw7zzzzzs0001z1zzzw001000TkTzzz000E007w7zzzk00A001z1zzzw007U00zkzzzzU0Ds"

        ; if (ok:=FindText(X, Y, 401, 215, 504, 271, 0, 0, Text))

        ; peugeot sr1
        ; Text:="|<>*145$47.001zw002000zs000000zk000000zU00EDw1z0zzUzy1y3zz1zw3w7zy3zw7sDzw7zsDkTzsDzkTUzzkTzUz1zzUzz1y3zz1zy3w7zy3zw7sDzw7zkDk00sDzUTU00kDy1z001U003y003000Dw00C000TsDzw003zkTzs01zzUzzkTzzz1zzUzzzy3zz1zzzw7zy3zzzsDzw7zzzkTzsDzzzUzzkTzzz1zzUzzzy0011zzzw0003zzzs0007zzzk00ADzzzk00M"

        ; if (ok:=FindText(X, Y, 317, 216, 380, 272, 0, 0, Text))

        ; apex ap-0
        Text:="|<>*130$106.zs1zzU00zy001w3zw3zU7zy000zs007kDzkDy0Tzs001zU00TUTy1zk0zzU007y001y1zsDz03zy1zUDsDzzw3z0zw0DzsDzUzUzzzsDw7zkUTzUzy3y3zzzUTUTy31zy3zsDsDzzz1y3zsA7zsDzUzUzzzw3kDzUkTzUzy3y3zzzsD1zw7Uzy3zs7sDzzzUM7zkS3zsDzUTUzzzz1Uzz1sDzUzy3y3zzzw03zs7UTy3zsDsDzzzs0TzUz1zsDzUzU01zzU1zy3w7zUzy3y007zz0DzsDkTy3zkDs00Tzw0zz0zUzs000zU01zzU3zw7y3zU007y007zy07zkTsDy000zsDzzzk0Ty1zUTs007zUzzzz00zs7y1zU07zy3zzzs63zU007y3zzzsDzzzUM7y000DsDzzzUzzzw3kDk000zUzzzy3zzzkT0z0003y3zzzsDzzy1y1w7zsDsDzzzUzzzsDs7UTzUTUzzzy3zzz0zkC1zz1y3zzzsDzzw7z0sDzw7sDzzzU00TUTy1UzzkDUzzzy001y3zs43zz0y3zzzs007kDzk0Tzy3sDzzzU00T1zz0VzzsTlzzzy003w7zy2"

        if (ok:=FindText(X, Y, 317, 216, 442, 264, 0, 0, Text))
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

