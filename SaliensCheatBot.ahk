SendMode Input  ;

MoveTheMouseToPixel()
{		
	PixelSearch, PiexelXpos, PiexelYpos, minShotZone_x, minShotZone_y, maxShotZone_x, maxShotZone_y, 0xD58B33, 20, Fast
	
	if !ErrorLevel
	{
		TargetX := PiexelXpos +2
		TargetY := PiexelYpos +15
		MouseMove,TargetX,TargetY
		Return 1
	}
	else
	{
		Return 0
	}
	Return 0
}


MsgBox, 
(
Hello, 
For spawm shoot clic press [CTRL+A].
For use bot go on a planet them press [CTRL+O].
For stop script press [Escape] key.
)
^A::
	while (GetKeyState(^A, "P"))
	Random, CheatValue, 0.04, 0.1
	Sleep CheatValue
	Click
	send, 1
	send, 2
	send, 3
	send, 4
		
Return
^O::
	Global MouseDelay := 1000
	Global NetDelay := 6000
	
	MsgBox, Press ok, them clic at the bottom left of Saliens game
	KeyWait, LButton, D
	MouseGetPos, PosX, PosY 
	Global SaliensGameMin_x := PosX
	Global SaliensGameMin_y := PosY

	MsgBox, Press ok, them clic at the top right of Saliens game
	KeyWait, LButton, D
	MouseGetPos, PosX, PosY 
	Global SaliensGameMax_x := PosX
	Global SaliensGameMax_y := PosY

	Global ContinueButton_x := ((SaliensGameMax_x - SaliensGameMin_x) * 0.5) + SaliensGameMin_x
	Global ContinueButton_y := ((SaliensGameMax_y - SaliensGameMin_y) * 0.35) + SaliensGameMin_y
	
	
	Global minShotZone_x := 608 ;((SaliensGameMax_x - SaliensGameMin_x) * 0.258) + SaliensGameMin_x
	Global minShotZone_y := 324 ;((SaliensGameMax_y - SaliensGameMin_y) * 0.041) + SaliensGameMin_y
	Global maxShotZone_x := 1552 ;((SaliensGameMax_x - SaliensGameMin_x) * 0.983) + SaliensGameMin_x
	Global maxShotZone_y := 811 ;((SaliensGameMax_y - SaliensGameMin_y) * 0.713) + SaliensGameMin_y

	MsgBox, Press ok, them to finish move the mouse over target area and press S key 
	KeyWait, S, D	
	MouseGetPos, ZonePosX, ZonePosY 
	global TargetZoneX := ZonePosX
	global TargetZoneY := ZonePosY


	Global SafeMouse_x := SaliensGameMax_x
	Global SafeMouse_y := SaliensGameMax_y




	MsgBox, Press ok for start cheat bot (>'O')> (Dont forget, for stop script press Escape key !)
	loop
	{
		;Menu
		
		MouseMove,SafeMouse_x,SafeMouse_y
		Sleep MouseDelay 
		MouseMove,TargetZoneX,TargetZoneY
		Sleep MouseDelay
		Click
		Click
		
		;Game
		
		Sleep 8000 ;Wait for startGame
		start := A_TickCount
		while (A_TickCount-start <= 119000)
		{
			Random, CheatValue, 0.04, 0.1
			Sleep CheatValue
			if (MoveTheMouseToPixel() = 1)
			{
				Click
				send, 1
				send, 2
				send, 3
				send, 4
				send, 5
			}
		}	
		
		
		;Continue button	
		
		Sleep NetDelay
		MouseMove,SafeMouse_x,SafeMouse_y
		Sleep MouseDelay
		MouseMove,ContinueButton_x,ContinueButton_y 
		Sleep MouseDelay
		Click
		Sleep NetDelay

	}
Return

Esc::  
	MsgBox, Bot stopped and script exit
	ExitApp
Return
