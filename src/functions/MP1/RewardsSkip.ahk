LeagueUpNext(){
    Text:="|<>*143$65.s0sDzlk3nzzs1kTzXk7bzzs3Uzz3USDzzk71k07Uw0sDkC3U071k1kTUQ700D7U3UzUsC00CC071z1kQ00Ss0C3b3Us00Tk0Q7C71zs0T00sCCC3zs0y01kQSQ7zk1w03UsQsC007w071kxkQ00Cs0C3UvUs00xs0Q71z1k01lk0sC1y3U07Xk1kQ1w700C3k3Us3sC00w7U71k3kTzXk7UC3U7Uzz7UD0Q7071zyC0C0s8"
    if (ok:=FindText(X, Y, 1089, 633, 1163, 658, 0, 0, Text))
    {
        PressEscape(1)
    }
}

RewardsNext(){
    Text:="|<>*151$68.w0w7zsw0wzzz0D1zy7UDDzzs3kTzVs7Xzzy0w700D1s1sDkD1k01kw0S3y3kQ00SD07UzUw7003bU1sDwD1k00xs0S3r3kQ007w07Uxsw7zk1y01sDCD1zw0DU0S3nnkTz07s07UwQw7001z01sD7j1k00zk0S3kzkQ00DS07Uw7w7007XU1sD1z1k01sw0S3kDkQ00w707Uw3w700D1s1sD0T1zw7UC0S3k7kTzVs3k7Uw0w7zsw0Q1s6061zwC030A2"
    if (ok:=FindText(X, Y, 1106, 635, 1187, 666, 0, 0, Text)){
        PressEscape(1)
    }
}

