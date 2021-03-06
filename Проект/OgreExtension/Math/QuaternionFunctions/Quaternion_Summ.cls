SB0  �      Quaternion_Summ   HQuaternion1     HANDLE   HQuaternion2     HANDLE   HQuaternionResult     HANDLE   qw1     FLOAT�   qx1     FLOAT�   qy1     FLOAT�   qz1     FLOAT�   qw2     FLOAT�   qx2     FLOAT�   qy2     FLOAT�   qz2     FLOAT�  
 4Function

Handle parameter HQuaternion1, HQuaternion2, HQuaternionResult

Float local qw1, qx1, qy1, qz1, qw2, qx2, qy2, qz2

if(HQuaternion1 && HQuaternion2)
  qw1 := VGetF(HQuaternion1, 0, "W")
  qx1 := VGetF(HQuaternion1, 0, "X")
  qy1 := VGetF(HQuaternion1, 0, "Y")
  qz1 := VGetF(HQuaternion1, 0, "Z")
  
  qw2 := VGetF(HQuaternion2, 0, "W")
  qx2 := VGetF(HQuaternion2, 0, "X")
  qy2 := VGetF(HQuaternion2, 0, "Y")
  qz2 := VGetF(HQuaternion2, 0, "Z")
  
  Quaternion_Set(HQuaternionResult, qw1 + qw2, qx1 + qx2, qy1 + qy2, qz1 + qz2)
endif L      
 system.dbm �        U o �             z  W �
              z  X �
              z  Y �
              z  Z �
             z  W �
             z  X �
             z  Y �
 	            z  Z �
 
                	     
  � Quaternion_Set   ����������     �N'    
 