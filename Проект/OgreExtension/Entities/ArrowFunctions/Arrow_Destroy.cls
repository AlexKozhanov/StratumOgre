SB0  �      Arrow_Destroy   HArrow     HANDLE   hLengthEntity     HANDLE�   hArrowEntity     HANDLE�   hLengthNode     HANDLE�  
 hArrowNode     HANDLE�  
 hSceneNode     HANDLE�  
 �Function

Handle parameter HArrow

if(HArrow)
  hLengthEntity := vGetH(HArrow, 0, "HLengthEntity")
  hArrowEntity := vGetH(HArrow, 0, "HArrowEntity")
  hLengthNode := vGetH(HArrow, 0, "HLengthNode")
  hArrowNode := vGetH(HArrow, 0, "HArrowNode")
  hSceneNode := vGetH(HArrow, 0, "HSceneNode")
  
  Entity_Destroy(hLengthEntity)
  Entity_Destroy(hArrowEntity)
  SceneNode_Destroy(hLengthNode)
  SceneNode_Destroy(hArrowNode)
  SceneNode_Destroy(hSceneNode)
  
  Delete(HArrow)
endif       
 system.dbm s      o r             z  HLengthEntity �              z  HArrowEntity  �              z  HLengthNode �              z  HArrowNode  �              z  HSceneNode  �    �  �            �   �U�   �   
 