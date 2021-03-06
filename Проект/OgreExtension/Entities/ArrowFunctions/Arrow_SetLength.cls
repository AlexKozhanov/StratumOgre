SB0         Arrow_SetLength   HArrow     HANDLE   Length     FLOAT   hLengthNode     HANDLE�  
 hArrowNode     HANDLE�   null     FLOAT   arrowLength     FLOAT�   arrowLenPercent     FLOAT�   lengthSx     FLOAT    lengthSz     FLOAT    arrowSx     FLOAT    arrowSz     FLOAT   
 �Function

Handle parameter HArrow
Float  parameter Length

Handle local hLengthNode, hArrowNode
Float  local null, arrowLength

if(HArrow)
  hLengthNode := vGetH(HArrow, 0, "HLengthNode")
  hArrowNode := vGetH(HArrow, 0, "HArrowNode")
  
  arrowLenPercent := vGetF(HArrow, 0, "ArrowLengthPercent")
  arrowLength := sgn(Length)*arrowLenPercent
  
  Node_GetScale(hLengthNode, lengthSx, null, lengthSz)
  Node_GetScale(hLengthNode, arrowSx, null, arrowSz)
  
  Node_SetScale(hLengthNode, lengthSx, Length - arrowLength, lengthSx)
  Node_SetScale(hArrowNode, arrowSx*2, arrowLength, arrowSz*2)
  
  Node_SetPosition(hArrowNode, 0, Length-arrowLength ,0)
endif L      
 system.dbm �      o �             z  HLengthNode �              z  HArrowNode  �              z 
 ArrowLengthPercent  �
    /    
    � � � �  �	 � �
 �           �   	         @    
         @ �                         �   ���   8  
 