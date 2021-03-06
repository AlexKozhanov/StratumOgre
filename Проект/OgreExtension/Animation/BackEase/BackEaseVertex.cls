SB0  j      BackEaseVertex %  EasingModeX 0 - In, 1 - Out, 2 - InOut 1 FLOAT�   EasingModeY 0 - In, 1 - Out, 2 - InOut 1 FLOAT    EasingModeZ 0 - In, 1 - Out, 2 - InOut 1 FLOAT   
 AmplitudeX     FLOAT�  
 AmplitudeY     FLOAT�  
 AmplitudeZ     FLOAT�   FromX ���������� � ��������� ������   FLOAT    FromY ���������� � ��������� ������   FLOAT    FromZ ���������� � ��������� ������   FLOAT    ToX ���������� � �������� ������   FLOAT    ToY ���������� � �������� ������   FLOAT    ToZ ���������� � �������� ������   FLOAT    ByX� �� ������� ������ ���������� ����������(���� �� ���� ����� ��������� ����� ToX(ToY,ToZ), ����� ToX(ToY,ToZ) = FromX(FromY,FromZ)+ByX(ByY,ByZ))   FLOAT    ByY� �� ������� ������ ���������� ����������(���� �� ���� ����� ��������� ����� ToX(ToY,ToZ), ����� ToX(ToY,ToZ) = FromX(FromY,FromZ)+ByX(ByY,ByZ))   FLOAT    ByZ� �� ������� ������ ���������� ����������(���� �� ���� ����� ��������� ����� ToX(ToY,ToZ), ����� ToX(ToY,ToZ) = FromX(FromY,FromZ)+ByX(ByY,ByZ))   FLOAT    ValueX �������� ����������   FLOAT�   ValueY �������� ����������   FLOAT�   ValueZ �������� ����������   FLOAT�   Duration ����� �������� 1 FLOAT   
 StartDelay ����� ��������   FLOAT   	 IsForever     FLOAT    AutoresetInputEvents     FLOAT    Start. ���� ������ (������������ ��� ������ ��������)   FLOAT    Stop2 ���� �������� (������������ ��� �������� ��������)   FLOAT    Pause, ���� ����� (������������ ��� ����� ��������)   FLOAT    Started     FLOAT    Finished     FLOAT    Paused     FLOAT   
 InProgress     FLOAT    ElapsedSeconds) ������� ����� 0<=ElapsedSeconds<=duration   FLOAT    Stage     FLOAT    _fromX     FLOAT�   _toX     FLOAT�   _fromY     FLOAT�   _toY     FLOAT�   _fromZ     FLOAT�   _toZ     FLOAT�               Duration Duration
 StartDelay
 StartDelay	 IsForever	 IsForever AutoresetInputEvents AutoresetInputEvents Stop Stop Pause Pause Started Started Finished Finished Paused Paused
 InProgress
 InProgress ElapsedSeconds ElapsedSeconds Stage Stage   BaseAnimationClass 	 Animation      �@     �w@      ������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������ �p��  ����  � � ��  � ��  ������  ��� ���������������p�������    � ���  � �   �����  �p���  �����  ��� ���� � ���������������  ������  ������  ������  ������ ������  ����������������������������������������������������������������������	 �      �  2D  � �                        Y@      Y@      Y@      Y@          �    
 
    �#   
 
 �� N            �@     �t@      @@      @@                      @@      @@    N           �@     �w@      @@      @@      @@      `@      @@      @@    '     �       �    Animation Q          ��@     �u@              H@         ��@     �u@     ��@     �x@ �#    
 
 ��e      �        �?    
 
 ��o       VARPOINT.DBMo       BE_ICONS.DBM
 �Float EasingModeX, EasingModeY, EasingModeZ, AmplitudeX, AmplitudeY, AmplitudeZ, 
      FromX, FromY, FromZ, ToX, ToY, ToZ, ByX, ByY, ByZ, ValueX, ValueY, ValueZ,
      Duration, StartDelay, IsForever, AutoresetInputEvents, Start, Stop, Pause,
      Started, Finished, Paused, InProgress, ElapsedSeconds, Stage

Float local _fromX, _toX, _fromY, _toY, _fromZ, _toZ

if(Start && (ToX != FromX || ToY!=FromY || ToZ!=FromZ || ByX != 0 || ByY != 0 || ByZ != 0))
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
  ValueX := fromX
  ValueY := fromY
   ValueZ := fromZ
    
  EasingModeX := limit(EasingModeX, 0,2)
  EasingModeX := limit(EasingModeX, 0,2)
  EasingModeX := limit(EasingModeX, 0,2)
    
  AmplitudeX := limit(AmplitudeX, 0, 10)
  AmplitudeY := limit(AmplitudeY, 0, 10)
  AmplitudeZ := limit(AmplitudeZ, 0, 10)
endif

switch
  case(InProgress && !Paused)
    ValueX := GetBackEaseValue(EasingModeX, AmplitudeX, _fromX, _toX, Duration, ~elapsedSeconds)
    ValueY := GetBackEaseValue(EasingModeX, AmplitudeX, _fromX, _toX, Duration, ~elapsedSeconds)
    ValueZ := GetBackEaseValue(EasingModeX, AmplitudeX, _fromX, _toX, Duration, ~elapsedSeconds)
  
  case(Finished)
    ValueX := _toX
    ValueY := _toY
    ValueZ := _toZ
endswitch        BE_ICONS.DBM r     	   7  
   7 ,     7 ,            7 ,            7 ,            7 , + 5 � z  Animation z  Start        �?�       !    #            7            7 ,            7 , 5 �               "       $ 3 �  	     
  "    $                                 @g                       @g                       @g                     $@g                    $@g                    $@g      - + 5 a              �	 GetBackEaseValue   ��������������                �	 GetBackEaseValue   ��������������                �	 GetBackEaseValue   ��������������  3 q  5 q      "    $      x|>  �   �
  	 �  
 