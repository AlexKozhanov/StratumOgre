SB0  �      Quaternion_Normalize   HQuaternion     HANDLE   n     FLOAT�   qw     FLOAT�   qx     FLOAT�   qy     FLOAT�   qz     FLOAT�  
 �Function

Handle parameter HQuaternion

Float local n, qw, qx, qy, qz

if(~HQuaternion)
  qw := VGetF(~HQuaternion, 0, "W")
  qx := VGetF(~HQuaternion, 0, "X")
  qy := VGetF(~HQuaternion, 0, "Y")
  qz := VGetF(~HQuaternion, 0, "Z")
  
  n := 1 / sqrt(sqr(~qw) + sqr(~qx) + sqr(~qy) + sqr(~qz))
  
  VSet(~HQuaternion, 0, "W", ~qw * ~n)
  VSet(~HQuaternion, 0, "X", ~qx * ~n)
  VSet(~HQuaternion, 0, "Y", ~qy * ~n)
  VSet(~HQuaternion, 0, "Z", ~qz * ~n)
endif ,      
 system.dbm �      o �             z  W �
              z  X �
              z  Y �
              z  Z �
         �?  #   #    #    #  "  
              z  W      �            z  X      �            z  Y      �            z  Z      �   /M'  �   
 