#Requires AutoHotkey >=2.0 64-bit

#SingleInstance Force
SetWorkingDir A_InitialWorkingDir
SetTitleMatchMode 2
#WinActivateForce
SetControlDelay 1
SetWinDelay 0
SetKeyDelay 0
SetMouseDelay -1

if A_LineFile = A_ScriptFullPath && !A_IsCompiled {
    myGui := Constructor()
    myGui.Show("w247 h420")
}

Constructor()
{
    myGui := Gui()
    myGui.Opt("-MinimizeBox -MaximizeBox")

    ButtonBtnPlay := myGui.Add("Button", "vBtnPlay x8 y8 w146 h67", "&Play")
    ButtonBtnPlay.OnEvent('click', (*) => play())

    ButtonExit := myGui.Add("Button", "x160 y8 w80 h68", "&Exit")
    ButtonExit.OnEvent('click', (*) => ExitApp())

    Tab := myGui.Add("Tab3", "x0 y80 w225 h160", ["MP", "Hunt"])

    myGui.OnEvent('Close', (*) => ExitApp())
    myGui.Title := "A9 Autobot"
    play() {
        user := {
            name: 'sheraz',
        }
        MsgBox('the username is ' user.name)
    }

    return myGui
}

; Exit the Script
Esc:: ExitApp