LeagueDetection(){

    ; (i) icon to confirm mp screen
    Text:="|<>*144$3.zz0zzzzzzzzU"
    if (ok:=FindText(X , Y, 1184, 184, 1223, 222, 0, 0, Text)){
        isMpScreen := False

        Loop, 30{
            ; leaderboard last chracters check to confirm if leaderboard button is available
            Text:="|<>*155$33.zw0Ty7zs7zwzzUzzrUy7USw3kw1zUC7UDw1kw1zUC7UDw1kw1zUS7UDw3kw1zzw7UDzz0w1zzk7UDwC0w1zVs7UDwD0w1zUw7UDw7Uw1rUS7zyw3kzzb0C7zsU"
            if (ok:=FindText(X , Y, 494, 623, 566, 655, 0, 0, Text)) {
                Sleep, 1000
                isMpScreen := True
                Break
            }Else{
                Click, 977, 632 Left, 1
                Sleep, 1000
            }
        }
        If (!isMpScreen){
            Gosub, script_start
        }
    }

    ; league detection main
    currLeague := {}
    LeagueColors := [{id:1, label: "bronze", color: "0xD88560", clickX: 805, clickY: 142},{id:2, label: "silver", color: "0x96B2D4", clickX: 879, clickY: 135},{id:3, label: "gold", color: "0xF1CB30", clickX: 953, clickY: 141},{id:4, label: "platinum", color: "0x9365F8", clickX: 1023, clickY: 142},{id:5, label: "legend", color: "0xF5E2A4", clickX: 1095, clickY: 138}]
    BackUpLeagueColors := ["0xD88560", "0x96B2D4", "0xF1CB30", "0x9365F8", "0xF5E2A4"]

    for index, car in LeagueColors{
        CoordMode, Pixel, Screen
        PixelSearch, FoundX, FoundY, 395, 343, 417, 368, car.color, 0, Fast RGB
        If (ErrorLevel = 0) {
            ; ResetColors
            for index, color in BackUpLeagueColors{
                LeagueColors[index].color := color
                ; MsgBox, "=> " . %color% . "=> " . %oldColor%
            }

            currLeague := car
            car.color := ""
            ; MsgBox, % car.color
            ; MsgBox, % newindex.color

            PosX:=currLeague.clickX
            PosY:=currLeague.clickY

            Click, 927, 634 Left, 1

            ; car selection screen
            Text:="|<>*133$247.w0Tzw7zs07zzzk1zs01yDzy00Tw0Tk00wDz07zXzss03zw1zw00zzzU0Dw00y7zz00Ds03s00S7y00zkzw800zy0zy00DzzU03y00T3zzU07s00w00D3y00DsTy000Dz0Tz003zzk01z00DVzzk03s00C007Vy003w7z07w7z07zVz1zzkTkTVzzkzzsTzw7w7z3zkz1z1y1zU7z3zV3zkzkzzsTwDkzzsTzwDzy7z3zVzsTVzkz0zk3zVzkVzsTsTzwDy7sTzwDzy7zz3zVzkzwDkzsTUDs1zkzsMTwDwDzy7z3wDzy7zz3zzVzkzsTy7sTwDk7w0zsTsQDy7y7zz3zzy7zz3zzVzzkzsTwDz3wDy7s1y0TzzwC7z3z3zzVzzz3zzVzzkzzsTzzy7zVy7z3w0z0Dzzy73zVzVzzkTzzVzzkzzsTzwDzzz3zkz3zVy4DU7zzy3kzkzkzzs0zzkzzsTzwDzy7zzzVzsTVzkz23k3zzz3sTsTkTzy01zs03wDzy00z3zzzkzwDkzsTVVs1zzzVwDw00DzzU0Dw01y7zz00TVzzzsTy7sTwDkkQ0zzzkz3y00Dzzw03y00z3zzU0DkzzzwDz3wDy7sQC0TzzkTVz00Dzzzs0z3zzVzzkzzsTzzy7zVy7z3wD30DzzsTkzU0DzzzzkTVzzkzzsTzwDzzz3zkz3zVy7VU7zzw00Tky7zzzzwDkzzsTzwDzy7zzzVzsTVzkz3sE3zVy007sT3zzyTy7sTzwDzy7zz3zVzkzwDkzsTVw01zky003wDkzzy7z3wDzy7zz3zzVzkzsTy7sTwDkz00zsT001y7sTzz3zVy7zz3zzVzzkzsTwDz3wDy7sTU0TwDVzkT3w7zzVzkz3zzVzzkzzsTwDy7zVy7z3wDs07w7UzwDVz3zzkTkTVzzkzzsTzw7w7z3zkz1z1y7y0003kzy7kzUzzw00Dk03s00w00y003zVzsTU00z3z0U03sTz3sTsTzy00Ds01w00S00TU03zkzwDs00zVzkM03wDzkwDw7zzU0Dw00y00D00Ds03zsTy7y00zkzsD07yDzsSDz3zzw0Ty00TU07U07z07zwDz3zk1zszyA"
            if (ok:=FindText(X:="wait", Y:=10, 100, 109, 368, 155, 0, 0, Text)){
                Sleep, 2000
                Click, %PosX%, %PosY% Left, 1
                Sleep, 1000

                Click, 370, 331 Left, 1
                Sleep, 2000
                Return True
            }

            Break
        }
    }

    Return False

}

