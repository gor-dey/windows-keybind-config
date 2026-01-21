;#HotIf
#Requires AutoHotkey v2.0
#SingleInstance Force
InstallKeybdHook
A_MenuMaskKey := "vkE8" ; Подавляет меню Пуск при использовании модификаторов

; --- ЛОГИКА CAPS LOCK (TAP vs HOLD) ---
*CapsLock:: {
    start := A_TickCount
    KeyWait "CapsLock"
    duration := A_TickCount - start

    ; Если нажали коротко (менее 200мс) — переключаем Caps
    if (duration < 200) {
        state := GetKeyState("CapsLock", "T")
        SetCapsLockState(state ? "AlwaysOff" : "AlwaysOn")
    }
}

; --- ГЛОБАЛЬНАЯ НАВИГАЦИЯ (CapsLock удерживается) ---
#HotIf GetKeyState("CapsLock", "P")
    Left::Send("{Home}")
    Right::Send("{End}")
    Up::Send("^{Home}")
    Down::Send("^{End}")

    +Left::Send("+{Home}")
    +Right::Send("+{End}")
    +Up::Send("^+{Home}")
    +Down::Send("^+{End}")

    Backspace::Send("+{Home}{Backspace}")
#HotIf
