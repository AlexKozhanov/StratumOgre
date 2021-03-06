SB0  �      BounceEasePoint "  EasingModeX 0 - In, 1 - Out, 2 - InOut 1 FLOAT�   EasingModeY 0 - In, 1 - Out, 2 - InOut 1 FLOAT�   EasingModeZ 0 - In, 1 - Out, 2 - InOut 1 FLOAT    FromX ���������� � ��������� ������   FLOAT    FromY ���������� � ��������� ������   FLOAT    ToX ���������� � �������� ������   FLOAT    ToY ���������� � �������� ������   FLOAT    ByX� �� ������� ������ ���������� ����������(���� �� ���� ����� ��������� ����� ToX(ToY,ToZ), ����� ToX(ToY,ToZ) = FromX(FromY,FromZ)+ByX(ByY,ByZ))   FLOAT    ByY� �� ������� ������ ���������� ����������(���� �� ���� ����� ��������� ����� ToX(ToY,ToZ), ����� ToX(ToY,ToZ) = FromX(FromY,FromZ)+ByX(ByY,ByZ))   FLOAT    ValueX �������� ����������   FLOAT�   ValueY �������� ����������   FLOAT�   BouncesX ����� ��������(�� 1 �� 10) 2 FLOAT�   BouncesY ����� ��������(�� 1 �� 10) 2 FLOAT�   BouncinessX ��������� �������(�� 1 �� 10) 2 FLOAT�   BouncinessY ��������� �������(�� 1 �� 10) 2 FLOAT�   Duration ����� �������� 4 FLOAT   
 StartDelay ����� ��������   FLOAT   	 IsForever     FLOAT    AutoresetInputEvents     FLOAT    Start. ���� ������ (������������ ��� ������ ��������)   FLOAT    Stop2 ���� �������� (������������ ��� �������� ��������)   FLOAT    Pause, ���� ����� (������������ ��� ����� ��������)   FLOAT    Started     FLOAT    Finished     FLOAT    Paused     FLOAT   
 InProgress     FLOAT    ElapsedSeconds) ������� ����� 0<=ElapsedSeconds<=duration   FLOAT    Stage     FLOAT    _fromX     FLOAT�   _toX     FLOAT�   _fromY     FLOAT�   _toY     FLOAT�   _fromZ     FLOAT   _toZ     FLOAT               Duration Duration
 StartDelay
 StartDelay	 IsForever	 IsForever AutoresetInputEvents AutoresetInputEvents Stop Stop Pause Pause Started Started Finished Finished Paused Paused
 InProgress
 InProgress ElapsedSeconds ElapsedSeconds Stage Stage   BaseAnimationClass 	 Animation     `�@     �z@      ������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������ ��px� ��� p�  �   � �� �  � ��p������p�� ������   ��   �  p�� p�� �� � � ��p�� �� �����x����� �������� ���� �������� ���� �������� ��������������������������������������������������������������������	 �      �  2D  � �                        Y@      Y@      Y@      Y@          �    
 
    �#   
 
 �� N           `�@     �w@      @@      @@                      @@      @@    N          `�@     �z@      @@      @@      @@      `@      @@      @@    '     �       �    Animation Q          ��@     �x@              H@         ��@     �x@     ��@     �{@ �#    
 
 ��e      �        �?    
 
 ��o       VARPOINT.DBMo       BE_ICONS.DBM
 <Float EasingModeX, EasingModeY, EasingModeZ
Float FromX, FromY, ToX, ToY, ByX, ByY, ValueX, ValueY,
      BouncesX, BouncesY, BouncinessX, BouncinessY,
      Duration, StartDelay, IsForever, AutoresetInputEvents, Start, Stop, Pause,
      Started, Finished, Paused, InProgress, ElapsedSeconds, Stage

Float local _fromX, _toX, _fromY, _toY, _fromZ, _toZ

if(Start && (ToX != FromX || ToY!=FromY || ByX != 0 || ByY != 0))
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
    EasingModeY := Limit(EasingModeX, 0,2)
    
    BouncesX := limit(trunc(BouncesX), 0, 10)
    BouncesY := limit(trunc(BouncesY), 0, 10)
    
    BouncinessX := limit(trunc(BouncinessX), 1, 10)
    BouncinessY := limit(trunc(BouncinessY), 1, 10)
endif

switch
  case(InProgress && !Paused)
    ValueX := GetBounceEaseValue(EasingModeX, BouncesX, BouncinessX, FromX, ToX, Duration, ~elapsedSeconds)
    ValueY := GetBounceEaseValue(EasingModeY, BouncesY, BouncinessY, FromY, ToY, Duration, ~elapsedSeconds)
  
  case(Finished)
    ValueX := _toX
    ValueY := _toY
endswitch        BE_ICONS.DBM .        7     7 ,            7 ,            7 , + 5 � z  Animation z  Start        �?�                   7            7 , 5 _               3 g            	    
                     @g                       @g    P                 $@g    P                 $@g    P        �?       $@g    P        �?       $@g      - + 5 !               �
 GetBounceEaseValue   ���������������� 	               �
 GetBounceEaseValue   ���������������� 
 3 -  5 -   	    
    ��G  �   �	  	 �  
 