start_game() {
    AppName := "Asphalt9_gdk_x64_rtl.exe"  ; The process name

    ; Check if the process is running and get its PID
    if (ProcessExist(AppName)) {
        ; close the process if it's running
        ProcessClose(AppName)
    }

    Sleep(1000)

    ; Run the application (if needed, uncomment and provide the correct path)
    Run("`"AsphaltLegendsUnite`" " A_ScriptDir)

    Sleep(3000)
    ; Wait until the game is closed and show a tooltip
    Tooltip "Waiting for Game to start "

    while (!ProcessExist(AppName)) {
        Sleep(500)  ; Check every 500ms if the process is not running
    }

    Tooltip "Game started "

    Sleep(3000)

    for window in WinGetList() {
        ; Match window PID with the running process PID
        ToolTip "Window PID: " . WinGetPID(window) . "`nRunning process PID: " . ProcessExist(AppName)
        if (WinGetPID(window) = ProcessExist(AppName)) {
            ; Get the window title
            gameWindowTitle := WinGetTitle(window)
            ; MsgBox window
            ; Tooltip "window title: " gameWindowTitle
            ; gameWindowId := WinGetID(window)
            ; MsgBox gameWindowId

            ; Activate the window of the running process
            WinActivate(window)
            ; Restore the window if it is minimized
            WinRestore(window)
            Sleep(3000)
            ; Resize the window to 1280x720 and move it to (0, 0) => (top left) on the screen
            WinMove(0, 0, 1280, 720, gameWindowTitle)
            ; MsgBox "The active window is '" WinGetTitle(window) "'."
            break  ; Exit the loop after activating, restoring, and resizing the window
        }
    }
}
