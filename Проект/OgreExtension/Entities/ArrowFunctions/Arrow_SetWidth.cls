SB0  �      Arrow_SetWidth   HArrow     HANDLE   Width     FLOAT   hLengthNode     HANDLE�  
 hArrowNode     HANDLE�   null     FLOAT   lengthSy     FLOAT    arrowSy     FLOAT    lengthSx     FLOAT   
 �Function

Handle parameter HArrow
Float  parameter Width

Handle local hLengthNode, hArrowNode
Float  local null

if(HArrow)
  hLengthNode := vGetH(HArrow, 0, "HLengthNode")
  hArrowNode := vGetH(HArrow, 0, "HArrowNode")
  
  Node_GetScale(hLengthNode, null, lengthSy, null)
  Node_GetScale(hLengthNode, null, arrowSy, null)
  
  Node_SetScale(hLengthNode, Width, lengthSx, Width)
  Node_SetScale(hArrowNode, Width*2, arrowSy, Width*2)
endif 4      
 system.dbm Y      o X             z  HLengthNode �              z  HArrowNode  �    � � � �  � � � �        �            @             @ �   ZH�   �   
 