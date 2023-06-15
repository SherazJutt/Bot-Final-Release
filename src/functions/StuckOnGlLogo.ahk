StuckOnGlLogo() {

    isStuck := true 

    Loop, 60 {
        CoordMode, Pixel, Screen
        PixelSearch, FoundX, FoundY, 627, 511, 653, 531, 0xCD0041, 0, Fast RGB
        If (ErrorLevel = 0) {
            Sleep, 1000
        } Else {
            isStuck := False
            Break
        }
    }

    return isStuck
}
