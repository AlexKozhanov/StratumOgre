SB0  KW      OgreSurface_Redraw !  HSurface     HANDLE   HVertexesArray     HANDLE   MaterialName     STRING   OperationType     FLOAT   hVertex1     HANDLE�   hVertex2     HANDLE�   hVertex3     HANDLE�   hVertex4     HANDLE�   hVertex5     HANDLE�   hVertex6     HANDLE�   hVertex7     HANDLE�   hVector1     HANDLE�   hVector2     HANDLE�   hVector3     HANDLE�   hVector4     HANDLE�   hVector5     HANDLE�   hVector6     HANDLE�   hNormal     HANDLE�   hNormal1     HANDLE�   hNormal2     HANDLE�   hNormal3     HANDLE   hNormal4     HANDLE�   hNormal5     HANDLE�   hNormal6     HANDLE�   res     FLOAT   xMin     FLOAT   xMax     FLOAT   yMin     FLOAT   yMax     FLOAT   sizeI     FLOAT�   i     FLOAT�   j     FLOAT�   sizeJ     FLOAT�  
 r2Function

Handle parameter HSurface, HVertexesArray
String parameter MaterialName
Float  parameter /*Matrix,*/ OperationType


Handle local hVertex1, hVertex2, hVertex3, hVertex4, hVertex5, hVertex6, hVertex7,
             hVector1, hVector2, hVector3, hVector4, hVector5, hVector6,
             hNormal, hNormal1, hNormal2, hNormal3, hNormal4, hNormal5, hNormal6
             
Float  local res, xMin, xMax, yMin, yMax

