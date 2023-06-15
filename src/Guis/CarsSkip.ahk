Skip_MP_Cars_Label:

    Gui, Destroy
    Gui -MinimizeBox -MaximizeBox

    for index, car in carNames {
        y := (index - 1) * 30
        ; set the skip value by reading from ini file
        IniRead, ini%car%, %SettingsIni%, CarsSkip, %car%
        isChecked := ini%car% == 1 ? "Checked" : 0
        Gui Add, CheckBox, gToggleCarToSkip %isChecked% x10 y%y% w150 h25 , %car%
        Gui, Add, Edit, v%car%_to_input w25 h20 x200 y%y%
        ; set the skip value by reading from ini file
        IniRead, skipVal, %SettingsIni%, CarsSkip, %car%_to
        GuiControl, , %car%_to_input, %skipVal%
    }
    Gui Add, Button, gSave_Skip_MP_Cars x10 y660 w100 h25 , Save
    Gui, Show, w240 h690, Define Cars Skip

Return

Save_Skip_MP_Cars:
    Gui, Submit, NoHide
    for index, car in carNames {
        saveCar := %car%_to_input
        IniWrite, %saveCar%, %SettingsIni%, CarsSkip, %car%_to
    }
    Gui, Destroy
Return

; ToggleCarToSkip
ToggleCarToSkip:
    GuiControlGet, checkboxState, , %A_GuiControl%
    car := SubStr(A_GuiControl, 1)
    IniRead, ClickedCar, %SettingsIni%, CarsSkip, %car%

    carState := ClickedCar = "1" ? 0 : 1
    IniWrite, %carState%, %SettingsIni%, CarsSkip, %car%
Return

