#NoEnv
SetWorkingDir %A_ScriptDir%
CoordMode , Mouse, Screen
SendMode Input
#SingleInstance Force
SetTitleMatchMode 2
#WinActivateForce
SetControlDelay 1
SetWinDelay 0
SetKeyDelay 0
SetMouseDelay -1
SetBatchLines -1

#Include, %A_ScriptDir%\src\libs\ScriptGuards.ahk

t1:=A_TickCount, X:=Y:=""

currCar := 1

playAD()

start:
    If (currCar == 1){
        currCar = 2
        nexCarLoop(12)
        Sleep, 1000
        playAD()
    }Else If (currCar == 2){
        currCar = 3
        nexCarLoop(3)
        Sleep, 1000
        playAD()
    }Else If (currCar == 3){
        currCar = 4
        nexCarLoop(1)
        Sleep, 1000
        playAD()
    }Else If (currCar == 4){
        currCar = 5
        nexCarLoop(4)
        Sleep, 1000
        playAD()
    }Else If (currCar == 5){
        currCar = 6
        nexCarLoop(3)
        Sleep, 1000
        playAD()
    }Else{
        Exit
    }

    nexCarLoop(count){
        loop %count% {
            Click, 1188, 365 Left, 1
            Sleep, 250
        }
    }

    playAD(){
        StartAD:
            WinActivate, Asphalt 9: Legends
            WinMove , Asphalt 9: Legends, , 0, 0, 1280, 720
            Sleep, 250
            WinClose, Microsoft Store
            Sleep, 250
            WinClose, Privacy - Vungle - Google Chrome
            Sleep, 250

            ;  mp garage
            Text:="|<>*148$67.000000000001zs1k3kQ3zw3zy1s3kC1zz1zzUw1s70zzlw3kS1s3UQ1sw0sD1s1kC0SS0Q7Vs0s70DD0C3kw0Q3U7bU01sw0C1k3nk00ww070s1sz00SS03UQ0wTy0DS01kC0Q7zs7zU0s70S0zy3zs0Q3zz00z1yw0C1zz007UyD070zz001sT3k3UQ00w0wD1s1kC00S0S7US0s700D0D3k7UQ3U07UD1s3kC1k01zzUw0w70s00zzUS0S3UQ007zU707VkC0000000000000E"

            if (ok:=FindText(X, Y, 1062, 621, 1144, 661, 0, 0, Text))
            {
                Click, 1199, 633 Left, 1
            }

            ; play ad
            Text:="|<>*148$143.w1s3k3s3zz1zs3U7U00z07zts7k7UDk7zy7zs70D001y0DzvkDUD0TUDzwTzsC0S003w0TzzUTUw0zU0w0w1kQ0w00Ds0s3z0z1s3r01s1k3ks1s00Ts1k3y3i3k7C03k3U7Vk3k00tk3U7Q7Q7UCQ07U70D3U7U01nU70CwCMD0ww0D0C0070D007bUC0RsQsQ1ss0S0Q00C0S00CD0Q0vklks3Vk0w0s00Tzw00QC0s1rXXXk73k1s1k00zzs01sQ1k3b737US3U3k3U01zzk03kw3U7CC7D0w707U7003U7U070s70CSQCS1kD0D0C0070D00C1kC0QxkQs3zy0S0Q0sC0S00zzkQ0svUtkDzw0w0s1sQ0w01zzUs1lr0vUTzs1s1k3ks1s03zz1k3Xi1z0s1s3k3U7Vk3k0D0C3U77s3y3k3k7U7US3U7U0S0S70SDk7s7U3UD0Dzw70D00s0QDzwTUDkC07US0DzkC0S01k0sTzkT0DUQ0D0w0Dz0Q0w07U1szz8"

            if (ok:=FindText(X, Y, 865, 510, 1020, 542, 0, 0, Text))
            {
                Click, 1034, 515 Left, 1
            }

            ; ad close (X)
            Text:="|<>*125$22.XzzA7zsEDz00Ts20z0Q1s3s30Tk03zU0Tz03zy0Tzs1zz03zs07z00Ds30T0S0s3w10Ts03zk0TzVXzzC"

            if (ok:=FindText(X, Y, 1217, 65, 1243, 98, 0, 0, Text))
            {
                Click, 1229, 72 Left, 1
            }

            ; old small window close
            Text:="|<>*163$22.Xzz47zs0Dz00Ts20z0Q1s3s30Tk03zU0Tz03zy0Tzs1zz03zs07z00Ds30T0S0s3w10Ts03zk0TzUXzz6"

            if (ok:=FindText(X, Y, 1216, 58, 1246, 90, 0, 0, Text))
            {
                Click, 1229, 72 Left, 1
            }

            ; new small window ad
            Text:="|<>*102$21.zUDzk0TwDVz7z7lzwQTzlbaD8yHsDszVz7wDszVy3wDmTUwtsbzzATzllzwT7z7wDVzk0TzUDw"

            if (ok:=FindText(X, Y, 903, 94, 936, 123, 0, 0, Text)) {
                Click, 921, 106 Left, 1
            }

            ; resume ad
            Text:="|<>*124$67.07w000000000Tzk00000000zzw00000000zzz00000000zkTk0000000TU7s0000000TU1y0000000DU0T07y0DVwDk0A0Dzk7nzbs000Dzw3zzvw000Dzz1zzzw0007kTUzkzy0003sDkTUTz0000M3sDk7zU00001w7s3zk00003y3s1zw0000zz1w0zy01U3zzUy0Tz00w3z7kT0DjU0T3w3sDU7rs0TVw1w7k3ty0TUy1y3s1wzkTkTVz1w0yDzzkDzzUy0T3zzk3zzkT0DUTzk1ztwDU7k3z00Dky7k3w"

            if (ok:=FindText(X, Y, 505, 286, 587, 324, 0, 0, Text))
            {
                Sleep, 500
                Click, 857, 448 Left, 1
                Sleep, 500
            }
            ; checks if car is already refilled
            Text:="|<>*122$71.zz0S003s1s0zzz0w007s1s1vzz1s00Tk3k3r0S3k00zU3kDC0S7U01rU7USQ0wD003j07Vss1sS00DC0D3lk3kw00SS0DD3U7Vs00sw0SS70D3k03ks0RsC0S7U07Vk0zkQ1sD00C3k0z0zzkS00Q7U1y1zz0w01s701s3zw1s03kC03k7003k07zy07UC007U0Tzw0D0Q00D00zzs0S0s00S01s1s0w1k00w03U3k1s3U01zzD03U3k7003zyS07U7UC007zws0D0D0E"
            if (ok:=FindText(X, Y, 1062, 625, 1147, 657, 0, 0, Text))
            {
                Sleep, 2000
                Gosub, start
            }
            Goto, StartAD
        }

        ^p:: Pause

        ^q:: ExitApp

        #Include, %A_ScriptDir%\src\libs\FindText.ahk
