EnterEventsTab() {

    isEventsLoaded := False

    Click("466, 645, Left, 1")
    Sleep(1000)
    Click("466, 645, Left, 1")

    Text := "|<>*131$66.Ts001zkzkDUzwS1nztzszwzwS1nztzszys0T1kC1k0sCs0T1kC1k0s7s0TVkC1k0s7s0TVkC1k0s7w0RlkC1s0s7zsQlkC1zksDzsQtkC1zkzys0QRkC1k0zws0QRkC1k0zss0QDkC1k0sws0QDkC1k0sQs0Q7kC1k0sSw0Q7kC1s0sCzwQ3kC1zssDzwQ1kC1zss7U"
    if (ok := FindText(&X := "wait", &Y := 5, 131, 644, 199, 665, 0, 0, Text)) {
        isEventsLoaded := true
    } else {
        ; captured claim to check if there is event claim screen
        Text := "|<>*141$147.zkTsD0zlkQ3zVy01y301kCC1zz3z1s7z630TwTs0zss0S1lsDsMM0D0kMss0Q73U73b03sCD1z3X03w633701UkQ0kQs0P1lsTsQM0NUkMQk0A63U63b07MCBXz3X03A631i01UkQ0k0s0n1lgPsMTkNUkMDU0A63U60706QCBaTz3y6C630w01UkQ0k0s1lVlanzkM0kkkM700A63U6070CACAyTC307y630s01UkQ0k0s1zllXXskM1zskM700A63U63b0DyCAQT730C7630s01UkQ0kQs3UllV3sMM1UMks700A73U77b0Q6CA0T3XzQ37z0s01UTs0Tszv0tlU3kATnU8zU300A1y01y3zM3AA0Q"
        if (ok := FindText(X := "wait", Y := 6, 550, 412, 708, 436, 0, 0, Text)) {
            Sleep(1000)
            Click('778, 372 Left, 1')
            Sleep(1000)
            Loop 16 {
                Text := "|<>*131$66.Ts001zkzkDUzwS1nztzszwzwS1nztzszys0T1kC1k0sCs0T1kC1k0s7s0TVkC1k0s7s0TVkC1k0s7w0RlkC1s0s7zsQlkC1zksDzsQtkC1zkzys0QRkC1k0zws0QRkC1k0zss0QDkC1k0sws0QDkC1k0sQs0Q7kC1k0sSw0Q7kC1s0sCzwQ3kC1zssDzwQ1kC1zss7U"
                if (ok := FindText(&X := "wait", &Y := 5, 131, 644, 199, 665, 0, 0, Text)) {
                    isEventsLoaded := False
                } Else {
                    Send("PgDn")
                    Sleep(300)
                }
            }
        } Else {
            isEventsLoaded := False
        }
    }
    return isEventsLoaded
}

EnterHuntTab() {

    isFound := False

    Loop 30 {
        ; tvr
        Text := "|<>*136$75.00031zzUy003s000M7zw7k00D00030zz0y000s000M7zs7k003zUDz0zz1y1z0Dy1zw7zsDkTy1zkDzUTy1y3zsDy1zw3zkDkTz1zkDzkTy3y3zsDy1zy3zkTkTz1zkDzkDw3y3zsDy1zy1zUTkTz1zkDzsDw7y3zsDy1zz1zUzkTz1zkDzs7s7y3zsDy1zzUz1zkTy1zkDzw7sDy000Ty1zzUz1zk003zkDzw7kDy000zy3zzkS3zk00DzkTzy3kTy003zy3zzkS3zkTUTzkTzz3Uzy3y3zy3zzsA7zkTkDzkTzz1Uzy3z1zy3zzsA7zkTs7zkTzzV1zy3zUzy3zzw0DzkTw3zkTzzU1zy3zkTy3zzw0TzkTy1zkTzzk3zy3zsDy3zzy0TzkTz0zkTzzk3zy3zw7z3zzz0zzszzkU"
        if (ok := FindText(&X, &Y, 319, 222, 409, 265, 0, 0, Text)) {
            Loop 2 {
                Sleep(1000)
                Send "{Enter}"
            }

            isFound := true
            break
        } Else {
            Send("PgDn")
            Sleep(1800)
        }
    }
    return isFound
}