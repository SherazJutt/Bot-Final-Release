#Requires AutoHotkey v2.0

If (settings.PlayAdafterhuntrace == 1) {
    If (watch_AD_if_1st_2nd_OR_3rd()) {

        ; click on (watch ad) button
        Text := "|!=*125$143.w1s3k3s3zz1zs3U7000y0Dzls3k7UDk7zy7zsD0C001w0TznkDkD0TUDzwTzsS0Q007w0zzrUTUS0zU0w0w3kw0s00Ds1s7b0z0s1r01s1k3Vs1k00Rk3k7j1y1k7i03k3U73k3U01vU7UDS3C7UCQ07U70C7U7003rUD0SwCQD0Qw0D0C0QD0C00770S0xsQsS1ss0S0Q00S0Q00CC0w1tktks3Vk0w0s00w0s00wS1s3nVnVk73k1s1k01zzk01kw3k7bb3XUC3U3k3U03zzU03Us7UDDC7D0w707U7007zz0071kD0SSQCS1kD0D0C00D0C00S3kS0wwsQs3zy0S0Q00S0Q00zzUw1stkNkDzw0w0s1kw0s01zz1s3lr0vUTzs1s1k3Vs1k07zz3k7Xi1r0s1s3k3U73k3U0D0S7UD7w3y1k3k7U70S7U700Q0QD0SDs3w7U3UD0DzwD0C01s0sTzsDU7kD07US0DzkS0Q03k1szzkT0DUQ0D0w0Dz0w0s0701lzy8"
        if (ok := FindText(&X, &Y, 984, 516, 1141, 553, 0, 0, Text)) {
            Sleep(1000)
            Click("962, 523 Left, 1")
            Sleep(3000)

            If (Close_AD()) {
                Sleep(1000)

                Loop 30 {
                    ; this will check the next button to exsuere the ad is closed
                    Text := "|!=*151$68.w0w7zsw0wzzz0D1zy7UDDzzs3kTzVs7Xzzy0w700D1s1sDkD1k01kw0S3y3kQ00SD07UzUw7003bU1sDwD1k00xs0S3r3kQ007w07Uxsw7zk1y01sDCD1zw0DU0S3nnkTz07s07UwQw7001z01sD7j1k00zk0S3kzkQ00DS07Uw7w7007XU1sD1z1k01sw0S3kDkQ00w707Uw3w700D1s1sD0T1zw7UC0S3k7kTzVs3k7Uw0w7zsw0Q1s6061zwC030A2"
                    if (ok := FindText(&X, &Y, 1104, 634, 1189, 668, 0, 0, Text)) {
                        Break
                    } Else {
                        ; this will click next to next button to skips the packs to save the time
                        Click("1216, 647 Left, 1")
                        Sleep(1000)
                    }
                }

                ; AD Next button
                Text := "|!=*151$68.w0w7zsw0wzzz0D1zy7UDDzzs3kTzVs7Xzzy0w700D1s1sDkD1k01kw0S3y3kQ00SD07UzUw7003bU1sDwD1k00xs0S3r3kQ007w07Uxsw7zk1y01sDCD1zw0DU0S3nnkTz07s07UwQw7001z01sD7j1k00zk0S3kzkQ00DS07Uw7w7007XU1sD1z1k01sw0S3kDkQ00w707Uw3w700D1s1sD0T1zw7UC0S3k7kTzVs3k7Uw0w7zsw0Q1s6061zwC030A2"
                if (ok := FindText(&X := "wait", &Y := 16, 1104, 634, 1189, 668, 0, 0, Text)) {
                    Click("1216, 647 Left, 1")
                    Sleep(2000)
                    ; move the mouse little bit up to see the next button
                    Click("1242, 409, 0")
                } Else {
                    isSkipped := false
                }
            } Else {
                isSkipped := false
            }
        }
    }
}