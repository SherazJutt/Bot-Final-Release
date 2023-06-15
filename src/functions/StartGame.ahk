start_game(){
    ; close a9
    WinClose , Asphalt 9: Legends
    Sleep , 1000

    Run, "Asphalt 9" %A_ScriptDir%

    Sleep, 2000
    ; restore a9 window
    WinRestore, Asphalt 9: Legends

    ; activate a9 window
    Sleep , 2000
    WinActivate , Asphalt 9: Legends
    Sleep , 1000

    ; resize a9 window to 720p
    WinMove , Asphalt 9: Legends, , 0, 0, 1280, 720
    Sleep, 1000

    ; restore a9 window
    WinRestore, Asphalt 9: Legends
}