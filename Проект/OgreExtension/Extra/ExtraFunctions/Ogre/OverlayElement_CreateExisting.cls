SB0  �      OverlayElement_CreateExisting   OverlayElementName     STRING  	 PositionX     FLOAT  	 PositionY     FLOAT   Width     FLOAT   Height     FLOAT  	 IsVisible     FLOAT   hOverlayElement     HANDLE� 
 �Function

String parameter OverlayElementName
Float  parameter PositionX, PositionY, Width, Height, IsVisible

hOverlayElement := Overlayelement_Get(OverlayElementName)
if(~hOverlayElement!=#0)
  OverlayElement_SetPosition(~hOverlayElement, PositionX, PositionY)
  OverlayElement_SetSize(~hOverlayElement, Width, Height)
  OverlayElement_SetVisible(~hOverlayElement, IsVisible)
endif

return hOverlayElement ,     
 system.dbm !   x   �         S 5         �      �    �   �e�  �   
 