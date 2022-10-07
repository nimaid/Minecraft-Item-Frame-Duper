#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

I_Icon = item_frame.ico
IfExist, %I_Icon%
Menu, Tray, Icon, %I_Icon%
;return

#MaxThreadsPerHotkey 3

TrayTip 6b6t Item Frame Duper, Press Ctrl+Z to start/stop the autoclicker!, 1

^z::
{
	Toggle := !Toggle
	
	If (Toggle)
	{
		TrayTip Script Running..., Duping has started! Press Ctrl+Z to stop., 1
		Click, Right
		Sleep 1000
		While, Toggle
		{
			Click
			Sleep 750
			Click, Right
			Sleep 250
		}
		TrayTip Script Done!, Duping has finished! Press Ctrl+Z to start again., 1
	}
}