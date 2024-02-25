start_game() {
    ; close a9
    if WinExist("Asphalt 9: Legends") {
        WinClose("Asphalt 9: Legends")
        Sleep(1000)
    }

    Run("`"Asphalt 9`" " A_ScriptDir)
    Sleep(2000)

    ; activate a9 window
    WinActivate("Asphalt 9: Legends")
    Sleep(2000)

    ; restore a9 window
    WinRestore("Asphalt 9: Legends")
    Sleep(2000)

    ; resize a9 window to 720p
    WinMove(0, 0, 1280, 720, "Asphalt 9: Legends")
    Sleep(2000)

}

StuckOnGlLogo() {

    isStuck := true

    Loop 60 {
        if (PixelSearch(&FoundX, &FoundY, 627, 511, 653, 531, 0xCD0041, 0,)) {
            Sleep(1000)
        } else {
            isStuck := False
            Break
        }
    }

    return isStuck
}

StuckOnLoadingScreen() {

    isStuck := true

    Loop 60 {

        Text := "|<>*118$18.zzzi0ziATiSRiSNiSNiSTiSTiSTiSTiANi0Nz0tzzzU"

        if (ok := FindText(&X, &Y, 167, 56, 191, 77, 0, 0, Text)) {
            Sleep(1000)
        } Else {
            isStuck := False
            Break
        }
    }

    return isStuck
}

MainMenuLoadedCheck() {

    isLoaded := false

    Loop 30 {
        If (PixelSearch(&FoundX, &FoundY, 10, 61, 35, 87, 0xB00039, 0)) {
            isLoaded := True
            Break
        } Else {
            if !isGameRunning() {
                break
            }
            FullScreenAD()
            ExitGamePopUp()
            RewardsNext()
            LeagueUpNext()
            PressEscape(1)
        }

        Sleep(1000)
    }

    return isLoaded
}

FullScreenAD() {

    Text := "|<>*48$29.bzzzm7zzz07zzw47zzkQ7zz1w7zw7w7zkTw7z1zw7w7zw7kTzw71zzw07zzw0Tzzw1zzzs7zzzk7zzz07zzw47zzkQ7zz1w7zw7w7zkTw7z1zw7w7zw7kTzw71zzw47zzw0TzzwNzzzxk"
    if (ok := FindText(&X, &Y, 1030, 124, 1074, 172, 0, 0, Text)) {
        Click("1052, 147 Left, 1")
        Sleep(1000)
    }

    Text := "|<>*65$29.bzzzW7zzz07zzw47zzkQ7zz1w7zs7w7zkTw7z1zw7w7zw7kTzw71zzw07zzw0Tzzw1zzzs3zzzk7zzz07zzw47zzkQ7zy1w7zw7w7zkTw7z1zw7w7zw7UTzw71zzw47zzw4TzzwNzzzxk"
    if (ok := FindText(&X, &Y, 1030, 124, 1073, 172, 0, 0, Text)) {
        Click("1052, 147 Left, 1")
        Sleep(1000)
    }
}

ExitGamePopUp() {

    Text := "|<>*116$63.U0D3zVwS00801sTsD1k0000D1z1sC00001wDsT1s011zzUy3sDw7sTzy7Uz1zkz3zzkQDsDy7sTzz31z1zkz3zzs8TsDy7sTzzU3z1zkz00zy0zsDy7s03zk7z1zkz00Ty0zsDy7s03zk7z1zkz1zzw0zsDy7sTzzU3z1zkz3zzs8TsDy7sTzz31z1zkz3zzkQ7sDy7sTzy7kz1zkz3zzUy3sDy7s3zwDsT1zkz00D1z1sDy7s01sTwD1zkz00D3zVwTyDw"

    if (ok := FindText(&X, &Y, 556, 241, 633, 280, 0, 0, Text)) {
        PressEscape(1)
        Sleep(1000)
    }

}

SeasonalEvents() {

    isLoaded := False

    ; seasonal events red
    Loop 60 {

        If PixelSearch(&FoundX, &FoundY, 240, 603, 270, 625, 0xFF0049, 0) {
            ; click on seasonal events tabe to active
            Sleep(1000)
            Click("349, 637 Left, 1")
            Sleep(1000)
        } else {

            If PixelSearch(&FoundX, &FoundY, 251, 648, 276, 674, 0xFFFFFF, 0) {
                isLoaded := True
                Break
            } else {
                If MainMenuLoadedCheck() {
                    Click("349, 637 Left, 1")
                    Sleep(1500)
                } Else {
                    break
                }
            }
        }
    }

    Return isLoaded
}