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

MainMenuLoadedCheck() {

    Loop 30 {

        Text := "|<>*146$16.nlnD6NyNbt6TYtyHbsSTVkCD0sy"
        if (ok := FindText(&X, &Y, 24, 42, 45, 58, 0, 0, Text)) {
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

    isLoaded := true

    ; seasonal events red/locked
    Text := "|<>*165$12.w7s3nnnvzvzvU0000U1U0U0U0U0U00U0U"
    if (ok := FindText(&X, &Y, 244, 601, 264, 629, 0, 0, Text)) {
        Click("265, 646, Left, 1")
        Sleep(1000)

        Text := "|<>*166$107.0zzUzzUzVzsTzzwDzy1zy0zy0y1zUzzzkDzw1zw1zw1w3z1zzzUTzs3zk3zs7s7y3zzz0zzs7zU7zkDkDw7zzy1zzkDz07zUTUTsDzzw3zzUTy0Dz0z0zkTzzs7zz0zw0Tw1y1zUzzzkDzy0zkEzs7w3z1zzzUTzy1zUUzkDs7y3zzz0zzw3z11zUTkDw7zzy1zzs7y63z0zUTsDzzw3zzkDsC7y1z0zkTzzs7zzUTkQ7s7y1zUzzzkDzzUzUsDkDw3z1zzzUTzz0z3kTUTs7y3zzz0zzy1y7kz0zkDw7zzy1zzw3sDVy1zUTsDzzw3zzs7kT1w7z0zkTzzs7zzsDUy3sDy1zUzzzkDzzkT3w7UTw3z1zzzUTzzUQ7wD0zs7y3zzz0zzz0sDsC1zkDw7zzy1zzy1kTkQ7zUTsDzzw3zzy3VzUsDz0zkTzzs7zzw73zVkTy1zUzzzkDzzsA7z30zw3z1zzzUTzzkMDy21zs7y3zzz0zzzUETw47zkDw7zzy1zzzUVzs8DzUTsDzzw3zzz03zsETz0zkTzzs7zzy07zk0zy1zUTzzkDzzw0DzU1zw3z000DU007s0zz07zs7y000T000Dk1zz0DzkDw000y000Tk3zy0TzUTs001w000zUDzw1zzVzs003w001"
        if (ok := FindText(&X := "wait0", &Y := 16, 928, 149, 1049, 201, 0, 0, Text)) {
            isLoaded := true
        }
    } else {
        isLoaded := true
    }

    return isLoaded
}