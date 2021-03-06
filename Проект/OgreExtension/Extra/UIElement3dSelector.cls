SB0  �      Element3dSelector !  HSpace     HANDLE    HRenderWindow     HANDLE    HScene     HANDLE    HContainerNode     HANDLE   	 HViewport     HANDLE    CheckHidden     FLOAT    IsObjectSelected     FLOAT�   HSelectedEntity     HANDLE�   HCollisionEntityList     HANDLE�   SelectedEntityName     STRING�   hEntityList     HANDLE   hObject     HANDLE�   hChildEntity     HANDLE  
 entityName     STRING   isInitialise     FLOAT   res     FLOAT�   i     FLOAT�   j     FLOAT   rayPosX     FLOAT   rayPosY     FLOAT   rayPosZ     FLOAT   rayDirX     FLOAT   rayDirY     FLOAT   rayDirZ     FLOAT   childEntitiesCount     FLOAT   selectedObjectsCount     FLOAT�   _lmbDown     FLOAT�   _lmbUp     FLOAT�   renderWindowWidth     FLOAT   renderWindowHeight     FLOAT   LMBDown     FLOAT�  
 LMBPressed     FLOAT�   LMBUp     FLOAT�               HRenderWindow HRenderWindow HSpace HSpace   OgreMouseStateObserver  MouseStateObserver     ��@     @�@ 	 �      �  2D  � �                        Y@      Y@      Y@      Y@          �    
 
    �,    
 �� N           ��@      ~@      @@      @@                      @@      @@    Q          @�@      @              R@         @�@      @     @�@     ��@  N          ��@     @�@      @@      @@              t@      @@      @@    0     �       �    MouseStateObserver�#    
 
 ��e      �        �=    
 
 ��o       VARPOINT.DBMo      
 SYSTEM.DBM
 �Handle HSpace, HRenderWindow, HScene, HContainerNode, HViewport
Float  CheckHidden, IsObjectSelected
Handle HSelectedEntity, HCollisionEntityList
String SelectedEntityName

Handle local hEntityList, hObject, hChildEntity
String local entityName
Float  local isInitialise, res, i, j, rayPosX, rayPosY, rayPosZ, rayDirX, rayDirY, rayDirZ, childEntitiesCount, selectedObjectsCount, 
             _lmbDown, _lmbUp, renderWindowWidth, renderWindowHeight

if(HRenderWindow && HScene && HViewport && HContainerNode)
  _lmbDown := GetVarF("MouseStateObserver", "LMBDown")
  _lmbUp := GetVarF("MouseStateObserver", "LMBUp")
  
  if(~_lmbDown)
    Collision_SpaceCursorRayCast(HRenderWindow, HSpace, HViewport, HScene)
    selectedObjectsCount := Collision_GetResultCount()
    
    if(HCollisionEntityList != #0)
      Delete(HCollisionEntityList)
    endif
    
    HCollisionEntityList := new()
    i:= 0
    while(~i<~selectedObjectsCount)
      hObject := Collision_GetObject(~i)
      res := vInsert(~HCollisionEntityList, "CollisionElement")
      vSet(~HCollisionEntityList, vGetCount(~HCollisionEntityList)-1, "HEntity", ~hObject)
      vSet(~HCollisionEntityList, vGetCount(~HCollisionEntityList)-1, "Distance", Collision_GetDistance(~i))
      if(!~IsObjectSelected && Node_ContainEntity(HContainerNode, ~hObject) && (Movable_GetVisible(~hObject) || CheckHidden))
        Movable_GetName(~hObject, ~SelectedEntityName)
        LMBDown := 1
        LMBPressed := 1
        IsObjectSelected := 1
        HSelectedEntity := ~hObject
      endif
      inc(~i)
    endwhile
  endif
  
  if(~_lmbUp && LMBPressed) 
    LMBUp := 1
    LMBPressed := 0
    SelectedEntityName := ""
    HSelectedEntity := #0
    
    Delete(~HCollisionEntityList)
    HCollisionEntityList := #0
  endif
  
  if(LMBDown); LMBDown := 0; endif
  if(LMBUp); LMBUp := 0; endif
  if(IsObjectSelected); IsObjectSelected := 0; endif
endif


        BE_ICONS.DBM D      U   U   U o Cz 
 MouseStateObserver  z  LMBDown �  z 
 MouseStateObserver  z  LMBUp �    5 �          � Collision_SpaceCursorRayCast   ��������  �         S 5 g   ��                 : 5 �   �    z 	 CollisionElement  �      �       �? z  HEntity   �    �       �? z  Distance    ��  -     �
 Node_ContainEntity   ������+   �  , + 5 �   �	 �       �?         �?         �?      � c3 q     + 5 "       �?              z    { 	          �         5 -              5 8              5 C              !�v  /  	 !  
 