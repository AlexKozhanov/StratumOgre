SB0  '      WaterDropSwitch   click     FLOAT    isWaterDrop     FLOAT�  
 � FLOAT click
FLOAT isWaterDrop

if(~click)
  if(~isWaterDrop)
    isWaterDrop:=0
  else
    isWaterDrop:=1
  endif
endif
     
 system.dbm       5    5             3         �?     V�-  O   
 