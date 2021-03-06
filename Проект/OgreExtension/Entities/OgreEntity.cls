SB0  �     
 OgreEntity   HScene ���������� �����   HANDLE    HEntity ���������� �������   HANDLE�  
 HSceneNode, ���������� ���� � �������� ���������� ������   HANDLE�   Name, ���������� � ������ ����� ��� ���� � �������   STRING    MeshName ��� mesh ����� �������   STRING    MaterialName ��� ���������   STRING    SubEntityCount ���-�� ����������� � �������   FLOAT�   VertexCount     FLOAT�  
 IndexCount     FLOAT�  	 IsVisible ��������� ������� 1 FLOAT�   IsCastShadows ������������ ����� �������� 1 FLOAT�   AddManuallyV 0 - �������� ������������ �� ����� ������ �� �����, 1 - �������� ����� ������ �� ����� 1 FLOAT    _hSceneNode     HANDLE�   isInitialized     FLOAT  
 _isVisible     FLOAT�   _isCastShadows     FLOAT�   i     FLOAT   _materialName     STRING�   tempMaterialName     STRING  
 �HANDLE HScene, HEntity, HSceneNode
String Name, MeshName, MaterialName
Float  SubEntityCount, VertexCount, IndexCount, IsVisible, IsCastShadows, AddManually

Handle local _hSceneNode
Float  local isInitialized, _isVisible, _isCastShadows, i
String local _materialName, tempMaterialName

if(HScene)
  if(hEntity == #0)
    if(AddManually)
      hEntity := Entity_Create(HScene, Name, MeshName)
      Movable_GetName(~hEntity, ~Name)
    else
      HEntity := Scene_GetEntity(HScene, Name)
      Entity_GetMaterial(~hEntity, 0, ~MaterialName)
      IsVisible := Movable_GetVisible(~hEntity)
      IsCastShadows := Movable_GetCastShadows(~hEntity)
      
      HSceneNode := Movable_GetParent(~hEntity)
      
      _hSceneNode := ~HSceneNode
      _isCastShadows := ~IsCastShadows
      _materialName := ~MaterialName
    endif
    SubEntityCount := Entity_GetSubEntityCount(~hEntity)
    VertexCount := Entity_GetVertexCount(~hEntity)
    IndexCount := Entity_GetVertexCount(~hEntity)
    _isVisible := -1
  endif

  if(~HEntity != #0)
    if(~_hSceneNode != ~HSceneNode && ~HSceneNode !=#0)
      Movable_SetParent(~HEntity, ~HSceneNode)
     _hSceneNode := ~HSceneNode
    endif

    if(~_isVisible != ~IsVisible)
      Movable_SetVisible(~HEntity, ~IsVisible)
      _isVisible := IsVisible
    endif

    if(~_isCastShadows != ~IsCastShadows)
      Movable_SetCastShadows(~HEntity, ~IsCastShadows)
      _isCastShadows := IsCastShadows
    endif

    if(~_materialName != ~MaterialName && Material_Get(~MaterialName) != #0)
      Entity_SetMaterial(~HEntity, 0, ~MaterialName)
      _materialName := ~MaterialName
    endif
  endif
endif    BE_ICONS.DBM �      o �        R 5 �   5      x  x  �    � �3 L    x               � �  � 	   � 
   �       
   y  {    �    � Entity_GetVertexCount  ����    � Entity_GetVertexCount  ����         �?q          S 5 �     S        S + 5 �     �       	 7 5 �    	 � 	      
 7 5 �    
 � 
   y  y  � y  �     S + 5 �            y  �y  {     ̀U  c  
 