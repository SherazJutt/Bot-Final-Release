EnterHuntTab(){

    isFound:= False

    Loop, 30{
        ; ford gt mk2
        Text:="|<>*134$47.w01zk001k00zU002000z0004000y00003w1zy1zUTy3zy3z1zw3zw7y3zs7zsDw7zkDzkTsDzUTzUzkTzVzz1zUzzzzy3z1zzzzw7y3zzzzsDw7zzzzkTsDzzzzUzkTU0zz1zUz01zy3z1y03zw7y3w07zsDw7zkDzkTsDzUTzUzkTz0zz1zUzy1zy3z1zw3zw7y3zs7zsDw7zkDzkTsDzUTzUzkDy1zz1zU003zy3zU00Dzw7zU00zzsDzU03zzkTzs0zzzVzs"
        if (ok:=FindText(X, Y, 322, 215, 379, 264, 0, 0, Text))
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

    ; get current value from settings.ini file
    IniRead, hunt_play_button_click_delay, %SettingsIni%, DELAYS, hunt_play_button_click_delay
    Sleep, %hunt_play_button_click_delay%

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
            Loop , 350{
                Click , WheelUp, 1
                Sleep , 15
            }

            Sleep, 1000
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

                    ReselectIndex := 0

                    Loop, 1000{
                        ReselectIndex++
                        Sleep, 1000
                        ; normal garage
                        Text:="|<>*150$66.000000000001z0707Vs7zU7zk7UDVsDzsDzs7UD1sDzwT1w7US1sD0yS0w7Uw1sD0SQ0w7Vw1sD0CQ0w7Vs1sD0CQ007Xk1sD0CS007bU1sD0CT007bU1sD0CTw07j01sD0CDzU7z01sD0S7zs7zU1sDzy0Tw7vk1sDzw01w7vk1sDzs00w7ls1sDz0A0Q7Uw1sD00Q0Q7Uw1sD00Q0Q7US1sD00S0w7UC1sD00T1w7UD1sD00Dzs7U7VsD007zs7U7VsD003zU7U3lsD0000000000000U"

                        if (ok:=FindText(X, Y, 1062, 630, 1145, 668, 0, 0, Text))
                        {
                            Click, 1199, 633 Left, 1
                        }
                        ;  mp garage

                        Text:="|<>*148$67.000000000001zs1k3kQ3zw3zy1s3kC1zz1zzUw1s70zzlw3kS1s3UQ1sw0sD1s1kC0SS0Q7Vs0s70DD0C3kw0Q3U7bU01sw0C1k3nk00ww070s1sz00SS03UQ0wTy0DS01kC0Q7zs7zU0s70S0zy3zs0Q3zz00z1yw0C1zz007UyD070zz001sT3k3UQ00w0wD1s1kC00S0S7US0s700D0D3k7UQ3U07UD1s3kC1k01zzUw0w70s00zzUS0S3UQ007zU707VkC0000000000000E"

                        if (ok:=FindText(X, Y, 1062, 621, 1144, 661, 0, 0, Text))
                        {
                            Click, 1199, 633 Left, 1
                        }

                        ; play ad

                        Text:="|<>*148$143.w1s3k3s3zz1zs3U7U00z07zts7k7UDk7zy7zs70D001y0DzvkDUD0TUDzwTzsC0S003w0TzzUTUw0zU0w0w1kQ0w00Ds0s3z0z1s3r01s1k3ks1s00Ts1k3y3i3k7C03k3U7Vk3k00tk3U7Q7Q7UCQ07U70D3U7U01nU70CwCMD0ww0D0C0070D007bUC0RsQsQ1ss0S0Q00C0S00CD0Q0vklks3Vk0w0s00Tzw00QC0s1rXXXk73k1s1k00zzs01sQ1k3b737US3U3k3U01zzk03kw3U7CC7D0w707U7003U7U070s70CSQCS1kD0D0C0070D00C1kC0QxkQs3zy0S0Q0sC0S00zzkQ0svUtkDzw0w0s1sQ0w01zzUs1lr0vUTzs1s1k3ks1s03zz1k3Xi1z0s1s3k3U7Vk3k0D0C3U77s3y3k3k7U7US3U7U0S0S70SDk7s7U3UD0Dzw70D00s0QDzwTUDkC07US0DzkC0S01k0sTzkT0DUQ0D0w0Dz0Q0w07U1szz8"

                        if (ok:=FindText(X, Y, 865, 510, 1020, 542, 0, 0, Text))
                        {
                            Click, 1034, 515 Left, 1
                        }

                        ; ad close (X)

                        Text:="|<>*125$22.XzzA7zsEDz00Ts20z0Q1s3s30Tk03zU0Tz03zy0Tzs1zz03zs07z00Ds30T0S0s3w10Ts03zk0TzVXzzC"

                        if (ok:=FindText(X, Y, 1217, 65, 1243, 98, 0, 0, Text))
                        {
                            Click, 1229, 72 Left, 1
                        }

                        ; old small window close
                        Text:="|<>*163$22.Xzz47zs0Dz00Ts20z0Q1s3s30Tk03zU0Tz03zy0Tzs1zz03zs07z00Ds30T0S0s3w10Ts03zk0TzUXzz6"

                        if (ok:=FindText(X, Y, 1216, 58, 1246, 90, 0, 0, Text))
                        {
                            Click, 1229, 72 Left, 1
                        }

                        ; new small window ad
                        Text:="|<>*102$21.zUDzk0TwDVz7z7lzwQTzlbaD8yHsDszVz7wDszVy3wDmTUwtsbzzATzllzwT7z7wDVzk0TzUDw"

                        if (ok:=FindText(X, Y, 903, 94, 936, 123, 0, 0, Text)) {
                            Click, 921, 106 Left, 1
                        }

                        ; resume ad
                        Text:="|<>*124$67.07w000000000Tzk00000000zzw00000000zzz00000000zkTk0000000TU7s0000000TU1y0000000DU0T07y0DVwDk0A0Dzk7nzbs000Dzw3zzvw000Dzz1zzzw0007kTUzkzy0003sDkTUTz0000M3sDk7zU00001w7s3zk00003y3s1zw0000zz1w0zy01U3zzUy0Tz00w3z7kT0DjU0T3w3sDU7rs0TVw1w7k3ty0TUy1y3s1wzkTkTVz1w0yDzzkDzzUy0T3zzk3zzkT0DUTzk1ztwDU7k3z00Dky7k3w"

                        if (ok:=FindText(X, Y, 505, 286, 587, 324, 0, 0, Text))
                        {
                            Sleep, 500
                            Click, 857, 448 Left, 1
                            Sleep, 500
                        }

                        ; check if car is refilled and exit the loop/refuelling
                        Text:="|<>*125$65.zy1s00T0S0Tzy3k01y0w0vzy7U03w0w3r0QD007w1s7C0sS00Cs1sSQ1kw00tk3kss3Vs01nk3nlk73k03XU7b3UC7U0D707S70QD00QC0DwC1sS00sS0DkTzkw01kQ0TUzz1s07Us0S1zs3k0C1s0w3U07U0Tzk1s700D01zzU3kC00S03zz07UQ00w070D0D0s01zyS0C0S1k03zww0Q0w3U07ztk0w1s4"

                        if (ok:=FindText(X, Y, 1034, 624, 1106, 655, 0, 0, Text))
                        {
                            Sleep, 2000
                            Send , {Escape}
                            Sleep, 2000
                            Send , {Escape}
                            Sleep, 2000
                            Goto, RandomSelect
                            Break
                        }
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
            IniRead, PlayAdafterhuntrace, %SettingsIni%, Main, PlayAdafterhuntrace
            If (PlayAdafterhuntrace == 1){
                If (watch_AD_if_1st_2nd_OR_3rd()){
                    ; click on (watch ad) button
                    Text:="|<>*124$144.0zk0000000000000000000003zw030M30A0zw3s10800A0Ts7zz070s70S1zwDy3UQ00y0zyDzz070w70y1zwTz3UQ00y0zzTzzU7Vw70z070Q73UQ00z0s7Tzzk3Vw70r070M33UQ00r0s7zbzk3VgC1r070M3XUQ01r0s7zVzs3ViC1n070M33UQ01n0s7zUzs3ViC1nU70M03UQ01XUs7zUDs3XaC1XU70M03zw01XUs7zU7s1n6C3XU70M03zw03XUs7zUDs1n7A3Vk70M03kQ03Vks7zUzs1n7A3Vk70M03UQ031ks7zXzs1r3Q7zk70M33UQ07zks7zbzs1r3Q7zs70M3XUQ07zks7Tzzk0y3w7zs70M33UQ07zss7TzzU0y3w70s70Q73UQ060ss7DzzU0y1sC0s70Tz3UQ0C0szz7zz00y1sC0Q70Dy3UQ0C0Qzy3zy00Q1kA0M303w10A0A0MTs0zs000000000000000000000U"
                    if (ok:=FindText(X, Y, 973, 518, 1132, 549, 0, 0, Text))
                    {
                        Sleep, 1000
                        Click, 962, 523 Left, 1
                        Sleep, 3000

                        If (Close_AD()){
                            Sleep, 1000

                            Loop, 30{
                                Text:="|<>*151$68.w0w7zsw0wzzz0D1zy7UDDzzs3kTzVs7Xzzy0w700D1s1sDkD1k01kw0S3y3kQ00SD07UzUw7003bU1sDwD1k00xs0S3r3kQ007w07Uxsw7zk1y01sDCD1zw0DU0S3nnkTz07s07UwQw7001z01sD7j1k00zk0S3kzkQ00DS07Uw7w7007XU1sD1z1k01sw0S3kDkQ00w707Uw3w700D1s1sD0T1zw7UC0S3k7kTzVs3k7Uw0w7zsw0Q1s6061zwC030A2"
                                if (ok:=FindText(X, Y, 1104, 634, 1189, 668, 0, 0, Text)){
                                    Break
                                }Else{
                                    Click, 1216, 647 Left, 1
                                    Sleep, 1000
                                }
                            }

                            ; AD Next button
                            Text:="|<>*151$68.w0w7zsw0wzzz0D1zy7UDDzzs3kTzVs7Xzzy0w700D1s1sDkD1k01kw0S3y3kQ00SD07UzUw7003bU1sDwD1k00xs0S3r3kQ007w07Uxsw7zk1y01sDCD1zw0DU0S3nnkTz07s07UwQw7001z01sD7j1k00zk0S3kzkQ00DS07Uw7w7007XU1sD1z1k01sw0S3kDkQ00w707Uw3w700D1s1sD0T1zw7UC0S3k7kTzVs3k7Uw0w7zsw0Q1s6061zwC030A2"
                            if (ok:=FindText(X:="wait", Y:=16, 1104, 634, 1189, 668, 0, 0, Text)){
                                Click, 1216, 647 Left, 1
                                Sleep, 2000
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
            Text:="|<>*119$69.zz01y03zk7zzzw0Dk0zz0zzzzk1y0Dzw7zz0S0Ts1k7Us0s1k3z0C0Q7070C0Qs3k3Us0s1k3b0S0Q7070C0ww3k00s0s1k73US007070C0sQ3k00zyw3k73US007zrzw1sS3k00zyzz0C1kS00707zk1kC3k00s0sC0TzsS0Q7071s3zz3k3Us0s70TzsS0Q7070w7U71k3Us0s3Uw0wC0w7070S703VzzUzzs1ks0Q7zs7zz0DD03kTy0zzU"
            if (ok:=FindText(X, Y, 1046, 638, 1123, 667, 0, 0, Text)) {
                isSkipped := True
                break
            }
        }
    }
    Return isSkipped
}

