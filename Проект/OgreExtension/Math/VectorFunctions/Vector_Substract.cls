SB0  �      Vector_Substract   hVector1     HANDLE   hVector2     HANDLE   hVectorResult     HANDLE  
 Function

Handle parameter hVector1, hVector2, hVectorResult

if(hVector1 && hVector2 && hVectorResult)
  Vector_Set(hVectorResult, Vector_GetX(hVector1) - Vector_GetX(hVector2), Vector_GetY(hVector1) - Vector_GetY(hVector2), Vector_GetZ(hVector1) - Vector_GetZ(hVector2))
endif       
 system.dbm l        U   U o k      � Vector_GetX  ����  � Vector_GetX  ����    � Vector_GetY  ����  � Vector_GetY  ����    � Vector_GetZ  ����  � Vector_GetZ  ���� � Vector_Set   ��������     �Q  q   
 