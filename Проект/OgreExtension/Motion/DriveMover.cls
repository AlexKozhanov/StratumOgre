SB0  ?     
 DriveMover   HRenderWindow     HANDLE    KeyConfigurationObjName   DefaultKeyConfig STRING   	 TurnSpeed   0.05 FLOAT    WheelsRotationSpeed   0.05 FLOAT    Speed   1 FLOAT    CameraDistance     FLOAT    IsEnable   1 FLOAT    UseInternalKeyStateObserver   1 FLOAT   	 PositionX     FLOAT�  	 PositionZ     FLOAT�   CameraPositionX     FLOAT�   CameraPositionY     FLOAT�   CameraPositionZ     FLOAT�   CameraAngleX     FLOAT�   CameraAngleY     FLOAT�   CarWheelsRotation     FLOAT    ToFront     FLOAT�   ToBack     FLOAT�   ToLeft     FLOAT�   ToRight     FLOAT�   TurnUp     FLOAT�   TurnDown     FLOAT�   TurnLeft     FLOAT�  	 TurnRight     FLOAT�   _init     FLOAT�   _cameraAngleX     FLOAT�   _cameraDistance     FLOAT�  	 CarAngleY     FLOAT    WheelsDirectionAngle     FLOAT�   CameraToBasePositionEvent     FLOAT      DefaultKeyConfiguration  DefaultKeyConfig     ��@     �w@ 	         2D  � �                         Y@      Y@      Y@      Y@          �    
 
  ��    
 
 �� N          ��@     �w@      @@      @@                      @@      @@    .     �       �    DefaultKeyConfig�%    
 
 ��o      
 system.dbm
 �Handle HRenderWindow
String KeyConfigurationObjName

Float TurnSpeed,  WheelsRotationSpeed, Speed, CameraDistance, IsEnable, UseInternalKeyStateObserver
Float PositionX, PositionZ, CameraPositionX, CameraPositionY, CameraPositionZ, CameraAngleX, CameraAngleY, CarWheelsRotation
Float ToFront, ToBack, ToLeft, ToRight, TurnUp, TurnDown, TurnLeft, TurnRight

Float local _init, _cameraAngleX, _cameraDistance

if(!_init)
  _init := 1
  ///
  _cameraAngleX := pi/10
  CameraAngleY := pi - pi/6
  CameraAngleX := -~_cameraAngleX
  ///
  CameraPositionZ := ~CameraDistance*cos(~CameraAngleY)*cos(~_cameraAngleX)
  CameraPositionX := ~CameraDistance*sin(~CameraAngleY)*cos(~_cameraAngleX)
  CameraPositionY := ~CameraDistance*sin(~_cameraAngleX)
endif

if(!IsEnable)
  exit()
endif

if(UseInternalKeyStateObserver && HRenderWindow != #0)
  TurnLeft  := RenderWindow_GetKeyboardButtonPressed(HRenderWindow, GetVarF(KeyConfigurationObjName, "TurnLeftKey"))
  TurnRight := RenderWindow_GetKeyboardButtonPressed(HRenderWindow, GetVarF(KeyConfigurationObjName, "TurnRightKey"))
  TurnUp    := RenderWindow_GetKeyboardButtonPressed(HRenderWindow, GetVarF(KeyConfigurationObjName, "TurnUpKey"))
  TurnDown  := RenderWindow_GetKeyboardButtonPressed(HRenderWindow, GetVarF(KeyConfigurationObjName, "TurnDownKey"))
  
  ToFront   := RenderWindow_GetKeyboardButtonPressed(HRenderWindow, GetVarF(KeyConfigurationObjName, "ToFrontKey"))
  ToBack    := RenderWindow_GetKeyboardButtonPressed(HRenderWindow, GetVarF(KeyConfigurationObjName, "ToBackKey"))
  ToLeft    := RenderWindow_GetKeyboardButtonPressed(HRenderWindow, GetVarF(KeyConfigurationObjName, "ToLeftKey"))
  ToRight   := RenderWindow_GetKeyboardButtonPressed(HRenderWindow, GetVarF(KeyConfigurationObjName, "ToRightKey"))
endif

if(~ToFront)
  PositionZ := ~PositionZ + Speed*cos(~CarAngleY)
  PositionX := ~PositionX + Speed*sin(~CarAngleY)
  inc(~CarWheelsRotation, ~WheelsRotationSpeed)
endif
if(~ToBack)
  PositionZ := ~PositionZ - Speed*cos(~CarAngleY)
  PositionX := ~PositionX - Speed*sin(~CarAngleY)
  inc(~CarWheelsRotation, -~WheelsRotationSpeed)
endif

if(~ToLeft)
  inc(~CarAngleY, (~ToFront  - ~ToBack )*~TurnSpeed)
  WheelsDirectionAngle := (~ToLeft - ~ToRight)*pi/6
endif
if(~ToRight)
  inc(~CarAngleY, (~ToBack - ~ToFront)*~TurnSpeed)
  WheelsDirectionAngle := (~ToLeft - ~ToRight)*pi/6  
endif

if(!ToRight && !ToLeft)
  WheelsDirectionAngle := 0
endif

if(~TurnLeft)
  inc(~CameraAngleY, -~TurnSpeed)
endif

if(~TurnRight)
  inc(~CameraAngleY, ~TurnSpeed)
endif

if(~TurnUp)
  inc(~_cameraAngleX, ~TurnSpeed)
  CameraAngleX := -~_cameraAngleX
endif

if(~TurnDown)
  inc(~_cameraAngleX, -~TurnSpeed)
  CameraAngleX := -~_cameraAngleX
endif

if(_cameraDistance != CameraDistance)
  _cameraDistance := CameraDistance
endif

if(~TurnLeft || ~TurnRight || ~TurnUp || ~TurnDown || _cameraDistance != CameraDistance)
  CameraPositionZ := ~CameraDistance*cos(~CameraAngleY)*cos(~_cameraAngleX)
  CameraPositionX := ~CameraDistance*sin(~CameraAngleY)*cos(~_cameraAngleX)
  CameraPositionY := ~CameraDistance*sin(~_cameraAngleX)
endif

if(~CameraToBasePositionEvent)
  ///
  _cameraAngleX := pi/10
  CameraAngleY := pi - pi/6
  CameraAngleX := -~_cameraAngleX
  ///
  CameraPositionZ := ~CameraDistance*cos(~CameraAngleY)*cos(~_cameraAngleX)
  CameraPositionX := ~CameraDistance*sin(~CameraAngleY)*cos(~_cameraAngleX)
  CameraPositionY := ~CameraDistance*sin(~_cameraAngleX)
endif
     {  
 PEOPLE.DBM +    - 5 Q        �?   ��DT�!	@       $@    ��DT�!	@ ��DT�!	@       @      q                          
           - 5 W             S + 5 �    x  z  TurnLeftKey �     x  z  TurnRightKey  �     x  z  TurnUpKey �     x  z  TurnDownKey �     x  z  ToFrontKey  �     x  z  ToBackKey �     x  z  ToLeftKey �     x  z  ToRightKey  �    5 �  	         	            �   d  5  	         	            �   q d  5 A�         d      ��DT�!	@        @     5 c�         d      ��DT�!	@        @     -   - + 5 s             5 }�   q d  5 ��   d  5 ��   d  q     5 ��   q d  q       7 5 �        ,   ,   ,     7 , 5 �                       
           5 * ��DT�!	@       $@    ��DT�!	@ ��DT�!	@       @      q                          
            �]v  �  	 �  
 