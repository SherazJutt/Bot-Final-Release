Close_AD(){
    Loop, 120{

        Sleep, 1000

        WinClose, Microsoft Store
        WinClose, Privacy - Vungle - Google Chrome

        ; ad close (X)
        Text:="|<>*161$22.Xzz47zs0Dz00Ts20z0Q1s3s30Tk03zU0Tz03zy0Tzs1zz03zs07z00Ds30T0S0s3w10Ts03zk8TzVnzzC"
        if (ok:=FindText(X, Y, 1213, 58, 1248, 91, 0, 0, Text))
        {
            Click, 1229, 72 Left, 1
            Return true
            Break
        }

        ; resume ad
        Text:="|<>*123$77.03z00000000000zzk0000000003zzs000000000Tzzs000000001zzzs000000003z0zk00000000Ds0Tk00000000zU0TU00000001y00zU1zU003w7w00k0Tzs1yTyDs0001zzs3xzyTU0007zzk7zzyz0000DzzkDzzxy0000zUzUTwDzw0001y0z0zkDzs0000Q1y1z0Tzk000003w3w0TzU00000Ds7s0zz00000DzkDk1zy00007zzUTU3zw00M0Tzz0z07zw00y3zty1y0Dzs03y7w3w3w0Tjk07wTU7s7s0zTk0Tkz0DkDk1yTk1zVy0zUTU3wzs7y3y3z0z07szzzs7zzy1y0Dkzzzk7zzw3w0TUTzy07zvw7s0z0Tzs07zbsDk1y07y003w7kTU3y"

        if (ok:=FindText(X, Y, 478, 266, 592, 326, 0, 0, Text))
        {
            Click, 857, 448 Left, 1
        }

        ; Australian ads system start
        Text:="|<>*101$21.zUDzk0TwDVz7z7lzwQTzlbaD8yHsDszVz7wDszVy3wDmTUwtsbzzATzllzwT7z7wDVzk0TzUDw"
        if (ok:=FindText(X, Y, 951, 89, 993, 127, 0, 0, Text)){
            Click, 974, 104 Left, 1
            Return true
            Break
        }

        Text:="|<>*82$60.s1zzzzzznzs1zzzzzznznszzzzzznz7zw70ks3nk7ztn668tn67znvDC9wmD7zrvDC9ym07zrvDC9ym07zrvDC9ym0nwnnDC9wmDlttnDC8tn6w3w7DC83nkzzzzzztzzzzzzzzztzzzzzzzzztzzzU"
        if (ok:=FindText(X, Y, 501, 98, 581, 122, 0, 0, Text)){
            Click, 974, 104 Left, 1
            Return true
            Break
        }

        Text:="|<>*177$23.XzzW3zy03zs03zU83y0s3s3s3UDs20zs03zs0Dzs0zzs3zzU3zy03zs03zU83y0s3s3s3UDs20zs03zs0Dzs8zzsk"
        if (ok:=FindText(X, Y, 1206, 60, 1245, 99, 0, 0, Text))
        {
            Click, 1229, 72 Left, 1
            Return true
            Break
        }
        ; Australian ads system end

        SyncingToTheServer()
    }
}
