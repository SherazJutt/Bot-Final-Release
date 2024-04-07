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

#Include, %A_ScriptDir%\src\libs\ScriptGuards.ahk

; run as admin if not running as admin
CommandLine := DllCall("GetCommandLine", "Str")
If !(A_IsAdmin || RegExMatch(CommandLine, " /restart(?!\S)")) {
    Try {
        If (A_IsCompiled) {
            Run *RunAs "%A_ScriptFullPath%" /restart
        } Else {
            Run *RunAs "%A_AhkPath%" /restart "%A_ScriptFullPath%"
        }
    }
    ExitApp
}
; set tooltip coords screen base instead of focused window
CoordMode, ToolTip, Screen

t1:=A_TickCount, X:=Y:=""

script_start:
    t1:=A_TickCount, X:=Y:=""

    Sleep, 1000

    start_game()
    Sleep, 5000

    If (StuckOnGlLogo()) {
        Goto, script_start
    }

    If (StuckOnLoadingScreen()) {
        Goto, script_start
    }
main_menu_loaded_check_start:

    If (!MainMenuLoadedCheck()) {
        Goto, script_start
    }

    Sleep, 3000

    If (!SeasonalEvents()) {
        Goto, script_start
    }

    ; <======================== Showcase Start ==============================>
    If (!EnterEventsTab()) {
        Goto, main_menu_loaded_check_start
    }

    Sleep, 2000

    Loop, 2{
        Send, {Enter}
        Sleep, 1000
    }
RaceScreen:
    If (!isRaceScreen()){
        Goto, script_start
    }

    ; click on race button
    Click, 1177, 643 Left, 1
    Sleep, 2500

    ; checking if car is refueling
    If (LockedOrRefueling()){
        Click, 1199, 633 Left, 1
        Sleep, 2500
        Click, 740, 515 Left, 1
        Sleep, 2000
    }