ConfirmIfRaceIsCompleted(){
    Loop, 30{

        Sleep, 1500

        ; i check to break loop
        Text:="|<>*144$3.zz0zzzzzzzzU"
        if (ok:=FindText(X , Y, 1184, 184, 1223, 222, 0, 0, Text)){
            Sleep, 1000
            Return true
            Break
        }Else{

            CheckGame()
            CheckInternet()
            RewardsNext()
            LeagueUpNext()

            ; ads miss out button click
            Text:="|<>*157$116.S0D1U7w0Dk00Ds3UADzjU7ks7zUDz00DzUs3bzzw1wD3zw7zs07zsC0szzz0z3kw71sS01sD3UC0sDkDkwC1sQ3U0Q1ks3UC3y3wD3UC70s070QC0s3UvVr3ks01k001k73UC0sCMRkwC00Q000Q1ks3UC3b6QD3w07s0070QC0s3Utnb3kTw0zs01k73UC0sCAtkw3zU7z00Q1ks3UC3XwQD07w0Ds070QC0s3Usz73k07U0S01k73UC0sC7Vkw00s03k0Q1ks3UC3VsQD3UC70w070QC0s3UsC73ks3VkD01k73UC0sC01kwC1sQ3k0Q3ks7UC3U0QD3zw7zs07zwDzk3Us073kTz0zy00zy1zw0sC01ks3z07y007z0Dw0C2"
            if (ok:=FindText(X, Y, 982, 629, 1110, 659, 0, 0, Text))
            {
                Click, 1176, 645 Left, 1
            }

            ; star up check it later
            Text:="|<>*149$211.Dz0Q0wDzs7z0S0w03VzzU0s00T0DzwzzVzwDzkC0S7zw7zsD0w01kzzk0Q00Dk7zyTzkzzbzw70D3zw7zy7UQ00sTzk0C007s3zyDzkTzrUC3U7Vs03UD3kS00Q0Q007007w03U7U0C0zU7Vk3kw03k7VsS00C0C003U03z01k3k070Tk3ks1sS01s1kwS00707001k01nU0s1s03UDs1sQ0wD00w0sSD003U3U00s00tk0Q0w01k7w00C0S7U0S00DD001k1k00Q00ww0C0S00s3y0070D3k0D007j000s0s00C00QS070D00Q1z003zzVzw7U03r000Q0Q00700C703U7zkC0zU01zzkzy3k01zk00C0C003U073U1k3zs70xk00zzsTz1s00zs00707001k07Vs0s1zw3zys00Q0wD00w00Ty003U3U00s03UQ0Q0w01zyQ00C0S7U0S00DbU01k1k00Q01kC0C0S00wyC0A70D3k0D0C7Vk00s0s00C01zzU70D00Q770D3U7Vs07U73kw00Q0Q00700zzk3U7U0C3nU7Vk3kw03k3VsD00C0C003U0Tzs1k3k071tk3ks1sS01s3kw3U0707001k0C0Q0s1s03USw3kQ0wD00Q1sS1s03U3U00s0D0D0Q0w01kDDzsC0S7zwDzsD0S01k1k00Tzb03UC0Tzks3rzs70D3zy3zw7U700s0s00DznU1k70DzsQ1szs3U71zy0zs3U3k0Q0Q007zvk0s3U7zwC0S"
            if (ok:=FindText(X, Y, 328, 617, 553, 653, 0, 0, Text)){
                Send, {Escape}
            }

            ; club ms claim later
            Text:="|<>*148$74.w00S0zzXzsTyD00DkDzszy7zvk03w3zyDzVzyw00z01k3U0Q3z00Cs0Q0s070Tk07C070C01k7w01nU1k3U0Q1z00Qs0Q0s070Tk0D7070C01k7w03Vk1k3zkQ3z00sQ0Q0zw7zvk0C7U70C01zww070s1k3U0TyD01zy0Q0s073Xk0TzU70C01kww0Dzw1k3U0Q7D03U70Q0s071vk0s1k70C01kCzzC0S1k3zsQ3zzr03UQ0zy70S"
            if (ok:=FindText(X, Y, 452, 578, 544, 615, 0, 0, Text)){
                Send, {Escape}
            }

            ; tier unlocked
            Text:="|<>*92$81.U00TVzk00zU0Ts001s7w003s00D000D0zU00T000s001s7w003s003000D0zU00T0008001s7w007s001zUTz0zUTzz0zUDw3zs7w3zzs7y0zUTz0zUTzz0zk7w3zs7w3zzs7y0zUTz0zUTzz0zk7w3zs7w3zzs7y0zUTz0zUTzz0zk7w3zs7w00Ts7y0zUTz0zU01z0zkDw3zs7w00Ds001zUTz0zU01z000Dw3zs7w00Ds003zUTz0zU03z000zw3zs7w3zzs00DzUTz0zUTzz0Q1zw3zs7w3zzs7kDzUTz0zUTzz0y0zw3zs7w3zzs7s7zUTz0zUTzz0z0Tw3zs7w3zzs7s3zUTz0zU00z0zUDw3zs7w003s7w1zUTz0zU00T0zkDw3zs7w003s7y0zUTz0zU00T0zs7w3zs7w007s7z0U"
            if (ok:=FindText(X, Y, 384, 148, 483, 201, 0, 0, Text)){
                Send, {Escape}
            }

            ; Demoted
            Text:="|<>*154$35.DzUS0wzzUw3lzz1sD7UD3kQD0S7VsS0wD7Uw1sSS1s3kww3k7Vvk7UD3z0D0S7z0S0wDz0w1sTC1s3kyS3k7VsS7UD3kQD0S7UwS0wD0wT7kS0szzUw1szy1s1w"

            if (ok:=FindText(X, Y, 609, 520, 659, 554, 0, 0, Text)){
                Send, {Escape}
            }

            ; in activity
            Text:="|<>*131$60.3zkT01zVzkVzky00TVzkVzUw00TVzkkzVwDsDVzkkz1wDwDVzkkT3sTwDVzksT3sTwDVzksC7sTwDVzkwC7sTwDVzkw4DsTwDVzky4DsTwDVzky0TsTwDVzkz0TsTwDVzkz0zsTwDVzkzUzsTwDVzkzVzsTwDVzkzVzsTwDVzkzVzsTwDVzkzVzsTwDVzkzVzsTwDVzkzVzwDwDVzUzVzw7kDkT1zVzw00Tk01zVzy00zs03zVzzU1zy0DU"
            if (ok:=FindText(X, Y, 189, 231, 271, 283, 0, 0, Text)){
                Gosub, script_start
            }
        }
    }
    Return false
}