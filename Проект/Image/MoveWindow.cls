SB0  �     
 MoveWindow 	 	 PositionX     FLOAT�  	 PositionY     FLOAT�  
 PositionX2     FLOAT   
 PositionY2     FLOAT    MouseX     FLOAT    MouseY     FLOAT    LMBDown     FLOAT   
 PrewMouseX     FLOAT�  
 PrewMouseY     FLOAT�  
 NFLOAT PositionX
FLOAT PositionY

FLOAT PositionX2
FLOAT PositionY2

FLOAT MouseX
FLOAT MouseY
FLOAT LMBDown

FLOAT PrewMouseX
FLOAT PrewMouseY

if(~LMBDown)
  PositionX := ~PositionX + (~MouseX - ~PrewMouseX)
  PositionY := ~PositionY + (~MouseY - ~PrewMouseY)
endif

PrewMouseX := ~MouseX
PrewMouseY := ~MouseY  
   
 system.dbm !     5                                   (w
-  �   
 