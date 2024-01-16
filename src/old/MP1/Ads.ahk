; watch_AD_if_1st_2nd_OR_3rd
watch_AD_if_1st_2nd_OR_3rd(){
    ; 1st
    Text:="|<>*162$38.zzzs00Tzzs003zzw000zzw000Dzw0007zw0001zw0000Tw00007y00001y00000z00000DU00003s00000y00000D000007k00001w00000T000007k03001s03U00y03s00DU3y003s3zU00y1zs00D1zw007tzz001zzzk00Tzzw007zzz001zzzU00zzzs00Dzzy003zzzU00zzzs00Dzzw007zzz001zzzk00Tzzw007zzz001zzzU00zzzs00Dzzy003zzzU00zzzs00Dzzw007zzz001zzzk00Tzzw007zzz001zzzU00zzzs00Dzzy003zzzU00zzzs00Dzzw007zzz001zzzk00Tzzw007zzz001zzzU00zzzs00Dzzy003zzzU00zzzs00Dzzw007zzz001zzzk00Tzzw007zzz001zzzU00zzzs00Dzzy003zzzU00zzzs00Dzzw007zzz001zzzk00Tzzw007zzz001zzzU00zzzs00Dzzy003zzzU00zzzs00Tzzy007zzzU03zzy"
    if (ok:=FindText(X, Y, 106, 82, 159, 178, 0, 0, Text)){
        Return true
    }
    ; 2nd
    Text:="|<>*163$51.zzzzzzzzzwDz3y00zz0zkDk00zs7y1w003y0zkTU00Tk3y3w003y0TUTUTUDk3w3w7y1y0DUT0zkTU1w7s7y3w0DUz0zUTU0s7sDw3w070z1zUTUUs7kDw7s431y1zUz0kMDkDs7s621y3z0z1k0DkTs7sD01w3z1y1s0TUTsDkD03w3y1y1w0TUzkDkTU3w7y1y3w0T0zkTUTk7s7s3w3y0z000TUTk7s007w7z0z001zUzs7k00zwDzVz00zzzzzzzzzzw"
    if (ok:=FindText(X, Y, 156, 86, 212, 125, 0, 0, Text)){
        Return true
    }
    ; 3rd
    Text:="|<>*164$50.zzzzzzzzzs07zs03zy00Dy007z001z000zk00Dk00Dw003w003z0y0z0z0TkTkDkTs7s7w3s7y3y1z0y1zUzUTkDUTkDsDw7sDw3y3z1y3z0z0zUT0zkTkDkDkDw7w003w3y1z001z1zUTk00zkTs7s00zs7y3y1kDy1zUzUS3zUTkDsDUTsDw3y3s7y3z0z0y1z0zkTkDkDkDk7w3w3w001z1z0z000zkTk7k00Ts7y1s00Tz3zUz00zzzzzzzzzzs"

    if (ok:=FindText(X, Y, 158, 90, 214, 124, 0, 0, Text)){
        Return true
    }
}

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
