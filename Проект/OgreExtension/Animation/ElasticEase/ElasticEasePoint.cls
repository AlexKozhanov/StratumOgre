SB0  �      ElasticEasePoint   EasingModeX 0 - In, 1 - Out, 2 - InOut 1 FLOAT�   EasingModeY 0 - In, 1 - Out, 2 - InOut 1 FLOAT�   FromX ���������� � ��������� ������   FLOAT    FromY ���������� � ��������� ������   FLOAT    ToX ���������� � �������� ������   FLOAT    ToY ���������� � �������� ������   FLOAT    ByX� �� ������� ������ ���������� ����������(���� �� ���� ����� ��������� ����� ToX(ToY,ToZ), ����� ToX(ToY,ToZ) = FromX(FromY,FromZ)+ByX(ByY,ByZ))   FLOAT    ByY� �� ������� ������ ���������� ����������(���� �� ���� ����� ��������� ����� ToX(ToY,ToZ), ����� ToX(ToY,ToZ) = FromX(FromY,FromZ)+ByX(ByY,ByZ))   FLOAT    ValueX �������� ����������   FLOAT�   ValueY �������� ����������   FLOAT�   OscillationsX ����� ���������   FLOAT�   OscillationsY ����� ���������   FLOAT�   SpringinessX ��������� �������   FLOAT�   SpringinessY ��������� �������   FLOAT�   Duration ����������������� ��������   FLOAT   
 StartDelay �������� ��������   FLOAT   	 IsForever     FLOAT    AutoResetInputEvents     FLOAT    Start. ���� ������ (������������ ��� ������ ��������)   FLOAT    Stop2 ���� �������� (������������ ��� �������� ��������)   FLOAT    Pause, ���� ����� (������������ ��� ����� ��������)   FLOAT    Started     FLOAT    Finished     FLOAT    Paused     FLOAT   
 InProgress     FLOAT    ElapsedSeconds) ������� ����� 0<=ElapsedSeconds<=duration   FLOAT    Stage     FLOAT    _fromX     FLOAT�   _toX     FLOAT�   _fromY     FLOAT�   _toY     FLOAT�               Duration Duration
 StartDelay
 StartDelay	 IsForever	 IsForever AutoresetInputEvents AutoresetInputEvents Stop Stop Pause Pause Started Started Finished Finished Paused Paused
 InProgress
 InProgress ElapsedSeconds ElapsedSeconds Stage Stage   BaseAnimationClass 	 Animation      �@      m@      ������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������ xw� �w� � � � �  ���  ��� �������� �����p�  p��� ��  ����� ��� ����  ��� �  ��� ��w� ����w� ������ ����� ����� ����� ������ ���������������������������������������������������������������������	 �      �  2D  � �                        Y@      Y@      Y@      Y@          �    
 
    �#   
 
 �� N            �@      g@      @@      @@                      @@      @@    N           �@      m@      @@      @@      @@      `@      @@      @@    '     �       �    Animation Q          ��@      i@              H@         ��@      i@     ��@      o@ �#    
 
 ��e      �        �?    
 
 ��o       VARPOINT.DBMo       BE_ICONS.DBM
 eFloat EasingModeX, EasingModeY,
      FromX, FromY,
      ToX, ToY, ByX, ByY, ValueX, ValueY,
      OscillationsX, OscillationsY,
      SpringinessX, SpringinessY,
      Duration, StartDelay, IsForever,
      AutoResetInputEvents,
      Start, Stop, Pause,
      Started, Finished, Paused, InProgress,
      ElapsedSeconds, Stage

Float local _fromX, _toX, _fromY, _toY
      

if(Start && (ToX!=FromX || ToY!=FromY || ByX != 0 || ByY != 0))
  SetVar("Animation", "Start", 1)
  _fromX := FromX
  _fromY := FromY
  if(ByX !=0 || ByY!=0)
    _toX := FromX + ByX
    _toY := FromY + ByY
  else
    _toX := ToX
    _toY := ToY
  endif
  ValueX := fromX
  ValueY := fromY
    
  EasingModeX := Limit(EasingModeX, 0,2)
  EasingModeY := Limit(EasingModeY, 0,2)

  OscillationsX := Limit(trunc(OscillationsX), 1, 100000)
  OscillationsY := Limit(trunc(OscillationsY), 1, 100000)
    
  SpringinessX := Limit(trunc(SpringinessX), 1, 100000)
  SpringinessY := Limit(trunc(SpringinessY), 1, 100000)
endif

switch
  case(InProgress && !Paused)
    ValueX := GetElasticEaseValue(EasingModeX, OscillationsX, SpringinessX, _fromX, _toX, Duration, ~elapsedSeconds)
    ValueY := GetElasticEaseValue(EasingModeX, OscillationsY, SpringinessY, _fromY, _toY, Duration, ~elapsedSeconds)
    
  case(Finished)
    ValueX := _toX
    ValueY := _toY
endswitch � ������ ��� ��������� ������
http://samples.msdn.microsoft.com/Silverlight/silverlight_next/Animations/easing_functions_gallery/testpage.html        BE_ICONS.DBM .        7     7 ,            7 ,            7 , + 5 � z  Animation z  Start        �?�                   7            7 , 5 _               3 g                	                     @g                      @g   
 P        �?      j�@g 
   P        �?      j�@g    P        �?      j�@g    P        �?      j�@g      - + 5 !    
           �
 GetElasticEaseValue  ����������������                 �
 GetElasticEaseValue  ���������������� 	 3 -  5 -       	    ��G  p   x	  	 c  
 �   