SB0  �      RenderTexture   RenderTexture     HANDLE�   Name     STRING    Width   256 FLOAT    Height   256 FLOAT    create     FLOAT�  
 � HANDLE RenderTexture
STRING Name
FLOAT Width
FLOAT Height

float local create

if(!~create)
 RenderTexture := RenderTexture_Create(~Name , ~Width, ~Height)
 create := 1
endif 
  
 system.dbm      - 5  y      �          �?     �
-  �   
 