SB0  :      Quaternion_GetAngleZ   HQuaternion     HANDLE   AngleZ     FLOAT�  w     FLOAT�   x     FLOAT�   y     FLOAT�   z     FLOAT�  
 �Function

Handle parameter HQuaternion
Float  AngleZ

Float  local w, x, y, z

if(HQuaternion)
  w := VGetF(~HQuaternion, 0, "W")
  x := VGetF(~HQuaternion, 0, "X")
  y := VGetF(~HQuaternion, 0, "Y")
  z := VGetF(~HQuaternion, 0, "Z")
  
  //http://en.wikipedia.org/wiki/Conversion_between_quaternions_and_Euler_angles
  AngleZ := atan2(2*(~w*~z + ~x*~y), 1-2*(sqr(~y) + sqr(~z)))
endif

return AngleZ ,      
 system.dbm h      o g             z  W �
              z  X �
              z  Y �
              z  Z �
          @                   �?        @  #   #    � atan2  ������
     z-  �   
 