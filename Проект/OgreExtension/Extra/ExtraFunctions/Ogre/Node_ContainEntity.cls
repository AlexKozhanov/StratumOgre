SB0  �      Node_ContainEntity   HNode     HANDLE   HEntity     HANDLE   objectCount     FLOAT�   i     FLOAT�  	 isContain     FLOAT� 
 nodeCounts     FLOAT�  
 HFunction

Handle parameter HNode, HEntity

if(HNode != #0 && HEntity != #0)
  objectCount := SceneNode_GetNumObjects(HNode)
  while(~i<~objectCount)
    isContain := (SceneNode_GetObject(HNode, ~i) == HEntity)
    if(~isContain)
      break
    endif
    inc(~i)
  endwhile
  
  if(!~isContain)
    nodeCounts := Node_GetNumChildren(HNode)
    i := 0
    while(~i < ~nodeCounts)
      isContain := Node_ContainEntity(Node_GetChild(HNode, ~i), HEntity)
      if(~isContain)
        break
      endif
      inc(~i)
    endwhile
  endif
endif

return isContain (      
 system.dbm m           S        S + 5 l    �
      : 5 0      �  R 
    5 + 3 0 � c3    - 5 l    �
           
      : 5 l      �  �
 Node_ContainEntity   ������
    5 g 3 l � c3 A    	�  �   
 