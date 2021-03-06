SB0  [      Quaternion_GetAngleY   HQuaternion     HANDLE   AngleY     FLOAT�  w     FLOAT�   x     FLOAT�   y     FLOAT�   z     FLOAT�   a     FLOAT�  
 �Function
//http://en.wikipedia.org/wiki/Conversion_between_quaternions_and_Euler_angles

Handle parameter HQuaternion
Float  AngleY

Float  local w, x, y, z, a

if(HQuaternion)
  w := VGetF(HQuaternion, 0, "W")
  x := VGetF(HQuaternion, 0, "X")
  y := VGetF(HQuaternion, 0, "Y")
  z := VGetF(HQuaternion, 0, "Z")
  
  a := round(2*(~w*~y - ~z*~x),6)
  a := limit(~a, -1,1)
  AngleY := arcsin(~a)
endif

return AngleY 4      
 system.dbm g      o f             z  W �
              z  X �
              z  Y �
              z  Z �
          @                   @) 
           �?q        �?g
     
     {w-  �   
 