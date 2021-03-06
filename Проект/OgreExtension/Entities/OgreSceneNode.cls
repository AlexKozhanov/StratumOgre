SB0  �      OgreSceneNode *  HScene     HANDLE   
 HSceneNode     HANDLE�   HParentNode     HANDLE�   HAutoTrackTarget     HANDLE    Name     STRING    AxisRotationOrder   YXZ STRING   	 PositionX     FLOAT   	 PositionY     FLOAT   	 PositionZ     FLOAT   	 RotationX     FLOAT   	 RotationY     FLOAT   	 RotationZ     FLOAT    ScaleX   1 FLOAT    ScaleY   1 FLOAT    ScaleZ   1 FLOAT    QW   1 FLOAT    QX     FLOAT    QY     FLOAT    QZ     FLOAT    AutoTrackDirX   0 FLOAT    AutoTrackDirY   1 FLOAT    AutoTrackDirZ   0 FLOAT    CreateManualy   1 FLOAT    _hParentNode     HANDLE�   _hAutoTrackTarget     HANDLE�   isInitialized     FLOAT  
 _positionX     FLOAT�  
 _positionY     FLOAT�  
 _positionZ     FLOAT�  
 _rotationX     FLOAT�  
 _rotationY     FLOAT�  
 _rotationZ     FLOAT�   _scaleX     FLOAT�   _scaleY     FLOAT�   _scaleZ     FLOAT�   _qw     FLOAT�   _qx     FLOAT�   _qy     FLOAT�   _qz     FLOAT�   _autoTrackDirX     FLOAT�   _autoTrackDirY     FLOAT�   _autoTrackDirZ     FLOAT�  
 Handle HScene, HSceneNode, HParentNode, HAutoTrackTarget
String Name, AxisRotationOrder
Float  PositionX, PositionY, PositionZ, 
       RotationX, RotationY, RotationZ, 
       ScaleX, ScaleY, ScaleZ,
       QW, QX, QY, QZ,
       AutoTrackDirX, AutoTrackDirY, AutoTrackDirZ,
       CreateManualy

Handle local _hParentNode, _hAutoTrackTarget
Float  local isInitialized, _positionX, _positionY, _positionZ, 
                            _rotationX, _rotationY, _rotationZ, 
                            _scaleX, _scaleY, _scaleZ, 
                            _qw, _qx, _qy, _qz,
                            _autoTrackDirX, _autoTrackDirY, _autoTrackDirZ

if(HScene)
  if(HSceneNode == #0)
    if(CreateManualy)
      HSceneNode := SceneNode_Create(HScene, Name)
    else
      if(Name != "")
        HSceneNode := Scene_GetSceneNode(HScene, Name)
        Node_GetPosition(~HSceneNode, ~PositionX, ~PositionY, ~PositionZ)
        Node_GetRotationQuaternion(~HSceneNode, ~QW, ~QX, ~QY, ~QZ)
        Node_GetScale(~HSceneNode, ~ScaleX, ~ScaleY, ~ScaleZ)
        HParentNode := Node_GetParent(~HSceneNode)
      endif
    endif
  endif

  if(~HSceneNode != #0)  
    if(_hParentNode!=HParentNode)
      Node_SetParent(~HSceneNode, HParentNode)
      _hParentNode := HParentNode
    endif
  
    if(_positionX != PositionX || _positionY != PositionY || _positionZ != PositionZ)
      Node_SetPosition(~HSceneNode, PositionX, PositionY, PositionZ)
      if(HAutoTrackTarget != #0)
        SceneNode_SetAutoTracking(~HSceneNode, HAutoTrackTarget, AutoTrackDirX, AutoTrackDirY, AutoTrackDirZ)
      endif
      _positionX := PositionX
      _positionY := PositionY
      _positionZ := PositionZ
    endif
  
    if(_rotationX != RotationX || _rotationY != RotationY || _rotationZ != RotationZ)
      switch
        case(AxisRotationOrder == "XYZ")
          Node_SetRotationEulerXYZ(~HSceneNode, RotationX, RotationY, RotationZ)
          
        case(AxisRotationOrder == "ZXY")
          Node_SetRotationEulerZXY(~HSceneNode, RotationZ, RotationX, RotationY)
          
        default
          Node_SetRotationEulerYXZ(~HSceneNode, RotationY, RotationX, RotationZ)
      endswitch
      Node_GetRotationQuaternion(~HSceneNode, ~QW, ~QX, ~QY, ~QZ)
      
      _rotationX := RotationX
      _rotationY := RotationY
      _rotationZ := RotationZ
      _qw := ~QW; _qx := ~QX; _qy := ~QY; _qz := ~QZ
    endif
  
    if(_scaleX != ScaleX || _scaleY != ScaleY || _scaleZ != ScaleZ)
      Node_SetScale(~HSceneNode, ScaleX, ScaleY, ScaleZ)
      _scaleX := ScaleX
      _scaleY := ScaleY
      _scaleZ := ScaleZ
    endif
    
    if(~_qw != ~QW || ~_qx != ~QX || ~_qy != ~QY || ~_qz != ~QZ)
      Node_SetRotationQuaternion(~HSceneNode, ~QW, ~QX, ~QY, ~QZ)
      _qw := ~QW; _qx := ~QX; _qy := ~QY; _qz := ~QZ
    endif
  
    if(_hAutoTrackTarget != HAutoTrackTarget || _autoTrackDirX != AutoTrackDirX || _autoTrackDirY != AutoTrackDirY || _autoTrackDirZ != AutoTrackDirZ)
      SceneNode_SetAutoTracking(~HSceneNode, HAutoTrackTarget, AutoTrackDirX, AutoTrackDirY, AutoTrackDirZ)
      _hAutoTrackTarget := HAutoTrackTarget
      _autoTrackDirX := AutoTrackDirX
      _autoTrackDirY := AutoTrackDirY
      _autoTrackDirZ := AutoTrackDirZ
    endif
  endif
endif   
 system.dbm �     o �       R 5 J   5     x    3 J x  z    � 5 J    x      � � � �  � � � � �  � � � �  �         S 5 �    S 5 b     �        7     7 ,     7 , 5 �         �       S 5 �           !               	 7    
 7 ,     7 , 5 x  z  XYZ � 5 �    	  
   �3 � x  z  ZXY � 5 �      	  
 �3 �    
  	   �  � � � � � 	    
          #    $    %    &      7  !   7 ,  "   7 , 5 0        �        !    "  #   7  $   7 ,  %   7 ,  &   7 , 5 d          �   #    $    %    &     S  '   7 ,  (   7 ,  )   7 , 5 �          !       '    (    )    �\x  m  
 