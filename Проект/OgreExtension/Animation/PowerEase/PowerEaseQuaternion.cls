SB0        PowerAnimationQuaternion -  EasingModeW   1 FLOAT�   EasingModeX 0 - In, 1 - Out, 2 - InOut 1 FLOAT�   EasingModeY 0 - In, 1 - Out, 2 - InOut 1 FLOAT�   EasingModeZ 0 - In, 1 - Out, 2 - InOut 1 FLOAT�   PowerW   2 FLOAT�   PowerX   2 FLOAT�   PowerY   2 FLOAT�   PowerZ   2 FLOAT�   FromW   1 FLOAT    FromX ���������� � ��������� ������   FLOAT    FromY ���������� � ��������� ������   FLOAT    FromZ ���������� � ��������� ������   FLOAT    ToW     FLOAT    ToX ���������� � �������� ������   FLOAT    ToY ���������� � �������� ������   FLOAT    ToZ ���������� � �������� ������   FLOAT    ByW     FLOAT    ByX� �� ������� ������ ���������� ����������(���� �� ���� ����� ��������� ����� ToX(ToY,ToZ), ����� ToX(ToY,ToZ) = FromX(FromY,FromZ)+ByX(ByY,ByZ))   FLOAT    ByY� �� ������� ������ ���������� ����������(���� �� ���� ����� ��������� ����� ToX(ToY,ToZ), ����� ToX(ToY,ToZ) = FromX(FromY,FromZ)+ByX(ByY,ByZ))   FLOAT    ByZ� �� ������� ������ ���������� ����������(���� �� ���� ����� ��������� ����� ToX(ToY,ToZ), ����� ToX(ToY,ToZ) = FromX(FromY,FromZ)+ByX(ByY,ByZ))   FLOAT    ValueW     FLOAT�   ValueX �������� ����������   FLOAT�   ValueY �������� ����������   FLOAT�   ValueZ �������� ����������   FLOAT�   Duration ����� �������� 1 FLOAT   
 StartDelay ����� ��������   FLOAT   	 IsForever     FLOAT    AutoresetInputEvents     FLOAT    Start. ���� ������ (������������ ��� ������ ��������)   FLOAT    Stop2 ���� �������� (������������ ��� �������� ��������)   FLOAT    Pause, ���� ����� (������������ ��� ����� ��������)   FLOAT    Started     FLOAT    Finished     FLOAT    Paused     FLOAT   
 InProgress     FLOAT    ElapsedSeconds) ������� ����� 0<=ElapsedSeconds<=duration   FLOAT    Stage     FLOAT    _fromX     FLOAT�   _toX     FLOAT�   _fromY     FLOAT�   _toY     FLOAT�   _fromZ     FLOAT�   _toZ     FLOAT�   _toW     FLOAT�   _fromW     FLOAT�               Duration Duration
 StartDelay
 StartDelay	 IsForever	 IsForever AutoresetInputEvents AutoresetInputEvents Stop Stop Pause Pause Started Started Finished Finished Paused Paused
 InProgress
 InProgress ElapsedSeconds ElapsedSeconds Stage Stage   BaseAnimationClass 	 Animation      ~@      m@      ����������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������  �x����  � �����   ����������  � ��p�  p �   ��  �p��  ��� �����   ����x��� �� ������� ���x� �������  ����� �������  ����� �������  ���������������������������������������������������������������������	 �      �  2D  � �                        Y@      Y@      Y@      Y@          �    
 
    �#   
 
 �� N            ~@      g@      @@      @@                      @@      @@    Q           @      i@              H@          @      i@      @      o@  N           ~@      m@      @@      @@      @@      `@      @@      @@    '     �       �    Animation�#    
 
 ��e      �        �?    
 
 ��o       VARPOINT.DBMo       BE_ICONS.DBM
 �Float EasingModeW, EasingModeX, EasingModeY, EasingModeZ, PowerW, PowerX, PowerY, PowerZ,
      FromW, FromX, FromY, FromZ,
      ToW, ToX, ToY, ToZ, ByW, ByX, ByY, ByZ, ValueW, ValueX, ValueY, ValueZ,
      Duration, StartDelay, IsForever, AutoresetInputEvents, Start, Stop, Pause,
      Started, Finished, Paused, InProgress, ElapsedSeconds, Stage

Float local _fromX, _toX, _fromY, _toY, _fromZ, _toZ, _toW, _fromW 


switch
  case(Start && (ToX != FromX || ToY!=FromY || ToZ!=FromZ || ToW!=FromW || ByX != 0 || ByY != 0 || ByZ != 0 || ByW != 0))
    SetVar("Animation", "Start", 1)
    _fromX := FromX
    _fromY := FromY
    _fromZ := FromZ
    _fromW := FromW
    if (ByX !=0 || ByY!=0 || ByZ !=0 || ByW !=0)
      _toX := FromX + ByX
      _toY := FromY + ByY
      _toZ := FromZ + ByZ
      _toW := FromW + ByW
    else
      _toX := ToX
      _toY := ToY
      _toZ := ToZ
      _toW := ToW
    endif
    ValueX := FromX
    ValueY := FromY
    ValueZ := FromZ
    ValueW := FromW
    
    EasingModeW := Limit(EasingModeW, 0,2)
    EasingModeX := Limit(EasingModeX, 0,2)
    EasingModeY := Limit(EasingModeY, 0,2)
    EasingModeZ := Limit(EasingModeZ, 0,2)
    
    PowerW := Limit(PowerW, -10, 10)
    PowerX := Limit(PowerX, -10, 10)
    PowerY := Limit(PowerY, -10, 10)
    PowerZ := Limit(PowerZ, -10, 10)

  case(InProgress && !Paused)
    ValueW := GetPowerEaseValue(EasingModeW, PowerW, ~_fromW, ~_toW, Duration, ElapsedSeconds - Duration*Stage)
    ValueX := GetPowerEaseValue(EasingModeX, PowerX, ~_fromX, ~_toX, Duration, ElapsedSeconds - Duration*Stage)
    ValueY := GetPowerEaseValue(EasingModeY, PowerY, ~_fromY, ~_toY, Duration, ElapsedSeconds - Duration*Stage)
    ValueZ := GetPowerEaseValue(EasingModeZ, PowerZ, ~_fromZ, ~_toZ, Duration, ElapsedSeconds - Duration*Stage)
    
  case(Finished)
    ValueX := _toX
    ValueY := _toY
    ValueZ := _toZ
    ValueW := _toW
endswitch        BE_ICONS.DBM �       	 7    
 7 ,     7 ,     7 ,            7 ,            7 ,            7 ,            7 , + 5 Cz  Animation z  Start        �?� 	  %  
  '    )    ,            7            7 ,            7 ,            7 , 5 �  	     &  
     (       *       + 3 �    &    (    *    +  	    
                               @g                      @g                     @g                     @g           $@q        $@g           $@q        $@g           $@q        $@g           $@q        $@g  3 � "  ! - + 5 �      ,  +    #    $   �	 GetPowerEaseValue  ��������������       %  &    #    $   �	 GetPowerEaseValue  ��������������       '  (    #    $   �	 GetPowerEaseValue  ��������������       )  *    #    $   �	 GetPowerEaseValue  ��������������  3 �   5 � &    (    *    +      ІG  E	   M  	 8  
 