SB0  �      SliderNameGen   Name     STRING   	 PanelName     STRING�  
 SliderName     STRING�   AreaTextName     STRING�  
 � STRING Name
STRING PanelName

STRING SliderName, AreaTextName

PanelName := "Panel" + ~Name

SliderName := "Slider" + ~Name
AreaTextName := "AreaText" + ~Name
 
 system.dbm "   z  Panel y   | {  z  Slider  y   | {  z  AreaText  y   | {     q�(,  �   
 