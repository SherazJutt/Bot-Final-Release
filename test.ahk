AppName := "Asphalt9_gdk_x64_rtl.exe" ; The process name

if (PID := ProcessExist(AppName))
    MsgBox "Notepad exists and has the Process ID " PID "."
else
    MsgBox "Notepad does not exist."