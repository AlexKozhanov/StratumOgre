SB0  �      Vector_MultiplyR 	  HVector1     HANDLE   HVector2     HANDLE   HResult     HANDLE   x1     FLOAT�   y1     FLOAT�   z1     FLOAT�   x2     FLOAT�   y2     FLOAT�   z2     FLOAT�  
 pFunction

Handle parameter HVector1, HVector2, HResult

if(HVector1 && HVector2 && HResult)
  x1 := Vector_GetX(HVector1)
  y1 := Vector_GetY(HVector1)
  z1 := Vector_GetZ(HVector1)
  
  x2 := Vector_GetX(HVector2)
  y2 := Vector_GetY(HVector2)
  z2 := Vector_GetZ(HVector2)
  
  Vector_Set(HResult, z1*y2 - y1*z2, y1*x2 - x1*y2, x1*z2 - z1*x2)
  
endif <      
 system.dbm �        U   U o �    � Vector_GetX  ����
     � Vector_GetY  ����
     � Vector_GetZ  ����
    � Vector_GetX  ����
    � Vector_GetY  ����
    � Vector_GetZ  ����
                                     � Vector_Set   ��������     �{M  �   
 