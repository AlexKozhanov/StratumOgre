SB0  G      Vector_DotProduct   HVector1     HANDLE   HVector2     HANDLE   result     FLOAT� 
 � Function

Handle parameter HVector1, HVector2

if(HVector1 && HVector2)
  result :=  Vector_GetX(HVector1)*Vector_GetX(HVector2) + Vector_GetY(HVector1)*Vector_GetY(HVector2) + Vector_GetZ(HVector1)*Vector_GetZ(HVector2)
  return result
endif       
 system.dbm ]        U o \    � Vector_GetX  ����  � Vector_GetX  ����    � Vector_GetY  ����  � Vector_GetY  ����     � Vector_GetZ  ����  � Vector_GetZ  ����  
     �VZ  j   
 