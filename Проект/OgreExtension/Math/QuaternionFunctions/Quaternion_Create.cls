SB0  u      Quaternion_Create   W     FLOAT   X     FLOAT   Y     FLOAT   Z     FLOAT   HQuaternion     HANDLE�  res     FLOAT�  
 )Function

Float parameter W, X, Y, Z

Handle HQuaternion

Float local res

HQuaternion := new()
res := VInsert(~HQuaternion, "Quaternion")
VSet(~HQuaternion, 0, "W", ~W)
VSet(~HQuaternion, 0, "X", ~X)
VSet(~HQuaternion, 0, "Y", ~Y)
VSet(~HQuaternion, 0, "Z", ~Z)

return HQuaternion ,      
 system.dbm E   �    z  Quaternion  �
             z  W    �           z  X   �           z  Y   �           z  Z   �   ��&  �   
 