SB0  �      CollisionObj   Scene     HANDLE    Viewport     HANDLE    RenderWindow     HANDLE    RaycastResultCount     FLOAT�   LBM     FLOAT    click     FLOAT�  
 cursorPosX     FLOAT   
 cursorPosY     FLOAT    windowWidth     FLOAT    windowHeight     FLOAT    PosX     FLOAT    PosY     FLOAT    PosZ     FLOAT    DirX     FLOAT    DirY     FLOAT    DirZ     FLOAT    i     FLOAT�   Object     HANDLE�   Distance     FLOAT�  	 PositionX     FLOAT�  	 PositionY     FLOAT�  	 PositionZ     FLOAT�  
 �HANDLE Scene
HANDLE Viewport 
HANDLE RenderWindow
FLOAT RaycastResultCount
FLOAT LBM
FLOAT click

click := 0
if(~Viewport)
 RenderWindow_GetCursorPosition(RenderWindow, ~cursorPosX, ~cursorPosY)
 RenderWindow_GetSize(RenderWindow, ~windowWidth, ~windowHeight)
 Viewport_GetRay(~Viewport, ~cursorPosX / ~windowWidth, ~cursorPosY / ~windowHeight, ~PosX, ~PosY, ~PosZ, ~DirX, ~DirY, ~DirZ)
 Collision_Raycast(~Scene, ~PosX, ~PosY, ~PosZ, ~DirX, ~DirY, ~DirZ)
 Collision_Sort();
 RaycastResultCount := Collision_GetResultCount();
    if(~RaycastResultCount != 0)  
      i:=~RaycastResultCount
      while(~i>0)   
       click := 0   
       if(~LBM)
          click := 1
          Object := Collision_GetObject(i)
          Distance := Collision_GetDistance(i)
          PositionX := ~PosX + ~DirX * ~Distance
          PositionY := ~PosY + ~DirY * ~Distance
          PositionZ := ~PosZ + ~DirZ * ~Distance 
       endif 
       dec(~i)
      endwhile    
    endif 
endif





   
 PEOPLE.DBM �                o �   � �   � �	 !          	  �
 � � � � � 2    
           ���             7 5 �                8 5 �              5 �        �?    �    �   
                             � e3 S    �+  4  
 