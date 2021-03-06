SB0  )      BounceEaseVertex (  EasingModeX 0 - In, 1 - Out, 2 - InOut 1 FLOAT�   EasingModeY 0 - In, 1 - Out, 2 - InOut 1 FLOAT�   EasingModeZ 0 - In, 1 - Out, 2 - InOut 1 FLOAT�   FromX ���������� � ��������� ������   FLOAT    FromY ���������� � ��������� ������   FLOAT    FromZ ���������� � ��������� ������   FLOAT    ToX ���������� � �������� ������   FLOAT    ToY ���������� � �������� ������   FLOAT    ToZ ���������� � �������� ������   FLOAT    ByX� �� ������� ������ ���������� ����������(���� �� ���� ����� ��������� ����� ToX(ToY,ToZ), ����� ToX(ToY,ToZ) = FromX(FromY,FromZ)+ByX(ByY,ByZ))   FLOAT    ByY� �� ������� ������ ���������� ����������(���� �� ���� ����� ��������� ����� ToX(ToY,ToZ), ����� ToX(ToY,ToZ) = FromX(FromY,FromZ)+ByX(ByY,ByZ))   FLOAT    ByZ� �� ������� ������ ���������� ����������(���� �� ���� ����� ��������� ����� ToX(ToY,ToZ), ����� ToX(ToY,ToZ) = FromX(FromY,FromZ)+ByX(ByY,ByZ))   FLOAT    ValueX �������� ����������   FLOAT�   ValueY �������� ����������   FLOAT�   ValueZ �������� ����������   FLOAT�   BouncesX ����� ��������(�� 1 �� 10) 2 FLOAT�   BouncesY ����� ��������(�� 1 �� 10) 2 FLOAT�   BouncesZ ����� ��������(�� 1 �� 10) 2 FLOAT�   BouncinessX ��������� �������(�� 1 �� 10) 2 FLOAT�   BouncinessY ��������� �������(�� 1 �� 10) 2 FLOAT�   BouncinessZ ��������� �������(�� 1 �� 10) 2 FLOAT�   Duration ����� �������� 4 FLOAT   
 StartDelay ����� ��������   FLOAT   	 IsForever     FLOAT    AutoresetInputEvents     FLOAT    Start. ���� ������ (������������ ��� ������ ��������)   FLOAT    Stop2 ���� �������� (������������ ��� �������� ��������)   FLOAT    Pause, ���� ����� (������������ ��� ����� ��������)   FLOAT    Started     FLOAT    Finished     FLOAT    Paused     FLOAT   
 InProgress     FLOAT    ElapsedSeconds) ������� ����� 0<=ElapsedSeconds<=duration   FLOAT    Stage     FLOAT    _fromX     FLOAT�   _toX     FLOAT�   _fromY     FLOAT�   _toY     FLOAT�   _fromZ     FLOAT�   _toZ     FLOAT�               Duration Duration
 StartDelay
 StartDelay	 IsForever	 IsForever AutoresetInputEvents AutoresetInputEvents Stop Stop Pause Pause Started Started Finished Finished Paused Paused
 InProgress
 InProgress ElapsedSeconds ElapsedSeconds Stage Stage   BaseAnimationClass 	 Animation     ��@      z@      ������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������ ��px� ��� p�  �   � �� �  � ��p������p�� ������   ��   �  p�� p�� �� � � ��p�� �� �����x����� �������� ���� �������� ���� �������� ��������������������������������������������������������������������	 �      �  2D  � �                        Y@      Y@      Y@      Y@          �    
 
    �#   
 
 �� N           ��@      w@      @@      @@                      @@      @@    N          ��@      z@      @@      @@      @@      `@      @@      @@    '     �       �    Animation Q           �@      x@              H@          �@      x@      �@      {@ �#    
 
 ��e      �        �?    
 
 ��o       VARPOINT.DBMo       BE_ICONS.DBM
  Float EasingModeX, EasingModeY, EasingModeZ
Float FromX, FromY, FromZ, 
      ToX, ToY, ToZ, 
      ByX, ByY, ByZ, 
      ValueX, ValueY, ValueZ, 
      BouncesX, BouncesY, BouncesZ,
      BouncinessX, BouncinessY, BouncinessZ,
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
    
    EasingModeX := Limit(EasingModeX, 0,2)
    EasingModeY := Limit(EasingModeX, 0,2)
    EasingModeZ := Limit(EasingModeX, 0,2)
    
    BouncesX := limit(trunc(BouncesX), 0, 10)
    BouncesY := limit(trunc(BouncesY), 0, 10)
    BouncesZ := limit(trunc(BouncesZ), 0, 10)
    
    BouncinessX := limit(trunc(BouncinessX), 1, 10)
    BouncinessY := limit(trunc(BouncinessY), 1, 10)
    BouncinessZ := limit(trunc(BouncinessZ), 1, 10)
endif

switch
  case(InProgress && !Paused)
    ValueX := GetBounceEaseValue(EasingModeX, BouncesX, BouncinessX, FromX, ToX, Duration, ~elapsedSeconds)
    ValueY := GetBounceEaseValue(EasingModeY, BouncesY, BouncinessY, FromY, ToY, Duration, ~elapsedSeconds)
    ValueZ := GetBounceEaseValue(EasingModeZ, BouncesZ, BouncinessZ, FromZ, ToZ, Duration, ~elapsedSeconds)
  
  case(Finished)
    ValueX := _toX
    ValueY := _toY
    ValueZ := _toZ
endswitch        BE_ICONS.DBM �        7     7 ,     7 ,  	          7 ,  
          7 ,            7 , + 5 'z  Animation z  Start        �?�   "    $    &  	          7  
          7 ,            7 , 5 �    	   #    
   %       ' 3 �    #    %    '                                 @g                       @g                      @g    P                 $@g    P                 $@g    P                 $@g    P        �?       $@g    P        �?       $@g    P        �?       $@g      - + 5 �                �
 GetBounceEaseValue   ����������������                 �
 GetBounceEaseValue   ����������������                 �
 GetBounceEaseValue   ����������������  3 �  5 � #    %    '      x|>  �	   �  	 {  
 