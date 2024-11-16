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
[:: Komorebic("cycle-workspace previous")
]:: Komorebic("cycle-workspace next")

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
f:: Komorebic("toggle-float")
m:: Komorebic("toggle-maximize")
n:: Komorebic("toggle-monocle")
r:: Komorebic("retile")
g:: Komorebic("manage")
+g:: Komorebic("unmanage")

; Adjust layout
+[:: {
    Komorebic("adjust-container-padding increase 3")
    Komorebic("adjust-workspace-padding increase 3")
}
+]:: {
    Komorebic("adjust-container-padding decrease 3")
    Komorebic("adjust-workspace-padding decrease 3")
}

; Focus monitors
o:: Komorebic("cycle-monitor previous")
p:: Komorebic("cycle-monitor next")
+o:: Komorebic("cycle-move-to-monitor previous")
+p:: Komorebic("cycle-move-to-monitor next")

; Komorebi bar
\:: StartKomorebiBar()
+\:: StopKomorebiBar()
`:: StartKomorebi()
+`:: StopKomorebi()

; Debug
F5:: Komorebic("gui")

; CapsLock-b to toggle window borders
b:: {
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

; Workspaces
1::
Numpad1:: Komorebic("focus-monitor-workspace 0 0")
2::
Numpad2:: Komorebic("focus-monitor-workspace 0 1")
3::
Numpad3:: Komorebic("focus-monitor-workspace 0 2")
4::
Numpad4:: Komorebic("focus-monitor-workspace 0 3")
5::
Numpad5:: Komorebic("focus-monitor-workspace 0 4")
6::
Numpad6:: Komorebic("focus-monitor-workspace 0 5")
7::
Numpad7:: Komorebic("focus-monitor-workspace 0 6")
8::
Numpad8:: Komorebic("focus-monitor-workspace 0 7")
9::
Numpad9:: Komorebic("focus-monitor-workspace 0 8")
0::
Numpad0:: Komorebic("focus-monitor-workspace 0 9")

; Move windows across workspaces
+1::
+NumPad1:: Komorebic("move-to-monitor-workspace 0 0")
+2::
+NumPad2:: Komorebic("move-to-monitor-workspace 0 1")
+3::
+NumPad3:: Komorebic("move-to-monitor-workspace 0 2")
+4::
+NumPad4:: Komorebic("move-to-monitor-workspace 0 3")
+5::
+NumPad5:: Komorebic("move-to-monitor-workspace 0 4")
+6::
+NumPad6:: Komorebic("move-to-monitor-workspace 0 5")
+7::
+NumPad7:: Komorebic("move-to-monitor-workspace 0 6")
+8::
+NumPad8:: Komorebic("move-to-monitor-workspace 0 7")
+9::
+NumPad9:: Komorebic("move-to-monitor-workspace 0 8")
+0::
+NumPad0:: Komorebic("move-to-monitor-workspace 0 9")

; Secondary monitor
a:: {
    ; input of Length 1, Timeout 5 seconds; esc to cancel
    input := InputHook("L1 T5", "{Esc}")
    input.Start()
    input.Wait()

    switch (input.Input) {
        case "1":
            Komorebic("focus-monitor-workspace 1 0")
        case "2":
            Komorebic("focus-monitor-workspace 1 1")
        case "3":
            Komorebic("focus-monitor-workspace 1 2")
        case "4":
            Komorebic("focus-monitor-workspace 1 3")
        case "5":
            Komorebic("focus-monitor-workspace 1 4")
        case "6":
            Komorebic("focus-monitor-workspace 1 5")
        case "7":
            Komorebic("focus-monitor-workspace 1 6")
        case "8":
            Komorebic("focus-monitor-workspace 1 7")
        case "9":
            Komorebic("focus-monitor-workspace 1 8")
        case "0":
            Komorebic("focus-monitor-workspace 1 9")
    }
}

+a:: {
    ; input of Length 1, Timeout 5 seconds; esc to cancel
    input := InputHook("L1 T5", "{Esc}")
    input.Start()
    input.Wait()

    switch (input.Input) {
        case "1":
            Komorebic("move-to-monitor-workspace 1 0")
        case "2":
            Komorebic("move-to-monitor-workspace 1 1")
        case "3":
            Komorebic("move-to-monitor-workspace 1 2")
        case "4":
            Komorebic("move-to-monitor-workspace 1 3")
        case "5":
            Komorebic("move-to-monitor-workspace 1 4")
        case "6":
            Komorebic("move-to-monitor-workspace 1 5")
        case "7":
            Komorebic("move-to-monitor-workspace 1 6")
        case "8":
            Komorebic("move-to-monitor-workspace 1 7")
        case "9":
            Komorebic("move-to-monitor-workspace 1 8")
        case "0":
            Komorebic("move-to-monitor-workspace 1 9")
    }
}
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

