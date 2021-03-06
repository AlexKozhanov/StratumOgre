SB0        Quaternion_FromVectors   HQuaternion     HANDLE   HVector1     HANDLE   HVector2     HANDLE   hCross     HANDLE�   w     FLOAT�   x     FLOAT�   y     FLOAT�   z     FLOAT�  
 �Function

Handle parameter HQuaternion, HVector1, HVector2 

if(HVector1 && HVector2 && HQuaternion)
  hCross := Vector_Create(0,0,0)
  Vector_MultiplyL(HVector1, HVector2, hCross)
  Quaternion_Set(HQuaternion, Vector_DotProduct(HVector1, HVector2), Vector_GetX(hCross), Vector_GetY(hCross), Vector_GetZ(hCross))
  Quaternion_Normalize(HQuaternion)
  
  w := Quaternion_GetW(HQuaternion)
  x := Quaternion_GetX(HQuaternion)
  y := Quaternion_GetY(HQuaternion)
  z := Quaternion_GetZ(HQuaternion)
  
  w := w + 1
  
  if(w <= 0.0000001)
    if(sqr(Vector_GetZ(HVector1)) > sqr(Vector_GetX(HVector1)))
      Quaternion_Set(HQuaternion, w, 0, Vector_GetZ(HVector1), -Vector_GetY(HVector1))
    else
      Quaternion_Set(HQuaternion, w, Vector_GetY(HVector1), -Vector_GetX(HVector1), 0)
    endif
  else
    Quaternion_Set(HQuaternion, w, x, y, z)
    Quaternion_Normalize(HQuaternion)
  endif
  
  Delete(~hCross)
endif 0      
 system.dbm �      U    U o �                           � Vector_Create  ��������        �	 Vector_MultiplyL   ������         �	 Vector_DotProduct  ������  � Vector_GetX  ����  � Vector_GetY  ����  � Vector_GetZ  ����� Quaternion_Set   ����������     � Quaternion_Normalize   ��     � Quaternion_GetW  ����
     � Quaternion_GetX  ����
     � Quaternion_GetY  ����
     � Quaternion_GetZ  ����
           �? 
        ���z>; 5 �  � Vector_GetZ  ����#   � Vector_GetX  ����# 8 5 L                � Vector_GetZ  ����  � Vector_GetY  ����q � Quaternion_Set   ����������  3 �       � Vector_GetY  ����  � Vector_GetX  ����q          � Quaternion_Set   ����������  3 �           � Quaternion_Set   ����������     � Quaternion_Normalize   ��    �   wXZ  �   
 