if(HSurface)
  hVector1 := Vector_Create(0,0,0)
  hVector2 := Vector_Create(0,0,0)
  hVector3 := Vector_Create(0,0,0)
  hVector4 := Vector_Create(0,0,0)
  hVector5 := Vector_Create(0,0,0)
  hVector6 := Vector_Create(0,0,0)
  
  hNormal1 := Vector_Create(0,0,0)
  hNormal2 := Vector_Create(0,0,0)
  hNormal2 := Vector_Create(0,0,0)
  hNormal4 := Vector_Create(0,0,0)
  hNormal5 := Vector_Create(0,0,0)
  hNormal6 := Vector_Create(0,0,0)
  hNormal := Vector_Create(0,0,0)
  
  if(HVertexesArray)
    ManualObject_Clear(HSurface)
    ManualObject_Begin(HSurface, MaterialName, OperationType)
    
    sizeI := vGetCount(HVertexesArray)
    i := 0
    while(~i < ~sizeI)
      j := 0
      sizeJ := vGetCount(vGetH(~HVertexesArray, ~i, ""))
      while(~j < ~sizeJ)
        switch
          case(~i == 0 && ~j == 0)
            hVertex1 := vGetH(vGetH(~HVertexesArray, ~i, ""), ~j, "")
            hVertex2 := vGetH(vGetH(~HVertexesArray, ~i+1, ""), ~j, "")
            hVertex3 := vGetH(vGetH(~HVertexesArray, ~i, ""), ~j+1, "")
          
            Vector_Substract(~hVertex2, ~hVertex1, ~hVector1)
            Vector_Substract(~hVertex3, ~hVertex1, ~hVector2)
            Vector_MultiplyL(~hVector1, ~hVector2, ~hNormal)
            Vector_Normalize(~hNormal)
            
            ManualObject_Position(HSurface, Vector_GetX(hVertex1), Vector_GetY(hVertex1), Vector_GetZ(hVertex1))
            ManualObject_Normal(HSurface, Vector_GetX(hNormal), Vector_GetY(hNormal), Vector_GetZ(hNormal))
                 
          case(~i > 0 && ~i < ~sizeI - 1 && ~j == 0)
            // left edge - 3 tri 4 vertices
            hVertex1 := vGetH(vGetH(~HVertexesArray, ~i, ""), ~j, "")
            hVertex2 := vGetH(vGetH(~HVertexesArray, ~i+1, ""), ~j, "")
            hVertex3 := vGetH(vGetH(~HVertexesArray, ~i-1, ""), ~j+1, "")
            hVertex4 := vGetH(vGetH(~HVertexesArray, ~i-1, ""), ~j, "")
            hVertex5 := vGetH(vGetH(~HVertexesArray, ~i, ""), ~j+1, "")
          
            Vector_Substract(hVertex2, hVertex1, hVector1)
            Vector_Substract(hVertex3, hVertex1, hVector2)
            Vector_Substract(hVertex4, hVertex1, hVector3)
            Vector_Substract(hVertex5, hVertex1, hVector4)
          
            Vector_MultiplyL(hVector1, hVector2, hNormal1)
            Vector_MultiplyL(hVector2, hVector3, hNormal2)
            Vector_MultiplyL(hVector3, hVector4, hNormal3)
          
            Vector_Summ(hNormal1, hNormal2, hNormal)
            Vector_Summ(hNormal, hNormal3, hNormal)
            Vector_DivideScalar(hNormal, 3, hNormal)
            Vector_Normalize(hNormal)
            
            ManualObject_Position(HSurface, Vector_GetX(hVertex1), Vector_GetY(hVertex1), Vector_GetZ(hVertex1))
            ManualObject_Normal(HSurface, Vector_GetX(hNormal), Vector_GetY(hNormal), Vector_GetZ(hNormal))
          
          case(~i == ~sizeI - 1 && ~j == 0)
            // front left corner - 2 tri 3 vertices  
            hVertex1 := vGetH(vGetH(~HVertexesArray, ~i, ""), ~j, "")
            hVertex2 := vGetH(vGetH(~HVertexesArray, ~i, ""), ~j+1, "")
            hVertex3 := vGetH(vGetH(~HVertexesArray, ~i-1, ""), ~j+1, "")
            hVertex4 := vGetH(vGetH(~HVertexesArray, ~i-1, ""), ~j, "")
          
            Vector_Substract(hVertex2, hVertex1, hVector1)
            Vector_Substract(hVertex3, hVertex1, hVector2)
            Vector_Substract(hVertex4, hVertex1, hVector3)
          
            Vector_MultiplyL(hVector1, hVector2, hNormal1)
            Vector_MultiplyL(hVector2, hVector3, hNormal2)
          
            Vector_Summ(hNormal1, hNormal2, hNormal)
            Vector_DivideScalar(hNormal, 2, hNormal)
            Vector_Normalize(hNormal)
            
            ManualObject_Position(HSurface, Vector_GetX(hVertex1), Vector_GetY(hVertex1), Vector_GetZ(hVertex1))
            ManualObject_Normal(HSurface, Vector_GetX(hNormal), Vector_GetY(hNormal), Vector_GetZ(hNormal))
          
          case(~i == ~sizeI - 1 && ~j > 0 && ~j < ~sizeJ - 1)
            // front edge - 3 tri 4 vertices
            hVertex1 := vGetH(vGetH(~HVertexesArray, ~i, ""), ~j, "")
            hVertex2 := vGetH(vGetH(~HVertexesArray, ~i, ""), ~j+1, "")
            hVertex3 := vGetH(vGetH(~HVertexesArray, ~i-1, ""), ~j+1, "")
            hVertex4 := vGetH(vGetH(~HVertexesArray, ~i-1, ""), ~j, "")
            hVertex5 := vGetH(vGetH(~HVertexesArray, ~i, ""), ~j-1, "")
          
            Vector_Substract(hVertex2, hVertex1, hVector1)
            Vector_Substract(hVertex3, hVertex1, hVector2)
            Vector_Substract(hVertex4, hVertex1, hVector3)
            Vector_Substract(hVertex5, hVertex1, hVector4)
           
            Vector_MultiplyL(hVector1, hVector2, hNormal1)
            Vector_MultiplyL(hVector2, hVector3, hNormal2)
            Vector_MultiplyL(hVector3, hVector4, hNormal3)
          
            Vector_Summ(hNormal1, hNormal2, hNormal)
            Vector_Summ(hNormal, hNormal3, hNormal)
            Vector_DivideScalar(hNormal, 3, hNormal)
            Vector_Normalize(hNormal)
            
            ManualObject_Position(HSurface, Vector_GetX(hVertex1), Vector_GetY(hVertex1), Vector_GetZ(hVertex1))
            ManualObject_Normal(HSurface, Vector_GetX(hNormal), Vector_GetY(hNormal), Vector_GetZ(hNormal))
          
          case(~i == ~sizeI - 1  && ~j == ~sizeJ - 1)
            // front right corner - 1 tri 2 vertices
            hVertex1 := vGetH(vGetH(~HVertexesArray, ~i, ""), ~j, "")
            hVertex2 := vGetH(vGetH(~HVertexesArray, ~i-1, ""), ~j, "")
            hVertex3 := vGetH(vGetH(~HVertexesArray, ~i, ""), ~j-1, "")
          
            Vector_Substract(hVertex2, hVertex1, hVector1)
            Vector_Substract(hVertex3, hVertex1, hVector2)
            Vector_MultiplyL(hVector1, hVector2, hNormal)
            Vector_Normalize(hNormal)
            
            ManualObject_Position(HSurface, Vector_GetX(hVertex1), Vector_GetY(hVertex1), Vector_GetZ(hVertex1))
            ManualObject_Normal(HSurface, Vector_GetX(hNormal), Vector_GetY(hNormal), Vector_GetZ(hNormal))
          
          case(~i > 0 && ~i < ~sizeI - 1 && ~j == ~sizeJ - 1)
            // right edge - 3 tri 4 vertices  
            hVertex1 := vGetH(vGetH(~HVertexesArray, ~i, ""), ~j, "")
            hVertex2 := vGetH(vGetH(~HVertexesArray, ~i-1, ""), ~j, "")
            hVertex3 := vGetH(vGetH(~HVertexesArray, ~i, ""), ~j-1, "")
            hVertex4 := vGetH(vGetH(~HVertexesArray, ~i+1, ""), ~j-1, "")
            hVertex5 := vGetH(vGetH(~HVertexesArray, ~i+1, ""), ~j, "")
          
            Vector_Substract(hVertex2, hVertex1, hVector1)
            Vector_Substract(hVertex3, hVertex1, hVector2)
            Vector_Substract(hVertex4, hVertex1, hVector3)
            Vector_Substract(hVertex5, hVertex1, hVector4)
          
            Vector_MultiplyL(hVector1, hVector2, hNormal1)
            Vector_MultiplyL(hVector2, hVector3, hNormal2)
            Vector_MultiplyL(hVector3, hVector4, hNormal3)
          
            Vector_Summ(hNormal1, hNormal2, hNormal)
            Vector_Summ(hNormal, hNormal3, hNormal)
            Vector_DivideScalar(hNormal, 3, hNormal)
            Vector_Normalize(hNormal)
            
            ManualObject_Position(HSurface, Vector_GetX(hVertex1), Vector_GetY(hVertex1), Vector_GetZ(hVertex1))
            ManualObject_Normal(HSurface, Vector_GetX(hNormal), Vector_GetY(hNormal), Vector_GetZ(hNormal))
            
          case(~i == 0 && ~j == ~sizeJ - 1)
            // back right corner - 2 tri 3 vertices
            hVertex1 := vGetH(vGetH(~HVertexesArray, ~i, ""), ~j, "")
            hVertex2 := vGetH(vGetH(~HVertexesArray, ~i, ""), ~j-1, "")
            hVertex3 := vGetH(vGetH(~HVertexesArray, ~i+1, ""), ~j-1, "")
            hVertex4 := vGetH(vGetH(~HVertexesArray, ~i+1, ""), ~j, "")
          
            Vector_Substract(hVertex2, hVertex1, hVector1)
            Vector_Substract(hVertex3, hVertex2, hVector2)
            
            Vector_Substract(hVertex3, hVertex1, hVector3)
            Vector_Substract(hVertex4, hVertex1, hVector4)
          
            Vector_MultiplyL(hVector1, hVector2, hNormal1)
            Vector_MultiplyL(hVector3, hVector4, hNormal2)
          
            Vector_Summ(hNormal1, hNormal2, hNormal)
            Vector_DivideScalar(hNormal, 2, hNormal)
            Vector_Normalize(hNormal)
            
            ManualObject_Position(HSurface, Vector_GetX(hVertex1), Vector_GetY(hVertex1), Vector_GetZ(hVertex1))
            ManualObject_Normal(HSurface, Vector_GetX(hNormal), Vector_GetY(hNormal), Vector_GetZ(hNormal))
          
          case(~i == 0 && ~j > 0 && ~j < ~sizeJ - 1)
            // back edge - 3 tri 4 vertices
            hVertex1 := vGetH(vGetH(~HVertexesArray, ~i, ""), ~j, "")
            hVertex2 := vGetH(vGetH(~HVertexesArray, ~i, ""), ~j-1, "")
            hVertex3 := vGetH(vGetH(~HVertexesArray, ~i+1, ""), ~j-1, "")
            hVertex4 := vGetH(vGetH(~HVertexesArray, ~i+1, ""), ~j, "")
            hVertex5 := vGetH(vGetH(~HVertexesArray, ~i, ""), ~j+1, "")
          
            Vector_Substract(hVertex2, hVertex1, hVector1)
            Vector_Substract(hVertex3, hVertex1, hVector2)
            Vector_Substract(hVertex4, hVertex1, hVector3)
            Vector_Substract(hVertex5, hVertex1, hVector4)
          
            Vector_MultiplyL(hVector1, hVector2, hNormal1)
            Vector_MultiplyL(hVector2, hVector3, hNormal2)
            Vector_MultiplyL(hVector3, hVector4, hNormal3)
          
            Vector_Summ(hNormal1, hNormal2, hNormal)
            Vector_Summ(hNormal, hNormal3, hNormal)
            Vector_DivideScalar(hNormal, 3, hNormal)
            Vector_Normalize(hNormal)
            
            ManualObject_Position(HSurface, Vector_GetX(hVertex1), Vector_GetY(hVertex1), Vector_GetZ(hVertex1))
            ManualObject_Normal(HSurface, Vector_GetX(hNormal), Vector_GetY(hNormal), Vector_GetZ(hNormal))
          
          default
            // internal - 6 tri 6 vertices
            hVertex1 := vGetH(vGetH(~HVertexesArray, ~i, ""), ~j, "")
            hVertex2 := vGetH(vGetH(~HVertexesArray, ~i, ""), ~j+1, "")
            hVertex3 := vGetH(vGetH(~HVertexesArray, ~i-1, ""), ~j+1, "")
            hVertex4 := vGetH(vGetH(~HVertexesArray, ~i-1, ""), ~j, "")
            hVertex5 := vGetH(vGetH(~HVertexesArray, ~i, ""), ~j-1, "")
            hVertex6 := vGetH(vGetH(~HVertexesArray, ~i+1, ""), ~j-1, "")
            hVertex7 := vGetH(vGetH(~HVertexesArray, ~i+1, ""), ~j, "")
          
            Vector_Substract(hVertex2, hVertex1, hVector1)
            Vector_Substract(hVertex3, hVertex1, hVector2)
            Vector_Substract(hVertex4, hVertex1, hVector3)
            Vector_Substract(hVertex5, hVertex1, hVector4)
            Vector_Substract(hVertex6, hVertex1, hVector5)
            Vector_Substract(hVertex7, hVertex1, hVector6)
          
            Vector_MultiplyL(hVector1, hVector2, hNormal1)
            Vector_MultiplyL(hVector2, hVector3, hNormal2)
            Vector_MultiplyL(hVector3, hVector4, hNormal3)
            Vector_MultiplyL(hVector4, hVector5, hNormal4)
            Vector_MultiplyL(hVector5, hVector6, hNormal5)
            Vector_MultiplyL(hVector6, hVector1, hNormal6)
          
            Vector_Summ(hNormal1, hNormal2, hNormal)
            Vector_Summ(hNormal, hNormal3, hNormal)
            Vector_Summ(hNormal, hNormal4, hNormal)
            Vector_Summ(hNormal, hNormal5, hNormal)
            Vector_Summ(hNormal, hNormal6, hNormal)
            Vector_DivideScalar(hNormal, 6, hNormal)
            Vector_Normalize(hNormal)
            
            ManualObject_Position(HSurface, Vector_GetX(hVertex1), Vector_GetY(hVertex1), Vector_GetZ(hVertex1))
            ManualObject_Normal(HSurface, Vector_GetX(hNormal), Vector_GetY(hNormal), Vector_GetZ(hNormal))
        endswitch
        inc(~j)
      endwhile
      inc(~i)
    endwhile
  
    ManualObject_End(HSurface)
  endif
  
  Delete(hVector1); Delete(hVector2); Delete(hVector3); Delete(hVector4); Delete(hVector5); Delete(hVector6)
  Delete(hNormal1); Delete(hNormal2); Delete(hNormal3); Delete(hNormal4); Delete(hNormal5); Delete(hNormal6)
  Delete(hNormal)