TiersCheck(){
    ; silver
    CoordMode, Pixel, Screen
    PixelSearch, FoundX, FoundY, 1024, 619, 1042, 635, 0x96B2D4, 0, Fast RGB
    If (ErrorLevel = 0)
    {
        Sleep, 350
        Send, {Escape}
        Sleep, 2000
        Click, 807, 141 Left, 1
        Sleep, 1000
        Click, 363, 323 Left, 1
        Sleep, 3000
        Return
    }
    ; Gold
    CoordMode, Pixel, Screen
    PixelSearch, FoundX, FoundY, 1042, 617, 1062, 637, 0xF1CB30, 0, Fast RGB
    If (ErrorLevel = 0)
    {
        Sleep, 350
        Send, {Escape}
        Sleep, 2000
        Click, 882, 143 Left, 1
        Sleep, 1000
        Click, 363, 323 Left, 1
        Sleep, 3000
        Return
    }
    ; Platinum
    CoordMode, Pixel, Screen
    PixelSearch, FoundX, FoundY, 992, 618, 1006, 635, 0x9365F8, 0, Fast RGB
    If (ErrorLevel = 0)
    {
        Sleep, 350
        Send, {Escape}
        Sleep, 2000
        Click, 953, 141 Left, 1
        Sleep, 1000
        Click, 363, 323 Left, 1
        Sleep, 3000
        Return
    }
    ; Legend
    CoordMode, Pixel, Screen
    PixelSearch, FoundX, FoundY, 1018, 619, 1034, 635, 0xF0DDA1, 0, Fast RGB
    If (ErrorLevel = 0)
    {
        Sleep, 350
        Send, {Escape}
        Sleep, 2000
        Click, 1025, 144 Left, 1
        Sleep, 1000
        Click, 363, 323 Left, 1
        Sleep, 3000
        Return
    }
}

isRefueling(){
    ; check if car have no fuel
    Text:="|<>*147$65.7zU70D1kDzkzzUS0w3UTzlzzUw1s70zzrkD1s7UC1k7j0C3kS0Q3U7y0Q7Vs0s70Dw0sD3k1kC0Ts00SD03UQ0zk00ww070s1vw01ts0C1k3rzU3rU0Q3U77zs7zU0s70S3zsDzU1kDzw0DkTj03UTzk07UyD070zz007VwD0C1k0D0D3kS0Q3U0S0S7US0s700w0wD0S1kC01s3kS0w3UQ01zzUw0w70s03zy1s1sC1k01zs1k1sQ3U0E"
    if (ok:=FindText(X, Y, 1049, 612, 1157, 668, 0, 0, Text)){
        Return True
    }

}

