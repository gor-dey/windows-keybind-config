; --- БОКОВЫЕ КНОПКИ МЫШИ (Ugreen M571P) ---
; Логика: Ближняя (X1) = Право/Вниз, Дальняя (X2) = Лево/Вверх

; 1. ГЛОБАЛЬНО: Обычное нажатие всегда переключает рабочие столы
XButton1::Send("^#{Right}") ; Ближняя
XButton2::Send("^#{Left}")  ; Дальняя

; 2. ГЛОБАЛЬНО: Win + Alt + Дальняя -> Блокировка (Win + L)
#!XButton2::DllCall("LockWorkStation")

; 2. VS CODE и ZED: Специфичные действия через Ctrl (ПОМЕНЯЛИ МЕСТАМИ)
#HotIf WinActive("ahk_exe Code.exe") || WinActive("ahk_exe zed.exe")
    ^XButton1::Send("^!b")  ; Ctrl + Ближняя -> AI Chat / Панель
    ^XButton2::Send("^j")   ; Ctrl + Дальняя  -> Терминал
#HotIf

; 4. БРАУЗЕРЫ (Chrome, Edge, Vivaldi, Firefox)
#HotIf WinActive("ahk_exe chrome.exe") || WinActive("ahk_exe msedge.exe") || WinActive("ahk_exe vivaldi.exe") || WinActive("ahk_exe firefox.exe")
    ^XButton1::Send("^+j")  ; Ctrl + Ближняя -> Console (Ctrl+Shift+J)
    ^XButton2::Send("^+j")  ; Ctrl + Ближняя -> Console (Ctrl+Shift+J)
#HotIf
