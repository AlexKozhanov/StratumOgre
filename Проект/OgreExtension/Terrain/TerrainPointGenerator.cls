SB0  `!      TerrainPointGenerator <  HScene     HANDLE    HContainerNode     HANDLE    RaycastAreaEntityName     STRING    TerrainFileName     STRING   	 StepCount   10 FLOAT    TerrainMatrixId   -1 FLOAT    GeneratePoints   1 FLOAT�   CheckAllEntities     FLOAT    IsPointsVisible   1 FLOAT    IsRayVisible     FLOAT    PointScaleX   1 FLOAT    PointScaleY   1 FLOAT    PointScaleZ   1 FLOAT    hSurfaceNode     HANDLE�   hQuaternion     HANDLE�   hPositionVector     HANDLE�   hDirectionVector     HANDLE�   hEntity     HANDLE�   hNode     HANDLE�   hSurafaceEntityList     HANDLE�   hSurfaceEntity     HANDLE�   hRay     HANDLE�  
 objectName     STRING   res     FLOAT�   isInitialized     FLOAT�   i     FLOAT�   detectedObjectsCount     FLOAT�   absolutePosX     FLOAT   absolutePosY     FLOAT   absolutePosZ     FLOAT   absoluteScaleX     FLOAT   absoluteScaleY     FLOAT   absoluteScaleZ     FLOAT  
 absoluteQW     FLOAT  
 absoluteQX     FLOAT  
 absoluteQY     FLOAT  
 absoluteQZ     FLOAT   x0     FLOAT   y0     FLOAT   z0     FLOAT   x1     FLOAT   y1     FLOAT   z1     FLOAT   x     FLOAT�   z     FLOAT�   raycastPosX     FLOAT�   raycastPosY     FLOAT�   raycastPosZ     FLOAT�   raycastDirX     FLOAT�   raycastDirY     FLOAT�   raycastDirZ     FLOAT�   vertexPositionX     FLOAT�   vertexPositionY     FLOAT�   vertexPositionZ     FLOAT�   stepX     FLOAT�   stepZ     FLOAT�   mI     FLOAT�   mJ     FLOAT�   RayCastHeight   1000 FLOAT    isEntityFound     FLOAT�  
 CHandle HScene, HContainerNode//, HSurfaceEntity
String RaycastAreaEntityName, TerrainFileName
Float  StepCount, TerrainMatrixId, GeneratePoints, CheckAllEntities, IsPointsVisible, IsRayVisible
Float  PointScaleX, PointScaleY, PointScaleZ

Handle local hSurfaceNode, hQuaternion, hPositionVector, hDirectionVector, hEntity, hNode, hSurafaceEntityList, hSurfaceEntity, hRay
String local objectName
Float  local res, isInitialized, i, detectedObjectsCount,
             absolutePosX, absolutePosY, absolutePosZ,
             absoluteScaleX, absoluteScaleY, absoluteScaleZ,
             absoluteQW, absoluteQX, absoluteQY, absoluteQZ,
             x0, y0, z0, x1, y1, z1, x, z,
             raycastPosX, raycastPosY, raycastPosZ,
             raycastDirX, raycastDirY, raycastDirZ,
             vertexPositionX, vertexPositionY, vertexPositionZ

if(HScene != #0 && HContainerNode != #0 && RaycastAreaEntityName != "")
  if(!isInitialized)
    hPositionVector := Vector_Create(0,0,0)
    hDirectionVector := Vector_Create(0,0,0)
    hQuaternion := Quaternion_Create(1,0,0,0)
    
    hSurafaceEntityList := new() 
    GetAllChildEntities(HContainerNode, ~hSurafaceEntityList)
    hSurfaceEntity := Scene_GetEntity(HScene, RaycastAreaEntityName)
    if(~hSurfaceEntity == #0)
      LogMessage("SurfacePointGenerator: hSurfaceEntity not found")
    endif
    
    isInitialized := 1
  endif

  if(GeneratePoints)
    res := MCreate(TerrainMatrixId, 0,StepCount, 0,StepCount, 1)
    
    hSurfaceNode := Movable_GetParent(~hSurfaceEntity)
    Node_GetDerivedPosition(~hSurfaceNode, ~absolutePosX, ~absolutePosY, ~absolutePosZ)
    Node_GetDerivedScale(~hSurfaceNode, ~absoluteScaleX, ~absoluteScaleY, ~absoluteScaleZ)
    Node_GetDerivedRotationQuaternion(~hSurfaceNode, ~absoluteQW, ~absoluteQX, ~absoluteQY, ~absoluteQZ)
    Quaternion_Set(~hQuaternion, ~absoluteQW, ~absoluteQX, ~absoluteQY, ~absoluteQZ)
    
    Movable_GetBoundingBox(~hSurfaceEntity, ~x0, ~y0, ~z0, ~x1, ~y1, ~z1)
    
    stepX := (~x1-~x0)/StepCount
    stepZ := (~z1-~z0)/StepCount
    
    x := ~x0; mI := 0
    while(~x<~x1)
      z := ~z0; mJ := 0
      while(~z < ~z1)
        rayCastPosX := ~absolutePosX + ~x*~absoluteScaleX 
        rayCastPosY := ~absolutePosY + ((~y1-~y0)+RayCastHeight)*~absoluteScaleY
        rayCastPosZ := ~absolutePosZ + ~z*~absoluteScaleZ
        
        Vector_Set(~hPositionVector, ~rayCastPosX, ~rayCastPosY, ~rayCastPosZ)
        Vector_Set(~hDirectionVector, 0, -1, 0)
        Quaternion_MultiplyVector(~hPositionVector, ~hQuaternion)
        Quaternion_MultiplyVector(~hDirectionVector, ~hQuaternion)
        
        raycastPosX := Vector_GetX(~hPositionVector)
        raycastPosY := Vector_GetY(~hPositionVector)
        raycastPosZ := Vector_GetZ(~hPositionVector)
        raycastDirX := Vector_GetX(~hDirectionVector)
        raycastDirY := Vector_GetY(~hDirectionVector)
        raycastDirZ := Vector_GetZ(~hDirectionVector)
        
        Collision_RayCast(HScene, ~rayCastPosX, ~rayCastPosY, ~rayCastPosZ, ~raycastDirX, ~raycastDirY, ~raycastDirZ)
        Collision_Sort()
        detectedObjectsCount := Collision_GetResultCount()
        
        i:= 0
        while(~i < ~detectedObjectsCount)
          isEntityFound := vGetIndexByFieldH(~hSurafaceEntityList, "", Collision_GetObject(~i))!=-1
          if(Collision_GetObject(~i) == ~hSurfaceEntity || (~isEntityFound && CheckAllEntities))
            Vector_Set(~hDirectionVector, 0, -Collision_GetDistance(~i), 0)
            Quaternion_MultiplyVector(~hDirectionVector, ~hQuaternion)
            Vector_Summ(~hPositionVector, ~hDirectionVector, ~hPositionVector)
            
            vertexPositionX := Vector_GetX(~hPositionVector)
            vertexPositionY := Vector_GetY(~hPositionVector)
            vertexPositionZ := Vector_GetZ(~hPositionVector)
            
            res := MPut(~TerrainMatrixId, ~mI, ~mJ, ~vertexPositionY, 1)
            break
          endif
          inc(~i)
        endwhile
        
        if(IsPointsVisible)
          hNode := SceneNode_Create(HScene, "")
          Node_SetParent(~hNode, Scene_GetRootSceneNode(HScene))
          Node_SetPosition(~hNode, ~vertexPositionX, ~vertexPositionY, ~vertexPositionZ)
          Node_SetScale(~hNode, PointScaleX, PointScaleY, PointScaleZ)
        
          hEntity := Entity_Create(HScene, "", "Box.mesh")
          Movable_SetParent(~hEntity, ~hNode)
        endif
        if(IsRayVisible)
          hRay := Ray(HScene, Scene_GetRootSceneNode(HScene), ~raycastPosX, ~raycastPosY, ~raycastPosZ, ~raycastDirX, ~raycastDirY, ~raycastDirZ, 100000)
        endif
        
        inc(~z, ~stepZ); inc(~mJ)
      endwhile
      inc(~x, ~stepX); inc(~mI)
    endwhile
    res := MSaveAs(TerrainMatrixId, TerrainFileName, 1)
    
    GeneratePoints := 0
  endif
endif
 ?   BE_ICONS.DBM �          S        S + x  z    � + 5 �  - 5 �                            � Vector_Create  ��������                             � Vector_Create  ��������         �?                           �	 Quaternion_Create  ����������  �      �
 GetAllChildEntities  ����     x           R 5 � z  SurfacePointGenerator: hSurfaceEntity not found �       �?    5 �                               �?<     �    � � �   � � �    �! �" �# �$    !  "  #  $ � Quaternion_Set   ����������    �% �& �' �( �) �* � (  %      6  *  '      7  %  +           8  +  ( : 5 � '  ,           9  ,  * : 5 �   +      -    )  &   :       .    ,       /    -  .  / � Vector_Set   ��������                    �?q          � Vector_Set   ��������      � Quaternion_MultiplyVector  ����      � Quaternion_MultiplyVector  ����    � Vector_GetX  ���� -   � Vector_GetY  ���� .   � Vector_GetZ  ���� /   � Vector_GetX  ���� 0   � Vector_GetY  ���� 1   � Vector_GetZ  ���� 2     -  .  /  0  1  2 ���                 : 5 &  z      ��	 vGetIndexByFieldH  ��������       �?q 7  ;   �  R  ;   + , 5 !             �q          � Vector_Set   ��������      � Quaternion_MultiplyVector  ����        � Vector_Summ  ������    � Vector_GetX  ���� 3   � Vector_GetY  ���� 4   � Vector_GetZ  ���� 5    8  9  4        �?@   3 &� c3 d  5 ^   z           �   3  4  5 �   
     �   z    z  Box.mesh  �      � 	 5 �       -  .  /  0  1  2       j�@� Ray 	 ��������������������  �,  7 d�9 c3 a�+  6 d�8 c3 O  x         �?d                 Zcr  �  
 