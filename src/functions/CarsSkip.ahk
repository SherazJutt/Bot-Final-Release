CarsSkip(){
    for index, car in carNames {
        IniRead, %car%_to, %SettingsIni%, CarsSkip, %car%_to
    }

    ; <============ D ============>

    ; lancer
    if (Lancer !== 0){
        Text:="|<>*134$93.w00y0Q1s7y1zwDy7U0Ds3kD3zsDzXzww01z0T1sTzVzwTzrU0Ds3sD7zwDz3zyw01z0TVsw3ls0S3rU0Sw3wD7USD03kSw03rUTlsw3ls0S3rU0SQ3yD7U0D03kSw03XkTtsw01zsS3rU0wS3rD7U0Dz3zyw07XkSxsw01zsTzrU0wC3nj7U0Dz3zww071sSTsw01s0Tz7U1zz3lz7USD03lsw0DzsSDsw3ls0S7bU1zz3kz7USD03kwzyS0wS7szzVzwS3rznk7XkT3zwDzXkSzyS0wS3sDz1zwS3zznk7XUD0zUDzVkDU"

        if (ok:=FindText(X, Y, 174, 160, 280, 189, 0, 0, Text))
        {
            Loop, %Lancer_to%
            {
                Sleep, 300
                Send, {PgDn}
            }
            Return True
        }
    }

    ; hellcat
    if (Hellcat !== 0){

        Text:="|<>*132$64.zw0Dk0zUC1vzw0z0DzVsDjzs7w1zz7UwzzUTs7zwS7XkS1zUS3lsyD1s7S1sD7Xkw7Uws7UwSS3kS3nkS01vsD1sDD1s07j0wDUsw7U0Tw3zy7VkS01zsDzkS7Vs07zUzy1sS7U0Tj3k07zsS3lwwD00zzVsD7Vsw03zz7UwS3nk0D0wTzlsDD01s3lzz7USw07U73zsS1zk0S0S3y0s3s"

        if (ok:=FindText(X, Y, 535, 155, 613, 195, 0, 0, Text))
        {
            Loop, %Hellcat_to%
            {
                Sleep, 300
                Send, {PgDn}
            }
            Return True
        }
    }

    ; peugeot sr1
    If (Peugeotsr1 !== 0){

        Text:="|<>*137$42.7w1zk0STz1zw0zzz1zy3zzzVzy3zw7VsS3zw7VsD3Dw01sD0Dw01sD0Dzs1sS0Dzy1zy0DTz1zy0D3zVzw0D0DVzs0DM7Vts0Dw7Vsw0Dw7Vsw0DzzVsS0DzzVsS0DTz1sD0D7w1kD0CU"

        if (ok:=FindText(X, Y, 175, 161, 233, 185, 0, 0, Text))
        {
            Loop, %Peugeotsr1_to%
            {
                Sleep, 300
                Send, {PgDn}
            }
            Return True
        }
    }

    ; lambo countach 25th
    If (Lamborghinicountach25th !== 0){

        Text:="|<>*134$60.7s3zwTznkCTy3zwTznkDzz3zwTznkDyT3zwDzXkDwD3k01s3kDwD3k01s3kDwD3k01s3kD0D3zs1s3kD0T3zw1s3zz0y3zw1s3zz1w3kS1s3zz7s00S1s3zzDk00S1s3kDTU1US1s3kDy03kS1s3kDw03kS1s3kDzz3xw1s3kDzz3zw1s3kDzz1zs1s3kDzz0Tk1s3kCU"

        if (ok:=FindText(X, Y, 315, 159, 386, 188, 0, 0, Text))
        {
            Loop, %Lamborghinicountach25th_to%
            {
                Sleep, 300
                Send, {PgDn}
            }
            Return True
        }
    }
    ; <============ C ============>

    ; SRT8

    If (Srt8 !== 0){

        Text:="|<>*135$60.7y1zsDzsDsDz1zyDzszyTzVzzDzszzTzVzz7zlyzw3lsD0S1sDw3lsD0S1sDw01sD0S1sDS01sD0S1sDTw1sD0S0zzTz1zz0S0zyDzVzz0S0zy3zlzy0S1yT07lzw0S1sDQ3lsw0S1sDw3lsy0S1sDQ3lsS0S1sDTzlsT0S1zzTzVsD0S0zzDzVsDUS0zy3y1s7US0DsU"

        if (ok:=FindText(X, Y, 343, 163, 410, 186, 0, 0, Text))
        {
            Loop, %Srt8_to%
            {
                Sleep, 300
                Send, {PgDn}
            }
            Return True
        }
    }

    ; Saleen S1
    If (Saleens1 !== 0 ){

        Text:="|<>*133$25.7w07jzUDzzkDzzwDzkS7zsD3Dw007y003zy01vzk0xzw0S7z0D0DU7c3k3z1s1zUw0zzy0Tzz0DTz07Xy03s"

        if (ok:=FindText(X, Y, 177, 163, 215, 185, 0, 0, Text))
        {
            Loop, %Saleens1_to%
            {
                Sleep, 300
                Send, {PgDn}
            }
            Return True
        }
    }

    ; ferrari monza sp1

    If (Ferrarimonzasp1 !== 0){

        Text:="|<>*132$41.7w1zs0Szy3zs3zzw7zsDzzwDzkzz1sS3lzy3kw7XDw01sD0Ts03kS0zzU7Uw1zzkD3k3rzkTzU7Vzkzz0D0DVzs0S0D3k00zkS7U01zUwD003zzsS007zzUw00DTz1s00SDs3U00y"

        if (ok:=FindText(X, Y, 274, 161, 325, 187, 0, 0, Text))
        {
            Loop, %Ferrarimonzasp1_to%
            {
                Sleep, 300
                Send, {PgDn}
            }
            Return True
        }

    }
    ; jaguar xe sv project
    If (Jaguarxesvproject !== 0){

        Text:="|<>*133$69.w1szy01z0w1vkT7zk0Ty7UDS3kzy07zsy3lsy7zU0zz3kSD7Uw00D1wS3kxw7U01s7XkS7j0w00D00S7UTk7U01w01sw3y0zw07z0D7UDk7zU0zy1sw3y0zw03zsD70Tk7z007z0ts7z0w0001w7j0xs7U00k7UxsDbUw00D0w7i1sw7U01s7UTkT7kzw07zw3y3kS7zk0zz0Tky3szy03zk1w7UD7zk0Dw0DUU"

        if (ok:=FindText(X, Y, 174, 161, 257, 186, 0, 0, Text))
        {
            Loop, %Jaguarxesvproject_to%
            {
                Sleep, 300
                Send, {PgDn}
            }
            Return True
        }
    }
    ; lambo miura

    If (Lamborghinimiura !== 0){

        Text:="|<>*134$78.z0T1kw3kzs0DUz0z3kw3lzy0DkzUz3kw3lzz0TkzUz3kw3lzz0TkzVz3kw3lsD0TszVz3kw3lsD0xsxlr3kw3lsD0xsxlr3kw3lsD0wsxnb3kw3lsD0wwwvb3kw3lzz1swwvb3kw3lzz1swwz73kw3lzy1sQwz73kw3lzw1sSwT73kw3lsw3zywS73kw3lsS3zyw073kw3lsS3zyw073kzzVsT3kDw073kTzVsD7UDw073kDz1sDbUDw071k7y0s7bU7U"

        if (ok:=FindText(X, Y, 171, 157, 268, 194, 0, 0, Text))
        {
            Loop, %Lamborghinimiura_to%
            {
                Sleep, 300
                Send, {PgDn}
            }
            Return True
        }
    }

    ; bugatti eb 110
    If (Bugattieb110 !== 0){

        Text:="|<>*135$56.zy7zU0w03zzVzw0z03zzsTzUTk1zzy7VwDw0Tz01sD3z07zk0S3knk1Dw07Uw0w03z01sD0D00zzkTzU3k0Dzw7zk0w03zz1zy0D00zzkS7k3k0Dw07Uw0w03z01sD0D00zk0S3k3k0Dw07Uw0w03zzVzz0D00zzsTzU3k0Dzy7zs0w03zzVzs0D00y"

        if (ok:=FindText(X, Y, 175, 160, 264, 188, 0, 0, Text))
        {
            Loop, %Bugattieb110_to%
            {
                Sleep, 300
                Send, {PgDn}
            }
            Return True
        }
    }

    ; <============ B ============>

    ; 911 gs coupe
    If (Porsche911gscoupe !== 0){

        Text:="|<>*136$46.00000000Dw7zsDs1zsTzVzsDzlzyDzkzz7ztzz7US1s7UwS1s7US1ls70S1s07U01s7k0S007UTy1szUS0zy7Xy1s1zwSDs7U1zlsDUS00DbUS1s30SS1s7US1ts7US1s7Xzw1s7zwDzk7UDzkTy0S0Ty0zk1s0zk00000002"

        if (ok:=FindText(X, Y, 234, 162, 285, 188, 0, 0, Text))
        {
            Loop, %Porsche911gscoupe_to%
            {
                Sleep, 250
                Send, {PgDn}
            }
            Return True
        }
    }

    ; nissan r390 gt1
    If (Nissanr390 !== 0){

        Text:="|<>*135$93.zw0Tk0zU3y0Dw7zzzs7zUTz1zw3zkzzzzVzy7zsDzkzz7zzzwD7kzzXzy7zszzw7XkS7UwS3ls7US7UwS3kw7XkSD0w3kw7VkS7UwS3ls70S7Uw03kw7XkSD003kw7U3y7UwS3ls00S7zw0zUzzXkSD7s3kzz07w7zwS3lszUS7zs0TkTzXkSD7w3kzy00S0zwS3lsDUS7XkC3k07XkSD0w3kwT3kS00wS3ls7US7VsS3k07XkSD0w3kwD1zy3zwTzkzz0S7UwDzkTz1zy7zs3kw7Uzw3zsDzUTy0S7US3y0Tw0Tk1zU3kU"

        if (ok:=FindText(X, Y, 174, 157, 297, 189, 0, 0, Text))
        {
            Loop, %Nissanr390_to%
            {
                Sleep, 300
                Send, {PgDn}
            }
            Return True
        }
    }

    ; enzo
    If (Ferrarienzo !==0){

        Text:="|<>*135$61.zy70S7zs7yTz3kD3zwDzjzVw7Vzy7zzzky3kzz7zzk0TVs0D3kTs0Dkw0DVs7w07wS07Uw3y03yD07kS1zz1zbU7kD0zzUxnk3k7UTzkSxs3k3kDzsDCw3s1s7w07by1s0w3y03lz1s0S1z01szVw0D0zU0wDkw07UzzsS7szzXzzzwD1wTzkzzzy7UyDzsTzTz3UD7zw3y8"

        if (ok:=FindText(X, Y, 175, 159, 249, 189, 0, 0, Text))
        {
            Loop, %Ferrarienzo_to%
            {
                Sleep, 300
                Send, {PgDn}
            }
            Return True
        }
    }

    ; essenza
    If (Lamborghiniessenza !== 0){

        Text:="|<>*140$28.3k0TUz07zbw0zzTk3txz0D3ow0wD3k3kwD003kw00T3k03sD00T0w03s3k0z0D07s0w0y03k3s0D0Dzkw0zz3k3zwD0Dzs"

        if (ok:=FindText(X, Y, 344, 157, 386, 192, 0, 0, Text))
        {
            Loop, %Lamborghiniessenza_to%
            {
                Sleep, 300
                Send, {PgDn}
            }
            Return True
        }
    }

    ; carrera
    If (Porschecarrera !== 0){

        Text:="|<>*135$28.7w3zxzwTzrztzzzzXzzkS0wD1s3kw3UD3k00wD003kwTUD3ly0wD7s3kw7UD3kS0wD1s3kw7UD3zy0w7zs3kTz0D0Tk0w8"

        if (ok:=FindText(X, Y, 297, 158, 337, 187, 0, 0, Text))
        {
            Loop, %Porschecarrera_to%
            {
                Sleep, 300
                Send, {PgDn}
            }
            Return True
        }
    }

    ; <============ A ============>

    ; vulkan

    If (Vulkan !== 0){

        Text:="|<>*140$161.07U7wTyDwC3U3UC0w3z3zb71k000D0TwTszwQ707Uw1s7z3yCD3U000T0kM61UswC0D1s7kA61UQS70000q1UkA30lwQ0S3kBUMC30syC0003g300M61Xss0yBUPUkQ61lwQ0006M700kA37tk1gP0n1UsA3Xws000AMDk1UM6CnU3Aa3631UM77Nk000MkDs30kARr06PA6C7z0kCCPU001VU3s61UMti0AqMAQDw1UQQr00033U0kA30lnw0MsksMQs30ssy0007z21UM61XXs0llVzklk61llw000Dy630kA773k1V33zlVkA3XVs000kAAC1UQCC7U306C1X3UM773k001UQTw30TsQ7060AQ3630kCC3U0030MTk60TUsA0A0Mk6A71UAQ70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000Tzzzzzzzzk00000000000000000zzzzzzzzzU00000000000000001zzzzzzzzz3k7bUwD00zk0y0S1s3zzzzzzzzy7UDD1sS03zk1y0w3k7zzzzzzzzwDUwS3kw0Dzk7w1w7UDzzzzzzzzsD1sw7Vs0TzkDs3sD0TzzzzzzzzkS3lsD3k1s7UTs7sS0zzzzzzzzzUw7XkS7U3kD1vkDkw1zzzzzzzzz1sS7UwD07US3rUTls3zzzzzzzzy1swD1sS0D007b0zXk7zzzzzzzzw3lsS3kw0S00DD1zbUDzzzzzzzzs7Xkw7Vs0w00wS3rD0TzzzzzzzzkD71sD3k1s01sw7jS0zzzzzzzzzUCS3kS7U3k03kwDDw1zzzzzzzzz0Sw7UwD07U07VsSTs3zzzzzzzzy0xsD1sS0D0wTzkwTk7zzzzzzzzw1vUS3kw0S1szzVszUDzzzzzzzzs1z0w7Vs0w3lzzXkz0Tzzzzzzzzk3y1zz3zszzXkD7Vy0zzzzzzzzzU7w3zy7zlzyD0SD1w1zzzzzzzzz07k3zsDzVzsS0wS1s3zzzzzzzzy0DU1z0Tz1zUw0sw3k7zzzzzzzzy"

        if (ok:=FindText(X, Y, 173, 131, 338, 193, 0, 0, Text))
        {
            Loop, %Vulkan_to%
            {
                Sleep, 300
                Send, {PgDn}
            }
            Return True
        }
    }

    ; senna gtr

    If (Sennagtr !== 0){

        Text:="|<>*134$44.7w7zwzw7zlzzDzlzyTznzyzzXzszzj1s3kD1vkS0w3kSw3UD0w7j003kD1vk00w3kSwTUD0zzjDs3kDznny0w3zww7UD0zyD1s3kD7XkS0w3lww7UD0wDDzs3kD3tzy0w3kSTz0D0w7lz03UD0y"

        if (ok:=FindText(X, Y, 268, 161, 323, 190, 0, 0, Text))
        {
            Loop, %Sennagtr_to%
            {
                Sleep, 300
                Send, {PgDn}
            }
            Return True
        }
    }

    ; zonda r

    If (Zondar !== 0){

        Text:="|<>*135$13.zwTzjzrzzkTsDw7y3z1zzzzxzwzwSDD7bVvkxsTw7y3s"

        if (ok:=FindText(X, Y, 267, 158, 293, 190, 0, 0, Text))
        {
            Loop, %Zondar_to%
            {
                Sleep, 300
                Send, {PgDn}
            }
            Return True
        }
    }
    ; <============ S ============>

    ; centenario

    If (Centenario !== 0){

        Text:="|<>*134$55.1w0zs3k7w1z0Tz1sDzUzUDzkw7zsTk7zsS7zwTs3UwD3kSDS1kC7Vs77j0s73kw3XbUQ3VsS1nnkC3kwD0tsw7zsS7UQwS3zwD3kCQD1zw7Vs7S7Uzw3kw3jzsQS1sS1rzwC7UwD0zzy73kS7Uzk73UwD3zzs3lkS7Uzzw1ss7XkTzQ0wQ3ls3y8"
        if (ok:=FindText(X, Y, 268, 159, 341, 190, 0, 0, Text))
        {
            Loop, %Centenario_to%
            {
                Sleep, 300
                Send, {PgDn}
            }
            Return True
        }
    }

    ; raesr

    If (RaesrTacheon !== 0){

        Text:="|<>*146$60.zk7UDwDsDyzs7UDsTwDykM7kA0MCC7kMCkA0MCC7kMCkA0M0C7kMAkA0Q0C7ksAMDkTkC7zsQMDs7wDyzkMMC00wDwnUMQA00CCQlkTwA0MCCAkkzwA0MCCCkkkAA0QCCCkskCDwTwC7kMk6Dw7sC3U"

        if (ok:=FindText(X, Y, 178, 136, 251, 161, 0, 0, Text))
        {
            Loop, %RaesrTacheon_to%
            {
                Sleep, 300
                Send, {PgDn}
            }
            Return True
        }
    }

    ; trion

    If (Trion !== 0){

        Text:="|<>*132$107.w3kzy7k7sTz0zUC0zVs7VzwDkDkzy7zUS7znsD3zsTUzVzwTzUwDzrsS7zUz1z3zkzzVszzjkwD01y3y7U1sD3lsDTlsS03y7wD03kS7XkSzXkw07QRsS07U0D7U1zbVs0Csvkw0D00SDU3rD3zkQtrVzsTw0wTw7jS7zUtrD3zkzy1sTzDCwDz1niS7zUzy3kTzSTsTy3XwwDy0Dy7UDywTkw077lsS001wD00xszVs0CDXkw001sS00zkz3k0QT7Vs0S3kwS1zVy7U0s0D3k0w7Vsw7j1wDzVk0S7zVzz3lzzS3sTz3U0wDzXzw7Vzyw3kzy701sTz3zsD3zts3VzwC03kzy1z0Q1z2"

        if (ok:=FindText(X, Y, 176, 161, 296, 189, 0, 0, Text))
        {
            Loop, %Trion_to%
            {
                Sleep, 300
                Send, {PgDn}
            }
            Return True
        }
    }

    ; Naran

    If (Naran !== 0){

        Text:="|<>*132$78.w3nk7XzUDzXzkw3ls7bzsDzXzww3lsD7zwDzXzww3lwD7zwDz3zyw3kwS7UwC03kSw3kyS7USC03kSw3kSS7USC03kSw3kSw7USC03kSzzkDw7UyDy3kSzzkDs7kwDz3zyzzk7s7zwDz3zwzzk7k7zsDy3zsw3k3k7zkC03zkw3k3k7U0C03lsw3k3k7U0C03lsw3k3k7U0C03kww3k3k7U0Dz3kww3k3k7U0DzXkSw3k3k7U0DzXkSw3k3k3U0DzXkDU"

        if (ok:=FindText(X, Y, 175, 159, 269, 194, 0, 0, Text))
        {
            Loop, %Naran_to%
            {
                Sleep, 300
                Send, {PgDn}
            }
            Return True
        }
    }

    Return False
}