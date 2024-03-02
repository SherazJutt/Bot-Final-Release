﻿;##### Capture Keys #####

MainLoop:
If (!Capt || !ListFocus)
{
	SetTimer, MainLoop, Off
	GoSub, Capt
	return
}
Input, sKey, M L1 T10, %VirtualKeys%
If (ErrorLevel = "NewInput")
	return
If (ErrorLevel = "Timeout")
{
	SetTimer, MainLoop, Off
	GoSub, Capt
	return
}
sKey := (ErrorLevel != "Max") ? SubStr(ErrorLevel, 8) : sKey
If sKey in %A_Space%,`n,`t
	return
GoSub, ChReplace
If (InStr(sKey, "_") < 1)
	If (Asc(sKey) < 192) && ((sKey != "/") && (sKey != ".") && (!GetKeyState(sKey, "P")))
		return
If ((GetKeyState("RAlt", "P")) && (!HoldRAlt))
	sKey := "RAlt", HoldRAlt := 1
If (Asc(sKey) < 192) && ((CaptKDn = 1) || InStr(sKey, "Control") || InStr(sKey, "Shift")
|| InStr(sKey, "Alt") || InStr(sKey, "Win"))
{
	ScK := GetKeySC(sKey)
	If (Hold%ScK%)
		return
	Hotkey, If
	#If
	If (sKey = "/")
		Try HotKey, ~*VKC1SC730 Up, RecKeyUp, On
	Else
		HotKey, ~*%sKey% Up, RecKeyUp, On
	If (sKey = ".")
		Try HotKey, ~*VKC2SC7E0 Up, RecKeyUp, On
	Hotkey, If
	#If
	Hold%ScK% := 1, sKey .= " Down"
}
Else If ((StrLen(sKey) = 1) && (!GetKeyState("CapsLock", "T")))
	StringLower, sKey, sKey
tKey := sKey, sKey := "{" sKey "}"
If (!Capt)
	SetTimer, MainLoop, Off
If (ListFocus)
	GoSub, InsertRow
return

KeyboardRecord:
If (Record = 0)
{
	SetTimer, KeyboardRecord, Off
	return
}
Input, sKey, V M L1 T3, %VirtualKeys%
If ((ErrorLevel = "NewInput") || (ErrorLevel = "Timeout"))
{
	SetTimer, KeyboardRecord, Off
	SetTimer, KeyboardRecord, -1
	return
}
sKey := (ErrorLevel != "Max") ? SubStr(ErrorLevel, 8) : sKey
If sKey in %A_Space%,`n,`t
{
	SetTimer, KeyboardRecord, Off
	SetTimer, KeyboardRecord, -1
	return
}
GoSub, ChReplace
If (InStr(sKey, "_") < 1)
{
	If (Asc(sKey) < 192) && ((sKey != "/") && (sKey != ".") && (sKey != "?") && (!GetKeyState(sKey, "P")))
	{
		SetTimer, KeyboardRecord, Off
		SetTimer, KeyboardRecord, -1
		return
	}
}
If ((GetKeyState("RAlt", "P")) && (!HoldRAlt))
	sKey := "RAlt", HoldRAlt := 1
If (Asc(sKey) < 192) && ((CaptKDn = 1) || InStr(sKey, "Control") || InStr(sKey, "Shift")
|| InStr(sKey, "Alt") || InStr(sKey, "Win"))
{
	ScK := GetKeySC(sKey)
	If (Hold%ScK%)
	{
		SetTimer, KeyboardRecord, Off
		SetTimer, KeyboardRecord, -1
		return
	}
	Hotkey, If
	#If
	If (sKey = "/")
		Try HotKey, ~*VKC1SC730 Up, RecKeyUp, On
	Else
		HotKey, ~*%sKey% Up, RecKeyUp, On
	If (sKey = ".")
		Try HotKey, ~*VKC2SC7E0 Up, RecKeyUp, On
	Hotkey, If
	#If
	Hold%ScK% := 1, sKey .= " Down"
}
Else If ((StrLen(sKey) = 1) && (!GetKeyState("CapsLock", "T")))
	StringLower, sKey, sKey