OwnsThisCar(){
    ; get blueprint
    Text:="|<>*148$68.zzU3US073zzzzw1s7k1kzzzzzUS1w0QDzzw1w7UTU707kD0D1s7s1k0w3k3kS1z0Q0D0w0w7UTk703kD0D1s7y1k0w3k3kS1vUQ0D0w0w7USw703kD0D1s7bVk0w3k3kS1tsQ0D0zzw7USD703kDzy1s7Xlk0w3zz0S1sSQ0D0zzU7US7b03kD1s1s7Uxk0w3kS0S1s7w0D0w3k7US1z03kD0w1s7UDk0w3k7US1s3w0D0w1s7US0T03kD0D1s7U7k0w3k3kS1s0w0D0w0S3US0D03k8"
    if (ok:=FindText(X, Y, 1135, 609, 1222, 648, 0, 0, Text)){
        Sleep, 1000
        Return False
    }Else{
        ; get KEY
        Text:="|<>*151$99.T00Ds3zzzVz007wDzw03y0zzzw7w00zVzzU0zU7zzzUzU0DsDzw07w0zzzw3w01z1zzU1z07zzzUTk0TkDzw0Tk0zU001y03y1zzU7w07w000Ds0TUDzw0zU0zU000z07w1zzUDs07w0007w0z0Dzw3y00zU000TUDs1zzUTU07w0003w1y0Dzw7w00zU000TkTk1zzVz007w0001y3w0DzwTk00zU000DszU1zzXy007w0000z7s0DzwzU00zU0007wz00zzjs007zzw00Tjk07zxz000zzzk03zy00zzzw007zzy00DzU07zzzU00zzzk01zw00yzzy007zzy007z007rzzs00zU0000zs00yzwz007w00003y007rz3w00zU0000Tk00yzkTk07w00003y007ry1y00zU0000Dk000zUDs07w00001y0007w0zU0zU0000Dk000zU3w07w00001y0007w0Tk0zU0000Dk00yzU1z07w00001y007zw07s0zU0000Dk00zzU0zU7w00001y007zw03y0zk0000Dk00zzU0Dk7zzzU01y007zw01z0zzzw00Dk00zzU07w7zzzU01y007vs00TUTzzw00DU00zT001w3zzz001w007o"
        if (ok:=FindText(X, Y, 1089, 606, 1203, 657, 0, 0, Text)){
            Sleep, 1000
            Return False
        }
    }

    Return True
}

SelectMPCarToPlay(){

    ; (i) icon to confirm mp screen
    Text:="|<>*144$3.zz0zzzzzzzzU"
    if (ok:=FindText(X:="wait" , Y:=10, 1184, 184, 1223, 222, 0, 0, Text)){
        isMpCarToPlayScreen := False

        Loop, 30{
            ; leaderboard last chracters check to confirm if leaderboard button is available
            Text:="|<>*155$33.zw0Ty7zs7zwzzUzzrUy7USw3kw1zUC7UDw1kw1zUC7UDw1kw1zUS7UDw3kw1zzw7UDzz0w1zzk7UDwC0w1zVs7UDwD0w1zUw7UDw7Uw1rUS7zyw3kzzb0C7zsU"
            if (ok:=FindText(X , Y, 494, 623, 566, 655, 0, 0, Text)) {
                Sleep, 1000
                isMpCarToPlayScreen := True
                Break
            }Else{
                Click, 967, 632 Left, 1
                Sleep, 1000
            }
        }

        If (isMpCarToPlayScreen){

            ; mp play button to goto car selection screen
            Click, 927, 634 Left, 1

            ; car selection screen
            Text:="|<>*133$247.w0Tzw7zs07zzzk1zs01yDzy00Tw0Tk00wDz07zXzss03zw1zw00zzzU0Dw00y7zz00Ds03s00S7y00zkzw800zy0zy00DzzU03y00T3zzU07s00w00D3y00DsTy000Dz0Tz003zzk01z00DVzzk03s00C007Vy003w7z07w7z07zVz1zzkTkTVzzkzzsTzw7w7z3zkz1z1y1zU7z3zV3zkzkzzsTwDkzzsTzwDzy7z3zVzsTVzkz0zk3zVzkVzsTsTzwDy7sTzwDzy7zz3zVzkzwDkzsTUDs1zkzsMTwDwDzy7z3wDzy7zz3zzVzkzsTy7sTwDk7w0zsTsQDy7y7zz3zzy7zz3zzVzzkzsTwDz3wDy7s1y0TzzwC7z3z3zzVzzz3zzVzzkzzsTzzy7zVy7z3w0z0Dzzy73zVzVzzkTzzVzzkzzsTzwDzzz3zkz3zVy4DU7zzy3kzkzkzzs0zzkzzsTzwDzy7zzzVzsTVzkz23k3zzz3sTsTkTzy01zs03wDzy00z3zzzkzwDkzsTVVs1zzzVwDw00DzzU0Dw01y7zz00TVzzzsTy7sTwDkkQ0zzzkz3y00Dzzw03y00z3zzU0DkzzzwDz3wDy7sQC0TzzkTVz00Dzzzs0z3zzVzzkzzsTzzy7zVy7z3wD30DzzsTkzU0DzzzzkTVzzkzzsTzwDzzz3zkz3zVy7VU7zzw00Tky7zzzzwDkzzsTzwDzy7zzzVzsTVzkz3sE3zVy007sT3zzyTy7sTzwDzy7zz3zVzkzwDkzsTVw01zky003wDkzzy7z3wDzy7zz3zzVzkzsTy7sTwDkz00zsT001y7sTzz3zVy7zz3zzVzzkzsTwDz3wDy7sTU0TwDVzkT3w7zzVzkz3zzVzzkzzsTwDy7zVy7z3wDs07w7UzwDVz3zzkTkTVzzkzzsTzw7w7z3zkz1z1y7y0003kzy7kzUzzw00Dk03s00w00y003zVzsTU00z3z0U03sTz3sTsTzy00Ds01w00S00TU03zkzwDs00zVzkM03wDzkwDw7zzU0Dw00y00D00Ds03zsTy7y00zkzsD07yDzsSDz3zzw0Ty00TU07U07z07zwDz3zk1zszyA"
            if (ok:=FindText(X:="wait", Y:=10, 100, 109, 368, 155, 0, 0, Text)){
                Sleep, 2000
                loop 2{
                    Sleep, 350
                    Send, {enter}
                }
                Return True
            }
        }Else{
            Gosub, script_start
        }

    }Else{
        Gosub, script_start
    }
}

