;#Requires AutoHotkey v2.0

;; ИСПОЛЬЗУЕМ ПОЛНЫЕ HKL (Handle to Keyboard Layout)
;; Формат: младшее слово - язык, старшее - раскладка.
;; Для стандартных: 0x04090409 (US) и 0x04190419 (RU)
;EN := 0x4090409
;RU := 0x4190419

;~LCtrl Up:: {
;    if (A_PriorKey = "LControl") {
;        SetLayout(RU)
;    }
;}

;~RCtrl Up:: {
;    if (A_PriorKey = "RControl") {
;        SetLayout(EN)
;    }
;}

;SetLayout(LayoutID) {
;    ; Получаем HWND активного окна
;    hwnd := WinActive("A")
;    if !hwnd
;        return

;    ; Получаем фокус внутри окна (ClassNN, например "Edit1")
;    focus := ControlGetFocus(hwnd)

;    if focus {
;        ; Если есть фокус на поле ввода, шлем сообщение именно ему.
;        ; Синтаксис: PostMessage(Msg, wParam, lParam, Control, WinTitle)
;        try PostMessage(0x50, 0, LayoutID, focus, hwnd)
;    } else {
;        ; Если фокуса нет, шлем в само окно
;        try PostMessage(0x50, 0, LayoutID,, hwnd)
;    }
;}

#Requires AutoHotkey v2.0

; Полные коды раскладок
EN := 0x4090409  ; Английский (US)
RU := 0x4190419  ; Русский

; --- Левый Shift -> Английский ---
~LShift Up:: {
    ; Проверка A_PriorKey критически важна!
    ; Если вы нажали Shift + A (чтобы напечатать "А"), то A_PriorKey будет "a".
    ; Смена языка произойдет, ТОЛЬКО если вы нажали и отпустили Shift ОДИНОЧНО.
    if (A_PriorKey = "LShift") {
        SetLayout(RU)
    }
}

; --- Правый Shift -> Русский ---
~RShift Up:: {
    ; То же самое для правого шифта
    if (A_PriorKey = "RShift") {
        SetLayout(EN)
    }
}

SetLayout(LayoutID) {
    hwnd := WinActive("A")
    if !hwnd
        return

    focus := ControlGetFocus(hwnd)
    if focus {
        try PostMessage(0x50, 0, LayoutID, focus, hwnd)
    } else {
        try PostMessage(0x50, 0, LayoutID,, hwnd)
    }
}