tKey := sKey, sKey := "{" sKey "}"
If (Record = 0)
{
	SetTimer, KeyboardRecord, Off
	return
}
GoSub, InsertRow
SetTimer, KeyboardRecord, Off
SetTimer, KeyboardRecord, -1
return

InsertRow:
Type := cType1, Target := "", Window := ""
If (Record = 1)
{
	If (RecKeybdCtrl = 1)
	{
		If ((InStr(sKey, "Control")) || (InStr(sKey, "Shift"))
		|| (InStr(sKey, "Alt")))
			Goto, KeyInsert
		ControlGetFocus, ActiveCtrl, A
		If (ActiveCtrl != "")
		{
			Type := cType2, Target := ActiveCtrl
			WinGetTitle, c_Title, A
			WinGetClass, c_Class, A
			If (WTitle = 1)
				Window := c_Title
			If (WClass = 1)
				Window := Window " ahk_class " c_Class
			If ((WTitle = 0) && (WClass = 0))
				Window := "A"
		}
	}
}
KeyInsert:
Gui, chMacro:Default
If (Record = 1)
{
	If (TimedI = 1)
	{
		If (Interval := TimeRecord())
		{
			If (Interval > TDelay)
			GoSub, SleepInput
		}
		InputDelay := 0, WinDelay := 0
	}
	Else
		InputDelay := DelayG, WinDelay := DelayW
	If ((WClass = 1) || (WTitle = 1))
		WindowRecord(A_List, WinDelay)
}
Else
	InputDelay := DelayG
RowSelection := LV_GetCount("Selected")
If (Record || RowSelection = 0)
{
	LV_Add("Check Icon" IconsNames["keystroke"], ListCount%A_List%+1, tKey, sKey, 1, InputDelay, Type, Target, Window)
,	LV_Modify(ListCount%A_List%+1, "Vis")
}
Else
{
	RowNumber := 0
	Loop, %RowSelection%
	{
		RowNumber := LV_GetNext(RowNumber)
	,	LV_Insert(RowNumber, "Check Icon" IconsNames["keystroke"], RowNumber, tKey, sKey, 1, DelayG, Type, Target, Window)
	,	LVManager[A_List].InsertAtGroup(1, RowNumber)
	,	RowNumber++
	}
	LV_Modify(RowNumber, "Vis")
}
return

RecKeyUp:
If (!GetKeyState("RAlt", "P"))
	HoldRAlt := 0
If (Record = 0)
{
	Gui, 1:Submit, NoHide
	If (Capt = 0)
	{
		HotKey, %A_ThisHotKey%, RecKeyUp, Off
		return
	}
}
StringTrimLeft, sKey, A_ThisHotKey, 2
If (sKey = "VKC1SC730 Up")
	sKey := "/ Up"
Else If (sKey = "VKC2SC7E0 Up")
	sKey := ". Up"
ScK := GetKeySC(RegExReplace(sKey, " Up$"))
Hold%ScK% := 0, tKey := sKey, sKey := "{" sKey "}"
If (Record || ListFocus)
	GoSub, InsertRow
HotKey, %A_ThisHotKey%, RecKeyUp, Off
If (InStr(A_ThisHotKey, "Win"))
	Send, %sKey%
return

MouseRecord:
If (Moves = 1) && (MouseMove := MoveCheck())
{
	Action := MAction2, Details := MouseMove ", 0"
,	Type := cType3, Target := "", Window := ""
	GoSub, MouseAdd
}
If (!GetKeyState(RelKey, ToggleMode))
	RelHold := 0, Relative := ""
If (MScroll = 1)
{
	If (mScUp > 0 && A_TimeIdle > 50)
	{
		If (RecMouseCtrl = 1)
			Details := ClickOn(xPos, yPos, "WheelUp", Up)
		Else
			Details := "WheelUp, " Up
		Action := MAction5, Type := cType3
		GoSub, MouseInput
		mScUp := 0
	}
	If (mScDn > 0 && A_TimeIdle > 50)
	{
		If (RecMouseCtrl = 1)
			Details := ClickOn(xPos, yPos, "WheelDown", Dn)
		Else
			Details := "WheelDown, " Dn
		Action := MAction6, Type := cType3
		GoSub, MouseInput
		mScDn := 0
	}
}
return

