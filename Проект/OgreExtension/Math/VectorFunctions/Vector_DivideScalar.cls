SB0        Vector_DivideScalar   HVector     HANDLE   Value     FLOAT   HResult     HANDLE  
 � Function

Handle parameter HVector
Float  parameter Value
Handle parameter HResult

if(HVector && HResult)
  Vector_Set(HResult, Vector_GetX(HVector)/Value, Vector_GetY(HVector)/Value, Vector_GetZ(HVector)/Value)
endif       
 system.dbm H        U o G      � Vector_GetX  ����      � Vector_GetY  ����      � Vector_GetZ  ����   � Vector_Set   ��������     �TR  i   
 