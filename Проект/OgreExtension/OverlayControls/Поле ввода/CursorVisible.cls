SB0  �      CursorVisible   Visible   1 FLOAT�   State     STRING    Started     FLOAT�   Start   1 FLOAT�   select     FLOAT   	 isVisible     FLOAT�     AnimationTimer  AnimationTimer     �{@      v@ 	         2D  � �                         Y@      Y@      Y@      Y@        E@�    
 
  ��    
 
   N          �{@      v@      @@      @@                      @@      @@    ,     �       �    AnimationTimer�%    
 
 ��o      
 system.dbm
 �float Visible
String State

if(Started)
  Started := 0
  SetVar("AnimationTimer","Start", 0)
endif

if(GetVarF("AnimationTimer", "TickEvent"))
  Visible:=-~Visible
endif


if(Start )
SetVar("AnimationTimer","Start", 1)
SetVar("AnimationTimer","Rate", 500)
    Started := 1
    Start:=0
endif

 



if(~Visible==1 && (~select==1))
  isVisible:=1
  else
  isVisible:=0
endif

     
 system.dbm �     5              z  AnimationTimer  z  Start          �z  AnimationTimer  z  TickEvent �5 9    q      5 u z  AnimationTimer  z  Start        �?�z  AnimationTimer  z  Rate        @@�       �?                       �?6          �?6 + 5 �        �?  3 �               ���!  �   	 �  
 