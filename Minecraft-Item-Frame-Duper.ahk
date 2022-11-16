#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

I_Icon = item_frame.ico
IfExist, %I_Icon%
Menu, Tray, Icon, %I_Icon%
;return

#MaxThreadsPerHotkey 3

TrayTip 6b6t Item Frame Duper, Press Ctrl+Z to start/stop the autoclicker! (Add shift for fast dupe mode.)

^z::

	If (ToggleFast)
	{
		return
	}
	
	ToggleSlow := !ToggleSlow
	
	If (ToggleSlow)
	{
		TrayTip Script Running..., Duping (slow) has started! Press Ctrl+Z to stop.
		Click, Right
		Sleep 2000
		While, ToggleSlow
		{
			Click
			Sleep 1000
			If (!ToggleSlow)
				break
			Click, Right
			Sleep 750
			If (!ToggleSlow)
				break
			Click, Right
			Sleep 250
		}
		TrayTip Script Done!, Duping (slow) has finished! Press Ctrl+Z to start again.
	}
return

^+z::

	If (ToggleSlow)
	{
		return
	}
	
	ToggleFast := !ToggleFast
	
	If (ToggleFast)
	{
		TrayTip Script Running..., Duping (fast) has started! Press Ctrl+Shift+Z to stop.
		Send {rbutton down}
		While, ToggleFast
		{
			Sleep 600
			if (ToggleFast)
			{
				Click
			}
		}
		Send {rbutton up}
		TrayTip Script Done!, Duping (fast) has finished! Press Ctrl+Shift+Z to start again.
	}
return

