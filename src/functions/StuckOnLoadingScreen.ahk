StuckOnLoadingScreen() {

    isStuck := true 

    Loop, 5 {

        Text:="|<>*118$18.zzzi0ziATiSRiSNiSNiSTiSTiSTiSTiANi0Nz0tzzzU"

        if (ok:=FindText(X, Y, 167, 56, 191, 77, 0, 0, Text)) {
            Sleep, 1000
        } Else {
            isStuck := False 
            Break
        }
    }

    return isStuck 
}
