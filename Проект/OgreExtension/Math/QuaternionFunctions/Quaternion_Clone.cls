SB0  �      Quaternion_Clone   HQuaternion     HANDLE   HClone     HANDLE�  res     FLOAT�  
 bFunction

Handle parameter HQuaternion

if(HQuaternion)
  HClone := new()
  res := VInsert(HClone, "Quaternion")
  
  VSet(HClone, 0, "W", VGetF(HQuaternion, 0, "W"))
  VSet(HClone, 0, "X", VGetF(HQuaternion, 0, "X"))
  VSet(HClone, 0, "Y", VGetF(HQuaternion, 0, "Y"))
  VSet(HClone, 0, "Z", VGetF(HQuaternion, 0, "Z"))
endif

return HClone       
 system.dbm m      o l �    z  Quaternion  �
             z  W             z  W ��           z  X             z  X ��           z  Y             z  Y ��           z  Z             z  Z ��   �~)  g   
 