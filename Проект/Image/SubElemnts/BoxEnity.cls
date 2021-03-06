SB0  �      BoxEnity   m_Entity     HANDLE    m_Scene     HANDLE   
 m_Material     HANDLE    m_SceneNode     HANDLE�   cbName     STRING�   CollisionBox     FLOAT    m_ManualObject     HANDLE�   m_MaterialName     STRING   x1     FLOAT   y1     FLOAT   z1     FLOAT   x2     FLOAT   y2     FLOAT   z2     FLOAT   res     FLOAT  
 �HANDLE m_Entity
HANDLE m_Scene
HANDLE m_Material
HANDLE local m_SceneNode
STRING local cbName
Float CollisionBox

HANDLE m_ManualObject
STRING local m_MaterialName
Float  local x1, y1, z1, x2, y2, z2, res

if(~CollisionBox && m_Material != #0 && m_Entity != #0 && ~m_ManualObject == #0)
  Movable_GetBoundingBox(~m_Entity, ~x1, ~y1, ~z1, ~x2, ~y2, ~z2)
  m_SceneNode := Movable_GetParent(~m_Entity)
  Movable_GetName(m_Entity, ~cbName)
  cbName:= ~cbName + "cBox"
  Material_GetName(~m_Material, ~m_MaterialName)
  m_ManualObject := ManualObject_Create(~m_Scene, ~cbName)
  
 //��������� Box 
 ManualObject_Begin(~m_ManualObject, ~m_MaterialName, OT_TRIANGLE_LIST)
        
        ManualObject_Normal(~m_ManualObject, 0, 0, 1)           
        ManualObject_Position(~m_ManualObject, ~x1, ~y1, ~z1)          
        ManualObject_Position(~m_ManualObject, ~x1, ~y1, ~z2)
        ManualObject_Position(~m_ManualObject, ~x1, ~y2, ~z1)
        ManualObject_Position(~m_ManualObject, ~x1, ~y2, ~z2)
        ManualObject_Position(~m_ManualObject, ~x2, ~y1, ~z1)
        ManualObject_Position(~m_ManualObject, ~x2, ~y1, ~z2)
        ManualObject_Position(~m_ManualObject, ~x2, ~y2, ~z1)
        ManualObject_Position(~m_ManualObject, ~x2, ~y2, ~z2)
        
             
        ManualObject_Index(~m_ManualObject, 0)
        ManualObject_Index(~m_ManualObject, 1)
        ManualObject_Index(~m_ManualObject, 2)
        ManualObject_Index(~m_ManualObject, 2)
        ManualObject_Index(~m_ManualObject, 1)
        ManualObject_Index(~m_ManualObject, 3)
        
        ManualObject_Index(~m_ManualObject, 1)
        ManualObject_Index(~m_ManualObject, 5)
        ManualObject_Index(~m_ManualObject, 7)
        ManualObject_Index(~m_ManualObject, 7)
        ManualObject_Index(~m_ManualObject, 3)
        ManualObject_Index(~m_ManualObject, 1) 
        
        ManualObject_Index(~m_ManualObject, 5)
        ManualObject_Index(~m_ManualObject, 4)
        ManualObject_Index(~m_ManualObject, 6)
        ManualObject_Index(~m_ManualObject, 6)
        ManualObject_Index(~m_ManualObject, 7)
        ManualObject_Index(~m_ManualObject, 5)
        
        ManualObject_Index(~m_ManualObject, 4)
        ManualObject_Index(~m_ManualObject, 0)
        ManualObject_Index(~m_ManualObject, 6)
        ManualObject_Index(~m_ManualObject, 6)
        ManualObject_Index(~m_ManualObject, 0)
        ManualObject_Index(~m_ManualObject, 2)
        
        ManualObject_Index(~m_ManualObject, 3)
        ManualObject_Index(~m_ManualObject, 2)
        ManualObject_Index(~m_ManualObject, 6)
        ManualObject_Index(~m_ManualObject, 6)
        ManualObject_Index(~m_ManualObject, 7)
        ManualObject_Index(~m_ManualObject, 3)
        
        ManualObject_Index(~m_ManualObject, 0)
        ManualObject_Index(~m_ManualObject, 4)
        ManualObject_Index(~m_ManualObject, 1)
        ManualObject_Index(~m_ManualObject, 1)
        ManualObject_Index(~m_ManualObject, 5)
        ManualObject_Index(~m_ManualObject, 4)
        
        
           
  ManualObject_End(~m_ManualObject)
  Movable_SetParent(~m_ManualObject, ~m_SceneNode)
 
endif  
  
  


   	 SIGNS.DBM �           S +         S +        R + 5 �   � �	 �
 � � � �   �     � �y  z  cBox  | {    � �  y  �    y         @�                           �?�     	  
 �     	   �       
 �        �     	  
 �     	   �       
 �        �           �         �?�          @�          @�         �?�         @�         �?�         @�         @�         @�         @�         �?�         @�         @�         @�         @�         @�         @�         @�           �         @�         @�           �          @�         @�          @�         @�         @�         @�         @�           �         @�         �?�         �?�         @�         @�  �    �   C�+  }  
 