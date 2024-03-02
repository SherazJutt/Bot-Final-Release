#Requires AutoHotkey >=2.0 64-bit

SetWorkingDir A_InitialWorkingDir
SetTitleMatchMode 2
#WinActivateForce
SetControlDelay 1
SetWinDelay 0
SetKeyDelay 0
SetMouseDelay -1

; set coords screen base instead of focused window
CoordMode "ToolTip", "Screen"
CoordMode "Mouse", "Screen"

if A_LineFile = A_ScriptFullPath && !A_IsCompiled
{
    myGui := Constructor()
    myGui.Show()
}

Constructor() {
    myGui := Gui()
    myGui.Opt("-MinimizeBox -MaximizeBox")

    ButtonBtnGet := myGui.Add("Button", "vBtnPlay x8 y8 w146 h67", "&Get coords")
    ButtonBtnGet.OnEvent('click', (*) => getPos())

    myGui.OnEvent('Close', (*) => ExitApp())
    myGui.Title := "Mouse POS"

    return myGui
}

getPos() {
    myGui.Destroy()
    ; SetTimer WatchCursor, 100


    ; WatchCursor() {
    ;     MouseGetPos &xpos, &ypos
    ;     ToolTip "Coords x: " xpos " y: " ypos, 0, 0
    ; }
}

^RButton:: {

    MouseGetPos &xpos, &ypos

    ToolTip "Coords x: " xpos " y: " ypos, 0, 0

    SetTimer () => ToolTip(), -3000

    A_Clipboard := "Click(" xpos " ," ypos " ," "Left, 1)"
}