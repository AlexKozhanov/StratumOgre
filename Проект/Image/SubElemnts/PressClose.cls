SB0  �     
 PressClose   Click     FLOAT   	 isVisible     FLOAT�   Name     STRING    ButName     STRING�   HName     STRING�  
 � FLOAT Click
FLOAT isVisible
STRING Name
STRING ButName
STRING HName

ButName:= ~Name + "BClose"
HName:= ~Name + "Header"

if(~Click)
  isVisible := 0
endif   
 system.dbm "   y  z  BClose  | {  y  z  Header  | {     5 !               �z-  �   
 