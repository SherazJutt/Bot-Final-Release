load_game() {

    Text := "|<>*135$55.71k60s3bz7VszsS3nznkwzyT3tzlsSzzjnxztwTT7rtyw0zzz3vzzTwTzjVzzzDyDzrUxzzjz7zvsyzzrk7lxzzSvvk3kwzzDRtztsSDzDUwzswD1y7USzwE"
    if (ok := FindText(&X := "wait", &Y := 30, 141, 644, 222, 678, 0, 0, Text)) {

        PressEscape(1)

        Text := "|<>*125$218.z000A0Tw0T060003zzzU1zzs0Tzk1zw0S000DU00303y07k1U000zzy003zy07zw0Ty07U007s000s0zU3w0M000Dzy000zz01zz07zU1k001y000S0Dk1z060003zy000Tzk0Dzk1zk0Q000TU007k1s0zk10001zz0007zs03zs0Ds0D0007k001w0Q0Ts0k000TzU001zy00zy03y03k001w0DzzU20Dy0Dw07zzk000Tz00DzU0z00w0Tzz07zzs007zU3zU3zzw0007zU03zs0DU0C0Dzzk1zzz003zs0zs0zzy01znzs00zy01k03U3zzw0Tzzk01zy0Dw0TzzU1zzzw007z00Q01s0zzy07zzy00zz07z07zzk0zzzz081zk0600S07zzU007zU0Dzk1zk1zzw0S01zU60Tw00007U00Ds003zw07zw0Tw0Tzz07U0Tk1U7z00001k003y000zz03zz07z07zzU3s07w0w1zU0000w001zU00DzU0zzU3zU3zzs0w01y0D0Ds0000D000Tk003zs07zs0zs0zzy0D00zU3k3y00003k007w001zw01zy0Dy0DzzU3k0Dk000zU0000w001z07zzy00DzU3zU3zzs0zk3w000Ds0U00C0Dzzk1zzz003zs0zs1zzy07w0y0003w0M107U3zzw0zzzU00Tw0Tw0TzzU000T0000z060k1s0zzy07zzk107z07z07zzs0007k0007k1UQ0S0DzzU003s0k0zk1zk1zzz0001s0001w0Q707U007s000w0S0Dw0Tw0Tzzk000S0Dw0T0Dzk3k001y000C0DU1z07y0Dzzy000703z07U3zs0w000TU00707w0Tk3zU3zzzk003k1zk1s0zy0D0007k001U1z03s0zs0zzzz001s0zy0S0DzU3k003w000E0zs0y0Dy0Dzzzw03w0DzU3U3zs0s000zU"

        if (ok := FindText(&X, &Y, 520, 229, 757, 276, 0, 0, Text)) {
            show_tooltip("Exit game popup")

        }

        show_tooltip("Game loaded")
        return true
    } else {
        show_tooltip("Game not loaded")
        return false
    }
}
