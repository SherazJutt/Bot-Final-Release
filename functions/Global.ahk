PressEscape(count) {
    if count > 1 {
        Loop count {
            Sleep(500)
            Send "{Escape}"
            Sleep(500)
        }
    } else {
        Send "{Escape}"
    }
}

isGameRunning() {
    If WinExist("Asphalt 9: Legends") {
        WinActivate("Asphalt 9: Legends")
        WinRestore("Asphalt 9: Legends")
        WinMove(0, 0, 1280, 720, "Asphalt 9: Legends")
        return true
    }
}

RewardsNext() {
    Text := "|<>*151$68.w0w7zsw0wzzz0D1zy7UDDzzs3kTzVs7Xzzy0w700D1s1sDkD1k01kw0S3y3kQ00SD07UzUw7003bU1sDwD1k00xs0S3r3kQ007w07Uxsw7zk1y01sDCD1zw0DU0S3nnkTz07s07UwQw7001z01sD7j1k00zk0S3kzkQ00DS07Uw7w7007XU1sD1z1k01sw0S3kDkQ00w707Uw3w700D1s1sD0T1zw7UC0S3k7kTzVs3k7Uw0w7zsw0Q1s6061zwC030A2"
    if (ok := FindText(&X, &Y, 1106, 635, 1187, 666, 0, 0, Text)) {
        PressEscape(1)
    }
}

CarLockedOrRefueling() {

    isRefuelingOrLocked := False

    ; get Key or bp (bp icon check)
    Text := "|<>*150$45.007zzzzs00zzzzz0070zzzs00k1zzz00607zzs3wk0Tzz7z601zzzzUk0007y060000vU0k0007Q060000vU0k0007A060000tk0k0007C0607s0tk0k1zU76060Ty0ss0k3zk77060zy0ss0k7zs77060zz0sM0k3zk73U60Ty0sQ0k1zU73U607s0sA0k00071k60000sC0k00071k60000s60k00070s60000s70k00070s7zzU0s30zzy070Q7zzs0s3UzzzU70Q7zzy0s3Uzzzzz0A7zzzzs1k000000C0000001zz000007zk00000z0000006000004"
    if (ok := FindText(&X, &Y, 910, 605, 973, 664, 0, 0, Text)) {
        isRefuelingOrLocked := True
    }
    ; skip text (car is refueling)
    Text := "|<>*144$65.7zU70D1kDzkzzUC0w3UTzlzzUQ1s70zzrkD0s7UC1k7j0C1kS0Q3U7S0Q3Vs0s70Dw0s73k1kC0Ts00CD03UQ0zk00Qw070s1vw00ts0C1k3rzU1rU0Q3U77zk3zU0s70S3zs7zU1kDzw0DkDj03UTzk07USD070zz007UwD0C1k0D0D1kS0Q3U0S0S3US0s700w0w70S1kC01s3kC0w3UQ01zzUQ0w70s03zy0s1sC1k01zs1k1sQ3U0E"

    if (ok := FindText(&X, &Y, 1065, 625, 1140, 657, 0, 0, Text)) {
        isRefuelingOrLocked := True
    }

    Return isRefuelingOrLocked
}