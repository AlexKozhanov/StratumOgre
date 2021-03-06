SB0  ~      BounceEaseQuaternion 1  EasingModeW 0 - In, 1 - Out, 2 - InOut 1 FLOAT�   EasingModeX 0 - In, 1 - Out, 2 - InOut 1 FLOAT�   EasingModeY 0 - In, 1 - Out, 2 - InOut 1 FLOAT�   EasingModeZ 0 - In, 1 - Out, 2 - InOut 1 FLOAT�   FromW ���������� � ��������� ������   FLOAT    FromX ���������� � ��������� ������   FLOAT    FromY ���������� � ��������� ������   FLOAT    FromZ ���������� � ��������� ������   FLOAT    ToW ���������� � �������� ������   FLOAT    ToX ���������� � �������� ������   FLOAT    ToY ���������� � �������� ������   FLOAT    ToZ ���������� � �������� ������   FLOAT    ByW     FLOAT    ByX� �� ������� ������ ���������� ����������(���� �� ���� ����� ��������� ����� ToX(ToY,ToZ), ����� ToX(ToY,ToZ) = FromX(FromY,FromZ)+ByX(ByY,ByZ))   FLOAT    ByY� �� ������� ������ ���������� ����������(���� �� ���� ����� ��������� ����� ToX(ToY,ToZ), ����� ToX(ToY,ToZ) = FromX(FromY,FromZ)+ByX(ByY,ByZ))   FLOAT    ByZ� �� ������� ������ ���������� ����������(���� �� ���� ����� ��������� ����� ToX(ToY,ToZ), ����� ToX(ToY,ToZ) = FromX(FromY,FromZ)+ByX(ByY,ByZ))   FLOAT    ValueW �������� ����������   FLOAT�   ValueX �������� ����������   FLOAT�   ValueY �������� ����������   FLOAT�   ValueZ �������� ����������   FLOAT�   BouncesW ����� ��������(�� 1 �� 10) 2 FLOAT�   BouncesX ����� ��������(�� 1 �� 10) 2 FLOAT�   BouncesY ����� ��������(�� 1 �� 10) 2 FLOAT�   BouncesZ ����� ��������(�� 1 �� 10) 2 FLOAT�   BouncinessW ��������� �������(�� 1 �� 10) 2 FLOAT�   BouncinessX ��������� �������(�� 1 �� 10) 2 FLOAT�   BouncinessY ��������� �������(�� 1 �� 10) 2 FLOAT�   BouncinessZ ��������� �������(�� 1 �� 10) 2 FLOAT�   Duration ����� �������� 4 FLOAT   
 StartDelay ����� ��������   FLOAT   	 IsForever     FLOAT    AutoresetInputEvents     FLOAT    Start. ���� ������ (������������ ��� ������ ��������)   FLOAT    Stop2 ���� �������� (������������ ��� �������� ��������)   FLOAT    Pause, ���� ����� (������������ ��� ����� ��������)   FLOAT    Started     FLOAT    Finished     FLOAT    Paused     FLOAT   
 InProgress     FLOAT    ElapsedSeconds) ������� ����� 0<=ElapsedSeconds<=duration   FLOAT    Stage     FLOAT    _fromW     FLOAT�   _toW     FLOAT�   _fromX     FLOAT�   _toX     FLOAT�   _fromY     FLOAT�   _toY     FLOAT�   _fromZ     FLOAT�   _toZ     FLOAT�               Duration Duration
 StartDelay
 StartDelay	 IsForever	 IsForever AutoresetInputEvents AutoresetInputEvents Stop Stop Pause Pause Started Started Finished Finished Paused Paused
 InProgress
 InProgress ElapsedSeconds ElapsedSeconds Stage Stage   BaseAnimationClass 	 Animation     ��@      v@      ������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������ ��px� ��� p�  �   � �� �  � ��p������p�� ������   ��   �  p�� p�� �� � � ��p�� �� �����x����� �������� ���� �������� ���� �������� ��������������������������������������������������������������������	 �      �  2D  � �                        Y@      Y@      Y@      Y@          �    
 
    �#   
 
 �� N           ��@      s@      @@      @@                      @@      @@    N          ��@      v@      @@      @@      @@      `@      @@      @@    '     �       �    Animation Q           �@      t@              H@          �@      t@      �@      w@ �#    
 
 ��e      �        �?    
 
 ��o       VARPOINT.DBMo       BE_ICONS.DBM
 �Float EasingModeW, EasingModeX, EasingModeY, EasingModeZ
Float FromW, FromX, FromY, FromZ, 
      ToW, ToX, ToY, ToZ, 
      ByW, ByX, ByY, ByZ, 
      ValueW, ValueX, ValueY, ValueZ,
      BouncesW, BouncesX, BouncesY, BouncesZ,
      BouncinessW, BouncinessX, BouncinessY, BouncinessZ,
      Duration, StartDelay, IsForever, AutoresetInputEvents, Start, Stop, Pause,
      Started, Finished, Paused, InProgress, ElapsedSeconds, Stage

Float local _fromW, _toW, _fromX, _toX, _fromY, _toY, _fromZ, _toZ

if(Start && (ToX != FromX || ToY!=FromY || ToZ!=FromZ ||  ToW!=FromW || ByX != 0 || ByY != 0 || ByZ != 0 || ByW != 0))
    SetVar("Animation", "Start", 1)
    
    _fromW := FromW
    _fromX := FromX
    _fromY := FromY
    _fromZ := FromZ
    if(ByX !=0 || ByY!=0 || ByZ !=0 || ByW !=0)
      _toW := FromW + ByW
      _toX := FromX + ByX
      _toY := FromY + ByY
      _toZ := FromZ + ByZ
    else
      _toW := ToW
      _toX := ToX
      _toY := ToY
      _toZ := ToZ
    endif
    ValueW := FromW
    ValueX := FromX
    ValueY := FromY
    ValueZ := FromZ

    EasingModeW := Limit(EasingModeW, 0,2)
    EasingModeX := Limit(EasingModeX, 0,2)
    EasingModeY := Limit(EasingModeY, 0,2)
    EasingModeZ := Limit(EasingModeZ, 0,2)
    
    BouncesW := limit(trunc(~BouncesW), 0, 10)
    BouncesX := limit(trunc(~BouncesX), 0, 10)
    BouncesY := limit(trunc(~BouncesY), 0, 10)
    BouncesZ := limit(trunc(~BouncesZ), 0, 10)
    
    BouncinessW := limit(trunc(~BouncinessW), 1, 10)
    BouncinessX := limit(trunc(~BouncinessX), 1, 10)
    BouncinessY := limit(trunc(~BouncinessY), 1, 10)
    BouncinessZ := limit(trunc(~BouncinessZ), 1, 10)
endif


switch
  case(InProgress && !Paused)
    ValueW := GetBounceEaseValue(EasingModeW, BouncesW, BouncinessW, FromW, ToW, Duration, ~elapsedSeconds)
    ValueX := GetBounceEaseValue(EasingModeX, BouncesX, BouncinessX, FromX, ToX, Duration, ~elapsedSeconds)
    ValueY := GetBounceEaseValue(EasingModeY, BouncesY, BouncinessY, FromY, ToY, Duration, ~elapsedSeconds)
    ValueZ := GetBounceEaseValue(EasingModeZ, BouncesZ, BouncinessZ, FromZ, ToZ, Duration, ~elapsedSeconds)
  
  case(Finished)
    ValueW := _toW
    ValueX := _toX
    ValueY := _toY
    ValueZ := _toZ
endswitch        BE_ICONS.DBM 4      	   7  
   7 ,     7 ,     7 ,            7 ,            7 ,            7 ,            7 , + 5 �z  Animation z  Start        �?�   )    +    -    /            7            7 ,            7 ,            7 , 5 �       *       ,       .       0 3 �    *  	  ,  
  .    0                                     @g                      @g                     @g                     @g    P                 $@g    P                 $@g    P                 $@g    P                 $@g    P        �?       $@g    P        �?       $@g    P        �?       $@g    P        �?       $@g   &  % - + 5               ' �
 GetBounceEaseValue   ����������������           	    ' �
 GetBounceEaseValue   ����������������           
    ' �
 GetBounceEaseValue   ����������������               ' �
 GetBounceEaseValue   ����������������  3 3 $ 5 3 *    ,    .    0      ��G  �
     	 �  
 