SB0        Quaternion_MultiplyVector   HVector     HANDLE   HQuaternion     HANDLE   hVectorQuaternion     HANDLE�   hInverseQuaternion     HANDLE�   hResultQuaternion     HANDLE�  
 �Function

Handle parameter HVector, HQuaternion

if(HQuaternion && HVector)
  hVectorQuaternion := Quaternion_Create(0, Vector_GetX(HVector), Vector_GetY(HVector), Vector_GetZ(HVector))
  hInverseQuaternion := Quaternion_Create(1,0,0,0)
  hResultQuaternion := Quaternion_Create(1,0,0,0)
  
  Quaternion_Invert(HQuaternion, hInverseQuaternion)
  
  Quaternion_Multiply(hVectorQuaternion, hInverseQuaternion, hResultQuaternion)
  Quaternion_Multiply(HQuaternion, hResultQuaternion, hResultQuaternion)
  
  Vector_Set(HVector, Quaternion_GetX(hResultQuaternion), Quaternion_GetY(hResultQuaternion), Quaternion_GetZ(hResultQuaternion))
  
  Delete(hResultQuaternion)
  Delete(hInverseQuaternion)
  Delete(hVectorQuaternion)
endif
       
 system.dbm        U o             � Vector_GetX  ����   � Vector_GetY  ����   � Vector_GetZ  �����	 Quaternion_Create  ����������         �?                           �	 Quaternion_Create  ����������         �?                           �	 Quaternion_Create  ����������      �	 Quaternion_Invert  ����        �
 Quaternion_Multiply  ������        �
 Quaternion_Multiply  ������       � Quaternion_GetX  ����  � Quaternion_GetY  ����  � Quaternion_GetZ  ����� Vector_Set   ��������    �  �  �   �RF  �   
 