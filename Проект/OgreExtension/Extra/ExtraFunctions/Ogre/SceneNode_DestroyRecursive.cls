SB0  *      SceneNode_DestroyRecursive  
 HSceneNode     HANDLE   subNodeCount     FLOAT�   subEntityCount     FLOAT�   i     FLOAT�  
 �Function

Handle parameter HSceneNode

Float local subNodeCount, subEntityCount, i

if(HSceneNode)
  subNodeCount := Node_GetNumChildren(HSceneNode)
  subEntityCount := SceneNode_GetNumObjects(HSceneNode)
  
  i := ~subEntityCount-1
  while(~i>=0)
    Entity_Destroy(SceneNode_GetObject(HSceneNode, ~i))
    dec(~i)
  endwhile
  
  i := ~subNodeCount-1
  while(~i>=0)
    if(Node_GetNumChildren(Node_GetChild(HSceneNode,~i))>0)
      SceneNode_DestroyRecursive(Node_GetChild(HSceneNode, ~i))
      SceneNode_Destroy(Node_GetChild(HSceneNode, ~i))
    endif
    dec(~i)
  endwhile
  SceneNode_Destroy(HSceneNode)
endif       
 system.dbm v      o u    �
     �
           �? 
             9 5 -      ��� e3           �? 
             9 5 r      ��         8 5 m      �� SceneNode_DestroyRecursive   ��       � � e3 7        4pa  �   
 