SB0  �      CameraNodeMouseRotator    HSpace     HANDLE    HRenderWindow     HANDLE   
 HSceneNode     HANDLE    RotationSpeed   1 FLOAT    IsAxisXRotationEnabled   1 FLOAT    IsAxisYRotationEnabled   1 FLOAT    IsEnable   1 FLOAT   	 IsDisable   0 FLOAT    IsRotationChanged     FLOAT�   hResultRotation     HANDLE�  	 hRotation     HANDLE�   res     FLOAT   isInitialize     FLOAT�   lmbDown     FLOAT�   lmbUp     FLOAT�   homeQW     FLOAT�   homeQX     FLOAT�   homeQY     FLOAT�   homeQZ     FLOAT�   cursorPositionX     FLOAT�   cursorPositionY     FLOAT�   cursorPositionX0     FLOAT�   cursorPositionY0     FLOAT�  
 rotationX0     FLOAT�  
 rotationY0     FLOAT�  	 rotationX     FLOAT�  	 rotationY     FLOAT�   QW   1 FLOAT�   QX     FLOAT�   QY     FLOAT�   QZ     FLOAT�   lmbPressedState     FLOAT�               HRenderWindow HRenderWindow HSpace HSpace   OgreMouseStateObserver 
 MouseState     ��@      y@ 	 �      �  2D  � �                        Y@      Y@      Y@      Y@          �    
 
    �$   
 
 �� N          ��@      y@      @@      @@              t@      @@      @@    (     �       �    MouseState N           ��@      v@      @@      @@                      @@      @@    Q          �@      w@              H@         �@      w@     �@      z@ �#    
 
 ��e      �        �=    
 
 ��o      
 system.dbmo       VARPOINT.DBM
 �
Handle HSpace, HRenderWindow, HSceneNode
Float  RotationSpeed, IsAxisXRotationEnabled, IsAxisYRotationEnabled, 
       IsEnable, IsDisable, IsRotationChanged

Handle local hResultRotation, hRotation
Float  local res, isInitialize, lmbDown, lmbUp, 
             homeQW, homeQX, homeQY, homeQZ,
             cursorPositionX, cursorPositionY, cursorPositionX0, cursorPositionY0,
             rotationX0, rotationY0, rotationX, rotationY


if(HRenderWindow && HSceneNode)
  if(!isInitialize)
    hRotation := Quaternion_Create(1,0,0,0)
    Node_GetRotationQuaternion(HSceneNode, ~QW, ~QX, ~QY, ~QZ)
    hResultRotation := Quaternion_Create(~QW, ~QX, ~QY, ~QZ)
    
    homeQW := QW
    homeQX := QX
    homeQY := QY
    homeQZ := QZ
    
    isInitialize := 1
  endif
  
  if(~IsEnable && !~IsDisable)
    lmbPressedState := GetVarF("MouseState", "LMBDownState")
    lmbDown := ~lmbPressedState && !lmbPressedState
    lmbUp := ~!lmbPressedState && lmbPressedState
    //lmbDown := GetVarF("MouseState", "LMBDown")
    //lmbUp   := GetVarF("MouseState", "LMBUp")
    cursorPositionX := GetVarF("MouseState", "CursorPositionX")
    cursorPositionY := GetVarF("MouseState", "CursorPositionY")
    
    if(lmbDown)
      IsRotationChanged := 1
      cursorPositionX0 := ~cursorPositionX
      cursorPositionY0 := ~cursorPositionY
    
      Node_GetRotationQuaternion(HSceneNode, ~QW, ~QX, ~QY, ~QZ)
      Quaternion_Set(~hResultRotation, ~QW, ~QX, ~QY, ~QZ)
      rotationX0 := Quaternion_GetAngleX(~hResultRotation)
      rotationY0 := Quaternion_GetAngleY(~hResultRotation)
      rotationX := ~rotationX0
      rotationY := ~rotationY0
    endif
    
    if(IsRotationChanged)
      rotationX := rotationX0 + (~cursorPositionY - ~cursorPositionY0) / 100 * RotationSpeed
      rotationY := rotationY0 + (~cursorPositionX - ~cursorPositionX0) / 100 * RotationSpeed
      
      if(IsAxisXRotationEnabled)
        Quaternion_FromAxisAngle(~hRotation, 1,0,0, -(~rotationX - rotationX))
        Quaternion_Multiply(~hResultRotation, ~hRotation, ~hResultRotation)
      endif
      
      if(IsAxisYRotationEnabled)
        Quaternion_FromAxisAngle(~hRotation, 0,1,0, -(~rotationY - rotationY))
        Quaternion_Multiply(~hResultRotation, ~hRotation, ~hResultRotation)
      endif
    
      QW := Quaternion_GetW(~hResultRotation)
      QX := Quaternion_GetX(~hResultRotation)
      QY := Quaternion_GetY(~hResultRotation)
      QZ := Quaternion_GetZ(~hResultRotation)
    
      Node_SetRotationQuaternion(HSceneNode, ~QW, ~QX, ~QY, ~QZ)
    endif
    
    if(lmbUp); 
      IsRotationChanged := 0;
    endif
  endif
  
  if(~IsDisable)
    IsRotationChanged := 0
    lmbDown := 0
  endif
endif     
 system.dbm V      U o U  - 5 p        �?                           �	 Quaternion_Create  ���������� 
   � � � � �        �	 Quaternion_Create  ���������� 	                        �?      - + 5 Cz  MouseState  z  LMBDownState  �      - +     -   +   z  MouseState  z  CursorPositionX �  z  MouseState  z  CursorPositionY �    5 /       �?            � � � � � 	         � Quaternion_Set   ����������   	 � Quaternion_GetAngleX   ����   	 � Quaternion_GetAngleY   ����            5 8              Y@                     Y@         5 � 
        �?                       q � Quaternion_FromAxisAngle   ����������   	  
  	 �
 Quaternion_Multiply  ������    5 � 
                 �?              q � Quaternion_FromAxisAngle   ����������   	  
  	 �
 Quaternion_Multiply  ������   	 � Quaternion_GetW  ����   	 � Quaternion_GetX  ����   	 � Quaternion_GetY  ����   	 � Quaternion_GetZ  ����            �  5 C             5 U                         #IN     	 �  
 