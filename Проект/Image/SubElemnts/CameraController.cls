SB0  .      CameraController   Sensitivity     FLOAT    CameraDistance     FLOAT    DefaultPositionY     FLOAT   	 IsDefault     FLOAT    NegativeCamera     FLOAT    CameraUp     FLOAT   
 CameraDown     FLOAT   
 CameraLeft     FLOAT    CameraRight     FLOAT    HeightCameraUp     FLOAT    HeightCameraDown     FLOAT    CameraRotationX     FLOAT�   CameraRotationY     FLOAT�   CameraPositionX     FLOAT�   CameraPositionY     FLOAT�   CameraPositionZ     FLOAT�   _cameraAngleX     FLOAT�   CameraAngleY     FLOAT�   CameraAngleX     FLOAT�   _CameraDistance     FLOAT�   _CameraPositionY     FLOAT�   _Sensitivity     FLOAT�   _init     FLOAT�  
 hFLOAT Sensitivity
FLOAT CameraDistance

FLOAT DefaultPositionY
FLOAT IsDefault

FLOAT NegativeCamera

FLOAT CameraUp
FLOAT CameraDown
FLOAT CameraLeft
FLOAT CameraRight

FLOAT HeightCameraUp
FLOAT HeightCameraDown

FLOAT CameraRotationX
FLOAT CameraRotationY

FLOAT CameraPositionX
FLOAT CameraPositionY
FLOAT CameraPositionZ

FLOAT local _cameraAngleX, CameraAngleY, CameraAngleX, _CameraDistance
FLOAT local _CameraPositionY,_Sensitivity

//�������������, ��������� �� ���������
if(!_init || IsDefault)
  _init := 1
  _CameraPositionY := ~DefaultPositionY
  _cameraAngleX := pi/10
  CameraAngleY :=  pi
  
  CameraAngleX := -~_cameraAngleX
  CameraPositionZ := ~CameraDistance*cos(~CameraAngleY)*cos(~_cameraAngleX)
  CameraPositionX := ~CameraDistance*sin(~CameraAngleY)*cos(~_cameraAngleX)
  CameraPositionY := ~CameraDistance*sin(~_cameraAngleX) + ~_CameraPositionY
endif

////////////////////////
//������ ������
if(~HeightCameraUp)
  inc(~_CameraPositionY, 1)
endif

if(~HeightCameraDown)
  dec(~_CameraPositionY, 1)
endif 

   
////////////////////////////
//�������� ������
if(~NegativeCamera)
  _Sensitivity :=-~Sensitivity
else
  _Sensitivity :=~Sensitivity 
endif   

if(~CameraLeft)
  inc(~CameraAngleY, -~_Sensitivity)
endif

if(~CameraRight)
  inc(~CameraAngleY, ~_Sensitivity)
endif

if(~CameraUp)
  inc(~_cameraAngleX, ~_Sensitivity)
  CameraAngleX := -~_cameraAngleX
endif

if(~CameraDown)
  inc(~_cameraAngleX, -~_Sensitivity)
  CameraAngleX := -~_cameraAngleX
endif

////////////////////////////
//���������
if(_cameraDistance != CameraDistance)
  _cameraDistance := CameraDistance
endif

//��������� �������
if(~CameraLeft || ~_CameraPositionY|| ~CameraRight || ~CameraUp || ~CameraDown || _CameraDistance != CameraDistance)
  CameraPositionZ := ~CameraDistance*cos(~CameraAngleY)*cos(~_cameraAngleX)
  CameraPositionX := ~CameraDistance*sin(~CameraAngleY)*cos(~_cameraAngleX)
  CameraPositionY := ~CameraDistance*sin(~_cameraAngleX) + ~_CameraPositionY
endif
//�������
CameraRotationX := ~CameraAngleY
CameraRotationY := ~CameraAngleX


   �     -   , 5 O        �?       ��DT�!	@       $@    ��DT�!	@    q                                       	 5 [ �        �?d 
 5 g �        �?f  5 r    q   3 v        5 � �   q d  5 � �   d  5 � �   d  q     5 � �   q d  q       7 5 �         ,   ,   ,   ,     7 , 5 �                                               v�),  �  
 