#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

sleep, 3000

loop,
{
    colorClickDelay(582, 1056, 0x00B592, "Enter")
    colorClickDelay(1871, 1370, 0xFFFFFF, "x")
    ;MsgBox This is the 1-parameter method. Commas (,) do not need to be escaped.
    colorClickDelay(1975, 457, 0xF2F2F2, "Enter")
    loop, 100 
    {
        PixelGetColor, col, 2750, 1772,rgb
        if (col == 0xFFFFFF)
        {
            buyAuction()
            Break
        }
        Else
        {
            sleep, 10
        }
    }
    leaveAuction()
    sleep, 250
    send, {Esc}
    sleep, 1000
    ;MsgBox, Exited 
}

buyAuction()
{
    send, y
    sleep, 250
    send, s
    sleep, 250
    send, {Enter}
    sleep, 250
    send, {Enter}
    sleep, 6000
    send, {Enter}
    sleep, 250
    send, Esc

}

leaveAuction()
{
    sleep, 100
    send, {Esc}
}

colorClickDelay(x, y, c, key)
{
    loop, 100
    { 
        PixelGetColor, col, x, y,rgb
        if (col == c)
        {
            send, {%key%}
            Return
        }
        Else
        {
            sleep, 10
        }
    }
    MsgBox "Failed to click %key%"
}

colorClick(x, y, c, key)
{
    PixelGetColor, col, x, y,rgb
    if (col == c)
    {
        send, {%key%}
    }
}

colorAuctionBuy(x, y, c)
{
    loop, 100
    { 
        PixelGetColor, col, x, y,rgb
        if (col == c)
        {
            send, {y}
            Return
        }
        Else
        {
            sleep, 10
        }
    }
    send, {Esc}
}

;loop,
;{ PixelGetColor, col, 1312, 1155,rgb
;    if (col == 0x00B793)
;    {
;        send, {Enter}
;        sleep, 250
;        send, {Esc}
;    }
;   Else
;    {
;        sleep, 10
;    }
; }

q::ExitApp ; Exit script with Q key


;2018, 1428