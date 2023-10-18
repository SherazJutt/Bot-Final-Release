settings:
    Gui, Destroy

    Gui -MinimizeBox -MaximizeBox -DPIScale ;-Caption

    IniRead, mp_play_button_click_delay, %SettingsIni%, DELAYS, mp_play_button_click_delay
    IniRead, hunt_play_button_click_delay, %SettingsIni%, DELAYS, hunt_play_button_click_delay
    IniRead, cars_skip_delay, %SettingsIni%, DELAYS, cars_skip_delay

    Gui, Add, Text, w140 h25 x10 y10, Mp Play Button Click Delay:
    Gui, Add, Edit, vmp_play_button_click_delay w42 h20 x158 y7
    GuiControl, , mp_play_button_click_delay, %mp_play_button_click_delay%

    ; section sseparator
    Gui Add, Text, x5 y32 w200 h2 +0x10

    Gui, Add, Text, w140 h25 x10 y45, Hunt Play Button Click Delay:
    Gui, Add, Edit, vhunt_play_button_click_delay w42 h20 x158 y42
    GuiControl, , hunt_play_button_click_delay, %hunt_play_button_click_delay%

    ; section sseparator
    Gui Add, Text, x5 y67 w200 h2 +0x10

    Gui, Add, Text, w140 h25 x10 y80, Cars Skip Delay:
    Gui, Add, Edit, vcars_skip_delay w42 h20 x158 y77
    GuiControl, , cars_skip_delay, %cars_skip_delay%

    ; section sseparator
    Gui Add, Text, x5 y102 w200 h2 +0x10

    Gui Add, Button, gsave_delays x35 y110 w140 h38 , Save

    Gui Add, Text, x5 y155 w140 h25 +0x200 +0x1, Add Values In Milliseconds:
    Gui Add, Text, x10 y180 w140 h25 +0x200 +0x1, 1 Second = 1000 Milliseconds

    Gui Show, w210 h220, Asphat 9 Autobot
    WinSet, Style, Asphat 9 Autobot

Return

save_delays:
    ; get all fields values
    GuiControlGet, mp_play_button_click_delay,, mp_play_button_click_delay
    GuiControlGet, hunt_play_button_click_delay,, hunt_play_button_click_delay
    GuiControlGet, cars_skip_delay,, cars_skip_delay

    ; write values to ini file
    IniWrite, %mp_play_button_click_delay%, %SettingsIni%, DELAYS, mp_play_button_click_delay
    IniWrite, %hunt_play_button_click_delay%, %SettingsIni%, DELAYS, hunt_play_button_click_delay
    IniWrite, %cars_skip_delay%, %SettingsIni%, DELAYS, cars_skip_delay

    MsgBox, Saved
    Goto, main_gui
Return
