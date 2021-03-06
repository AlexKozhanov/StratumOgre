SB0  
      ElasticEaseVertex )  EasingModeX 0 - In, 1 - Out, 2 - InOut 1 FLOAT�   EasingModeY 0 - In, 1 - Out, 2 - InOut 1 FLOAT�   EasingModeZ 0 - In, 1 - Out, 2 - InOut 1 FLOAT�   FromX ���������� � ��������� ������   FLOAT    FromY ���������� � ��������� ������   FLOAT    FromZ ���������� � ��������� ������   FLOAT    ToX ���������� � �������� ������   FLOAT    ToY ���������� � �������� ������   FLOAT    ToZ ���������� � �������� ������   FLOAT    ByX� �� ������� ������ ���������� ����������(���� �� ���� ����� ��������� ����� ToX(ToY,ToZ), ����� ToX(ToY,ToZ) = FromX(FromY,FromZ)+ByX(ByY,ByZ))   FLOAT    ByY� �� ������� ������ ���������� ����������(���� �� ���� ����� ��������� ����� ToX(ToY,ToZ), ����� ToX(ToY,ToZ) = FromX(FromY,FromZ)+ByX(ByY,ByZ))   FLOAT    ByZ� �� ������� ������ ���������� ����������(���� �� ���� ����� ��������� ����� ToX(ToY,ToZ), ����� ToX(ToY,ToZ) = FromX(FromY,FromZ)+ByX(ByY,ByZ))   FLOAT    ValueX �������� ����������   FLOAT�   ValueY �������� ����������   FLOAT�   ValueZ �������� ����������   FLOAT�   OscillationsX ����� ��������� 3 FLOAT�   OscillationsY ����� ��������� 3 FLOAT�   OscillationsZ ����� ��������� 3 FLOAT�   SpringinessX ��������� ������� 5 FLOAT�   SpringinessY ��������� ������� 5 FLOAT�   SpringinessZ ��������� ������� 5 FLOAT�   Duration ����������������� �������� 1 FLOAT   
 StartDelay �������� ��������   FLOAT   	 IsForever     FLOAT    AutoResetInputEvents     FLOAT    Start. ���� ������ (������������ ��� ������ ��������)   FLOAT    Stop2 ���� �������� (������������ ��� �������� ��������)   FLOAT    Pause, ���� ����� (������������ ��� ����� ��������)   FLOAT    Started     FLOAT    Finished     FLOAT    Paused     FLOAT   
 InProgress     FLOAT    ElapsedSeconds) ������� ����� 0<=ElapsedSeconds<=duration   FLOAT    Stage     FLOAT    isInitialize     FLOAT   _fromX     FLOAT�   _toX     FLOAT�   _fromY     FLOAT�   _toY     FLOAT�   _fromZ     FLOAT�   _toZ     FLOAT�               Duration Duration
 StartDelay
 StartDelay	 IsForever	 IsForever AutoresetInputEvents AutoresetInputEvents Stop Stop Pause Pause Started Started Finished Finished Paused Paused
 InProgress
 InProgress ElapsedSeconds ElapsedSeconds Stage Stage   BaseAnimationClass 	 Animation     ��@     �t@      ������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������ xw� �w� � � � �  ���  ��� �������� �����p�  p��� ��  ����� ��� ����  ��� �  ��� ��w� ����w� ������ ����� ����� ����� ������ ���������������������������������������������������������������������	 �      �  2D  � �                        Y@      Y@      Y@      Y@          �    
 
    �#   
 
 �� N           ��@     �q@      @@      @@                      @@      @@    N          ��@     �t@      @@      @@      @@      `@      @@      @@    '     �       �    Animation Q           �@     �r@              H@          �@     �r@      �@     �u@ �#    
 
 ��e      �        �?    
 
 ��o       VARPOINT.DBMo       BE_ICONS.DBM
 vFloat EasingModeX, EasingModeY, EasingModeZ
Float FromX, FromY, FromZ, 
      ToX, ToY, ToZ, 
      ByX, ByY, ByZ, 
      ValueX, ValueY, ValueZ,
      OscillationsX, OscillationsY, OscillationsZ,
      SpringinessX, SpringinessY, SpringinessZ, 
      Duration, StartDelay, IsForever,
      AutoResetInputEvents,
      Start, Stop, Pause, 
      Started, Finished, Paused, InProgress, 
      ElapsedSeconds, Stage

Float local isInitialize, _fromX, _toX, _fromY, _toY, _fromZ, _toZ
      
if(Start && (ToX!=FromX || ToY!=FromY || ToZ!=FromZ || ByX != 0 || ByY != 0 || ByZ != 0))
  SetVar("Animation", "Start", 1)
    
  _fromX := FromX
  _fromY := FromY
  _fromZ := FromZ
  if(ByX !=0 || ByY!=0 || ByZ !=0)
    _toX := FromX + ByX
    _toY := FromY + ByY
    _toZ := FromZ + ByZ
  else
    _toX := ToX
    _toY := ToY
    _toZ := ToZ
  endif
  ValueX := FromX
  ValueY := FromY
  ValueZ := FromZ
    
  EasingModeX := Limit(EasingModeX, 0,2)
  EasingModeY := Limit(EasingModeY, 0,2)
  EasingModeZ := Limit(EasingModeZ, 0,2)
  
  OscillationsX := limit(trunc(OscillationsX), 1, 100000)
  OscillationsY := limit(trunc(OscillationsY), 1, 100000)
  OscillationsZ := limit(trunc(OscillationsZ), 1, 100000)

  SpringinessX := limit(trunc(SpringinessX), 1, 100000)
  SpringinessY := limit(trunc(SpringinessY), 1, 100000)
  SpringinessZ := limit(trunc(SpringinessZ), 1, 100000)
endif

switch
  case(InProgress && !Paused)
    ValueX := GetElasticEaseValue(EasingModeX, OscillationsX, SpringinessX, _fromX, _toX, Duration, ~elapsedSeconds)
    ValueY := GetElasticEaseValue(EasingModeY, OscillationsY, SpringinessY, _fromY, _toY, Duration, ~elapsedSeconds)
    ValueZ := GetElasticEaseValue(EasingModeZ, OscillationsZ, SpringinessZ, _fromZ, _toZ, Duration, ~elapsedSeconds)
    
  case(Finished)
    ValueX := _toX
    ValueY := _toY
    ValueZ := _toZ
endswitch � ������ ��� ��������� ������
http://samples.msdn.microsoft.com/Silverlight/silverlight_next/Animations/easing_functions_gallery/testpage.html        BE_ICONS.DBM �        7     7 ,     7 ,  	          7 ,  
          7 ,            7 , + 5 'z  Animation z  Start        �?�   #    %    '  	          7  
          7 ,            7 , 5 �    	   $    
   &       ( 3 �    $    &    (                                 @g                      @g                     @g    P        �?      j�@g    P        �?      j�@g    P        �?      j�@g    P        �?      j�@g    P        �?      j�@g    P        �?      j�@g      - + 5 �        #  $      �
 GetElasticEaseValue  ����������������         %  &      �
 GetElasticEaseValue  ����������������         '  (      �
 GetElasticEaseValue  ����������������  3 �  5 � $    &    (      !q;  �	   �  	 u  
 �   