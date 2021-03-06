SB0  :      Quaternion_GetAngleX   HQuaternion     HANDLE   AngleX     FLOAT�  w     FLOAT�   x     FLOAT�   y     FLOAT�   z     FLOAT�  
 �Function

Handle parameter HQuaternion
Float  AngleX

Float  local w, x, y, z

if(HQuaternion)
  w := VGetF(~HQuaternion, 0, "W")
  x := VGetF(~HQuaternion, 0, "X")
  y := VGetF(~HQuaternion, 0, "Y")
  z := VGetF(~HQuaternion, 0, "Z")
  
  //http://en.wikipedia.org/wiki/Conversion_between_quaternions_and_Euler_angles
  AngleX := atan2(2*(~w*~x + ~y*~z), 1-2*(sqr(~x) + sqr(~y)))
endif

return AngleX ,      
 system.dbm h      o g             z  W �
              z  X �
              z  Y �
              z  Z �
          @                   �?        @  #   #    � atan2  ������
     su-  �   
 