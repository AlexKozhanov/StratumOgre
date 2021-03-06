SB0  �      EntityEx   m_Scene     HANDLE    m_Name     STRING   
 m_MeshName     STRING    l_Create     FLOAT�   m_SceneNode     HANDLE    l_SceneNode     HANDLE�   m_CastShadows   1 FLOAT    l_CastShadows     FLOAT�  	 m_Visible   1 FLOAT   	 l_Visible     FLOAT�   m_MaterialName     STRING    l_MaterialName     STRING�   m_Entity     HANDLE�  
 HANDLE m_Scene
STRING m_Name
STRING m_MeshName

FLOAT local l_Create

HANDLE m_SceneNode
HANDLE local l_SceneNode

FLOAT m_CastShadows
FLOAT local l_CastShadows

FLOAT m_Visible
FLOAT local l_Visible

STRING m_MaterialName
STRING local l_MaterialName

if(~!l_Create)
  if(~m_Scene)  
    m_Entity := Entity_Create(~m_Scene, ~m_Name, ~m_MeshName)
    Movable_GetName(~m_Entity, ~m_Name)
    l_Create := 1
  endif
endif

if(~m_Entity)
  if(l_SceneNode != ~m_SceneNode)
    Movable_SetParent(~m_Entity, ~m_SceneNode)
    l_SceneNode := ~m_SceneNode
  endif
  
  if(l_CastShadows != ~m_CastShadows)
    Movable_SetCastShadows(~m_Entity, ~m_CastShadows)
    l_CastShadows := ~m_CastShadows
  endif
  
  if(l_Visible != ~m_Visible)
    Movable_SetVisible(~m_Entity, ~m_Visible)
    l_Visible := ~m_Visible
  endif
  
  if(l_MaterialName != ~m_MaterialName && Material_Get(~m_MaterialName) != #0)
     Entity_SetMaterial(~m_Entity, 0, m_MaterialName)
     l_MaterialName := ~m_MaterialName
  endif   
endif



 \   BE_ICONS.DBM p     - 5     o     y  y  �    � �       �?    o o     S 5 2     �        7 5 B     �     	   7 5 R     �   	 x  y 
 � y 
 �     S + 5 o            x 
 �y 
 {     ���*  �  
 