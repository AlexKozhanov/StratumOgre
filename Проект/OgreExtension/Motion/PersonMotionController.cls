SB0  ##      PersonMotionController =  HScene     HANDLE    TerrainFileName     STRING    TerrainEntityName     STRING    TerrainMatrixId   -51 FLOAT    MotionSpeed   1 FLOAT    MotionSpeedScale     FLOAT    RotationSpeed   0.01 FLOAT    CameraRotationSpeed   0.03 FLOAT    MaxCameraRotationY   1.57 FLOAT    MinCameraRotationX   0 FLOAT    MaxCameraRotationX   1.57 FLOAT   	 PositionX     FLOAT�  	 PositionY     FLOAT�  	 PositionZ     FLOAT�   ThirdPersonRotationY     FLOAT    ThirdPersonRotationX     FLOAT    BodyRotationX     FLOAT    BodyRotationY     FLOAT�   CameraRotationX     FLOAT    CameraRotationY     FLOAT    ToFront     FLOAT    ToBack     FLOAT    ToLeft     FLOAT    ToRight     FLOAT    ToUp     FLOAT    ToDown     FLOAT    TurnLeft     FLOAT   	 TurnRight     FLOAT    TurnUp     FLOAT    TurnDown     FLOAT    CameraTurnLeft     FLOAT    CameraTurnRight     FLOAT    CameraTurnUp     FLOAT    CameraTurnDown     FLOAT    hTerrainEntity     HANDLE�   _terrainFileName     STRING�   isInitialize     FLOAT�   baseBodyRotationX     FLOAT�   baseBodyRotationY     FLOAT�   res     FLOAT�   hTerrainNode     HANDLE�   terrainMinX     FLOAT    terrainMinY     FLOAT    terrainMinZ     FLOAT    terrainMaxX     FLOAT    terrainMaxY     FLOAT    terrainMaxZ     FLOAT    terrainScaleX     FLOAT    terrainScaleY     FLOAT    terrainScaleZ     FLOAT    BaseCameraRotationX     FLOAT�   BaseCameraRotationY     FLOAT�   isMatrixLoaded     FLOAT�   mXmin     FLOAT    mYmin     FLOAT    mXmax     FLOAT    mYmax     FLOAT   	 stepCount     FLOAT�   isCameraTurned     FLOAT�   StartToBaseCameraRotation     FLOAT�   StopToBaseCameraRotation     FLOAT�  
 Handle HScene
String TerrainFileName, TerrainEntityName
Float  TerrainMatrixId, MotionSpeed, MotionSpeedScale, RotationSpeed, CameraRotationSpeed, 
       MaxCameraRotationY, MinCameraRotationX, MaxCameraRotationX,
       PositionX, PositionY, PositionZ, 
       ThirdPersonRotationY, ThirdPersonRotationX, 
       BodyRotationX, BodyRotationY, 
       CameraRotationX, CameraRotationY,
       ToFront, ToBack, ToLeft, ToRight, ToUp, ToDown, 
       TurnLeft, TurnRight, TurnUp, TurnDown, 
       CameraTurnLeft, CameraTurnRight, CameraTurnUp, CameraTurnDown

Handle local hTerrainEntity       
String local _terrainFileName
Float  local isInitialize, baseBodyRotationX, baseBodyRotationY, res//, isMatrixLoaded

