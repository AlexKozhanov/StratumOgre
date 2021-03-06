SB0  �      Quaternion_FromAxisAngle   HQuaternion     HANDLE   x     FLOAT   y     FLOAT   z     FLOAT   angle     FLOAT  
 >Function

Handle parameter HQuaternion
Float  parameter x, y, z, angle

if(HQuaternion)
  VSet(HQuaternion, 0, "W", cos(angle/2))
  VSet(HQuaternion, 0, "X", x*sin(angle/2))
  VSet(HQuaternion, 0, "Y", y*sin(angle/2))
  VSet(HQuaternion, 0, "Z", z*sin(angle/2))
  
  Quaternion_Normalize(HQuaternion)
endif $      
 system.dbm p      o o             z  W           @  �            z  X             @   �            z  Y             @   �            z  Z             @   �   � Quaternion_Normalize   ��     �K'  �   
 