; this will check if the selected card is the hunt card to enter hunt
HuntCard() {
    ; jaguar xe sv
    Text := "|<>*124$60.0007zzz00T0003zzw0070003zzs0030007zzk001zkDzzzk7y1zkTzzzkTz1zkTzzzkTz0zkTzzzkTz0zkTzzzkTz0zkTzzzkTz0zkTzzzkTz0zkTzzzkTz0zkTzzzkTz1zkTzzzkDy1zkTzzzs003zkTzzzw003zkTzzzw007zkTzzzw003zkTzzzs003zkTzzzkDy1zkTzzzkTz1zkTzzzkTz1zkTzzzkTz0zkTzzzkTz0zkTzzzkTz0zkTzzzkTz0zkTzzzkTz0zkTzzzkTz1zkTzzzkDy1zkTzzzk001zkTzzzs003zkTzzzw007zkTzzzy00Dzszzzzzw3zU"
    if (ok := FindText(&X, &Y, 253, 267, 324, 311, 0, 0, Text)) {
        return true
    } Else {
        return false
    }
}

EnterEventsTab() {

    isEventsLoaded := False

    Click("466, 645, Left, 1")
    Sleep(1000)
    Click("466, 645, Left, 1")
    ; check enter text showm in bottom of the first selected card to ensure entered in the events tab
    Text := "|<>*131$66.Ts001zkzkDUzwS1nztzszwzwS1nztzszys0T1kC1k0sCs0T1kC1k0s7s0TVkC1k0s7s0TVkC1k0s7w0RlkC1s0s7zsQlkC1zksDzsQtkC1zkzys0QRkC1k0zws0QRkC1k0zss0QDkC1k0sws0QDkC1k0sQs0Q7kC1k0sSw0Q7kC1s0sCzwQ3kC1zssDzwQ1kC1zss7U"
    if (ok := FindText(&X := "wait", &Y := 5, 131, 644, 199, 665, 0, 0, Text)) {
        isEventsLoaded := true
    } else {
        ; captured claim to check if there is event claim screen
        Text := "|<>*141$147.zkTsD0zlkQ3zVy01y301kCC1zz3z1s7z630TwTs0zss0S1lsDsMM0D0kMss0Q73U73b03sCD1z3X03w633701UkQ0kQs0P1lsTsQM0NUkMQk0A63U63b07MCBXz3X03A631i01UkQ0k0s0n1lgPsMTkNUkMDU0A63U60706QCBaTz3y6C630w01UkQ0k0s1lVlanzkM0kkkM700A63U6070CACAyTC307y630s01UkQ0k0s1zllXXskM1zskM700A63U63b0DyCAQT730C7630s01UkQ0kQs3UllV3sMM1UMks700A73U77b0Q6CA0T3XzQ37z0s01UTs0Tszv0tlU3kATnU8zU300A1y01y3zM3AA0Q"
        if (ok := FindText(X := "wait", Y := 6, 550, 412, 708, 436, 0, 0, Text)) {
            Sleep(1000)
            Click('778, 372, Left, 1')
            Sleep(1000)
            Loop 30 {
                Text := "|<>*131$66.Ts001zkzkDUzwS1nztzszwzwS1nztzszys0T1kC1k0sCs0T1kC1k0s7s0TVkC1k0s7s0TVkC1k0s7w0RlkC1s0s7zsQlkC1zksDzsQtkC1zkzys0QRkC1k0zws0QRkC1k0zss0QDkC1k0sws0QDkC1k0sQs0Q7kC1k0sSw0Q7kC1s0sCzwQ3kC1zssDzwQ1kC1zss7U"
                if (ok := FindText(&X, &Y, 131, 644, 199, 665, 0, 0, Text)) {
                    isEventsLoaded := true
                    break
                } Else {
                    Send("PgDn")
                    Sleep(300)
                }
            }
        } Else {
            isEventsLoaded := False
        }
    }
    return isEventsLoaded
}

