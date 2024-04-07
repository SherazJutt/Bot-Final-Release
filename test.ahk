#NoEnv
#SingleInstance Force
SetWorkingDir %A_ScriptDir%
CoordMode , Mouse, Screen
SendMode Input
SetTitleMatchMode 2
#WinActivateForce
SetControlDelay 1
SetWinDelay 0
SetKeyDelay 0
SetMouseDelay -1
SetBatchLines -1

Sleep, 5000

Loop, 1000 {
    Sleep, 1000
    Click, 1218, 620 Left, 1
    Sleep, 1000
}

Run, shutdown.exe /s /t 0