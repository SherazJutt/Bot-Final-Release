auth_gui:
    Gui +hWndhMainWnd -MinimizeBox -MaximizeBox -DPIScale +E0x400 +Owner +0x1
    Gui Font, s12 cBlack
    Gui Add, Edit, hWndhEdtValue vEdtValue x16 y80 w330 h40 +Left +0x1
    Gui Font
    Gui Font, s20 w600 q5, Yu Gothic UI Semibold
    Gui Add, Text, x0 y0 w366 h70 +0x200 +0x1, Login
    Gui Font
    Gui Font, s12 cBlack
    Gui Add, Edit, hWndhPasswordField vPasswordField x16 y134 w330 h40 +Left +Password +0x1
    Gui Font
    Gui Font, s14 Norm q4 cBlack
    Gui Add, Button, vloginBtn x100 y192 w165 h45 gLoginButtonClicked, &Login
    Gui Font

    ; Set default values for email and password fields
    GuiControl, ,EdtValue , sheraz@gmail.com
    GuiControl, ,PasswordField , 123

    Gui Show, w368 h256, Authentication
Return

LoginButtonClicked(){

    GuiControlGet, useremail, , EdtValue
    GuiControlGet, userpassword, , PasswordField
    GuiControl, Disabled, loginBtn
    if (useremail = "" or userpassword = "")
    {
        MsgBox, Please enter both email and password.
        return
    }

    http := ComObjCreate("WinHttp.WinHttpRequest.5.1")
    ; http.Open("POST", "http://localhost:3000/loginUser")
    http.Open("POST", "https://bot-api-one.vercel.app/loginUser")
    http.SetRequestHeader("Content-Type", "application/json")

    ; Construct the JSON data
    data := "{""email"":""" . useremail . """,""password"":""" . userpassword . """}"

    http.Send(data)

    ; Parse the JSON response
    responseText := http.ResponseText
    jsonData := JSON.Load(responseText)

    ; Check for the "success" key in the response
    if (jsonData.HasKey("success")) {
        userinfo := jsonData.success.userinfo
        userId := userinfo.userId
    } else if (jsonData.HasKey("error")) {
        MsgBox, % "Error: " . jsonData.error
        GuiControl, Enable, loginBtn
        Return
    } else {
        MsgBox, Unexpected Error Please Send Us Feedback
        ExitApp
    }

    Gui, Destroy
    Gosub, main_gui
}

