SB0  �      OgreMove  	 PositionZ     FLOAT�   MaxDist     FLOAT    Speed     FLOAT�  	 RotationX     FLOAT�  
 � FLOAT PositionZ
FLOAT MaxDist
FLOAT Speed

if(PositionZ > MaxDist)
  RotationX:= rad(180)
  Speed := -(~Speed)
endif

if(PositionZ < -200)
  RotationX:= rad(0)
  Speed := -~Speed
endif  

PositionZ:= ~PositionZ + ~Speed �  
 PEOPLE.DBM 4        8 5        �f@0     q             i@q : 5 ,          0     q               �|+  x   
 