SB0        Buttons4NameGen   Name     STRING   	 PanelName     STRING�   UpName     STRING�   DownName     STRING�   LeftName     STRING�  	 RightName     STRING�   upY     FLOAT�   downY     FLOAT�   leftX     FLOAT�   rightX     FLOAT�   sizeXY     FLOAT�  
  STRING Name
STRING PanelName
STRING UpName, DownName, LeftName, RightName
PanelName := "Panel" + ~Name

UpName := "BUp" + ~Name
DownName := "BDownp" + ~Name
LeftName := "BLeft" + ~Name
RightName := "BRight" + ~Name
upY:= -50
downY := 50
leftX := -50
rightX := 50
sizeXY := 40 
 system.dbm Y   z  Panel y   | {  z  BUp y   | {  z  BDownp  y   | {  z  BLeft y   | {  z  BRight  y   | {         I@q          I@         I@q          I@ 	        D@ 
    ��(,  #  
 