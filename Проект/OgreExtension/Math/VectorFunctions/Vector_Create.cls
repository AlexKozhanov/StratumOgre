SB0  �      Vector_Create   X     FLOAT   Y     FLOAT   Z     FLOAT   HVector     HANDLE�  res     FLOAT�  
 � Function

Float parameter X, Y, Z

Handle HVector

Float local res

HVector := new()
res := VInsert(HVector, "Vector")

VSet(HVector, 0, "X", ~X)
VSet(HVector, 0, "Y", ~Y)
VSet(HVector, 0, "Z", ~Z)

return HVector $      
 system.dbm 6   �    z  Vector  �
             z  X    �           z  Y   �           z  Z   �   8TF  ~   
 