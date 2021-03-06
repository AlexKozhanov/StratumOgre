SB0  �      Quaternion_Equal   HQuaternion1     HANDLE   HQuaternion2     HANDLE   Equal     FLOAT�  w1     FLOAT�   x1     FLOAT�   y1     FLOAT�   z1     FLOAT�   w2     FLOAT�   x2     FLOAT�   y2     FLOAT�   z2     FLOAT�  
 �Function
Handle parameter HQuaternion1, HQuaternion2

Equal := HQuaternion1 == HQuaternion2
if(!Equal)
  if(HQuaternion1 && HQuaternion2)
    w1 := Round(Quaternion_GetW(~HQuaternion1), 3)
    x1 := Round(Quaternion_GetX(~HQuaternion1), 3)
    y1 := Round(Quaternion_GetY(~HQuaternion1), 3)
    z1 := Round(Quaternion_GetZ(~HQuaternion1), 3)
    
    w2 := Round(Quaternion_GetW(~HQuaternion2), 3)
    x2 := Round(Quaternion_GetX(~HQuaternion2), 3)
    y2 := Round(Quaternion_GetY(~HQuaternion2), 3)
    z2 := Round(Quaternion_GetZ(~HQuaternion2), 3)
  endif
  
  Equal := ~w1 == ~w2 && ~x1 == ~x2 && ~y1 == ~y2 && ~z1 == ~z2
endif

return Equal P      
 system.dbm �        R 
    - 5 �      U o �    � Quaternion_GetW  ����       @) 
     � Quaternion_GetX  ����       @) 
     � Quaternion_GetY  ����       @) 
     � Quaternion_GetZ  ����       @) 
    � Quaternion_GetW  ����       @) 
    � Quaternion_GetX  ����       @) 
    � Quaternion_GetY  ����       @) 
 	   � Quaternion_GetZ  ����       @) 
 
     6     6 +    	 6 +    
 6 + 
     wO0    
 