endif �     
 system.dbm �     o �                           � Vector_Create  ��������                             � Vector_Create  ��������                             � Vector_Create  ��������                             � Vector_Create  ��������                             � Vector_Create  ��������                             � Vector_Create  ��������                             � Vector_Create  ��������                             � Vector_Create  ��������                             � Vector_Create  ��������                             � Vector_Create  ��������                             � Vector_Create  ��������                             � Vector_Create  ��������                             � Vector_Create  ��������    o �   �   x    �  �
           
      : 5 �         
      z    ��
        : 5 }           6            6 + 5 �    z    �  z    �             �? z    �  z    �      z    �         �? z    �        �	 Vector_Substract   ������        �	 Vector_Substract   ������        �	 Vector_MultiplyL   ������    �	 Vector_Normalize   ��       � Vector_GetX  ����  � Vector_GetY  ����  � Vector_GetZ  �����     � Vector_GetX  ����  � Vector_GetY  ����  � Vector_GetZ  �����3 x           8            �? : +            6 + 5 �    z    �  z    �             �? z    �  z    �             �? z    �         �? z    �             �? z    �  z    �      z    �         �? z    �        �	 Vector_Substract   ������        �	 Vector_Substract   ������        �	 Vector_Substract   ������        �	 Vector_Substract   ������        �	 Vector_MultiplyL   ������        �	 Vector_MultiplyL   ������        �	 Vector_MultiplyL   ������        � Vector_Summ  ������        � Vector_Summ  ������           @  �
 Vector_DivideScalar  ������    �	 Vector_Normalize   ��       � Vector_GetX  ����  � Vector_GetY  ����  � Vector_GetZ  �����     � Vector_GetX  ����  � Vector_GetY  ����  � Vector_GetZ  �����3 x           �? 6            6 + 5     z    �  z    �      z    �         �? z    �             �? z    �         �? z    �             �? z    �  z    �        �	 Vector_Substract   ������        �	 Vector_Substract   ������        �	 Vector_Substract   ������        �	 Vector_MultiplyL   ������        �	 Vector_MultiplyL   ������        � Vector_Summ  ������            @  �
 Vector_DivideScalar  ������    �	 Vector_Normalize   ��       � Vector_GetX  ����  � Vector_GetY  ����  � Vector_GetZ  �����     � Vector_GetX  ����  � Vector_GetY  ����  � Vector_GetZ  �����3 x           �? 6            8 +             �? : + 5 �    z    �  z    �      z    �         �? z    �             �? z    �         �? z    �             �? z    �  z    �      z    �         �? z    �        �	 Vector_Substract   ������        �	 Vector_Substract   ������        �	 Vector_Substract   ������        �	 Vector_Substract   ������        �	 Vector_MultiplyL   ������        �	 Vector_MultiplyL   ������        �	 Vector_MultiplyL   ������        � Vector_Summ  ������        � Vector_Summ  ������           @  �
 Vector_DivideScalar  ������    �	 Vector_Normalize   ��       � Vector_GetX  ����  � Vector_GetY  ����  � Vector_GetZ  �����     � Vector_GetX  ����  � Vector_GetY  ����  � Vector_GetZ  �����3 x           �? 6             �? 6 + 5 �    z    �  z    �             �? z    �  z    �      z    �         �? z    �        �	 Vector_Substract   ������        �	 Vector_Substract   ������        �	 Vector_MultiplyL   ������    �	 Vector_Normalize   ��       � Vector_GetX  ����  � Vector_GetY  ����  � Vector_GetZ  �����     � Vector_GetX  ����  � Vector_GetY  ����  � Vector_GetZ  �����3 x           8            �? : +             �? 6 + 5 �
    z    �  z    �             �? z    �  z    �      z    �         �? z    �             �? z    �         �? z    �             �? z    �  z    �        �	 Vector_Substract   ������        �	 Vector_Substract   ������        �	 Vector_Substract   ������        �	 Vector_Substract   ������        �	 Vector_MultiplyL   ������        �	 Vector_MultiplyL   ������        �	 Vector_MultiplyL   ������        � Vector_Summ  ������        � Vector_Summ  ������           @  �
 Vector_DivideScalar  ������    �	 Vector_Normalize   ��       � Vector_GetX  ����  � Vector_GetY  ����  � Vector_GetZ  �����     � Vector_GetX  ����  � Vector_GetY  ����  � Vector_GetZ  �����3 x           6             �? 6 + 5 &    z    �  z    �      z    �         �? z    �             �? z    �         �? z    �             �? z    �  z    �        �	 Vector_Substract   ������        �	 Vector_Substract   ������        �	 Vector_Substract   ������        �	 Vector_Substract   ������        �	 Vector_MultiplyL   ������        �	 Vector_MultiplyL   ������        � Vector_Summ  ������            @  �
 Vector_DivideScalar  ������    �	 Vector_Normalize   ��       � Vector_GetX  ����  � Vector_GetY  ����  � Vector_GetZ  �����     � Vector_GetX  ����  � Vector_GetY  ����  � Vector_GetZ  �����3 x           6            8 +             �? : + 5 �    z    �  z    �      z    �         �? z    �             �? z    �         �? z    �             �? z    �  z    �      z    �         �? z    �        �	 Vector_Substract   ������        �	 Vector_Substract   ������        �	 Vector_Substract   ������        �	 Vector_Substract   ������        �	 Vector_MultiplyL   ������        �	 Vector_MultiplyL   ������        �	 Vector_MultiplyL   ������        � Vector_Summ  ������        � Vector_Summ  ������           @  �
 Vector_DivideScalar  ������    �	 Vector_Normalize   ��       � Vector_GetX  ����  � Vector_GetY  ����  � Vector_GetZ  �����     � Vector_GetX  ����  � Vector_GetY  ����  � Vector_GetZ  �����3 x    z    �  z    �      z    �         �? z    �             �? z    �         �? z    �             �? z    �  z    �      z    �         �? z    �             �? z    �         �? z    � 	            �? z    �  z    � 
       �	 Vector_Substract   ������        �	 Vector_Substract   ������        �	 Vector_Substract   ������        �	 Vector_Substract   ������   	     �	 Vector_Substract   ������   
     �	 Vector_Substract   ������        �	 Vector_MultiplyL   ������        �	 Vector_MultiplyL   ������        �	 Vector_MultiplyL   ������        �	 Vector_MultiplyL   ������        �	 Vector_MultiplyL   ������        �	 Vector_MultiplyL   ������        � Vector_Summ  ������        � Vector_Summ  ������        � Vector_Summ  ������        � Vector_Summ  ������        � Vector_Summ  ������           @  �
 Vector_DivideScalar  ������    �	 Vector_Normalize   ��       � Vector_GetX  ����  � Vector_GetY  ����  � Vector_GetZ  �����     � Vector_GetX  ����  � Vector_GetY  ����  � Vector_GetZ  ������ c3 �� c3 �   �  �  �  �  �  �  �  �  �  �  �  �  �  �   �}Q  U  
 