SB0  �      Collision_SpaceCursorRayCast   HRenderWindow     HANDLE   HSpace     HANDLE  	 HViewport     HANDLE   HScene     HANDLE   res     FLOAT�  
 cursorPosX     FLOAT�  
 cursorPosY     FLOAT�   rayPosX     FLOAT   rayPosY     FLOAT   rayPosZ     FLOAT   rayDirX     FLOAT   rayDirY     FLOAT   rayDirZ     FLOAT   windowWidth     FLOAT   windowHeight     FLOAT  
 _Function

Handle parameter HRenderWindow, HSpace, HViewport, HScene

Float local res, cursorPosX, cursorPosY, rayPosX, rayPosY, rayPosZ, rayDirX, rayDirY, rayDirZ, windowWidth, windowHeight

if(HRenderWindow && HViewport && HScene)
  if(HSpace)
    res := GetMousePos(GetWindowName(HSpace), ~cursorPosX, ~cursorPosY)
    cursorPosX := ~cursorPosX - GetSpaceOrg2dX(HSpace)
    cursorPosY := ~cursorPosY - GetSpaceOrg2dY(HSpace)
  else
    RenderWindow_GetCursorPosition(HRenderWindow, ~cursorPosX, ~cursorPosY)
  endif
  RenderWindow_GetSize(HRenderWindow, ~windowWidth, ~windowHeight)
  Viewport_GetRay(HViewport, ~cursorPosX / ~windowWidth, ~cursorPosY / ~windowHeight, ~rayPosX, ~rayPosY, ~rayPosZ, ~rayDirX, ~rayDirY, ~rayDirZ)
  Collision_Raycast(HScene, ~rayPosX, ~rayPosY, ~rayPosZ, ~rayDirX, ~rayDirY, ~rayDirZ)
  Collision_Sort()
endif
 h      
 system.dbm b        U   U o a   o *   � � � � 
      V 
      U 
  3 1    � �    � � !            � � �	 �
 � � 2       	  
     ��   �]H   �  
 