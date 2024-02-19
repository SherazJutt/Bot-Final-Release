﻿#Warn All, Off

#Requires Autohotkey v2
;AutoGUI creator: Alguimist autohotkey.com/boards/viewtopic.php?f=64&t=89901
;AHKv2converter creator: github.com/mmikeww/AHK-v2-script-converter
;EasyAutoGUI-AHKv2 github.com/samfisherirl/Easy-Auto-GUI-for-AHK-v2

if A_LineFile = A_ScriptFullPath && !A_IsCompiled
{
	myGui := Constructor()
	myGui.Show("w247 h420")
}

Constructor()
{	
	myGui := Gui()
	myGui.Opt("-MinimizeBox -MaximizeBox +AlwaysOnTop")
	ButtonBtnPlay := myGui.Add("Button", "vBtnPlay  x8 y8 w146 h67", "&Play")
	ButtonOK := myGui.Add("Button", "x504 y344 w80 h23", "&OK")
	ButtonExit := myGui.Add("Button", "x160 y8 w80 h68", "&Exit")
	ButtonOK := myGui.Add("Button", "x8 y144 w80 h23", "&OK")
	Tab := myGui.Add("Tab3", "x8 y88 w225 h160", ["MP", "Hunt"])
	Tab.UseTab()
	ButtonBtnPlay.OnEvent("Click", OnEventHandler)
	ButtonOK.OnEvent("Click", OnEventHandler)
	ButtonExit.OnEvent("Click", OnEventHandler)
	myGui.OnEvent('Close', (*) => ExitApp())
	myGui.Title := "A9 Autobot"
	play(CtrlHwnd, GuiEvent, EventInfo, ErrLevel := "") {
	}
	
	OnEventHandler(*)
	{
		ToolTip("Click! This is a sample action.`n"
		. "Active GUI element values include:`n"  
		. "ButtonBtnPlay => " ButtonBtnPlay.Text "`n" 
		. "ButtonOK => " ButtonOK.Text "`n" 
		. "ButtonExit => " ButtonExit.Text "`n" 
		. "ButtonOK => " ButtonOK.Text "`n", 77, 277)
		SetTimer () => ToolTip(), -3000 ; tooltip timer
	}
	
	return myGui
}