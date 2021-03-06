SB0  �      PowerAnimationVertex &  EasingModeX 0 - In, 1 - Out, 2 - InOut 1 FLOAT�   EasingModeY 0 - In, 1 - Out, 2 - InOut 1 FLOAT�   EasingModeZ 0 - In, 1 - Out, 2 - InOut 1 FLOAT�   PowerX   4 FLOAT�   PowerY   4 FLOAT�   PowerZ   4 FLOAT�   FromX ���������� � ��������� ������   FLOAT    FromY ���������� � ��������� ������   FLOAT    FromZ ���������� � ��������� ������   FLOAT    ToX ���������� � �������� ������   FLOAT    ToY ���������� � �������� ������   FLOAT    ToZ ���������� � �������� ������   FLOAT    ByX� �� ������� ������ ���������� ����������(���� �� ���� ����� ��������� ����� ToX(ToY,ToZ), ����� ToX(ToY,ToZ) = FromX(FromY,FromZ)+ByX(ByY,ByZ))   FLOAT    ByY� �� ������� ������ ���������� ����������(���� �� ���� ����� ��������� ����� ToX(ToY,ToZ), ����� ToX(ToY,ToZ) = FromX(FromY,FromZ)+ByX(ByY,ByZ))   FLOAT    ByZ� �� ������� ������ ���������� ����������(���� �� ���� ����� ��������� ����� ToX(ToY,ToZ), ����� ToX(ToY,ToZ) = FromX(FromY,FromZ)+ByX(ByY,ByZ))   FLOAT    ValueX �������� ����������   FLOAT�   ValueY �������� ����������   FLOAT�   ValueZ �������� ����������   FLOAT�   Duration ����� �������� 1 FLOAT   
 StartDelay ����� ��������   FLOAT   	 IsForever     FLOAT    AutoResetInputEvents     FLOAT    Start. ���� ������ (������������ ��� ������ ��������)   FLOAT    Stop2 ���� �������� (������������ ��� �������� ��������)   FLOAT    Pause, ���� ����� (������������ ��� ����� ��������)   FLOAT    Started     FLOAT    Finished     FLOAT    Paused     FLOAT   
 InProgress     FLOAT    ElapsedSeconds) ������� ����� 0<=ElapsedSeconds<=duration   FLOAT   	 TickEvent     FLOAT    Stage     FLOAT    _fromX     FLOAT�   _toX     FLOAT�   _fromY     FLOAT�   _toY     FLOAT�   _fromZ     FLOAT�   _toZ     FLOAT�               Duration Duration
 StartDelay
 StartDelay	 IsForever	 IsForever AutoresetInputEvents AutoresetInputEvents Stop Stop Pause Pause Started Started Finished Finished Paused Paused
 InProgress
 InProgress ElapsedSeconds ElapsedSeconds Stage Stage Start Start	 TickEvent	 TickEvent   BaseAnimationClass 	 Animation     ��@     �q@      ����������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������  �x����  � �����   ����������  � ��p�  p �   ��  �p��  ��� �����   ����x��� �� ������� ���x� �������  ����� �������  ����� �������  ���������������������������������������������������������������������	 �      �  2D  � �                        Y@      Y@      Y@      Y@          �    
 
    �#   
 
 �� N           ��@      m@      @@      @@                      @@      @@    N          ��@     �q@      @@      @@      @@      `@      @@      @@    '     �       �    Animation Q           �@      o@              H@          �@      o@      �@     �r@ �#    
 
 ��e      �        �?    
 
 ��o       VARPOINT.DBMo       BE_ICONS.DBM
 Float EasingModeX, EasingModeY, EasingModeZ, PowerX, PowerY, PowerZ, 
      FromX, FromY, FromZ, ToX, ToY, ToZ, ByX, ByY, ByZ, ValueX, ValueY, ValueZ,
      Duration, StartDelay, IsForever,
      AutoResetInputEvents,
      Start, Stop, Pause, 
      Started, Finished, Paused, InProgress, 
      ElapsedSeconds, TickEvent, Stage

Float local _fromX, _toX, _fromY, _toY, _fromZ, _toZ

switch
  case(Start && (ToX != FromX || ToY!=FromY || ToZ!=FromZ || ByX != 0 || ByY != 0 || ByZ != 0))
    //SetVar("Animation", "Start", 1)
  
    _fromX := FromX
    _fromY := FromY
    _fromZ := FromZ
    if (ByX !=0 || ByY!=0 || ByZ !=0)
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
    
    PowerX := Limit(PowerX, -10, 10)
    PowerY := Limit(PowerY, -10, 10)
    PowerZ := Limit(PowerZ, -10, 10)
    
  case(InProgress && !Paused)
    ValueX := GetPowerEaseValue(EasingModeX, PowerX, ~_fromX, ~_toX, Duration, ~ElapsedSeconds)
    ValueY := GetPowerEaseValue(EasingModeY, PowerY, ~_fromY, ~_toY, Duration, ~ElapsedSeconds)
    ValueZ := GetPowerEaseValue(EasingModeZ, PowerZ, ~_fromZ, ~_toZ, Duration, ~ElapsedSeconds)
  
  case(Finished)
    ValueX := _toX
    ValueY := _toY
    ValueZ := _toZ
endswitch        BE_ICONS.DBM e     	   7  
   7 ,     7 ,            7 ,            7 ,            7 , + 5 �         "    $            7            7 ,            7 , 5 p       !       #       % 3 |  	  !  
  #    %                                 @g                      @g                     @g           $@q        $@g           $@q        $@g           $@q        $@g  3 d    - + 5 T         !     �	 GetPowerEaseValue  ��������������       "  #     �	 GetPowerEaseValue  ��������������       $  %     �	 GetPowerEaseValue  ��������������  3 d  5 d !    #    %      x|>  �   �
  	 �  
 