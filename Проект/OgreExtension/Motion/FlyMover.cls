SB0  e      FlyMover   HSpace     HANDLE    HRenderWindow     HANDLE    KeyConfigurationObjName   DefaultKeyConfig STRING    FlySpeed   1 FLOAT    CameraRotationSpeed   0.001 FLOAT    IsEnable   1 FLOAT    UseInternalKeyStateObserver   1 FLOAT   	 PositionX     FLOAT�  	 PositionY     FLOAT   	 PositionZ     FLOAT�   CameraAngleX     FLOAT    CameraAngleY     FLOAT    ToFront     FLOAT�   ToBack     FLOAT�   ToLeft     FLOAT�   ToRight     FLOAT�   ToUp     FLOAT�   ToDown     FLOAT�   TurnLeft     FLOAT�  	 TurnRight     FLOAT�   TurnUp     FLOAT�   TurnDown     FLOAT�   _init     FLOAT   _cameraAngleX     FLOAT   isInitialize     FLOAT�   hQuaternionX     HANDLE�   hQuaternionY     HANDLE�   CameraQW     FLOAT�   CameraQX     FLOAT�   CameraQY     FLOAT�   CameraQZ     FLOAT�     DefaultKeyConfiguration  DefaultKeyConfig      �@      p@                                                                           """"#          #332         33333"         "333332       333333333      #3333333330     33333333333     33333333333     33333333332     3373333333"     333;333333"     3;8338f�332     3� 33� h333     3� c3� h3330    3��k3��h330    3�v�3�v�33     ?��3?��33      33;333330       ;3��33330       ���3333        ;�33330         33333           33330            330              0                                                        	         2D  � �                         Y@      Y@      Y@      Y@          �    
 
  ��    
 
   N           �@      p@      @@      @@                      @@      @@    .     �       �    DefaultKeyConfig�%    
 
 ��o      
 system.dbm
 DHandle HSpace, HRenderWindow
String KeyConfigurationObjName

Float FlySpeed, CameraRotationSpeed, IsEnable, UseInternalKeyStateObserver, PositionX, PositionY, PositionZ, /*CameraPositionX, CameraPositionY, CameraPositionZ,*/ CameraAngleX, CameraAngleY
Float ToFront, ToBack, ToLeft, ToRight, ToUp, ToDown, TurnLeft, TurnRight, TurnUp, TurnDown

Float local _init, _cameraAngleX

//TODO ���������� ����������� ����

if(HRenderWindow != #0 && IsEnable)
  if(!isInitialize)
    hQuaternionX := Quaternion_Create(1,0,0,0)
    hQuaternionY := Quaternion_Create(1,0,0,0)
    isInitialize := 1
  endif
  
  if(UseInternalKeyStateObserver)
    ToFront   := Ogre_GetKeyboardButtonPressed(HSpace, HRenderWindow, GetVarF(KeyConfigurationObjName, "ToFrontKey"))
    ToBack    := Ogre_GetKeyboardButtonPressed(HSpace, HRenderWindow, GetVarF(KeyConfigurationObjName, "ToBackKey"))
    ToLeft    := Ogre_GetKeyboardButtonPressed(HSpace, HRenderWindow, GetVarF(KeyConfigurationObjName, "ToLeftKey"))
    ToRight   := Ogre_GetKeyboardButtonPressed(HSpace, HRenderWindow, GetVarF(KeyConfigurationObjName, "ToRightKey"))
    
    ToUp      := Ogre_GetKeyboardButtonPressed(HSpace, HRenderWindow, GetVarF(KeyConfigurationObjName, "ToUpKey"))
    ToDown    := Ogre_GetKeyboardButtonPressed(HSpace, HRenderWindow, GetVarF(KeyConfigurationObjName, "ToDownKey"))
    
    TurnLeft  := Ogre_GetKeyboardButtonPressed(HSpace, HRenderWindow, GetVarF(KeyConfigurationObjName, "TurnLeftKey"))
    TurnRight := Ogre_GetKeyboardButtonPressed(HSpace, HRenderWindow, GetVarF(KeyConfigurationObjName, "TurnRightKey"))
    TurnUp    := Ogre_GetKeyboardButtonPressed(HSpace, HRenderWindow, GetVarF(KeyConfigurationObjName, "TurnUpKey"))
    TurnDown  := Ogre_GetKeyboardButtonPressed(HSpace, HRenderWindow, GetVarF(KeyConfigurationObjName, "TurnDownKey"))
  endif

  if(~ToFront)
    PositionZ := ~PositionZ - FlySpeed*cos(~CameraAngleY)
    PositionX := ~PositionX - FlySpeed*sin(~CameraAngleY)
  endif

  if(~ToBack)
    PositionZ := ~PositionZ + FlySpeed*cos(~CameraAngleY)
    PositionX := ~PositionX + FlySpeed*sin(~CameraAngleY)
  endif

  if(~ToLeft)
    PositionZ := ~PositionZ - FlySpeed*cos(~CameraAngleY + pi/2)
    PositionX := ~PositionX - FlySpeed*sin(~CameraAngleY + pi/2)
  endif

  if(~ToRight)
    PositionZ := ~PositionZ + FlySpeed*cos(~CameraAngleY + pi/2)
    PositionX := ~PositionX + FlySpeed*sin(~CameraAngleY + pi/2)
  endif

  if(ToUp)
    inc(~PositionY, FlySpeed)
  endif

  if(ToDown)
    dec(~PositionY, FlySpeed)
  endif

  if(~TurnLeft)
    inc(~CameraAngleY, CameraRotationSpeed)
  endif

  if(~TurnRight)
    dec(~CameraAngleY, CameraRotationSpeed)
  endif

  if(~TurnUp && CameraAngleX < pi/2)
    inc(~CameraAngleX, CameraRotationSpeed)
  endif

  if(~TurnDown && CameraAngleX > -pi/2)
    dec(~CameraAngleX, CameraRotationSpeed)
  endif
  
  if(~CameraAngleX != CameraAngleX || ~CameraAngleY != CameraAngleY)
    Quaternion_FromAxisAngle(~hQuaternionX, 1,0,0, ~CameraAngleX)
    Quaternion_FromAxisAngle(~hQuaternionY, 0,1,0, ~CameraAngleY)
    Quaternion_Multiply(~hQuaternionY, ~hQuaternionX, ~hQuaternionY)
    CameraQW := Quaternion_GetW(~hQuaternionY)
    CameraQX := Quaternion_GetX(~hQuaternionY)
    CameraQY := Quaternion_GetY(~hQuaternionY)
    CameraQZ := Quaternion_GetZ(~hQuaternionY)
  endif
endif     Z   ANIMALS.DBM �         S   + 5 �  - 5 e        �?                           �	 Quaternion_Create  ����������         �?                           �	 Quaternion_Create  ����������         �?    5 �     x  z  ToFrontKey  �� Ogre_GetKeyboardButtonPressed  ��������       x  z  ToBackKey �� Ogre_GetKeyboardButtonPressed  ��������       x  z  ToLeftKey �� Ogre_GetKeyboardButtonPressed  ��������       x  z  ToRightKey  �� Ogre_GetKeyboardButtonPressed  ��������       x  z  ToUpKey �� Ogre_GetKeyboardButtonPressed  ��������       x  z  ToDownKey �� Ogre_GetKeyboardButtonPressed  ��������       x  z  TurnLeftKey �� Ogre_GetKeyboardButtonPressed  ��������       x  z  TurnRightKey  �� Ogre_GetKeyboardButtonPressed  ��������       x  z  TurnUpKey �� Ogre_GetKeyboardButtonPressed  ��������       x  z  TurnDownKey �� Ogre_GetKeyboardButtonPressed  ��������    5  	         	              5  	         	              5 P 	      ��DT�!	@        @      	        ��DT�!	@        @         5 � 	      ��DT�!	@        @      	        ��DT�!	@        @         5 ��   d  5 ��   f  5 ��   d  5 ��   f   
  ��DT�!	@        @ : + 5 ��
   d   
  ��DT�!	@q         @ 8 + 5 ��
   f 
  
 7     7 , 5 �         �?                   
 � Quaternion_FromAxisAngle   ����������                    �?           � Quaternion_FromAxisAngle   ����������        �
 Quaternion_Multiply  ������    � Quaternion_GetW  ����    � Quaternion_GetX  ����    � Quaternion_GetY  ����    � Quaternion_GetZ  ����     �M�  �   �  	 �  
 