PlayButton:

    if(!ClickOnPlayButton()){
        Goto, script_start
    }

    Text:="|<>*133$302.003zs007s007kTsDzzkzzzzs000w3zs03zkDz0T000Q000Tk07k00Dy001y001w7y3zzsDzzzy000D0zs00Dw1zk7k0070007s00Q001zU00TU00T1zUzzy3zzzzU003kDw001z0Ts3w001k001w003000Ts007s007kTsDzzUzzzzs000w3z000Dk7w0z000Q000S000kTs3y3zzy3zzw7y3zzsDzzzy000D0zU003w1z0Tk007000700047zUzUzzzUzzz1zUzzy3zzzzzU3zkDs0w0T0TUDw0zzzk1zk0k11zsDsDzzsDzzkTsDzzUzzzzzw1zw3y0zk7k7k7z0Tzzy1zw1zUETy3y3zzy3zzw7y3zzsDzzzzz0Tz0zUTw1w1s1zk7zzzUTz0zs07zUzUzzzUzzz1zUzzy3zzzzzk7zkDs7z0T0S0zw1zzzs7zkDy01zsDsDzzsDzzkTsDzzUzzzzzw1zw3y1zk7k70Tz0Tzzy1zw3zUETy3y3zzy3zzw7y3zzsDzzzzz0Tz0zUTw1w1k7zk7zzzUTz0zzw7zUzUzzzUzzz1zUzzy3zzzzzk7zkDs7zUz0M3zw1zzzs7zk7zz1zsDsDzzsDzzkTsDzzUzzzzzw1zw3y1zzzk41zz0Tzzy1zw0zzkTy3y3zzy3zzw7y3zzsDzzzzz0Tz0zUTzzw00zzk00TzUTz00Dw7zUzU01zUzzz1zUzzy3zzzzzk7zkDs7zzz00Dzw007zs7zk00T1zkDs00Ts00TkTsDzzUzzzzzw1zw3y1zzzk03zz001zy1zy001k007y007y007w7y3zzsDzzzzz0Tz0zUTzzw00Tzk00TzUTzk00A001zU01zU01z1zUzzy3zzzzzk7zkDs7zzz003zw007zs7zy001000zsDzzs00TkTsDzzUzzzzzw1zw3y1zzzk00zz001zy1zzw00E00zy3zzy3zzw7y3zzsDzzzzz0Tz0zUTzzw007zk7zzzUTzzw007sDzUzzzUzzz1zUzzy3zzzzzk7zkDs7zzz060zw1zzzs7zzzw01y3zsDzzsDzzkTsDzzUzzzzzw1zw3y1zk7k3UDz0Tzzy1zzzzU0TkTy3zzy3zzw7y3zzsDzzzzz0Tz0zUTw1w1w1zk7zzzUTz0zw07w3zUzzzUzzz1zUzzy3zzzzzk7zkDs7z0T0TUTw1zzzs7zkDz01z0zsDzzsDzzkTsDzzUzzzzzw1zw3y1zk7k7s3z0Tzzy1zw3zk0Ts7y3zzy3zzw7y3zzsDzzzzz0Tz0zUTw1w1z0Tk7zzzUTz0Ts07z1zUzzzUzzz1zUzzy3zzzzzk7zkDs3y0T0Tk7w1zzzs7zk7w01zkTsDzzsDzzkTsDzzUzzzzzw1zw3y000Dk7y0z000Ty1zw0000Tw3y001y3zzw7y001s007zzz0Tz0zk003w1zk7k007zUTzU0047zUzU00TUzzz1zU00S001zzzk7zkDw001z0Tw1w001zs7zs0011zs7s007sDzzkTs007U00Tzzw1zw3zU00zk7zUD000Ty1zz000kTz1y001y3zzw7y001s007zzz0Tz0zw00Tw1zw3k007zUTzw00yDzsTk00zlzzzXzk00z003zzzsDzsTzy1zzVzzky003zwDzzw3zU"

    if (ok:=FindText(X:="wait", Y:=5, 430, 169, 755, 224, 0, 0, Text)){
        Sleep, 1000
        Click, 360, 507 Left, 1
        Sleep, 1000
        PressEscape(1)
        Goto,PlayButton
    }

    If (!PlayRace()){
        Goto, script_start
    }

    Loop, 60{

        Text:="|<>*119$69.zz01y03zk7zzzw0Dk0zz0zzzzk1y0Dzw7zz0S0Ts1k7Us0s1k3z0C0Q7070C0Qs3k3Us0s1k3b0S0Q7070C0ww3k00s0s1k73US007070C0sQ3k00zyw3k73US007zrzw1sS3k00zyzz0C1kS00707zk1kC3k00s0sC0TzsS0Q7071s3zz3k3Us0s70TzsS0Q7070w7U71k3Us0s3Uw0wC0w7070S703VzzUzzs1ks0Q7zs7zz0DD03kTy0zzU"
        if (!ok:=FindText(X, Y, 1046, 638, 1123, 667, 0, 0, Text)) {

            Click, 1183, 634 Left, 1

            Text:="|<>*149$38.3y0703Xzw1s1tzzUS0wzzs7UTD0D1sDXU3kS3ks0w7VsC0D1sy3U3kSD0s0w7bUC0D1vk3U3kTw0s0w7zUC0D1zs3U3kTj0s0w7nsC0D1sS3U3kS3ks0w7UyC0D1s7Xk3kS0wy3s7UDbzy1s1tzz0S0D7z0703s"
            if (ok:=FindText(X, Y, 611, 600, 670, 645, 0, 0, Text)){
                PressEscape(1)
            }

        }Else{
            Break
        }
        Sleep, 1000
    }

    If (isRaceScreen()){
        Goto, RaceScreen
    }Else{
        Goto, script_start
    }

; <======================== Showcase Ended ==============================>

script_ended:

    MsgBox, Ended

ExitApp
^p:: Pause
^q::
    SoundGet, isMuted, , MUTE
    if (isMuted = "on") {
        SoundSet, +1, , Mute
    }
ExitApp

; common functions
#Include, %A_ScriptDir%\src\functions\CommonFunctions.ahk
#Include, %A_ScriptDir%\src\functions\Events.ahk
#Include, %A_ScriptDir%\src\functions\LegendPassShowCase.ahk
#Include, %A_ScriptDir%\src\functions\PlayRace.ahk

; libs
#Include, %A_ScriptDir%\src\libs\JSON.ahk
#Include, %A_ScriptDir%\src\libs\FindText.ahk