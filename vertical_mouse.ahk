; --- КОНФИГУРАЦИЯ ГРУПП (Списки процессов) ---
; Редакторы кода
GroupAdd("Editors", "ahk_exe Code.exe")
GroupAdd("Editors", "ahk_exe zed.exe")

; Браузеры
GroupAdd("Browsers", "ahk_exe chrome.exe")
GroupAdd("Browsers", "ahk_exe vivaldi.exe")
GroupAdd("Browsers", "ahk_exe msedge.exe")
GroupAdd("Browsers", "ahk_exe firefox.exe")

; --- БОКОВЫЕ КНОПКИ МЫШИ (Ugreen M571P) ---
; Логика: Ближняя (X1) = Право/Вниз, Дальняя (X2) = Лево/Вверх

; 1. ГЛОБАЛЬНО: Обычное нажатие — рабочие столы
*XButton1::Send("^#{Left}")
*XButton2::Send("^#{Right}")

; 2. ГЛОБАЛЬНО: Win + Alt + Кнопка -> Блокировка (#! = Win + Alt)
#!XButton1::DllCall("LockWorkStation")
#!XButton2::DllCall("LockWorkStation")

; 3. РЕДАКТОРЫ (VS Code + Zed)
#HotIf WinActive("ahk_group Editors")
    ^XButton1::Send("^!b")  ; Ctrl + Ближняя -> AI Chat
    ^XButton2::Send("^j")   ; Ctrl + Дальняя  -> Терминал
#HotIf

; 4. БРАУЗЕРЫ
#HotIf WinActive("ahk_group Browsers")
    ^XButton1::Send("^+m")  ; Ctrl + Ближняя -> Mobile View
    ^XButton2::Send("{F12}") ; Ctrl + Дальняя  -> Toggle DevTools
#HotIf