EnterHuntTab() {

    isFound := False

    Loop 30 {
        if HuntCard() {
            Loop 2 {
                Sleep(1000)
                Send "{Enter}"
            }

            isFound := true
            break
        } Else {
            Send("PgDn")
            Sleep(1800)
        }
    }

    return isFound
}

isRaceScreen() {

    isRaceScreen := False
    ; check the race text inside the race button to ensure the hunt race screen is active
    Text := "|<>*119$69.zz01y03zk7zzzw0Dk0zz0zzzzk1y0Dzw7zz0S0Ts1k7Us0s1k3z0C0Q7070C0Qs3k3Us0s1k3b0S0Q7070C0ww3k00s0s1k73US007070C0sQ3k00zyw3k73US007zrzw1sS3k00zyzz0C1kS00707zk1kC3k00s0sC0TzsS0Q7071s3zz3k3Us0s70TzsS0Q7070w7U71k3Us0s3Uw0wC0w7070S703VzzUzzs1ks0Q7zs7zz0DD03kTy0zzU"
    if (ok := FindText(X := "wait", Y := 10, 1046, 638, 1123, 667, 0, 0, Text)) {
        isRaceScreen := True
    }

    Return isRaceScreen
}

TicketCheck() {

    resObj := { tickets: 0, doRestart: true, canPlay: false }

    Sleep(1000)
    Click("1162, 135, Left, 1")

    ; this checks the refill text / heading in the bopup ribbon
    Text := "|<>*133$302.003zs007s007kTsDzzkzzzzs000w3zs03zkDz0T000Q000Tk07k00Dy001y001w7y3zzsDzzzy000D0zs00Dw1zk7k0070007s00Q001zU00TU00T1zUzzy3zzzzU003kDw001z0Ts3w001k001w003000Ts007s007kTsDzzUzzzzs000w3z000Dk7w0z000Q000S000kTs3y3zzy3zzw7y3zzsDzzzy000D0zU003w1z0Tk007000700047zUzUzzzUzzz1zUzzy3zzzzzU3zkDs0w0T0TUDw0zzzk1zk0k11zsDsDzzsDzzkTsDzzUzzzzzw1zw3y0zk7k7k7z0Tzzy1zw1zUETy3y3zzy3zzw7y3zzsDzzzzz0Tz0zUTw1w1s1zk7zzzUTz0zs07zUzUzzzUzzz1zUzzy3zzzzzk7zkDs7z0T0S0zw1zzzs7zkDy01zsDsDzzsDzzkTsDzzUzzzzzw1zw3y1zk7k70Tz0Tzzy1zw3zUETy3y3zzy3zzw7y3zzsDzzzzz0Tz0zUTw1w1k7zk7zzzUTz0zzw7zUzUzzzUzzz1zUzzy3zzzzzk7zkDs7zUz0M3zw1zzzs7zk7zz1zsDsDzzsDzzkTsDzzUzzzzzw1zw3y1zzzk41zz0Tzzy1zw0zzkTy3y3zzy3zzw7y3zzsDzzzzz0Tz0zUTzzw00zzk00TzUTz00Dw7zUzU01zUzzz1zUzzy3zzzzzk7zkDs7zzz00Dzw007zs7zk00T1zkDs00Ts00TkTsDzzUzzzzzw1zw3y1zzzk03zz001zy1zy001k007y007y007w7y3zzsDzzzzz0Tz0zUTzzw00Tzk00TzUTzk00A001zU01zU01z1zUzzy3zzzzzk7zkDs7zzz003zw007zs7zy001000zsDzzs00TkTsDzzUzzzzzw1zw3y1zzzk00zz001zy1zzw00E00zy3zzy3zzw7y3zzsDzzzzz0Tz0zUTzzw007zk7zzzUTzzw007sDzUzzzUzzz1zUzzy3zzzzzk7zkDs7zzz060zw1zzzs7zzzw01y3zsDzzsDzzkTsDzzUzzzzzw1zw3y1zk7k3UDz0Tzzy1zzzzU0TkTy3zzy3zzw7y3zzsDzzzzz0Tz0zUTw1w1w1zk7zzzUTz0zw07w3zUzzzUzzz1zUzzy3zzzzzk7zkDs7z0T0TUTw1zzzs7zkDz01z0zsDzzsDzzkTsDzzUzzzzzw1zw3y1zk7k7s3z0Tzzy1zw3zk0Ts7y3zzy3zzw7y3zzsDzzzzz0Tz0zUTw1w1z0Tk7zzzUTz0Ts07z1zUzzzUzzz1zUzzy3zzzzzk7zkDs3y0T0Tk7w1zzzs7zk7w01zkTsDzzsDzzkTsDzzUzzzzzw1zw3y000Dk7y0z000Ty1zw0000Tw3y001y3zzw7y001s007zzz0Tz0zk003w1zk7k007zUTzU0047zUzU00TUzzz1zU00S001zzzk7zkDw001z0Tw1w001zs7zs0011zs7s007sDzzkTs007U00Tzzw1zw3zU00zk7zUD000Ty1zz000kTz1y001y3zzw7y001s007zzz0Tz0zw00Tw1zw3k007zUTzw00yDzsTk00zlzzzXzk00z003zzzsDzsTzy1zzVzzky003zwDzzw3zU"
    if (ok := FindText(X := "wait", Y := 10, 430, 169, 755, 224, 0, 0, Text)) {
        ; checks if the tickets already full
        Text := "|<>*153$172.3y3y7U0D3zyDzzz00zw0DwTwDU0D0DsDsS00wDzszzzw01zU0Tkzky00w0zUzVs03kzzXzzzk03w00z1z3s03k3y1y7Vzz3zyDzzz3w7kz1w7wDVzz27k7sSDzwDzszzzwTsT7y7kDky7zw8T4T3szzkzzXzzzlzVsTsT0z3sTzkVwFwDXzz3zyDzzz7y7VzVw1wDVzz27l7ky7zwDzszzzwTsS7y7k7ky7zw8S6D3szzkzzXzzzlzVsTsT0D3sTzklsswDVzz3zyDzzz7y7VzVw8wDVzz33XXly03wDzszzzwTsS7y7kVky01wACCC7s0DkzzXzzzlzVsTsT333s07kkswMTU0z3zyDzzz7y7VzVwAADU0TX37lVy7zwDzszzzwTsS7y7ksEy7zyCAT67szzkzzXzzzlzVsTsT3V3sTzsslwMzXzz3zyDzzz7y7VzVwD0DVzzbX7lXyDzwDzszzzwTsS7y7ky0y7zzy0TUDszzkzzXzzzlzVsTsT3s3sTzzs3y0zXzz3zyDzzz7y7VzVwDkDVzz3kDs3y7zwDzszzzwTkT3w7kz0y7zwD0zUTs07k07U0Tzk03w00z3y3s03kw3z1zU0D00S00zz00Ds03wDsDU0D3kTw7y00w01s03zw03zk0zlzky00w8"
        if (ok := FindText(&X, &Y, 362, 403, 549, 440, 0, 0, Text)) {
            resObj := { tickets: 'full', doRestart: false, canPlay: true }
        } else {
            ; checks if the tickets is 0
            Text := "|<>*119$28.zzzzzz00TzU00Tw000zU001w0003k00060Ty0M3zw1UTzs61zzUM7zy1UTzs61zzUM7zy1UTzs61zzUM7zy1UTzs61zzUM7zy1UTzs61zzUM7zy1UTzs61zzUM7zy1UTzs61zzUM7zy1UTzs61zzUM7zy1UTzs61zzUM3zw1U7zk70000Q0003s000Tk003zU00Tzk07zzzzzs"
            if (ok := FindText(X, Y, 625, 310, 676, 370, 0, 0, Text)) {
                if (settings.AutoRefillTickets) {
                    ; this will check if refill is available to refill
                    Text := "|<>*123$81.zy0zy7zlkQ0707zs7zkzyC3U0s0zzUzw7zVkQ0707UQ700s0C3U0s0w3Us0701kQ0707UQ700s0C3U0s0w3Us0701kQ0707UQ700s0C3U0s0w3Us0701kQ0707Uw7zUzwC3U0s0zzUzw7zVkQ0707zs700zwC3U0s0wS0s0701kQ0707Vk700s0C3U0s0wC0s0701kQ0707Us700s0C3U0s0w70s0701kQ0707Uw700s0C3k0w0w3Uzy701kTzbzzUS7zks0C3zwzzU"
                    if (ok := FindText(X, Y, 470, 495, 576, 530, 0, 0, Text)) {
                        ; this will click on refill button to refill the tickets
                        Click("594, 497, Left, 1")
                        Sleep(1000)
                        resObj.canPlay := true
                    }
                }
            }

            ; 1
            Text := "|<>*113$17.zzzzkDy0Ds0T00s01U030060UA70MS0nw1zs3zk7zUDz0Ty0zw1zs3zk7zUDz0Ty0zw1zs3zk7zUDz0Ty0zw1zs3zk7zUDz0Ty0zw1zs3zk7zUDz0Ty0zw1zs7zzy"
            if (ok := FindText(X, Y, 627, 308, 671, 369, 0, 0, Text)) {
                if (settings.EventPassHolder) {
                    resObj := { tickets: 1, canPlay: true }
                } Else if (settings.AutoRefillTickets) {
                    ; this will check if refill is available to refill
                    Text := "|<>*123$81.zy0zy7zlkQ0707zs7zkzyC3U0s0zzUzw7zVkQ0707UQ700s0C3U0s0w3Us0701kQ0707UQ700s0C3U0s0w3Us0701kQ0707UQ700s0C3U0s0w3Us0701kQ0707Uw7zUzwC3U0s0zzUzw7zVkQ0707zs700zwC3U0s0wS0s0701kQ0707Vk700s0C3U0s0wC0s0701kQ0707Us700s0C3U0s0w70s0701kQ0707Uw700s0C3k0w0w3Uzy701kTzbzzUS7zks0C3zwzzU"
                    if (ok := FindText(X, Y, 470, 495, 576, 530, 0, 0, Text)) {
                        ; this will click on refill button to refill the tickets
                        Click("594, 497, Left, 1")
                        Sleep(1000)
                        resObj := { tickets: 1, doRestart: false, canPlay: true }
                    }
                }
            }
        }

        resObj.doRestart := false
    }

    Sleep(1000)

    ; close tickets popup
    Click("1152, 188, Left, 1")

    return resObj
}

