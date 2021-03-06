SB0        PowerAnimationPoint   EasingModeX 0 - In, 1 - Out, 2 - InOut 1 FLOAT�   EasingModeY 0 - In, 1 - Out, 2 - InOut 1 FLOAT�   PowerX   2 FLOAT�   PowerY   2 FLOAT�   FromX ���������� � ��������� ������   FLOAT    FromY ���������� � ��������� ������   FLOAT    ToX ���������� � �������� ������   FLOAT    ToY ���������� � �������� ������   FLOAT    ByX� �� ������� ������ ���������� ����������(���� �� ���� ����� ��������� ����� ToX(ToY,ToZ), ����� ToX(ToY,ToZ) = FromX(FromY,FromZ)+ByX(ByY,ByZ))   FLOAT    ByY� �� ������� ������ ���������� ����������(���� �� ���� ����� ��������� ����� ToX(ToY,ToZ), ����� ToX(ToY,ToZ) = FromX(FromY,FromZ)+ByX(ByY,ByZ))   FLOAT    ByZ� �� ������� ������ ���������� ����������(���� �� ���� ����� ��������� ����� ToX(ToY,ToZ), ����� ToX(ToY,ToZ) = FromX(FromY,FromZ)+ByX(ByY,ByZ))   FLOAT    ValueX �������� ����������   FLOAT�   ValueY �������� ����������   FLOAT�   Duration ����� �������� 4 FLOAT   	 IsForever     FLOAT   
 StartDelay ����� ��������   FLOAT    Start. ���� ������ (������������ ��� ������ ��������)   FLOAT    Stop2 ���� �������� (������������ ��� �������� ��������)   FLOAT    Pause, ���� ����� (������������ ��� ����� ��������)   FLOAT    Started     FLOAT    Finished     FLOAT    Paused     FLOAT   
 InProgress     FLOAT    ElapsedSeconds) ������� ����� 0<=ElapsedSeconds<=duration   FLOAT    Stage     FLOAT    AutoresetInputEvents     FLOAT    _fromX     FLOAT�   _toX     FLOAT�   _fromY     FLOAT�   _toY     FLOAT�               Duration Duration
 StartDelay
 StartDelay	 IsForever	 IsForever AutoresetInputEvents AutoresetInputEvents Stop Stop Pause Pause Started Started Finished Finished Paused Paused
 InProgress
 InProgress ElapsedSeconds ElapsedSeconds Stage Stage   BaseAnimationClass 	 Animation     ��@     �s@      ����������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������  �x����  � �����   ����������  � ��p�  p �   ��  �p��  ��� �����   ����x��� �� ������� ���x� �������  ����� �������  ����� �������  ���������������������������������������������������������������������	 �      �  2D  � �                        Y@      Y@      Y@      Y@          �    
 
    �#    
 �� N           ��@     �p@      @@      @@                      @@      @@    N          ��@     �s@      @@      @@      @@      `@      @@      @@    '     �       �    Animation Q           �@     �q@              H@          �@     �q@      �@     �t@ �#    
 
 ��e      �        �?    
 
 ��o       VARPOINT.DBMo       BE_ICONS.DBM
 m Float EasingModeX, EasingModeY, PowerX, PowerY,
      FromX, FromY, ToX, ToY, ByX, ByY, ByZ, ValueX, ValueY,
      Duration, IsForever, StartDelay, Start, Stop, Pause, 
      Started, Finished, Paused, InProgress, ElapsedSeconds, Stage, AutoresetInputEvents

Float local _fromX, _toX, _fromY, _toY

switch
  case(Start && (ToX != FromX || ToY!=FromY  || ByX != 0 || ByY != 0))
    SetVar("Animation", "Start", 1)
    _fromX := FromX
    _fromY := FromY
    if (ByX !=0 || ByY!=0)
      _toX := FromX + ByX
      _toY := FromY + ByY
    else
      _toX := ToX
      _toY := ToY
    endif
    ValueX := FromX
    ValueY := FromY
    
    EasingModeX := Limit(EasingModeX, 0, 2)
    EasingModeY := Limit(EasingModeY, 0, 2)
    
    PowerX := Limit(~PowerX, -10, 10)
    PowerY := Limit(~PowerY, -10, 10)

  case(InProgress && !Paused)
    ValueX := GetPowerEaseValue(EasingModeX, PowerX, ~_fromX, ~_toX, Duration, ~elapsedSeconds)
    ValueY := GetPowerEaseValue(EasingModeY, PowerY, ~_fromY, ~_toY, Duration, ~elapsedSeconds)
    
  case(Finished)
    ValueX := _toX
    ValueY := _toY    
endswitch        BE_ICONS.DBM         7     7 ,            7 ,  	          7 , + 5 � z  Animation z  Start        �?�                   7  	          7 , 5 _           	    3 g                                     @g                      @g           $@q        $@g           $@q        $@g  3     - + 5 �              �	 GetPowerEaseValue  ��������������              �	 GetPowerEaseValue  ��������������  3   5            φG  �   �	  	 t  
 