SB0  �      PlayerCollision   Scene     HANDLE    Entity     HANDLE    Object     HANDLE�   RaycastResultCount     FLOAT�   CollisionRay     FLOAT�   Distance     FLOAT�   PlayerPositionX     FLOAT    PlayerPositionY     FLOAT    PlayerPositionZ     FLOAT    RayPositionX     FLOAT�   RayPositionY     FLOAT�   RayPositionZ     FLOAT�   mPosX     FLOAT    mPosY   0 FLOAT    mPosZ   0 FLOAT    DirX     FLOAT    DirY   0.5 FLOAT    DirZ     FLOAT    RenderWindow     HANDLE�   i     FLOAT�  
 \HANDLE Scene
HANDLE Entity
HANDLE Object

FLOAT RaycastResultCount
FLOAT CollisionRay
FLOAT Distance
FLOAT PlayerPositionX, PlayerPositionY, PlayerPositionZ
FLOAT RayPositionX, RayPositionY, RayPositionZ
FLOAT mPosX, mPosY, mPosZ
FLOAT DirX, DirY, DirZ

HANDLE local RenderWindow
FLOAT local i

RenderWindow:= RenderWindow_Get(0)
CollisionRay := 0
Distance :=-1
if( ~Entity && ~RenderWindow)
  Collision_Raycast(~Scene, ~PlayerPositionX + ~mPosX, ~PlayerPositionY + mPosY, ~PlayerPositionZ+mPosZ, ~DirX, ~DirY, ~DirZ)
  RaycastResultCount := Collision_GetResultCount();
    if(~RaycastResultCount != 0)
      Collision_Sort();
      i := 0
      while(~i< ~RaycastResultCount)
       Object := Collision_GetObject(~i)
       if(~Entity != ~Object)
        Distance := Collision_GetDistance(~i)
        CollisionRay := 1
        RayPositionX := ~PlayerPositionX + ~DirX * ~Distance
        RayPositionY := ~PlayerPositionY + ~DirY * ~Distance
        RayPositionZ := ~PlayerPositionZ + ~DirZ * ~Distance 
       endif 
       inc(~i)
      endwhile     
    endif
endif





 U  �                                �?q       U o �                         ��             7 5 � �               : 5 �   �      S 5 �   �         �?           	          
           � c3 K    ��',  *  
 