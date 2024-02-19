#Warn All, Off

#Requires Autohotkey v2
;AutoGUI creator: Alguimist autohotkey.com/boards/viewtopic.php?f=64&t=89901
;AHKv2converter creator: github.com/mmikeww/AHK-v2-script-converter
;EasyAutoGUI-AHKv2 github.com/samfisherirl/Easy-Auto-GUI-for-AHK-v2

if A_LineFile = A_ScriptFullPath && !A_IsCompiled
{
	myGui := Constructor()
	myGui.Show("w369 h420")
}

Constructor()
{	
	myGui := Gui()
	myGui.Opt("-MinimizeBox -MaximizeBox +AlwaysOnTop")
	ButtonBtnPlay := myGui.Add("Button", "vBtnPlay  x10 y10 w146 h67", "&Play")
	Tab := myGui.Add("Tab3", "x8 y80 w275 h160", ["Tab 1", "Tab 2"])
	Tab.UseTab()
	ButtonBtnPlay.OnEvent("Click", OnEventHandler)
	myGui.OnEvent('Close', (*) => ExitApp())
	myGui.Title := "A9 Autobot"
	play(CtrlHwnd, GuiEvent, EventInfo, ErrLevel := "") {
	}
	
	OnEventHandler(*)
	{
		ToolTip("Click! This is a sample action.`n"
		. "Active GUI element values include:`n"  
		. "ButtonBtnPlay => " ButtonBtnPlay.Text "`n", 77, 277)
		SetTimer () => ToolTip(), -3000 ; tooltip timer
	}
	
	return myGui
}