SearchingForPlayers(){
    Loop, 60{
        Text:="|<>*118$37.zzzzzzy7tws1z3wyQ0TVyDCD7Uz3b7XmDVnXltbkNlswntAswQswmQSCSSNCD70DC77X03b3XlXlnllsnwtss0tyQyQ0Tzzzzzy"

        if (ok:=FindText(X, Y, 712, 559, 756, 579, 0, 0, Text)){
            Sleep, 1000
        }else{
            Break
        }
    }
    Text:="|<>*118$37.zzzzzzy7tws1z3wyQ0TVyDCD7Uz3b7XmDVnXltbkNlswntAswQswmQSCSSNCD70DC77X03b3XlXlnllsnwtss0tyQyQ0Tzzzzzy"
    if (ok:=FindText(X, Y, 712, 559, 756, 579, 0, 0, Text)){
        Gosub, script_start
    }
}

MpSkipCheck(){

    ; connection error retry
    Text:="|<>*127$59.01zzU7z00y00Ts03y00Q00TU03w00M00z003s00EzVw7y7kzkVzVsTwDVzV3z3kzsT3z27y7Vzky7y4DwD3zVwDw8TsS7z3sTsEzkwDy7kzkVz3sTwDVzV3w7kzsT3w200DVzky00A00z3zVw00s07y7z3s03kwDwDy7ky7VwDsTwDVwD3sTkzsT3wC7sTVzky7sQDkz3zVwDsMTkz3y3sTkkzVy00DkzkVz1y00TVzV3z3y01z3z1"

    if (ok:=FindText(X, Y, 724, 201, 812, 244, 0, 0, Text))
    {
        Gosub, script_start
    }

    ; club ms claim later
    Text:="|<>*148$74.w00S0zzXzsTyD00DkDzszy7zvk03w3zyDzVzyw00z01k3U0Q3z00Cs0Q0s070Tk07C070C01k7w01nU1k3U0Q1z00Qs0Q0s070Tk0D7070C01k7w03Vk1k3zkQ3z00sQ0Q0zw7zvk0C7U70C01zww070s1k3U0TyD01zy0Q0s073Xk0TzU70C01kww0Dzw1k3U0Q7D03U70Q0s071vk0s1k70C01kCzzC0S1k3zsQ3zzr03UQ0zy70S"

    if (ok:=FindText(X, Y, 452, 578, 544, 615, 0, 0, Text))
    {
        Send, {Escape}
    }

    ; tier unlocked
    Text:="|<>*92$81.U00TVzk00zU0Ts001s7w003s00D000D0zU00T000s001s7w003s003000D0zU00T0008001s7w007s001zUTz0zUTzz0zUDw3zs7w3zzs7y0zUTz0zUTzz0zk7w3zs7w3zzs7y0zUTz0zUTzz0zk7w3zs7w3zzs7y0zUTz0zUTzz0zk7w3zs7w00Ts7y0zUTz0zU01z0zkDw3zs7w00Ds001zUTz0zU01z000Dw3zs7w00Ds003zUTz0zU03z000zw3zs7w3zzs00DzUTz0zUTzz0Q1zw3zs7w3zzs7kDzUTz0zUTzz0y0zw3zs7w3zzs7s7zUTz0zUTzz0z0Tw3zs7w3zzs7s3zUTz0zU00z0zUDw3zs7w003s7w1zUTz0zU00T0zkDw3zs7w003s7y0zUTz0zU00T0zs7w3zs7w007s7z0U"

    if (ok:=FindText(X, Y, 384, 148, 483, 201, 0, 0, Text))
    {
        Send, {Escape}
    }

    ; Demoted
    Text:="|<>*154$35.DzUS0wzzUw3lzz1sD7UD3kQD0S7VsS0wD7Uw1sSS1s3kww3k7Vvk7UD3z0D0S7z0S0wDz0w1sTC1s3kyS3k7VsS7UD3kQD0S7UwS0wD0wT7kS0szzUw1szy1s1w"

    if (ok:=FindText(X, Y, 609, 520, 659, 554, 0, 0, Text))
    {
        Send, {Escape}
    }

    ; star up check it later
    Text:="|<>*149$211.Dz0Q0wDzs7z0S0w03VzzU0s00T0DzwzzVzwDzkC0S7zw7zsD0w01kzzk0Q00Dk7zyTzkzzbzw70D3zw7zy7UQ00sTzk0C007s3zyDzkTzrUC3U7Vs03UD3kS00Q0Q007007w03U7U0C0zU7Vk3kw03k7VsS00C0C003U03z01k3k070Tk3ks1sS01s1kwS00707001k01nU0s1s03UDs1sQ0wD00w0sSD003U3U00s00tk0Q0w01k7w00C0S7U0S00DD001k1k00Q00ww0C0S00s3y0070D3k0D007j000s0s00C00QS070D00Q1z003zzVzw7U03r000Q0Q00700C703U7zkC0zU01zzkzy3k01zk00C0C003U073U1k3zs70xk00zzsTz1s00zs00707001k07Vs0s1zw3zys00Q0wD00w00Ty003U3U00s03UQ0Q0w01zyQ00C0S7U0S00DbU01k1k00Q01kC0C0S00wyC0A70D3k0D0C7Vk00s0s00C01zzU70D00Q770D3U7Vs07U73kw00Q0Q00700zzk3U7U0C3nU7Vk3kw03k3VsD00C0C003U0Tzs1k3k071tk3ks1sS01s3kw3U0707001k0C0Q0s1s03USw3kQ0wD00Q1sS1s03U3U00s0D0D0Q0w01kDDzsC0S7zwDzsD0S01k1k00Tzb03UC0Tzks3rzs70D3zy3zw7U700s0s00DznU1k70DzsQ1szs3U71zy0zs3U3k0Q0Q007zvk0s3U7zwC0S"
    if (ok:=FindText(X, Y, 328, 617, 553, 653, 0, 0, Text)){
        Send, {Escape}
    }

    ; asphalt 9 loading screen stuck start
    Loop, 30{
        Text:="|<>*53$36.zzzzzzy00001w00001k00001k00001U7zzzzUDzzzzUDzzzzUDzzzzU7zwvzk0000Dk00007s00003w00003zzzzk3zzzzw1zzzzw1zzzzw1zzzzs3U00003U00007U0000DU0001zzzzzzzU"
        if (ok:=FindText(X, Y, 745, 429, 795, 468, 0, 0, Text)){
            Sleep, 1000
        }Else{
            Break
        }
    }

    Text:="|<>*53$36.zzzzzzy00001w00001k00001k00001U7zzzzUDzzzzUDzzzzUDzzzzU7zwvzk0000Dk00007s00003w00003zzzzk3zzzzw1zzzzw1zzzzw1zzzzs3U00003U00007U0000DU0001zzzzzzzU"
    if (ok:=FindText(X, Y, 745, 429, 795, 468, 0, 0, Text))
    {
        Gosub, script_start
    }
    ; asphalt 9 loading screen stuck end

}