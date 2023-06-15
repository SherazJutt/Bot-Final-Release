;  *-----------------------------------------------------------------------------*
;         |     Define Cars GUi / Shows after clicking on hunt cars       |
;  *-----------------------------------------------------------------------------*

Hunt_Cars_Label:

    Gui, Destroy
    Gui -MinimizeBox -MaximizeBox ;-DPIScale ;-Caption
    ; car1
    Gui, Add, Text, w30 h25 y7, Car 1:
    Gui, Add, Edit, vcar_1 w25 h20 x40 y3
    ; car2
    Gui, Add, Text, w30 h25 x70 y7, Car 2:
    Gui, Add, Edit, vcar_2 w25 h20 x100 y3
    ; car3
    Gui, Add, Text, w30 h25 x10 y33 , Car 3:
    Gui, Add, Edit, vcar_3 w25 h20 x40 y30
    ; car4
    Gui, Add, Text, w30 h25 x70 y33 , Car 4:
    Gui, Add, Edit, vcar_4 w25 h20 x100 y30
    ; car5
    Gui, Add, Text, w30 h25 x10 y63 , Car 5:
    Gui, Add, Edit, vcar_5 w25 h20 x40 y60

    Gui, Add, Button, gsave_cars Default w55 h20 x70 y61, Save

    Gui Add, Text, x10 y87 w120 h50, Insert Numbers only to avoide errors

    Gui, Show, w135 h120, Define Cars
    WinSet, Style, -0x80000, Define Cars

    IniRead, inicar1, %SettingsIni%, HUNT ,car_1
    IniRead, inicar2, %SettingsIni%, HUNT ,car_2
    IniRead, inicar3, %SettingsIni%, HUNT ,car_3
    IniRead, inicar4, %SettingsIni%, HUNT ,car_4
    IniRead, inicar5, %SettingsIni%, HUNT ,car_5
    ; setting current ini values to inputs
    GuiControl, , car_1, %inicar1%
    GuiControl, , car_2, %inicar2%
    GuiControl, , car_3, %inicar3%
    GuiControl, , car_4, %inicar4%
    GuiControl, , car_5, %inicar5%
Return

save_cars:
    Gui, Submit, NoHide
    IniWrite, %car_1%, %SettingsIni%, HUNT,car_1
    IniWrite, %car_2%, %SettingsIni%, HUNT,car_2
    IniWrite, %car_3%, %SettingsIni%, HUNT,car_3
    IniWrite, %car_4%, %SettingsIni%, HUNT,car_4
    IniWrite, %car_5%, %SettingsIni%, HUNT,car_5
    Gui, Destroy
    Goto, main_gui
Return