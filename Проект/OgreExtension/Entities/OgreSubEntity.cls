SB0        OgreSubEntity   HScene     HANDLE    HEntity     HANDLE    MaterialName     STRING    Index     FLOAT    VertexCount     FLOAT�  
 IndexCount     FLOAT�   _materialName     STRING�   isInitialize     FLOAT�  
 �Handle HScene, HEntity
String MaterialName
Float  Index, VertexCount, IndexCount

String local _materialName
Float local isInitialize

if(HScene && HEntity)
  if(!isInitialize)
    if(MaterialName == "")
      Entity_GetMaterial(HEntity, Index, ~MaterialName)
    else
      if(Material_Get(MaterialName) != #0)
        Entity_SetMaterial(HEntity, Index, MaterialName)
      endif
    endif
    VertexCount := Entity_GetVertexCount(HEntity)
    IndexCount := Entity_GetIndexCount(HEntity)
    _materialName := ~MaterialName
    isInitialize := 1
  endif
  
  if(~_materialName != ~MaterialName && Material_Get(~MaterialName) != #0)
    Entity_SetMaterial(HEntity, Index, ~MaterialName)
    _materialName := ~MaterialName
  endif
endif 7   BE_ICONS.DBM {        U o z   - 5 ` x  z    � 5      � �3 - x  �     S 5 -     x  �  � Entity_GetVertexCount  ����    � Entity_GetIndexCount   ����  y  {         �?  y  y  � y  �     S + 5 z     y  �y  {     To  �   
 