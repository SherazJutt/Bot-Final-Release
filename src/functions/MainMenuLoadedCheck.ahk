MainMenuLoadedCheck(){

    isLoaded := false

    Loop, 20 {
        CoordMode , Pixel, Screen
        PixelSearch, FoundX, FoundY, 10, 61, 35, 87, 0xB00039, 0, Fast RGB
        If (ErrorLevel = 0)
        {
            isLoaded := True
            Break
        } Else
        {
            PressEscape(1)
            CheckGame()
            FullScreenAD()
            ExitGamePopUp()
            RewardsNext()
        }
        Sleep, 1000
    }
    return isLoaded
}