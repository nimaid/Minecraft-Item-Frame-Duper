#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

I_Icon = item_frame.ico
IfExist, %I_Icon%
Menu, Tray, Icon, %I_Icon%
;return

#MaxThreadsPerHotkey 3

TrayTip 6b6t Item Frame Duper, Press Ctrl+Z to start/stop the autoclicker!

^z::
{
	Toggle := !Toggle
	
	If (Toggle)
	{
		TrayTip Script Running..., Duping has started! Press Ctrl+Z to stop.
		Click, Right
		Sleep 2000
		While, Toggle
		{
			Click
			Sleep 1000
			If (!Toggle)
				break
			Click, Right
			Sleep 1900
			If (!Toggle)
				break
			Click, Right
			Sleep 100
		}
		TrayTip Script Done!, Duping has finished! Press Ctrl+Z to start again.
	}
}