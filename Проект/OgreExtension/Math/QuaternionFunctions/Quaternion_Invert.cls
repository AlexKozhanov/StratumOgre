SB0  y      Quaternion_Invert   HQuaternion     HANDLE   HResultQuaternion     HANDLE   w     FLOAT�   x     FLOAT�   y     FLOAT�   z     FLOAT�   len     FLOAT�  
 zFunction

Handle parameter HQuaternion, HResultQuaternion

if(HQuaternion && HResultQuaternion)
  w := Quaternion_GetW(HQuaternion)
  x := Quaternion_GetX(HQuaternion)
  y := Quaternion_GetY(HQuaternion)
  z := Quaternion_GetZ(HQuaternion)
  
  len := 1/(sqr(w) + sqr(x) + sqr(y) + sqr(z))
  
  Quaternion_Set(HResultQuaternion, len*w, -len*x, -len*y, -len*z)
endif 0      
 system.dbm �        U o �    � Quaternion_GetW  ����
     � Quaternion_GetX  ����
     � Quaternion_GetY  ����
     � Quaternion_GetZ  ����
         �?  #   #    #    #   
           q      q      q    � Quaternion_Set   ����������     �m0  �   
 