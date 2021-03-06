SB0  %      Collision_CursorRaycast   HRenderWindow     HANDLE  	 HViewport     HANDLE   HScene     HANDLE  
 cursorPosX     FLOAT   
 cursorPosY     FLOAT    windowWidth     FLOAT    windowHeight     FLOAT    rayPosX     FLOAT    rayPosY     FLOAT    rayPosZ     FLOAT    rayDirX     FLOAT    rayDirY     FLOAT    rayDirZ     FLOAT   
 Function

Handle parameter HRenderWindow, HViewport, HScene

if(HRenderWindow && HViewport && HScene)
  RenderWindow_GetCursorPosition(HRenderWindow, ~cursorPosX, ~cursorPosY)
  RenderWindow_GetSize(HRenderWindow, ~windowWidth, ~windowHeight)
  Viewport_GetRay(HViewport, ~cursorPosX / ~windowWidth, ~cursorPosY / ~windowHeight, ~rayPosX, ~rayPosY, ~rayPosZ, ~rayDirX, ~rayDirY, ~rayDirZ)
  Collision_Raycast(HScene, ~rayPosX, ~rayPosY, ~rayPosZ, ~rayDirX, ~rayDirY, ~rayDirZ)
  Collision_Sort()
endif
 \      
 system.dbm B        U   U o A    � �    � � !            � � �	 �
 � � 2       	  
     ��   Xx  v  
 