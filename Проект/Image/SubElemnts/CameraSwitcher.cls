SB0  �      CameraSwitcher   Object     HANDLE�   Player     HANDLE   	 Landscape     HANDLE   	 SceneNode     HANDLE�   CameraDistanceIn     FLOAT    CameraDistanceOut     FLOAT�   x     FLOAT   y     FLOAT   z     FLOAT   DistanceCameraUp     FLOAT    DistanceCameraDown     FLOAT    _Object     HANDLE�   init     FLOAT�   Mode     FLOAT   
 �HANDLE Object
HANDLE Player
HANDLE Landscape
HANDLE SceneNode
FLOAT CameraDistanceIn
FLOAT CameraDistanceOut
FLOAT local x, y, z
FLOAT DistanceCameraUp
FLOAT DistanceCameraDown

HANDLE local _Object

FLOAT init

if(~init == 0 && Player != #0)
  SceneNode:= Movable_GetParent(~Player)
  init := 1
endif

if(~Mode == 1)
  Object := ~Player
endif

if(Object != #0 && Object != Landscape && _Object != Object)
  SceneNode:= Movable_GetParent(~Object)
  _Object := ~Object
endif

if(~DistanceCameraUp)
  inc(~CameraDistanceIn, 1)
endif

if(~DistanceCameraDown)
  dec(~CameraDistanceIn, 1)
endif

if(~SceneNode != #0)
 Node_GetScale(~SceneNode,  ~x, ~y, ~z) 
 CameraDistanceOut := ~CameraDistanceIn / ~x
endif 

  


 
 system.dbm y              6        S + 5    �         �?           �?6 5 +              S      S +      S + 5 H    �        	 5 T �        �?d 
 5 ` �        �?f       S 5 x   � � � �          �),  �  
 