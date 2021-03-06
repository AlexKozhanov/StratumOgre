SB0  �	      Arrow_Create   HScene     HANDLE   HParentNode     HANDLE   LineMeshName     STRING   ArrowMeshName     STRING   MaterialName     STRING   ArrowLengthPercent     FLOAT   Length     FLOAT�   Width     FLOAT�   arrowLength     FLOAT�   hArrow     HANDLE� 
 hSceneNode     HANDLE�   hLengthNode     HANDLE�  
 hArrowNode     HANDLE�   hLengthEntity     HANDLE�   hArrowEntity     HANDLE�   res     FLOAT�  
 �Function

Handle parameter HScene, HParentNode
String parameter LineMeshName, ArrowMeshName, MaterialName
Float  parameter ArrowLengthPercent


if(HScene && HParentNode)
  Length := 1
  Width := 0.1
  arrowLength := sgn(Length)*ArrowLengthPercent
  hArrow := new()
  
  hSceneNode := SceneNode_Create(HScene, "")
  Node_SetParent(hSceneNode, HParentNode)
  
  hLengthNode := SceneNode_Create(HScene, "")
  Node_SetParent(hLengthNode, hSceneNode)
  Node_SetScale(hLengthNode, Width, Length-arrowLength, Width)
  
  hArrowNode := SceneNode_Create(HScene, "")
  Node_SetParent(hArrowNode, hSceneNode)
  Node_SetPosition(hArrowNode, 0, Length-arrowLength ,0)
  Node_SetScale(hArrowNode, Width*2, arrowLength, Width*2)
  
  hLengthEntity := Entity_Create(HScene, "", LineMeshName)
  Entity_SetMaterial(hLengthEntity, 0, MaterialName)
  Movable_SetParent(hLengthEntity, hLengthNode)
  
  hArrowEntity := Entity_Create(HScene, "", ArrowMeshName)
  Entity_SetMaterial(hArrowEntity, 0, MaterialName)
  Movable_SetParent(hArrowEntity, hArrowNode)
  
  res := vInsert(hArrow, "ArrowInfo")
  vSet(hArrow, 0, "HSceneNode", hSceneNode)
  vSet(hArrow, 0, "HLengthNode", hLengthNode)
  vSet(hArrow, 0, "HArrowNode", hArrowNode)
  vSet(hArrow, 0, "HLengthEntity", hLengthEntity)
  vSet(hArrow, 0, "HArrowEntity", hArrowEntity)
  vSet(hArrow, 0, "ArrowLengthPercent", ArrowLengthPercent)
  
  return hArrow
endif

 H     
 system.dbm +       U o *       �?
   �������?
    /    
  � 	    z     
  
   �   z         
 �           �   z         
 �                         �            @             @ �   z    x  �             x  �    �   z    x  �             x  �    � 	 z  ArrowInfo �
   	          z  HSceneNode   
 � 	          z  HLengthNode   � 	          z  HArrowNode    � 	          z  HLengthEntity   � 	          z  HArrowEntity    � 	          z 
 ArrowLengthPercent    �   ;R�   �  
 