SeasonalEvents(){

    isLoaded := False

    ; seasonal events red
    Loop, 60 {
        CoordMode, Pixel, Screen
        PixelSearch, FoundX, FoundY, 240, 603, 270, 625, 0xFF0049, 0, Fast RGB
        If (ErrorLevel = 0){
            ; click on seasonal events tabe to active
            Sleep, 1000
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
            Text:="|<>*141$147.zkTsD0zlkQ3zVy01y301kCC1zz3z1s7z630TwTs0zss0S1lsDsMM0D0kMss0Q73U73b03sCD1z3X03w633701UkQ0kQs0P1lsTsQM0NUkMQk0A63U63b07MCBXz3X03A631i01UkQ0k0s0n1lgPsMTkNUkMDU0A63U60706QCBaTz3y6C630w01UkQ0k0s1lVlanzkM0kkkM700A63U6070CACAyTC307y630s01UkQ0k0s1zllXXskM1zskM700A63U63b0DyCAQT730C7630s01UkQ0kQs3UllV3sMM1UMks700A73U77b0Q6CA0T3XzQ37z0s01UTs0Tszv0tlU3kATnU8zU300A1y01y3zM3AA0Q"

            if (ok:=FindText(X:="wait", Y:=18, 550, 412, 708, 436, 0, 0, Text)){
                Sleep, 1000
                Click, 778, 372 Left, 1
                Sleep, 750
                Loop, 20{
                    Send, {PgUp}
                    Sleep, 300
                }
                Goto, recheck
            }Else{
                Gosub, script_start
            }
        }
    Return isEventsLoaded
}
