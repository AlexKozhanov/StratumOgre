SB0  W      QuaternionFromAxisAngle   X   0 FLOAT    Y   1 FLOAT    Z   0 FLOAT    Angle   1,57 FLOAT    QW   1 FLOAT�   QX   0 FLOAT�   QY   0 FLOAT�   QZ   0 FLOAT�   hQuaternion     HANDLE�   isInitialize     FLOAT�   _x     FLOAT�   _y     FLOAT�   _z     FLOAT�   _angle     FLOAT�  
 sFloat X, Y, Z, Angle,
      QW, QX, QY, QZ
      
Handle local hQuaternion
Float  local isInitialize, _x, _y, _z, _angle
      
if(!isInitialize)
  hQuaternion := Quaternion_Create(QW, QX, QY, QZ)
  isInitialize := 1
endif

if(~hQuaternion)
  if(_x != X || _y != Y || _z != Z || _angle != Angle)
    Quaternion_FromAxisAngle(~hQuaternion, X, Y, Z, Angle)
    QW := Quaternion_GetW(~hQuaternion)
    QX := Quaternion_GetX(~hQuaternion)
    QY := Quaternion_GetY(~hQuaternion)
    QZ := Quaternion_GetZ(~hQuaternion)
    
    _x := X 
    _y := Y
    _z := Z
    _angle := Angle
  endif
endif

 
       
 system.dbm �    	 - 5 '         �	 Quaternion_Create  ����������         �? 	   o �  
    7     7 ,     7 ,     7 , 5 �            � Quaternion_FromAxisAngle   ����������    � Quaternion_GetW  ����    � Quaternion_GetX  ����    � Quaternion_GetY  ����    � Quaternion_GetZ  ����      
                ��'  R  
 