SB0  �	      Quaternion_Multiply   HQuaternion1     HANDLE   HQuaternion2     HANDLE   HResultQuaternion     HANDLE   qw1     FLOAT�   qx1     FLOAT�   qy1     FLOAT�   qz1     FLOAT�   qw2     FLOAT�   qx2     FLOAT�   qy2     FLOAT�   qz2     FLOAT�   a     FLOAT�   b     FLOAT�   c     FLOAT�   d     FLOAT�   e     FLOAT�   f     FLOAT�   h     FLOAT�   wRes     FLOAT�   xRes     FLOAT�   yRes     FLOAT�   zRes     FLOAT�   res     FLOAT   g     FLOAT�  
 �Function

Handle parameter HQuaternion1, HQuaternion2, HResultQuaternion

Float local qw1, qx1, qy1, qz1, qw2, qx2, qy2, qz2, a,b,c,d,e,f,h, wRes, xRes, yRes, zRes, res

if(HQuaternion1 && HQuaternion2 && HResultQuaternion)
  qw1 := VGetF(~HQuaternion1, 0, "W")
  qx1 := VGetF(~HQuaternion1, 0, "X")
  qy1 := VGetF(~HQuaternion1, 0, "Y")
  qz1 := VGetF(~HQuaternion1, 0, "Z")
  
  qw2 := VGetF(~HQuaternion2, 0, "W")
  qx2 := VGetF(~HQuaternion2, 0, "X")
  qy2 := VGetF(~HQuaternion2, 0, "Y")
  qz2 := VGetF(~HQuaternion2, 0, "Z")
  
  a := (~qw1 + ~qx1)*(~qw2 + ~qx2)
  b := (~qz1 - ~qy1)*(~qy2 - ~qz2)
  c := (~qx1 - ~qw1)*(~qy2 + ~qz2)
  d := (~qy1 + ~qz1)*(~qx2 - ~qw2)
  e := (~qx1 + ~qz1)*(~qx2 + ~qy2)
  f := (~qx1 - ~qz1)*(~qx2 - ~qy2)
  g := (~qw1 + ~qy1)*(~qw2 - ~qz2)
  h := (~qw1 - ~qy1)*(~qw2 + ~qz2)
  
  wRes := ~b + (-~e - ~f + ~g + ~h) * 0.5
  xRes := ~a - (~e + ~f + ~g + ~h) * 0.5
  yRes := -~c + (~e - ~f + ~g - ~h) * 0.5
  zRes := -~d + (~e - ~f - ~g + ~h) * 0.5
  
  VSet(HResultQuaternion, 0, "W", ~wRes)
  VSet(HResultQuaternion, 0, "X", ~xRes)
  VSet(HResultQuaternion, 0, "Y", ~yRes)
  VSet(HResultQuaternion, 0, "Z", ~zRes)
endif �      
 system.dbm j       U   U o i            z  W �
              z  X �
              z  Y �
              z  Z �
             z  W �
             z  X �
             z  Y �
 	            z  Z �
 
            
        	  
   
        	  
   
             
          	   
          	   
          
   
          
   
      q                 �?  
                      �?  
    q                   �?  
    q                   �?  
             z  W   �           z  X   �           z  Y   �           z  Z   �   YO'    
 