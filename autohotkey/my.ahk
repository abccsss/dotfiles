#Requires AutoHotKey >=2.0

/*
    Win-Esc to stop script
*/
#Esc:: {
    result := MsgBox("Terminate AutoHotKey script?", , 0x24)
    if (result = "Yes") {
        ExitApp()
    }
}

/*
    Win-q to toggle window borders
    To specify windows, use #HotIf
*/
#q:: {
    ; No active window
    if (WinGetProcessName("A") = "explorer.exe" && WinGetClass("A") != "CabinetWClass")
        return

    WinGetPos(&x, &y, &w, &h, "A")
    style := WinGetStyle("A")

    if (style & 0x400000) {                       ; has caption
        WinSetStyle("-0x440000", "A")             ; caption and resize box
        WinMove(x + 10, y, w - 20, h - 10, "A")
    } else {
        WinSetStyle("+0x440000", "A")
        WinMove(x - 10, y, w + 20, h + 10, "A")
    }
}

/*
    Win-c to centre window
*/
#c:: {
    ; No active window
    if (WinGetProcessName("A") = "explorer.exe" && WinGetClass("A") != "CabinetWClass")
        return

    WinGetPos(, , &w, &h, "A")
    WinMove((A_ScreenWidth - w) // 2, (A_ScreenHeight - h) // 2, , , "A")
}

/*
    Win-f to focus certain windows
*/
#f:: {
    ; input of Length 1, Timeout 1 second; esc to cancel
    input := InputHook("L1 T1", "{Esc}")
    input.Start()
    input.Wait()

    switch (input.Input) {
        ; Firefox
        case "f":
            WinTryActivate("ahk_exe firefox.exe")
                || Run("firefox.exe")

        ; LaTeX workspace
        case "l":
            WinTryActivate("ahk_exe sioyek.exe")
            WinTryActivate("ahk_exe neovide.exe")

        ; Terminal
        case "t":
            WinTryActivate("ahk_exe alacritty.exe")
                || WinTryActivate("ahk_exe WindowsTerminal.exe")
                || Run('"C:\Program Files\Alacritty\alacritty.exe"')
    }
}

WinTryActivate(title) {
    ; Some windows create a second HWND when minimized,
    ; and the false HWND will stay on top.
    ; Filter out the false HWND by checking the window class.
    for window in WinGetList(title) {
        if WinGetClass(window) != "Winit Thread Event Target" {
            WinActivate(window)
            return window
        }
    }

    return false
}

/*
    Win-Tab to activate PowerToys Run to switch windows
*/
#Tab:: Send("!{Space}<{Space}")

