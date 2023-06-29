;  *-----------------------------------------------------------------------------*
;         |     Define Cars GUi / Shows after clicking on hunt cars       |
;  *-----------------------------------------------------------------------------*

Hunt_Cars_Label:

    Gui, Destroy
    Gui -MinimizeBox -MaximizeBox ;-DPIScale ;-Caption

    IniRead, maxCars, %SettingsIni%, HUNT, max_cars

    Gui, Add, Text, w60 h25 x10 y10, Max Cars:
    Gui, Add, Edit, vMaxCarsField w25 h20 x65 y7
    GuiControl, , MaxCarsField, %maxCars%
    Gui, Add, Button, gsave_maxCars w85 h25 x7 y35, Save Max Cars
    Gui Add, Text, x0 y70 w100 h2 +0x10

    LoopIndex := 0

    Loop, %maxCars% {
        LoopIndex := A_Index
        ; ; set the skip value by reading from ini file
        IniRead, car_%A_Index%, %SettingsIni%, HUNT, car_%A_Index%

        y := A_Index == 1 ? 80 : A_Index * 30 + 50
        y2 := y - 3

        Gui, Add, Text, w60 h25 x10 y%y%, Car %A_Index%:
        Gui, Add, Edit, vcar_%A_Index% w25 h20 x65 y%y2%

        IniRead, CurrCar, %SettingsIni%, HUNT ,car_%A_Index%, 0
        ; setting current ini values to inputs
        GuiControl, , car_%A_Index%, %CurrCar%
    }

    SaveButton := LoopIndex * 30 + 80
    Gui, Add, Button, gsave_cars w85 h25 x7 y%SaveButton%, Save

    GuiHeight := LoopIndex * 30 + 112

    Gui, Show, w100 h%GuiHeight%, Hunt Cars
    WinSet, Style, -0x80000, Hunt Cars

Return

save_maxCars:
    GuiControlGet, MaxCarsFieldValue, , MaxCarsField
    ; MsgBox, %MaxCarsFieldValue%
    If (MaxCarsFieldValue <= 15){
        IniWrite, %MaxCarsFieldValue%, %SettingsIni%, HUNT, max_cars
        Gui, Destroy
        Goto, Hunt_Cars_Label
        Return
    }Else{
        MsgBox, Maximum cars limit is: 15
    }
Return
save_cars:
    Loop, %maxCars% {
        GuiControlGet, CarValue, , car_%A_Index%
        IniWrite, %CarValue%, %SettingsIni%, HUNT, car_%A_Index%
    }
    MsgBox, Changes Saved Succesfully.
    Gui, Destroy
    Goto, main_gui
return