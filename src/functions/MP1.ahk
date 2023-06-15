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
                Click, 977, 632 Left, 1
                Sleep, 1000
            }
        }

        If (isMpCarToPlayScreen){

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

StartMPRace(){
    ; Play Button

    Text:="|<>*123$71.zz0S003s1s0zzz0w007s1s1vzz1s00Tk3k3r0S3k00zU3kDC0S7U01rU7USQ0wD003j07Vss1sS00DC0D3lk3kw00SS0DD3U7Vs00sw0SS70D3k03ks0RsC0S7U07Vk0zkQ1sD00C3k0z0zzkS00Q7U1y1zz0w01s701s3zw1s03kD03k7003k07zy07UC007U0Tzw0D0Q00D00zzs0S0s00S01s1s0w1k00w03U3k1s3U01zzD03U3k7003zyS07U7UC007zws0D0D0E"
    if (ok:=FindText(X:="wait", Y:=10, 1058, 624, 1146, 657, 0, 0, Text)){
        Click, 1183, 634 Left, 1
    }Else{
        Gosub, script_start
    }
}

MpSkipCheck(){
    ; Demoted
    Text:="|<>*154$35.DzUS0wzzUw3lzz1sD7UD3kQD0S7VsS0wD7Uw1sSS1s3kww3k7Vvk7UD3z0D0S7z0S0wDz0w1sTC1s3kyS3k7VsS7UD3kQD0S7UwS0wD0wT7kS0szzUw1szy1s1w"

    if (ok:=FindText(X, Y, 609, 520, 659, 554, 0, 0, Text))
    {
        Send, {Escape}
    }
    ; club ms claim later
    Text:="|<>*148$74.w00S0zzXzsTyD00DkDzszy7zvk03w3zyDzVzyw00z01k3U0Q3z00Cs0Q0s070Tk07C070C01k7w01nU1k3U0Q1z00Qs0Q0s070Tk0D7070C01k7w03Vk1k3zkQ3z00sQ0Q0zw7zvk0C7U70C01zww070s1k3U0TyD01zy0Q0s073Xk0TzU70C01kww0Dzw1k3U0Q7D03U70Q0s071vk0s1k70C01kCzzC0S1k3zsQ3zzr03UQ0zy70S"

    if (ok:=FindText(X, Y, 452, 578, 544, 615, 0, 0, Text))
    {
        Send, {Escape}
    }

    ; tier unlocked
    Text:="|<>*110$82.1w0Q007k1kDk3szy3s00zU7Uz0TrzwDU07y0S3y1zzzky00Ts1sDs7zsDXs01zU7UzUzz0yDU07z0S3y3zw3sy00yw1sDwDzkDXs03nk7Uxlvz00DU0DD0S3r7jw00y00wy1sDSQzk03s07ls7Uxtnz00DU0S7US3njDw00y01sS1sDDszk03s07Vw7UwzXz0QDU0zzkS3lyDw3sy03zz1sD7szkDXs0Dzw7UwT3z0yDU0zzsS3ksDy7sy07k7VsD00zzz3zyS0S7Uw03rzwDzts1wS3k0DDzUzzbU7lsD00y"

    if (ok:=FindText(X, Y, 562, 536, 705, 597, 0, 0, Text))
    {
        Send, {Escape}
    }

    ; star up check it later
    Text:="|<>*149$211.Dz0Q0wDzs7z0S0w03VzzU0s00T0DzwzzVzwDzkC0S7zw7zsD0w01kzzk0Q00Dk7zyTzkzzbzw70D3zw7zy7UQ00sTzk0C007s3zyDzkTzrUC3U7Vs03UD3kS00Q0Q007007w03U7U0C0zU7Vk3kw03k7VsS00C0C003U03z01k3k070Tk3ks1sS01s1kwS00707001k01nU0s1s03UDs1sQ0wD00w0sSD003U3U00s00tk0Q0w01k7w00C0S7U0S00DD001k1k00Q00ww0C0S00s3y0070D3k0D007j000s0s00C00QS070D00Q1z003zzVzw7U03r000Q0Q00700C703U7zkC0zU01zzkzy3k01zk00C0C003U073U1k3zs70xk00zzsTz1s00zs00707001k07Vs0s1zw3zys00Q0wD00w00Ty003U3U00s03UQ0Q0w01zyQ00C0S7U0S00DbU01k1k00Q01kC0C0S00wyC0A70D3k0D0C7Vk00s0s00C01zzU70D00Q770D3U7Vs07U73kw00Q0Q00700zzk3U7U0C3nU7Vk3kw03k3VsD00C0C003U0Tzs1k3k071tk3ks1sS01s3kw3U0707001k0C0Q0s1s03USw3kQ0wD00Q1sS1s03U3U00s0D0D0Q0w01kDDzsC0S7zwDzsD0S01k1k00Tzb03UC0Tzks3rzs70D3zy3zw7U700s0s00DznU1k70DzsQ1szs3U71zy0zs3U3k0Q0Q007zvk0s3U7zwC0S"
    if (ok:=FindText(X, Y, 328, 617, 553, 653, 0, 0, Text)){
        Send, {Escape}
    }

    ; asphalt 9 loading screen stuck
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

}

; watch_AD_if_1st_2nd_OR_3rd
watch_AD_if_1st_2nd_OR_3rd(){
    canWatch:= false
    ; 1st
    Text:="|<>*162$38.zzzs00Tzzs003zzw000zzw000Dzw0007zw0001zw0000Tw00007y00001y00000z00000DU00003s00000y00000D000007k00001w00000T000007k03001s03U00y03s00DU3y003s3zU00y1zs00D1zw007tzz001zzzk00Tzzw007zzz001zzzU00zzzs00Dzzy003zzzU00zzzs00Dzzw007zzz001zzzk00Tzzw007zzz001zzzU00zzzs00Dzzy003zzzU00zzzs00Dzzw007zzz001zzzk00Tzzw007zzz001zzzU00zzzs00Dzzy003zzzU00zzzs00Dzzw007zzz001zzzk00Tzzw007zzz001zzzU00zzzs00Dzzy003zzzU00zzzs00Dzzw007zzz001zzzk00Tzzw007zzz001zzzU00zzzs00Dzzy003zzzU00zzzs00Dzzw007zzz001zzzk00Tzzw007zzz001zzzU00zzzs00Dzzy003zzzU00zzzs00Tzzy007zzzU03zzy"

    if (ok:=FindText(X, Y, 106, 82, 159, 178, 0, 0, Text)){
        canWatch:= true
    }
    ; 2nd
    Text:="|<>*163$51.zzzzzzzzzwDz3y00zz0zkDk00zs7y1w003y0zkTU00Tk3y3w003y0TUTUTUDk3w3w7y1y0DUT0zkTU1w7s7y3w0DUz0zUTU0s7sDw3w070z1zUTUUs7kDw7s431y1zUz0kMDkDs7s621y3z0z1k0DkTs7sD01w3z1y1s0TUTsDkD03w3y1y1w0TUzkDkTU3w7y1y3w0T0zkTUTk7s7s3w3y0z000TUTk7s007w7z0z001zUzs7k00zwDzVz00zzzzzzzzzzw"
    if (ok:=FindText(X, Y, 156, 86, 212, 125, 0, 0, Text)){
        canWatch:= true
    }
    ; 3rd
    Text:="|<>*164$50.zzzzzzzzzs07zs03zy00Dy007z001z000zk00Dk00Dw003w003z0y0z0z0TkTkDkTs7s7w3s7y3y1z0y1zUzUTkDUTkDsDw7sDw3y3z1y3z0z0zUT0zkTkDkDkDw7w003w3y1z001z1zUTk00zkTs7s00zs7y3y1kDy1zUzUS3zUTkDsDUTsDw3y3s7y3z0z0y1z0zkTkDkDkDk7w3w3w001z1z0z000zkTk7k00Ts7y1s00Tz3zUz00zzzzzzzzzzs"

    if (ok:=FindText(X, Y, 158, 90, 214, 124, 0, 0, Text)){
        canWatch:= true
    }

    if(canWatch == true){
        ; click on ad text
        Text:="|<>*126$37.0000000DU3zw07k1zz07w0zzk3y0S1s1r0D0S1vU7UD0xs3k7UQQ1s3kCC0w1sD7US0w73kD0S3Us7UD1kQ3k7VsD1s3kzzUw1sTzkS0wTzwD0SD0S7UD7073k7bU3VzzXk1szzlk0QTzk000000U"
        if (ok:=FindText(X, Y, 1094, 519, 1139, 548, 0, 0, Text)){
            Click, 962, 523 Left, 1
            Sleep, 1000
        }
    }

    Return canWatch
}
close_AD(){
    isAdClosed := false
    Loop, 120{
        ; ad next
        Text:="|<>*128$62.000000000030A3zlk37zls3VzwS1vzyS0sTz3UQTzbkC700wD0Q1w3Vk073U70TUsQ01tk1k7wC700CQ0Q1r3Vk03y070RssTw0TU1k7CC7zU7k0Q1lnVzs1w070QQsQ00TU1k73i700Ds0Q1kzVk03b070Q7sQ01tk1k71y700QC0Q1kDVk0D3k70Q1sTz3UQ1k70S7zls7UQ1k3VzwQ0s7000000000008"
        if (ok:=FindText(X, Y, 1006, 628, 1083, 661, 0, 0, Text)){
            Click, 1154, 639 Left, 1
            isAdClosed := true
            Break
        }Else{
            CheckGame()
            Sleep, 250
            WinClose, Microsoft Store
            Sleep, 250
            WinClose, Privacy - Vungle - Google Chrome
            Sleep, 250

            CoordMode, Pixel, Screen
            PixelSearch, FoundX, FoundY, 1218, 43, 1261, 54, 0xFFFFFF, 0, Fast RGB
            If (ErrorLevel = 0){
                Sleep, 250
                Click, 1228, 73 Left, 1
                Sleep, 250

            }
            CoordMode, Pixel, Screen
            PixelSearch, FoundX, FoundY, 1203, 40, 1249, 64, 0xE8E8E8, 0, Fast RGB
            If (ErrorLevel = 0)
            {
                Sleep, 250
                Click, 1228, 73 Left, 1
                Sleep, 250
            }
            CoordMode, Pixel, Screen
            PixelSearch, FoundX, FoundY, 1203, 43, 1257, 58, 0xF5F5F6, 0, Fast RGB
            If (ErrorLevel = 0)
            {
                Sleep, 250
                Click, 1228, 73 Left, 1
                Sleep, 250
            }
            ; ad with close text
            Text:="|<>*165$58.zzyTzzzzzzs1tzzzzzzz03bzzzzzzlzyTzzzzzzDztzzzzzztzzbzzzzzzjzyTUTkDUQzztsMyAwAnzzb7ttzntDzyQznbyTkzztrzCTtz3zzaTwwzbwDzyNznsy00zztbzDsvztzzbTwztbzbzyQznzaTz7ztvyTyQzS03bVXlXlly0STUTUTkC"
            if (ok:=FindText(X, Y, 1147, 39, 1264, 89, 0, 0, Text))
            {
                Sleep, 250
                Click, 1225, 61 Left, 1
                Sleep, 5000
            }
            ; close this ad with green button
            Text:="|<>*137$48.00001s0000001s7s00001sTy00001szy00001ssT00001s0D00001s0D00001s0D3y07ts0DDz0Dxs0SDzUTzs0yA7Uy7s1w03kw3s1s03ls1s3k0zls1s3UDzls1s7UTzls1s7US3ls1s3Uw3ls1s00w3kw3s00w7ky7s3UTzkzzs7kTvkTxs7k7nk7ls3UU"
            if (ok:=FindText(X, Y, 682, 433, 746, 474, 0, 0, Text))
            {
                Sleep, 250
                Click, 447, 572 Left, 1
                Sleep, 250
            }

            ; circle close
            Text:="|<>*133$22.Xzz47zs0Dz00Ts20z0Q1s3s30Tk03zU0Tz03zy0Tzs1zz03zs07z00Ds30T0S0s3w10Ts03zk0TzUXzz6"
            if (ok:=FindText(X, Y, 1208, 51, 1252, 101, 0, 0, Text)){
                Sleep, 250
                Click, 1228, 71 Left, 1
                Sleep, 250

            }

            ; march of empires
            Text:="|<>*161$22.Xzz47zs0Dz00Ts20z0Q1s3s30Tk03zU0Tz03zy0Tzs1zz03zs07z00Ds30T0S0s3w10Ts03zk8TzVnzzC"
            if (ok:=FindText(X, Y, 1213, 58, 1248, 91, 0, 0, Text)){
                Sleep, 250
                Click, 1229, 72 Left, 1
                Sleep, 250

            }

            ; resume ad
            Text:="|<>*123$77.03z00000000000zzk0000000003zzs000000000Tzzs000000001zzzs000000003z0zk00000000Ds0Tk00000000zU0TU00000001y00zU1zU003w7w00k0Tzs1yTyDs0001zzs3xzyTU0007zzk7zzyz0000DzzkDzzxy0000zUzUTwDzw0001y0z0zkDzs0000Q1y1z0Tzk000003w3w0TzU00000Ds7s0zz00000DzkDk1zy00007zzUTU3zw00M0Tzz0z07zw00y3zty1y0Dzs03y7w3w3w0Tjk07wTU7s7s0zTk0Tkz0DkDk1yTk1zVy0zUTU3wzs7y3y3z0z07szzzs7zzy1y0Dkzzzk7zzw3w0TUTzy07zvw7s0z0Tzs07zbsDk1y07y003w7kTU3y"
            if (ok:=FindText(X, Y, 478, 266, 592, 326, 0, 0, Text)){
                Sleep, 500
                Click, 857, 448 Left, 1
                Sleep, 500
            }

            Text:="|<>*177$23.XzzW3zy03zs03zU83y0s3s3s3UDs20zs03zs0Dzs0zzs3zzU3zy03zs03zU83y0s3s3s3UDs20zs03zs0Dzs8zzsk"
            if (ok:=FindText(X, Y, 1206, 60, 1245, 99, 0, 0, Text)){
                Sleep, 250
                Click, 1229, 72 Left, 1
                Sleep, 250
            }

            ; syncing to the server start
            Loop, 30{
                Text:="|<>*127$33.zzzzzwwz7k7bXsw0QwD73XbVssyAw777lbUsszwwX77zbaMszwwl761bb8ssAww77lbbUsyAwy77lbbkswQwz7U3bbsy0zzzzzzU"
                if (ok:=FindText(X, Y, 1221, 604, 1261, 631, 0, 0, Text)){
                    Sleep, 1000
                }else{
                    Sleep, 1000
                    Break
                }
            }
            Text:="|<>*127$33.zzzzzwwz7k7bXsw0QwD73XbVssyAw777lbUsszwwX77zbaMszwwl761bb8ssAww77lbbUsyAwy77lbbkswQwz7U3bbsy0zzzzzzU"
            if (ok:=FindText(X, Y, 1221, 604, 1261, 631, 0, 0, Text)){
                Gosub, script_start
            }
            ; syncing to the server end

            ; token color check to verify home screen to break loop
            Text:="|<>*72$29.zzrzzzy3zzzs3zzz01zzw01zzk00zy000zs0k0z03k0Q07k0E0Tk0E0nU1U37U3067070Tz0S1zy0w3zy1wA0S7sM0QDk000Tk001zU003z0007z000Ty000zw001y"
            if (ok:=FindText(X, Y, 787, 42, 823, 80, 0, 0, Text)){
                Break
            }

        }
    }
    Return isAdClosed
}

homeCheck(){
    Loop, 30{

        ; i check to break loop
        Text:="|<>*144$3.zz0zzzzzzzzU"
        if (ok:=FindText(X , Y, 1184, 184, 1223, 222, 0, 0, Text)){
            Sleep, 1000
            Return true
            Break
        }Else{

            Click, 1188, 649 Left, 1
            Sleep, 500
            ; star up check it later
            Text:="|<>*149$211.Dz0Q0wDzs7z0S0w03VzzU0s00T0DzwzzVzwDzkC0S7zw7zsD0w01kzzk0Q00Dk7zyTzkzzbzw70D3zw7zy7UQ00sTzk0C007s3zyDzkTzrUC3U7Vs03UD3kS00Q0Q007007w03U7U0C0zU7Vk3kw03k7VsS00C0C003U03z01k3k070Tk3ks1sS01s1kwS00707001k01nU0s1s03UDs1sQ0wD00w0sSD003U3U00s00tk0Q0w01k7w00C0S7U0S00DD001k1k00Q00ww0C0S00s3y0070D3k0D007j000s0s00C00QS070D00Q1z003zzVzw7U03r000Q0Q00700C703U7zkC0zU01zzkzy3k01zk00C0C003U073U1k3zs70xk00zzsTz1s00zs00707001k07Vs0s1zw3zys00Q0wD00w00Ty003U3U00s03UQ0Q0w01zyQ00C0S7U0S00DbU01k1k00Q01kC0C0S00wyC0A70D3k0D0C7Vk00s0s00C01zzU70D00Q770D3U7Vs07U73kw00Q0Q00700zzk3U7U0C3nU7Vk3kw03k3VsD00C0C003U0Tzs1k3k071tk3ks1sS01s3kw3U0707001k0C0Q0s1s03USw3kQ0wD00Q1sS1s03U3U00s0D0D0Q0w01kDDzsC0S7zwDzsD0S01k1k00Tzb03UC0Tzks3rzs70D3zy3zw7U700s0s00DznU1k70DzsQ1szs3U71zy0zs3U3k0Q0Q007zvk0s3U7zwC0S"
            if (ok:=FindText(X, Y, 328, 617, 553, 653, 0, 0, Text)){
                Send, {Escape}
            }
            CheckInternet()

            ; club ms claim later
            Text:="|<>*148$74.w00S0zzXzsTyD00DkDzszy7zvk03w3zyDzVzyw00z01k3U0Q3z00Cs0Q0s070Tk07C070C01k7w01nU1k3U0Q1z00Qs0Q0s070Tk0D7070C01k7w03Vk1k3zkQ3z00sQ0Q0zw7zvk0C7U70C01zww070s1k3U0TyD01zy0Q0s073Xk0TzU70C01kww0Dzw1k3U0Q7D03U70Q0s071vk0s1k70C01kCzzC0S1k3zsQ3zzr03UQ0zy70S"

            if (ok:=FindText(X, Y, 452, 578, 544, 615, 0, 0, Text)){
                Send, {Escape}
            }

            ; tier unlocked
            Text:="|<>*110$82.1w0Q007k1kDk3szy3s00zU7Uz0TrzwDU07y0S3y1zzzky00Ts1sDs7zsDXs01zU7UzUzz0yDU07z0S3y3zw3sy00yw1sDwDzkDXs03nk7Uxlvz00DU0DD0S3r7jw00y00wy1sDSQzk03s07ls7Uxtnz00DU0S7US3njDw00y01sS1sDDszk03s07Vw7UwzXz0QDU0zzkS3lyDw3sy03zz1sD7szkDXs0Dzw7UwT3z0yDU0zzsS3ksDy7sy07k7VsD00zzz3zyS0S7Uw03rzwDzts1wS3k0DDzUzzbU7lsD00y"
            if (ok:=FindText(X, Y, 562, 536, 705, 597, 0, 0, Text)){
                Send, {Escape}
            }

            ; Demoted
            Text:="|<>*154$35.DzUS0wzzUw3lzz1sD7UD3kQD0S7VsS0wD7Uw1sSS1s3kww3k7Vvk7UD3z0D0S7z0S0wDz0w1sTC1s3kyS3k7VsS7UD3kQD0S7UwS0wD0wT7kS0szzUw1szy1s1w"

            if (ok:=FindText(X, Y, 609, 520, 659, 554, 0, 0, Text)){
                Send, {Escape}
            }

            ; rewards next
            Text:="|<>*151$68.w0w7zsw0wzzz0D1zy7UDDzzs3kTzVs7Xzzy0w700D1s1sDkD1k01kw0S3y3kQ00SD07UzUw7003bU1sDwD1k00xs0S3r3kQ007w07Uxsw7zk1y01sDCD1zw0DU0S3nnkTz07s07UwQw7001z01sD7j1k00zk0S3kzkQ00DS07Uw7w7007XU1sD1z1k01sw0S3kDkQ00w707Uw3w700D1s1sD0T1zw7UC0S3k7kTzVs3k7Uw0w7zsw0Q1s6061zwC030A2"

            if (ok:=FindText(X, Y, 1106, 635, 1187, 666, 0, 0, Text)){
                Sleep, 250
                MouseMove, 1188, 649
                Click, 1188, 649 Left, 1
                Sleep, 1500
            }

            CheckGame()

            ; in activity
            Text:="|<>*131$60.3zkT01zVzkVzky00TVzkVzUw00TVzkkzVwDsDVzkkz1wDwDVzkkT3sTwDVzksT3sTwDVzksC7sTwDVzkwC7sTwDVzkw4DsTwDVzky4DsTwDVzky0TsTwDVzkz0TsTwDVzkz0zsTwDVzkzUzsTwDVzkzVzsTwDVzkzVzsTwDVzkzVzsTwDVzkzVzsTwDVzkzVzsTwDVzkzVzwDwDVzUzVzw7kDkT1zVzw00Tk01zVzy00zs03zVzzU1zy0DU"
            if (ok:=FindText(X, Y, 189, 231, 271, 283, 0, 0, Text)){
                Gosub, script_start
            }
        }
    }
    Return false
}