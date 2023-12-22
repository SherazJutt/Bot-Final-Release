#Requires AutoHotkey >=2.0 64-bit

#SingleInstance Force
SetWorkingDir A_InitialWorkingDir
SetTitleMatchMode 2
#WinActivateForce
SetControlDelay 1
SetWinDelay 0
SetKeyDelay 0
SetMouseDelay -1


myObject := { "name": "John", "age": 30, "city": "New York" }

MsgBox % "Name: " . myObject.name

; Exit the Script
ExitApp
Esc:: ExitApp
