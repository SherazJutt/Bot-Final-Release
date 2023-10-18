;  *-----------------------------------------------------------------------------*
;         |     Define Cars GUi / Shows after clicking on hunt cars       |
;  *-----------------------------------------------------------------------------*

settings:
    Gui, Destroy

    Gui -MinimizeBox -MaximizeBox -DPIScale ;-Caption

    Gui, Add, Text, w60 h25 x10 y10, Delay 1:
    Gui, Add, Edit, vdelay_mp_car_selection w42 h20 x158 y7

    ; section sseparator
    Gui Add, Text, x5 y32 w200 h2 +0x10

    Gui, Add, Text, w60 h25 x10 y45, Delay 1:
    Gui, Add, Edit, vdelay_mp_car_selection1 w42 h20 x158 y42

    ; section sseparator
    Gui Add, Text, x5 y67 w200 h2 +0x10

    Gui, Add, Text, w60 h25 x10 y80, Delay 1:
    Gui, Add, Edit, vdelay_mp_car_selection2 w42 h20 x158 y77

    Gui Show, w210 h300, Asphat 9 Autobot
    WinSet, Style, Asphat 9 Autobot
Return

; save_maxCars:
;     GuiControlGet, MaxCarsFieldValue, , MaxCarsField
;     ; MsgBox, %MaxCarsFieldValue%
;     If (MaxCarsFieldValue <= 15){
;         IniWrite, %MaxCarsFieldValue%, %SettingsIni%, HUNT, max_cars
;         Gui, Destroy
;         Goto, Hunt_Cars_Label
;         Return
;     }Else{
;         MsgBox, Maximum cars limit is: 15
;     }
; Return
; save_cars:
;     Loop, %maxCars% {
;         GuiControlGet, CarValue, , car_%A_Index%
;         IniWrite, %CarValue%, %SettingsIni%, HUNT, car_%A_Index%
;     }
;     MsgBox, Changes Saved Succesfully.
;     Gui, Destroy
;     Goto, main_gui
; return