SB0  ś      GetAllChildEntities   HContainerNode     HANDLE   HEntitiesArray     HANDLE  
 EntityName     STRING   i     FLOAT   res     FLOAT       ˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙Cx7Hs q4p8`1HqggG3qwwxHHgsqwwh@0wsqww sHsqwwxq3`wwgHh ww Hs`sw6hsxx88sxxHsww
 Function
Handle parameter HContainerNode, HEntitiesArray

String local EntityName
Float  local i, res

if(HContainerNode == #0)
  exit()
endif

i:= 0
while(~i<SceneNode_GetNumObjects(HContainerNode))
  res := vInsert(~HEntitiesArray, "Handle")
  vSet(~HEntitiesArray, vGetCount(~HEntitiesArray)-1, "", SceneNode_GetObject(HContainerNode, ~i))
  inc(~i)
endwhile

i:= 0
while(~i<Node_GetNumChildren(HContainerNode))
  GetAllChildEntities(Node_GetChild(HContainerNode,~i), ~HEntitiesArray)
  inc(~i)
endwhile
      
 system.dbm h           R 5 	            
       ž: 5 <   z  Handle  ż
      Á       đ? z         żČÜ c3           
       ş: 5 g      ť  Ţ
 GetAllChildEntities  ý˙ý˙  Ü c3 C     v  Ł    Ť  
 