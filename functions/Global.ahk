PressEscape(count) {
    if count > 1 {
        Loop count {
            Sleep(500)
            Send "{ Escape }"
            Sleep(500)
        }
    } else {
        Send "{ Escape }"
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