; CONFIG
KeyToPress = Space 		; 
Interval = 30000   		; In milliseconds

#MaxThreadsPerHotkey 100
F12::
	toggle := !toggle
	
	ToolTip ; remove previous tooltip if any
	If (toggle)
	{
   		IntervalInSeconds := Floor(Interval / 1000)
		ToolTip, Engaged with key %KeyToPress% and Interval of %IntervalInSeconds% seconds, 0, 0 
	} Else
	{
		ToolTip, Disengaged, 0, 0 
		
	}
	SetTimer, RemoveToolTip, -1500

	While True
	{
		If (!toggle)
		{
			Break
		}

		If (WinActive("ahk_class [Paste window class here]"))
		{
			Send, {%KeyToPress% down}
			Sleep, 100
			Send, {%KeyToPress% up}
		}

		Sleep, %Interval%
	}
Return

F11::
	WinGetClass, WinClass, A
	Clipboard := WinClass
Return

RemoveTooltip:
ToolTip
Return 