SelectCarToPlayHunt() {

    Sleep(2000)

    ; click on race button
    Click("1177, 643 Left, 1")

    Sleep(3000)

    ; this will check the (Car Selection) to verify the car selection screen
    Text := "|<>*134$247.w0Tzw7zs07zzzk1zs01yDzy00Tw0Tk00wDz07zXzss03zw1zw00zzzU0Dw00y7zz00Ds03s00S7y00zkzw800zy0zy00DzzU03y00T3zzU07s00w00D3y00DsTy000Dz0Tz003zzk01z00DVzzk03s00C007Vy003w7z07w7z07zVz1zzkTkTVzzkzzsTzw7w7z3zkz3z1y1zU7z3zV3zkzkzzsTwDkzzsTzwDzy7z3zVzsTVzkz0zk3zVzkVzsTsTzwDy7sTzwDzy7zz3zVzkzwDkzsTUDs1zkzsMTwDwDzy7z3wDzy7zz3zzVzkzsTy7sTwDk7w0zsTsQDy7y7zz3zzy7zz3zzVzzkzsTwDz3wDy7s1y0TzzwC7z3z3zzVzzz3zzVzzkzzsTzzy7zVy7z3w0z0Dzzy73zVzVzzkTzzVzzkzzsTzwDzzz3zkz3zVy4DU7zzy3kzkzkzzs0zzkzzsTzwDzy7zzzVzsTVzkz23k3zzz3sTsTkTzy01zs03wDzy00z3zzzkzwDkzsTVVs1zzzVwDw00DzzU0Dw01y7zz00TVzzzsTy7sTwDksQ0zzzkz3y00Dzzw03y00z3zzU0DkzzzwDz3wDy7sQC0TzzkTVz00Dzzzs0z3zzVzzkzzsTzzy7zVy7z3wD30DzzsTkzU0DzzzzkTVzzkzzsTzwDzzz3zkz3zVy7VU7zzw00Tky7zzzzwDkzzsTzwDzy7zzzVzsTVzkz3sE3zVy007sT3zzyTy7sTzwDzy7zz3zVzkzwDkzsTVw01zky003wDkzzy7z3wDzy7zz3zzVzkzsTy7sTwDkz00zsT001y7sTzz3zVy7zz3zzVzzkzsTwDz3wDy7sTU0TwDVzkT3w7zzVzkz3zzVzzkzzsTwDy7zVy7z3wDs07w7UzwDVz3zzkTkTVzzkzzsTzw7w7z3zkz1z1y7y0003kzy7kzUzzw00Dk03s00w00y003zVzsTU00z3z0U03sTz3sTsTzy00Ds01w00S00TU03zkzwDs00zVzkM03wDzkwDw7zzU0Dw00y00D00Ds03zsTy7y00zkzsD07yDzsSDz3zzw0Ty00TU07U07z07zwDz3zk1zszyA"
    if (ok := FindText(X := "wait", Y := 10, 102, 114, 367, 153, 0, 0, Text)) {

        loop 8 {

            Sleep(1000)

            ; move mosue to scroll
            Click("880, 293, 0")

            ; scroll back to select 1st car
            Loop 200 {
                Click("WheelUp, 1")
                Sleep(15)
            }

            ; click on first car
            Click("325, 375 Left, 1")

            ; check upgrade text to verify selected car screen
            Text := "|<>*148$145.s1kTz01z07zU0DU1zs0zz0DsQ0sDzs3zs7zw07k1zz0TzUTzC0Q7zy3zy3zz07s0zzkDzkTzr0C3kD1sD1s7U3y0S1w700T1vU71s3Vs3kw1s1r0D0S3U0D0Rk3Uw1kw1sS0w1vU7U71k070Cs1kS0sS0wD0S0xs3k3Us03U7Q0sD0QD0A7UD0QQ1s1kQ01k0C0Q7UC7U03k7UCC0w0sC00w070C3k73k01s3kD7US0Q700TU3U71s3Vs00w1k73kD0C3zs7z1k3Uw3kwTsTzs3Us7U71zw1zws1kTzsSDwDzs3kQ3k3Uzy0DzQ0sDzsD3y7zs1sD1s1kQ000Ti0Q7zk7UD3kw0s7Uw0sC0001z0C3k03k7VsS0TzkS0Q70000zU71s01s3kw7UTzsD0C3U0C0Tk3Uw00w1sS3kDzy7U71k070Ds1kS00S0wD0s7073k7Us03k7y1sD00DUw7US7U3Vs7kQ01s7jzw7U03zy3k73k1szzkDzkTznzw3k00zy1s3lk0wTzk7zsDzkTs1k007w0w0ss0CDzk3zw1zV"
            if (ok := FindText(X := "wait", Y := 10, 103, 617, 274, 663, 0, 0, Text)) {


                Sleep(1000)

                ; random select car function
                selectedCarIndex := Random(1, settings.hunt.maxcars)
                selectedCar := settings.hunt.cars[selectedCarIndex]

                Loop selectedCar {
                    Send("PgDn")
                    Sleep(250)
                }

                Sleep(1000)

                If (CarLockedOrRefueling()) {
                    if (A_Index = 2) {
                        ; selecting any available car to play with
                        loop 30 {
                            Send("PgDn")

                            Sleep (1000)
                            If (!CarLockedOrRefueling()) {
                                MsgBox('breaking')
                                ; breaks out of current loop
                                break
                            }
                        }
                        ; breaks out of main loop
                        break
                    } else {
                        Sleep(1000)
                        PressEscape(1)
                        Sleep(3000)
                    }
                } else {
                    break
                }

            }
        }

    }
}