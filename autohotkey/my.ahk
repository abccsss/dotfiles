#Requires AutoHotKey >=2.0

SetCapsLockState("AlwaysOff")

/*
    CapsLock as Esc
*/
*CapsLock:: Esc

/*
    Ctrl-CapsLock as CapsLock
*/
^CapsLock:: CapsLock

/*
    CapsLock-Esc to sleep
*/
CapsLock & Esc:: {
    DllCall("PowrProf\SetSuspendState", "int", 0, "int", 0, "int", 0)
}

/*
    CapsLock-q to toggle window borders
*/
Capslock & q:: {
    ; No active window
    if (!WinExist("A") || (WinGetProcessName() = "explorer.exe" && WinGetClass() != "CabinetWClass"))
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
    CapsLock-c to centre window
*/
Capslock & c:: {
    ; No active window
    if (!WinExist("A") || (WinGetProcessName() = "explorer.exe" && WinGetClass() != "CabinetWClass"))
        return

    ; Skip if maximized or minimized
    if (WinGetMinMax("A") != 0)
        return

    WinGetPos(, , &w, &h, "A")
    WinMove((A_ScreenWidth - w) // 2, Max(0, A_ScreenHeight - h) // 2 - 20, , , "A")
}

/*
    CapsLock-f to focus certain windows,
    eg CapsLock-f f to focus Firefox
*/
Capslock & f:: {
    ; input of Length 1, Timeout 5 seconds; esc to cancel
    input := InputHook("L1 T5", "{Esc}")
    input.Start()
    input.Wait()

    switch (input.Input) {
        ; VS Code
        case "c":
            WinTryActivate("ahk_exe Code.exe")

        ; Firefox
        case "f":
            WinTryActivate("ahk_exe firefox.exe")
                || Run("firefox.exe")

        ; LaTeX workspace
        case "l":
            WinTryActivate("ahk_exe sioyek.exe")
            WinTryActivate("ahk_exe neovide.exe")
        case "L":
            WinMinimizeAll()
            WinTryActivate("ahk_exe sioyek.exe")
            WinTryActivate("ahk_exe neovide.exe")

        ; Mail
        case "m":
            WinTryActivate("ahk_exe thunderbird.exe")

        ; Terminal
        case "t":
            WinTryActivate("ahk_exe alacritty.exe")
                || Run("alacritty.exe")
        case "T":
            WinMinimizeAll()
            WinTryActivate("ahk_exe alacritty.exe")
                || Run("alacritty.exe")
        
        ; Zotero
        case "z":
            WinTryActivate("ahk_exe zotero.exe")
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
    CapsLock-Space to activate PowerToys Run
*/
Capslock & Space:: !Space

/*
    CapsLock-Tab to activate PowerToys Run to switch windows
*/
Capslock & Tab:: {
    Send("!{Space}")
    if (WinWaitActive("ahk_exe PowerToys.PowerLauncher.exe", , 1))
        SendText("< ")
}

/*
    CapsLock-Up and CapsLock-Down to maximize/restore/minimize
    CapsLock-Left and CapsLock-Right as Win-Left and Win-Right
*/
CapsLock & Up:: WinExist("A") && (WinGetMinMax("A") = -1 ? WinRestore("A") : WinMaximize("A"))
CapsLock & Down:: WinExist("A") && (WinGetMinMax("A") = 1 ? WinRestore("A") : WinMinimize("A"))
CapsLock & Left:: Send("#{Left}")
CapsLock & Right:: Send("#{Right}")

