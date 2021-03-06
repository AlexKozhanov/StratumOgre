SB0  r      Ray   HScene     HANDLE  
 HSceneNode     HANDLE   PosX     FLOAT   PosY     FLOAT   PosZ     FLOAT   DirX     FLOAT   DirY     FLOAT   DirZ     FLOAT  	 RayLength     FLOAT   hRay     HANDLE�  k     FLOAT�   posXEnd     FLOAT�   posYEnd     FLOAT�   posZEnd     FLOAT�  
 Function

Handle parameter HScene, HSceneNode
Float  parameter PosX, PosY, PosZ, 
                 DirX, DirY, DirZ, 
                 RayLength
                 
Handle local hRay
Float  local k, posXEnd, posYEnd, posZEnd

if(HScene && HSceneNode)
  k := RayLength/(sqr(~DirX) + sqr(~DirY) + sqr(~DirZ))
  posXEnd := PosX + ~k*DirX
  posYEnd := PosY + ~k*DirY
  posZEnd := PosZ + ~k*DirZ
      
  hRay := ManualObject_Create(HScene, "")
  ManualObject_Begin(~hRay, "", OT_LINE_LIST)
    ManualObject_Position(~hRay, PosX, PosY, PosZ)
    ManualObject_Position(~hRay, ~posXEnd, ~posYEnd, ~posZEnd)
    
    ManualObject_Index(~hRay, 0)
    ManualObject_Index(~hRay, 1)
    
  ManualObject_End(~hRay)
  Movable_SetParent(~hRay, HSceneNode)
endif

return hRay

 d      
 system.dbm s        U o r     #   #    #   
 
    
     
     
     
     
     
     z    � 	  	 z            @� 	       � 	       � 	          � 	        �?� 	 � 	   �   Fe�  M  
 