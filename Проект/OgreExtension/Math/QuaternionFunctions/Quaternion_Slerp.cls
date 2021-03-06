SB0  ]
      Quaternion_Slerp   HQuaternion1     HANDLE   HQuaternion2     HANDLE   Alpha     FLOAT   HResultQuaternion     HANDLE   kErp0     FLOAT�   kErp1     FLOAT�   angle     FLOAT�   sinAngle     FLOAT�   cosAngle     FLOAT�   minAngle     FLOAT�   w1     FLOAT�   x1     FLOAT�   y1     FLOAT�   z1     FLOAT�   w2     FLOAT�   x2     FLOAT�   y2     FLOAT�   z2     FLOAT�   w     FLOAT�   x     FLOAT�   y     FLOAT�   z     FLOAT�  
 �Function

Handle parameter HQuaternion1, HQuaternion2
Float  parameter Alpha
Handle parameter HResultQuaternion

Float local kErp0, kErp1, angle, sinAngle, cosAngle, minAngle

if(HQuaternion1 != #0 && HQuaternion2 != #0 && !Quaternion_Equal(HQuaternion1, HQuaternion2))
  w1 := Quaternion_GetW(HQuaternion1)
  x1 := Quaternion_GetX(HQuaternion1)
  y1 := Quaternion_GetY(HQuaternion1)
  z1 := Quaternion_GetZ(HQuaternion1)
  
  w2 := Quaternion_GetW(HQuaternion2)
  x2 := Quaternion_GetX(HQuaternion2)
  y2 := Quaternion_GetY(HQuaternion2)
  z2 := Quaternion_GetZ(HQuaternion2)
  
  Quaternion_Set(HResultQuaternion, w1, x1, y1, z1)
  minAngle := 0.0001
  cosAngle := w1*w2 + x1*x2 + y1*y2 + z1*z2
  if(cosAngle < 0)
    cosAngle := -cosAngle
    w1 := -w1
    x1 := -x1
    y1 := -y1
    z1 := -z1
  endif
  
  if(1 - cosAngle > MinAngle)
    angle := ArcCos(cosAngle)
    sinAngle := Sin(angle)
    kErp0 := sin((1 - Alpha)*angle) / sinAngle
    kErp1 := sin(Alpha * sinAngle) / sinAngle
  else
    kErp0 := 1 - Alpha
    kErp1 := Alpha
  endif
  
  w := w1 * kErp0 + w2 * kErp1
  x := x1 * kErp0 + x2 * kErp1
  y := y1 * kErp0 + y2 * kErp1
  z := z1 * kErp0 + z2 * kErp1
  
  Quaternion_Set(HResultQuaternion, w,x,y,z)
endif  �      
 system.dbm �          S        S +      �	 Quaternion_Equal   ������- + 5 �   � Quaternion_GetW  ����
 
    � Quaternion_GetX  ����
     � Quaternion_GetY  ����
     � Quaternion_GetZ  ����
    � Quaternion_GetW  ����
    � Quaternion_GetX  ����
    � Quaternion_GetY  ����
    � Quaternion_GetZ  ����
     
       � Quaternion_Set   ����������   -C��6?
 	  
                      
             : 5 
  q 
   
 q 
 
   q 
    q 
    q 
         �?    	 8 5 ?   
     
         �?          
           
  3 M       �?   
    
   
          
             
             
             
            � Quaternion_Set   ����������     �M0     
 