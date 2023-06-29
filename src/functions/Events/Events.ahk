SeasonalEvents(){

    isLoaded := False

    ; seasonal events red
    Loop, 60 {
        CoordMode, Pixel, Screen
        PixelSearch, FoundX, FoundY, 240, 603, 270, 625, 0xFF0049, 0, Fast RGB
        If (ErrorLevel = 0){
            ; click on seasonal events tabe to active
            Click, 349, 637 Left, 1
            Sleep, 1000
        }else{
            CoordMode, Pixel, Screen
            PixelSearch, FoundX, FoundY, 251, 648, 276, 674, 0xFFFFFF, 0, Fast RGB
            If (ErrorLevel = 0){
                isLoaded := True
                Break
            }else{
                If (MainMenuLoadedCheck()) {
                    Click, 349, 637 Left, 1
                    Sleep, 1500
                }Else{
                    Gosub, script_start
                }
            }
        }
    }
    Return isLoaded
}

EnterEventsTab(){

    isEventsLoaded := False

    ; if SeasonalEvents tab is active and loaded
    CoordMode, Pixel, Screen
    PixelSearch, FoundX, FoundY, 256, 643, 269, 654, 0xFFFFFF, 0, Fast RGB
    If (ErrorLevel = 0){
        ; click on events tab
        Loop, 2{
            Click , 465, 643 left, 1
            Sleep, 1000
        }
    }Else{
        Gosub, script_start
    }

    Sleep, 3000
    recheck:
        ; green underline check to verify events tab start
        CoordMode, Pixel, Screen
        PixelSearch, FoundX, FoundY, 71, 690, 95, 700, 0xC3FB12, 0, Fast RGB
        If (ErrorLevel = 0){
            isEventsLoaded := True
        }Else{
            ; captured claim to check if there is event claim screen
            Text:="|<>*142$54.DkM0C0ls7TwM0D0ls7MQM0T0lwDsAM0P0lwDsAM0PUlw/s0M0NUlyPs0M0tUlqPs0M0lUlqns0M0kklnns0M1zklnnsAM1zklnXsAM1UsllXQQM1UMlk3TsTvUMlk37kTv0MkU3U"

            if (ok:=FindText(X:="wait", Y:=18, 653, 409, 721, 435, 0, 0, Text)){
                Click, 778, 372 Left, 1
                Sleep, 750
                Loop, 20{
                    Send, {PgUp}
                    Sleep, 250
                }
                Goto, recheck
            }Else{
                Gosub, script_start
            }
        }
    Return isEventsLoaded
}