Replace:
If (InStr(sKey, "_"))
	StringReplace, tKey, tKey, _, %A_Space%, All
If (InStr(tKey, "+"))
	StringReplace, sKey, tKey, +, Shift Down}{
If (InStr(tKey, "^"))
	StringReplace, sKey, tKey, ^, Control Down}{
If (InStr(tKey, "!"))
	StringReplace, sKey, tKey, !, Alt Down}{
If (InStr(sKey, "+"))
	StringReplace, sKey, sKey, +, Shift Down}{
If (InStr(sKey, "^"))
	StringReplace, sKey, sKey, ^, Control Down}{
If (InStr(sKey, "!"))
	StringReplace, sKey, sKey, !, Alt Down}{

If (InStr(sKey, "Alt Down"))
	sKey := sKey "}{Alt Up"
If (InStr(sKey, "Control Down"))
	sKey := sKey "}{Control Up"
If (InStr(sKey, "Shift Down"))
	sKey := sKey "}{Shift Up"

StringGetPos, pos, tKey, +
If (pos = 0)
	StringReplace, tKey, tKey, +, Shift +%A_Space%
If (InStr(tKey, "^"))
	StringReplace, tKey, tKey, ^, Control +%A_Space%
If (InStr(tKey, "!"))
	StringReplace, tKey, tKey, !, Alt +%A_Space%

If (InStr(tKey, "Numpad"))
	StringReplace, tKey, tKey, Numpad, Num%A_Space%
return

ChReplace:
Loop, 26
{
	Transform, Ch, Chr, %A_Index%
	StringReplace, sKey, sKey, %Ch%, % Chr(96+A_Index)
}
return

#If ((Record = 1) && (Mouse = 1) && (!A_IsPaused))
*~LButton::
	Critical
	; Send, {Blind}{LButton Down}
	CoordMode, Mouse, %CoordMouse%
	MouseGetPos,,, id, control
	WinGetClass, m_Class, ahk_id %id%
	If ((InStr(m_Class, "#32") > 1) && (m_Class != "Button")
	&& (id != PMCWinID) && (id != PrevID) && (id != PMCOSC))
		WinActivate, ahk_id %id%
	MouseGetPos, xPd, yPd
	Button := "Left"
,	Details := ClickOn(xPd, yPd, Button) ((RecMouseCtrl = 1) ? ", Down" : "Down")
,	Action := Button " " MAction3, Type := cType3
	GoSub, MouseInput
return
*~LButton Up::
	Critical
	; Send, {Blind}{LButton Up}
	CoordMode, Mouse, %CoordMouse%
	MouseGetPos, xPd, yPd
	Button := "Left"
,	Details := ClickOn(xPd, yPd, Button) ((RecMouseCtrl = 1) ? ", Up" : "Up")
,	Action := Button " " MAction3, Type := cType3
	GoSub, MouseInput
return
*~RButton::
	Critical
	; Send, {Blind}{RButton Down}
	CoordMode, Mouse, %CoordMouse%
	MouseGetPos,,, id, control
	WinGetClass, m_Class, ahk_id %id%
	If ((InStr(m_Class, "#32") > 1) && (m_Class != "Button")
	&& (id != PMCWinID) && (id != PrevID) && (id != PMCOSC))
		WinActivate, ahk_id %id%
	MouseGetPos, xPd, yPd
	Button := "Right"
,	Details := ClickOn(xPd, yPd, Button) ((RecMouseCtrl = 1) ? ", Down" : "Down")
,	Action := Button " " MAction3, Type := cType3
	GoSub, MouseInput
return
*~RButton Up::
	Critical
	; Send, {Blind}{RButton Up}
	CoordMode, Mouse, %CoordMouse%
	MouseGetPos, xPd, yPd
	Button := "Right"
,	Details := ClickOn(xPd, yPd, Button) ((RecMouseCtrl = 1) ? ", Up" : "Up")
,	Action := Button " " MAction3, Type := cType3
	GoSub, MouseInput
return
*~MButton::
	Critical
	; Send, {Blind}{MButton Down}
	CoordMode, Mouse, %CoordMouse%
	MouseGetPos,,, id, control
	WinGetClass, m_Class, ahk_id %id%
	If ((InStr(m_Class, "#32") > 1) && (m_Class != "Button")
	&& (id != PMCWinID) && (id != PrevID) && (id != PMCOSC))
		WinActivate, ahk_id %id%
	MouseGetPos, xPd, yPd
	Button := "Middle"
,	Details := ClickOn(xPd, yPd, Button) ((RecMouseCtrl = 1) ? ", Down" : "Down")
,	Action := Button " " MAction3, Type := cType3
	GoSub, MouseInput
return
*~MButton Up::
	Critical
	; Send, {Blind}{MButton Up}
	CoordMode, Mouse, %CoordMouse%
	MouseGetPos, xPd, yPd
	Button := "Middle"
,	Details := ClickOn(xPd, yPd, Button) ((RecMouseCtrl = 1) ? ", Up" : "Up")
,	Action := Button " " MAction3, Type := cType3
	GoSub, MouseInput
return
*~XButton1::
	Critical
	; Send, {Blind}{XButton1 Down}
	CoordMode, Mouse, %CoordMouse%
	MouseGetPos,,, id, control
	WinGetClass, m_Class, ahk_id %id%
	If ((InStr(m_Class, "#32") > 1) && (m_Class != "Button")
	&& (id != PMCWinID) && (id != PrevID) && (id != PMCOSC))
		WinActivate, ahk_id %id%
	MouseGetPos, xPd, yPd
	Button := "X1"
,	Details := ClickOn(xPd, yPd, Button) ((RecMouseCtrl = 1) ? ", Down" : "Down")
,	Action := Button " " MAction3, Type := cType3
	GoSub, MouseInput
return
*~XButton1 Up::
	Critical
	; Send, {Blind}{XButton1 Up}
	CoordMode, Mouse, %CoordMouse%
	MouseGetPos, xPd, yPd
	Button := "X1"
,	Details := ClickOn(xPd, yPd, Button) ((RecMouseCtrl = 1) ? ", Up" : "Up")
,	Action := Button " " MAction3, Type := cType3
	GoSub, MouseInput
return
*~XButton2::
	Critical
	; Send, {Blind}{XButton2 Down}
	CoordMode, Mouse, %CoordMouse%
	MouseGetPos,,, id, control
	WinGetClass, m_Class, ahk_id %id%
	If ((InStr(m_Class, "#32") > 1) && (m_Class != "Button")
	&& (id != PMCWinID) && (id != PrevID) && (id != PMCOSC))
		WinActivate, ahk_id %id%
	MouseGetPos, xPd, yPd
	Button := "X2"
,	Details := ClickOn(xPd, yPd, Button) ((RecMouseCtrl = 1) ? ", Down" : "Down")
,	Action := Button " " MAction3, Type := cType3
	GoSub, MouseInput
return
*~XButton2 Up::
	Critical
	; Send, {Blind}{XButton2 Up}
	CoordMode, Mouse, %CoordMouse%
	MouseGetPos, xPd, yPd
	Button := "X2"
,	Details := ClickOn(xPd, yPd, Button) ((RecMouseCtrl = 1) ? ", Up" : "Up")
,	Action := Button " " MAction3, Type := cType3
	GoSub, MouseInput
return
#If

MWUp:
mScUp++
return

MWDn:
mScDn++
return

MouseInput:
If (id = PMCOSC)
	return
Target := "", Window := ""
If ((RecMouseCtrl = 1) && (InStr(m_Class, "#32") > 1))
{
	If ((InStr(Details, "rel")) || (InStr(Details, "click")))
		Goto, MouseAdd
	CoordMode, Mouse, %CoordMouse%
	If (control != "")
	{
		ControlGetPos, x, y,,, %control%, A
		xcpos := Controlpos(xPd, x), ycpos := Controlpos(yPd, y)
	,	Details := RegExReplace(Details, "\d+, \d+ ")
		If (xcpos != "")
			Details .= " x" xcpos " y" ycpos " NA"
		Else
			Details .= " NA"
		Target := control
	}
	Else
	{
		Details := RegExReplace(Details, "\d+, \d+ ")
	,	Details .= " NA"
	,	Target := "x" xPd " y" yPd
	}
	Action := Button " " MAction1, Type := cType4
	WinGetTitle, c_Title, A
	WinGetClass, c_Class, A
	If (WTitle = 1)
		Window := c_Title
	If (WClass = 1)
		Window := Window " ahk_class " c_Class
	If ((WTitle = 0) && (WClass = 0))
		Window := "A"
}
MouseAdd:
Gui, chMacro:Default
If (TimedI = 1)
{
	If (Interval := TimeRecord())
	{
		If (Interval > TDelay)
		GoSub, SleepInput
	}
	RecDelay := 0, WinDelay := 0
}
Else
	RecDelay := DelayM, WinDelay := DelayW
If (!InStr(Details, "Up") && (Action != MAction2))
{
	If ((WClass = 1) || (WTitle = 1))
		WindowRecord(A_List, WinDelay)
}
LV_Add("Check", ListCount%A_List%+1, Action, Details, 1, RecDelay, Type, Target, Window)
return

SleepInput:
LV_Add("Check", ListCount%A_List%+1, "[Pause]", "", 1, Interval, cType5)
return

WindowRecord(ListID, WinDelay)
{
	global p_Title, p_Class, WTitle, WClass
	WinGetTitle, c_Title, A
	WinGetClass, c_Class, A
	If ((c_Class = "") && (c_Title = ""))
		return
	If (WTitle = 1)
	{
		Window := c_Title
		If (WClass = 1)
			Window := Window " ahk_class " c_Class
	}
	Else
	{
		If (WClass = 1)
			Window := "ahk_class " c_Class
	}
	If (c_Class = p_Class)
	{
		If (WTitle = 0)
			return
		Else
		{
			If (c_Title = p_Title)
				return
			Else
				LV_Add("Check", ListCount%ListID%+1, "WinActivate", "", 1, WinDelay, "WinActivate", "", Window)
		}
	}
	Else
		LV_Add("Check", ListCount%ListID%+1, "WinActivate", "", 1, WinDelay, "WinActivate", "", Window)
	p_Class := c_Class, p_Title := c_Title
}

ClickOn(xPos, yPos, Button, Click := "")
{
	global RelHold, LastPos, RelKey, Toggle
	If (RelHold = 1)
	{
		Loop, Parse, LastPos, /
			iPar%A_Index% := A_LoopField
		Relative := RelToLastPos(iPar1, iPar2, xPos, yPos)
	}
	LastPos := xPos "/" yPos
	If GetKeyState(RelKey, Toggle)
	{
		xPos := "Rel 0"
		yPos := 0
		RelHold := 1
	}
	If (Relative != "")
		Details := Relative " " Button ", " Click
	Else
		Details := xPos ", " yPos " " Button ", " Click
	return Details
}

RelToLastPos(lX, lY, cX, cY)
{
	cX -= lX
	cY -= lY
	return "Rel " cX "`, " cY
}

MoveCheck()
{
	global MDelay, LastPos, RelKey, Toggle, CoordMouse
	CoordMode, Mouse, %CoordMouse%
	MouseGetPos, xPos, yPos
	If (LastPos = xPos "/" yPos)
		return
	If (A_TimeIdle < MDelay)
		return
	If GetKeyState(RelKey, Toggle)
	{
		Loop, Parse, LastPos, /
			iPar%A_Index% := A_LoopField
		MovedPos := RelToLastPos(iPar1, iPar2, xPos, yPos)
	}
	Else
		MovedPos := xPos ", " yPos
	LastPos := xPos "/" yPos
	return MovedPos
}

TimeRecord()
{
	global LastTime
	static TimeCount
	TimeCount := A_TickCount - LastTime
,	LastTime := A_TickCount
	return TimeCount
}

Controlpos(z1, z2)
{
	return z1 - z2
}

