; -------------------------tooltip--------------------------------
show_tooltip(text) {
    Tooltip text, 640, 0
}

; example: SetTimer () => ToolTip(), -2000 ; timer expires in 2 seconds and tooltip disappears
SetTimer () => ToolTip(), -5000

; -------------------------keys--------------------------------
PressEscape(count) {
    loop, %count%{
        Sleep 500
        Send "Escape"
        Sleep 500
    }
}