if(HScene)
  if(!isInitialize)
    hTerrainEntity := Scene_GetEntity(HScene, TerrainEntityName)
    hTerrainNode := Movable_GetParent(~hTerrainEntity)
    Movable_GetBoundingBox(~hTerrainEntity, ~terrainMinX, ~terrainMinY, ~terrainMinZ, ~terrainMaxX, ~terrainMaxY, ~terrainMaxZ)
    Node_GetScale(~hTerrainNode, ~terrainScaleX, ~terrainScaleY, ~terrainScaleZ)
    
    baseBodyRotationX := BodyRotationX
    baseBodyRotationY := BodyRotationY
    
    BaseCameraRotationX := CameraRotationX
    BaseCameraRotationY := CameraRotationY
  
    isInitialize := 1
  endif

  if(_terrainFileName != TerrainFileName && FileExist(TerrainFileName))
    isMatrixLoaded := MLoad(TerrainMatrixId, TerrainFileName, 1) != 0
    if(~isMatrixLoaded)
      res := MDim(TerrainMatrixId, ~mXmin, ~mYmin, ~mXmax, ~mYmax)
      stepCount := ~mXmax
    endif
    _terrainFileName := TerrainFileName
  endif

  if(~ToFront)
    BodyRotationY := ~baseBodyRotationY
    PositionX := Limit(~PositionX - MotionSpeed*MotionSpeedScale*sin(~ThirdPersonRotationY), ~terrainMinX, ~terrainMaxX)
    PositionZ := Limit(~PositionZ - MotionSpeed*MotionSpeedScale*cos(~ThirdPersonRotationY), ~terrainMinZ, ~terrainMaxZ)
    if(~isMatrixLoaded)
      PositionY := Terrain_GetHeight(TerrainMatrixId, ~PositionX, ~PositionZ, ~terrainMinX, ~terrainMinZ, ~terrainMaxX, ~terrainMaxZ, ~stepCount)/~terrainScaleY
    endif
  endif

  if(~ToBack)
    BodyRotationY := ~baseBodyRotationY
    PositionZ := Limit(~PositionZ + MotionSpeed*MotionSpeedScale*cos(~ThirdPersonRotationY), ~terrainMinX, ~terrainMaxX) 
    PositionX := Limit(~PositionX + MotionSpeed*MotionSpeedScale*sin(~ThirdPersonRotationY), ~terrainMinX, ~terrainMaxX) 
    
    if(~isMatrixLoaded)
      PositionY := Terrain_GetHeight(TerrainMatrixId, ~PositionX, ~PositionZ, ~terrainMinX, ~terrainMinZ, ~terrainMaxX, ~terrainMaxZ, ~stepCount)/~terrainScaleY
    endif
  endif

  if(~ToLeft)
    BodyRotationY := ~baseBodyRotationY + pi/2
    PositionZ := Limit(~PositionZ - MotionSpeed*MotionSpeedScale*cos(~ThirdPersonRotationY + pi/2), ~terrainMinX, ~terrainMaxX)
    PositionX := Limit(~PositionX - MotionSpeed*MotionSpeedScale*sin(~ThirdPersonRotationY + pi/2), ~terrainMinX, ~terrainMaxX)
    if(~isMatrixLoaded)
      PositionY := Terrain_GetHeight(TerrainMatrixId, ~PositionX, ~PositionZ, ~terrainMinX, ~terrainMinZ, ~terrainMaxX, ~terrainMaxZ, ~stepCount)/~terrainScaleY
    endif
  endif

  if(~ToRight)
    BodyRotationY := ~baseBodyRotationY - pi/2
    PositionZ := Limit(~PositionZ + MotionSpeed*MotionSpeedScale*cos(~ThirdPersonRotationY + pi/2), ~terrainMinX, ~terrainMaxX)
    PositionX := Limit(~PositionX + MotionSpeed*MotionSpeedScale*sin(~ThirdPersonRotationY + pi/2), ~terrainMinX, ~terrainMaxX)
    if(~isMatrixLoaded)
      PositionY := Terrain_GetHeight(TerrainMatrixId, ~PositionX, ~PositionZ, ~terrainMinX, ~terrainMinZ, ~terrainMaxX, ~terrainMaxZ, ~stepCount)/~terrainScaleY
    endif
  endif

  if(~TurnLeft)
    inc(~ThirdPersonRotationY, ~RotationSpeed)
  endif

  if(~TurnRight)
    dec(~ThirdPersonRotationY, ~RotationSpeed)
  endif

  if(~CameraTurnLeft && CameraRotationY < MaxCameraRotationY)
    inc(~CameraRotationY, ~CameraRotationSpeed)
  endif

  if(~CameraTurnRight && CameraRotationY > -MaxCameraRotationY)
    dec(~CameraRotationY, ~CameraRotationSpeed)
  endif

  if(~CameraTurnUp && ~CameraRotationX > -MaxCameraRotationX)
    dec(~CameraRotationX, ~CameraRotationSpeed)
  endif

  if(~CameraTurnDown && ~CameraRotationX < MinCameraRotationX)
    inc(~CameraRotationX, ~CameraRotationSpeed)
  endif
  
  isCameraTurned := ~CameraTurnLeft || ~CameraTurnRight || ~CameraTurnUp || ~CameraTurnDown
  switch
    case(!~isCameraTurned && isCameraTurned)
      StartToBaseCameraRotation := 1
    case(~isCameraTurned && !isCameraTurned)
      StopToBaseCameraRotation := 1
  endswitch

  switch
    case(~ToFront && ~ToLeft)
      BodyRotationY := ~baseBodyRotationY + pi/4
    
    case(~ToFront && ~ToRight)
      BodyRotationY := ~baseBodyRotationY - pi/4
    
    case(~ToBack && ~ToRight)
      BodyRotationY := ~baseBodyRotationY + pi/4
  
    case(~ToBack && ~ToLeft)
      BodyRotationY := ~baseBodyRotationY - pi/4
    
    case(~ToLeft)
      BodyRotationY := ~baseBodyRotationY + pi/2
    
    case(~ToRight)
      BodyRotationY := ~baseBodyRotationY - pi/2
    
    default
      BodyRotationY := ~baseBodyRotationY
  endswitch
  
  if(StartToBaseCameraRotation); StartToBaseCameraRotation := 0; endif
  if(StopToBaseCameraRotation); StopToBaseCameraRotation := 0; endif
endif A   BE_ICONS.DBM Z     o Y $ - 5 D    x   "  " � (  " �) �* �+ �, �- �. � ( �/ �0 �1 �   %    &    2    3        �? $ x # x  � x  �+ 5 z   x         �?e          7  4  4 5 v   �5 �6 �7 �8 `  '  7  9 x  { #   5 �  &                )  , g               +  . g   4 5 �        )  +  ,  .  9 �	 Terrain_GetHeight  ������������������ 0      5 2 &                )  , g               )  , g   4 5 2       )  +  ,  .  9 �	 Terrain_GetHeight  ������������������ 0      5 � &  ��DT�!	@        @              ��DT�!	@        @      )  , g            ��DT�!	@        @      )  , g   4 5 �       )  +  ,  .  9 �	 Terrain_GetHeight  ������������������ 0      5 2 &  ��DT�!	@        @              ��DT�!	@        @      )  , g            ��DT�!	@        @      )  , g   4 5 2       )  +  ,  .  9 �	 Terrain_GetHeight  ������������������ 0      5 ;�   d  5 D�   f      : + 5 S�   d      q 8 + 5 c�   f      
 q 8 + 5 s�   f !    	 : + 5 ��   d    ,    ,  ! ,  :  : -  : + 5 �       �? ; 3 � :  : - + 5 �       �? <     + 5 � &  ��DT�!	@       @    3 C    + 5 � &  ��DT�!	@       @    3 C    + 5 � &  ��DT�!	@       @    3 C    + 5  &  ��DT�!	@       @    3 C  5 ) &  ��DT�!	@        @    3 C  5 ? &  ��DT�!	@        @    3 C &    ; 5 N          ;  < 5 Y          <    �R�  ;  
 