#Requires AutoHotKey >=2.0
#SingleInstance Force

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
    CapsLock-Esc to turn off screen
*/
CapsLock & Esc:: {
    Sleep(1000)
    SendMessage(0x112, 0xF170, 2, , "Program Manager")
}

/*
    CapsLock-b to toggle window borders
*/
Capslock & b:: {
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
    Komorebi
*/
Komorebic(cmd) {
    RunWait("C:\Program Files\komorebi\bin\komorebic.exe " cmd, , "Hide")
}

PowerShell(cmd) {
    RunWait("PowerShell.exe -Command `"" cmd "`"", , "Hide")
}

#HotIf GetKeyState("CapsLock", "P")
; Focus windows
h:: Komorebic("focus left")
j:: Komorebic("focus down")
k:: Komorebic("focus up")
l:: Komorebic("focus right")
[:: Komorebic("cycle-focus previous")
]:: Komorebic("cycle-focus next")

; Move windows
+h:: Komorebic("move left")
+j:: Komorebic("move down")
+k:: Komorebic("move up")
+l:: Komorebic("move right")
+Enter:: Komorebic("promote")

; Stack windows
Left:: Komorebic("stack left")
Down:: Komorebic("stack down")
Up:: Komorebic("stack up")
Right:: Komorebic("stack right")
`;:: Komorebic("unstack")
u:: Komorebic("cycle-stack previous")
i:: Komorebic("cycle-stack next")

; Resize windows
=:: Komorebic("resize-axis horizontal increase")
-:: Komorebic("resize-axis horizontal decrease")
+=:: Komorebic("resize-axis vertical increase")
+_:: Komorebic("resize-axis vertical decrease")

; Manipulate windows
q:: Komorebic("close")
t:: Komorebic("toggle-float")
m:: Komorebic("minimize")
.:: Komorebic("toggle-maximize")
,:: Komorebic("toggle-monocle")
r:: Komorebic("retile")

; Workspaces
1::
Numpad1:: Komorebic("focus-workspace 0")
2::
Numpad2:: Komorebic("focus-workspace 1")
3::
Numpad3:: Komorebic("focus-workspace 2")
4::
Numpad4:: Komorebic("focus-workspace 3")
5::
Numpad5:: Komorebic("focus-workspace 4")
6::
Numpad6:: Komorebic("focus-workspace 5")
7::
Numpad7:: Komorebic("focus-workspace 6")
8::
Numpad8:: Komorebic("focus-workspace 7")
9::
Numpad9:: Komorebic("focus-workspace 8")
0::
Numpad0:: Komorebic("focus-workspace 9")

; Move windows across workspaces
+1::
+NumPad1:: Komorebic("move-to-workspace 0")
+2::
+NumPad2:: Komorebic("move-to-workspace 1")
+3::
+NumPad3:: Komorebic("move-to-workspace 2")
+4::
+NumPad4:: Komorebic("move-to-workspace 3")
+5::
+NumPad5:: Komorebic("move-to-workspace 4")
+6::
+NumPad6:: Komorebic("move-to-workspace 5")
+7::
+NumPad7:: Komorebic("move-to-workspace 6")
+8::
+NumPad8:: Komorebic("move-to-workspace 7")
+9::
+NumPad9:: Komorebic("move-to-workspace 8")
+0::
+NumPad0:: Komorebic("move-to-workspace 9")

; Komorebi bar
\:: StartKomorebiBar()
+\:: StopKomorebiBar()
`:: StartKomorebi()
+`:: StopKomorebi()
#HotIf

StartKomorebi() {
    StopKomorebi()
    Komorebic("start")
}

StopKomorebi() {
    Komorebic("stop")
}

StartKomorebiBar() {
    StopKomorebiBar()
    ; PowerShell("Start-Process 'C:\Program Files\komorebi\bin\komorebi-bar.exe' -WindowStyle hidden")
    PowerShell("Start-Process 'C:\Program Files (x86)\hitokage\bin\hitokage.exe' -WindowStyle hidden")
}

StopKomorebiBar() {
    ; PowerShell("Stop-Process -Name:komorebi-bar -ErrorAction SilentlyContinue")
    PowerShell("Stop-Process -Name:hitokage -ErrorAction SilentlyContinue")
}

