SB0  <      EntityBoundingBox   HScene     HANDLE    HBoundingBox     HANDLE�   Name     STRING   
 EntityName     STRING    Color     COLORREF    CornerLengthPercent     FLOAT    hEntity     HANDLE�   hEntityNode     HANDLE�   x1     FLOAT   y1     FLOAT   z1     FLOAT   x2     FLOAT   y2     FLOAT   z2     FLOAT   res     FLOAT  
 �	Handle   HScene, HBoundingBox
String   Name, EntityName
ColorRef Color
Float    CornerLengthPercent

Handle local hEntity, hEntityNode
Float  local x1, y1, z1, x2, y2, z2, res

//���������� ����� ������ BoundingBox_Create(), BoundingBox_Destroy(), BoundingBox_Redraw()
if(HScene)
  
  if(not(HBoundingBox) && EntityName != "")
    hEntity := Scene_GetEntity(HScene, EntityName)
    hEntityNode := Movable_GetParent(~hEntity)
    
    if(~hEntity != #0 && ~hEntityNode!=#0)
      Movable_GetBoundingBox(~hEntity, ~x1, ~y1, ~z1, ~x2, ~y2, ~z2)
      HBoundingBox := ManualObject_Create(HScene, Name)
      ManualObject_Begin(~HBoundingBox, "", OT_LINE_LIST)
        ManualObject_Position(~HBoundingBox, ~x1, ~y1, ~z1)
        ManualObject_Position(~HBoundingBox, ~x2, ~y1, ~z1)
        ManualObject_Position(~HBoundingBox, ~x2, ~y2, ~z1)
        ManualObject_Position(~HBoundingBox, ~x1, ~y2, ~z1)
        ManualObject_Position(~HBoundingBox, ~x1, ~y1, ~z2)
        ManualObject_Position(~HBoundingBox, ~x2, ~y1, ~z2)
        ManualObject_Position(~HBoundingBox, ~x2, ~y2, ~z2)
        ManualObject_Position(~HBoundingBox, ~x1, ~y2, ~z2)
      
        ManualObject_Index(~HBoundingBox, 0)
        ManualObject_Index(~HBoundingBox, 1)
        
        ManualObject_Index(~HBoundingBox, 0)
        ManualObject_Index(~HBoundingBox, 3)
        
        ManualObject_Index(~HBoundingBox, 2)
        ManualObject_Index(~HBoundingBox, 1)
        
        ManualObject_Index(~HBoundingBox, 2)
        ManualObject_Index(~HBoundingBox, 3)
        
        ManualObject_Index(~HBoundingBox, 4)
        ManualObject_Index(~HBoundingBox, 5)
        
        ManualObject_Index(~HBoundingBox, 4)
        ManualObject_Index(~HBoundingBox, 7)
        
        ManualObject_Index(~HBoundingBox, 6)
        ManualObject_Index(~HBoundingBox, 5)
        
        ManualObject_Index(~HBoundingBox, 6)
        ManualObject_Index(~HBoundingBox, 7)
        
        ManualObject_Index(~HBoundingBox, 0)
        ManualObject_Index(~HBoundingBox, 4)
        ManualObject_Index(~HBoundingBox, 1)
        ManualObject_Index(~HBoundingBox, 5)
        ManualObject_Index(~HBoundingBox, 2)
        ManualObject_Index(~HBoundingBox, 6)
        ManualObject_Index(~HBoundingBox, 3)
        ManualObject_Index(~HBoundingBox, 7)
        
    ManualObject_End(~HBoundingBox)
    Movable_SetParent(~HBoundingBox, ~hEntityNode)
    endif
    
  endif
  
  if(HBoundingBox)
  endif
  
endif 
 system.dbm a     o `  W x  z    � + 5 \   x      �         S        S + 5 \  � �	 �
 � � � �   x  �    z            @�     	  
 �     	  
 �       
 �       
 �     	   �     	   �        �        �           �         �?�           �         @�          @�         �?�          @�         @�         @�         @�         @�         @�         @�         @�         @�         @�           �         @�         �?�         @�          @�         @�         @�         @�  �    �  o `   +��  �  
 