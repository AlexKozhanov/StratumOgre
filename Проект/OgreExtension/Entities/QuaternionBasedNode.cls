SB0  1      QuaternionBasedNode $  HScene     HANDLE   
 HSceneNode     HANDLE�   HParentNode     HANDLE�   HAutoTrackTarget     HANDLE    Name     STRING   	 PositionX     FLOAT   	 PositionY     FLOAT   	 PositionZ     FLOAT    QW   1 FLOAT    QX     FLOAT    QY     FLOAT    QZ     FLOAT    ScaleX   1 FLOAT    ScaleY   1 FLOAT    ScaleZ   1 FLOAT    AutoTrackDirX     FLOAT    AutoTrackDirY   1 FLOAT    AutoTrackDirZ     FLOAT    CreateManualy   1 FLOAT    _hParentNode     HANDLE�   _hAutoTrackTarget     HANDLE�   QuaterionName     STRING   isInitialized     FLOAT  
 _positionX     FLOAT�  
 _positionY     FLOAT�  
 _positionZ     FLOAT�   _qw     FLOAT�   _qx     FLOAT�   _qy     FLOAT�   _qz     FLOAT�   _scaleX     FLOAT�   _scaleY     FLOAT�   _scaleZ     FLOAT�   _autoTrackDirX     FLOAT�   _autoTrackDirY     FLOAT�   _autoTrackDirZ     FLOAT�  
 	Handle HScene, HSceneNode, HParentNode, HAutoTrackTarget
String Name
Float  PositionX, PositionY, PositionZ, 
       QW, QX, QY, QZ, 
       ScaleX, ScaleY, ScaleZ,
       AutoTrackDirX, AutoTrackDirY, AutoTrackDirZ,
       CreateManualy

Handle local _hParentNode, _hAutoTrackTarget
String local QuaterionName
Float  local isInitialized, 
             _positionX, _positionY, _positionZ, 
             _qw, _qx, _qy, _qz, 
             _scaleX, _scaleY, _scaleZ,
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
    if(~_hParentNode!=~HParentNode)
      Node_SetParent(~HSceneNode, ~HParentNode)
      _hParentNode := HParentNode
    endif
  
    if(_positionX != PositionX || _positionY != PositionY || _positionZ != PositionZ)
      Node_SetPosition(~HSceneNode, ~PositionX, ~PositionY, ~PositionZ)
      _positionX := PositionX
      _positionY := PositionY
      _positionZ := PositionZ
    endif
  
    if(_qw != QW || _qx != QX || _qy != QY || _qz != QZ)
      Node_SetRotationQuaternion(~HSceneNode, QW, QX, QY, QZ)
      _qw := QW; _qx := QX; _qy := QY; _qz := QZ
    endif
  
    if(_scaleX != ScaleX || _scaleY != ScaleY || _scaleZ != ScaleZ)
      Node_SetScale(~HSceneNode, ScaleX, ScaleY, ScaleZ)
      _scaleX := ScaleX
      _scaleY := ScaleY
      _scaleZ := ScaleZ
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
 system.dbm      o        R 5 J   5     x    3 J x  z    � 5 J    x      � � � �  � �	 �
 � �  � � � �  �         S 5     S 5 b     �        7     7 ,     7 , 5 �         �                7    	 7 ,    
 7 ,     7 , 5 �      	  
   �     	    
           7     7 ,      7 , 5 �         �                 S  !   7 ,  "   7 ,  #   7 , 5           !       !    "    #    B}&  �  
 