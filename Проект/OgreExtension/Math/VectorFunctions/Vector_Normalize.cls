SB0  �      Vector_Normalize   HVector     HANDLE   x     FLOAT�   y     FLOAT�   z     FLOAT�  	 invLength     FLOAT�  
 Function

Handle parameter HVector

if(HVector)
  x := Vector_GetX(HVector)
  y := Vector_GetY(HVector)
  z := Vector_GetZ(HVector)
  
  invLength := 1 / sqrt( sqr(x) + sqr(y) + sqr(z) )
  Vector_Set(HVector, x*invLength, y*invLength, z*invLength)
endif

 $      
 system.dbm e      o d    � Vector_GetX  ����
     � Vector_GetY  ����
     � Vector_GetZ  ����
         �?  #   #    #  "  
                    � Vector_Set   ��������     ��N  �   
 