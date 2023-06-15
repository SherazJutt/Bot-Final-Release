Gui +hWndhMainWnd -MinimizeBox -MaximizeBox -DPIScale +E0x400 +Owner +0x1
Gui Font, s12 cBlack
Gui Add, Edit, hWndhEdtValue vEdtValue x16 y80 w330 h40 +Left +0x1
Gui Font
SendMessage 0x1501, 1, "Email",, ahk_id %hEdtValue% 
Gui Font, s20 w600 q5, Yu Gothic UI Semibold
Gui Add, Text, x0 y0 w366 h70 +0x200 +0x1, Login
Gui Font
Gui Font, s12 cBlack
Gui Add, Edit, hWndhPasswordField vPasswordField x16 y134 w330 h40 +Left +Password +0x1
Gui Font
SendMessage 0x1501, 1, "Password",, ahk_id %hPasswordField%
Gui Font, s14 Norm q4 cBlack
Gui Add, Button, x100 y192 w165 h45 gLoginButtonClicked, &Login
Gui Font

Gui Show, w368 h256, Authentication
Return

GuiEscape:
GuiClose:
ExitApp

LoginButtonClicked(){

    GuiControlGet, email, , EdtValue
    GuiControlGet, password, , PasswordField

    if (email = "" or password = "")
    {
        MsgBox, Please enter both email and password.
        return
    }else{
        http := ComObjCreate("WinHttp.WinHttpRequest.5.1")
        http.Open("POST", "http://127.0.0.1:8000/api/CheckUser")
        http.SetRequestHeader("Content-Type", "application/json")
        data := "{""email"":""" . email . """,""password"":""" . password . """}"
        http.Send(data)

        if (http.Status != 200) {
            MsgBox, % "Error: " . http.Status . " - " . http.StatusText
            Return
        }

        responseText := http.ResponseText
        jsonData := JSON.Load(responseText)

        if (!jsonData.HasKey("error")){
            ; MsgBox, % "Name: " . jsonData["name"]
            username := jsonData["name"]
            useremail := jsonData["email"]
            MsgBox, % username . "`n" . useremail 
            ExitApp
        }else if (jsonData.HasKey("error") && jsonData["error"] = "User not found"){
            MsgBox, % jsonData["error"]
            Return
        }else if (jsonData.HasKey("error") && jsonData["error"] = "Account already logged in on another device"){
            MsgBox, % jsonData["error"]
            Return
        }Else{
            MsgBox, Error
            Return
        }

        Gui, Destroy

    }
}

