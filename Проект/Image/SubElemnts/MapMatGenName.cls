SB0        MapMatGenName   TextureName     STRING    MaterialName     STRING�  	 PanelName     STRING�   OverlaylName     STRING�   l_create     FLOAT  
 � STRING TextureName
STRING MaterialName
STRING PanelName
STRING OverlaylName

float local l_create

if(!l_create)
  MaterialName:= ~TextureName + "Mat"
  PanelName:= ~TextureName + "Panel"
  OverlaylName:= ~TextureName + "Overlay"
endif 
 system.dbm $     - 5 # y   z  Mat | {  y   z  Panel | {  y   z  Overlay | {     X -  �   
 