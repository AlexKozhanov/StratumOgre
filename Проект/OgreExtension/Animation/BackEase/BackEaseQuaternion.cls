SB0  +      BackEaseQuaternion 5  EasingModeW   1 FLOAT�   EasingModeX 0 - In, 1 - Out, 2 - InOut 1 FLOAT�   EasingModeY 0 - In, 1 - Out, 2 - InOut 1 FLOAT�   EasingModeZ 0 - In, 1 - Out, 2 - InOut 1 FLOAT�   FromW     FLOAT    FromX     FLOAT    FromY     FLOAT    FromZ     FLOAT    ToW     FLOAT    ToX     FLOAT    ToY     FLOAT    ToZ     FLOAT    ByW     FLOAT    ByX� �� ������� ������ ���������� ����������(���� �� ���� ����� ��������� ����� ToX(ToY,ToZ), ����� ToX(ToY,ToZ) = FromX(FromY,FromZ)+ByX(ByY,ByZ))   FLOAT    ByY� �� ������� ������ ���������� ����������(���� �� ���� ����� ��������� ����� ToX(ToY,ToZ), ����� ToX(ToY,ToZ) = FromX(FromY,FromZ)+ByX(ByY,ByZ))   FLOAT    ByZ� �� ������� ������ ���������� ����������(���� �� ���� ����� ��������� ����� ToX(ToY,ToZ), ����� ToX(ToY,ToZ) = FromX(FromY,FromZ)+ByX(ByY,ByZ))   FLOAT    ValueW     FLOAT�   ValueX �������� ����������   FLOAT�   ValueY �������� ����������   FLOAT�   ValueZ �������� ����������   FLOAT�  
 AmplitudeW     FLOAT�  
 AmplitudeX     FLOAT�  
 AmplitudeY     FLOAT�  
 AmplitudeZ     FLOAT�   Duration ����� �������� 1 FLOAT   
 StartDelay ����� ��������   FLOAT   	 IsForever     FLOAT    AutoResetinputEvents     FLOAT    Start. ���� ������ (������������ ��� ������ ��������)   FLOAT    Stop2 ���� �������� (������������ ��� �������� ��������)   FLOAT    Pause, ���� ����� (������������ ��� ����� ��������)   FLOAT    Started     FLOAT    Finished     FLOAT    Paused     FLOAT   
 InProgress     FLOAT    ElapsedSeconds) ������� ����� 0<=ElapsedSeconds<=duration   FLOAT    Stage     FLOAT    tw     FLOAT   tx     FLOAT   ty     FLOAT   tz     FLOAT   retw     FLOAT   retx     FLOAT   rety     FLOAT   retz     FLOAT   _fromW     FLOAT�   _fromX     FLOAT�   _fromY     FLOAT�   _fromZ     FLOAT�   _toW     FLOAT�   _toX     FLOAT�   _toY     FLOAT�   _toZ     FLOAT�               Duration Duration
 StartDelay
 StartDelay	 IsForever	 IsForever AutoresetInputEvents AutoresetInputEvents Stop Stop Pause Pause Started Started Finished Finished Paused Paused
 InProgress
 InProgress ElapsedSeconds ElapsedSeconds Stage Stage   BaseAnimationClass 	 Animation     ��@      }@      ������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������ �p��  ����  � � ��  � ��  ������  ��� ���������������p�������    � ���  � �   �����  �p���  �����  ��� ���� � ���������������  ������  ������  ������  ������ ������  ����������������������������������������������������������������������	 �      �  2D  � �                        Y@      Y@      Y@      Y@          �    
 
    �#   
 
 �� N           ��@      z@      @@      @@                      @@      @@    N          ��@      }@      @@      @@      @@      `@      @@      @@    '     �       �    Animation Q          @�@      {@              H@         @�@      {@     @�@      ~@ �#    
 
 ��e      �        �?    
 
 ��o       VARPOINT.DBMo       BE_ICONS.DBM
 Float EasingModeW, EasingModeX, EasingModeY, EasingModeZ
Float FromW, FromX, FromY, FromZ, 
      ToW, ToX, ToY, ToZ, 
      ByW, ByX, ByY, ByZ, 
      ValueW, ValueX, ValueY, ValueZ,
      AmplitudeW, AmplitudeX, AmplitudeY, AmplitudeZ,
      Duration, StartDelay, IsForever,
      AutoResetinputEvents,
      Start, Stop, Pause,
      Started, Finished, Paused, InProgress,
      ElapsedSeconds, Stage

Float local tw, tx, ty, tz, retw, retx, rety, retz,            
           _fromW,  _fromX,  _fromY, _fromZ,
           _toW, _toX, _toY, _toZ

if(Start && (ToW != FromW || ToX != FromX || ToY!=FromY || ToZ!=FromZ || ByW != 0 || ByX != 0 || ByY != 0 || ByZ != 0))
    SetVar("Animation", "Start", 1)
    _fromW := FromW
    _fromX := FromX
    _fromY := FromY
    _fromZ := FromZ
    if(ByW != 0 || ByX !=0 || ByY!=0 || ByZ !=0)
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
    ValueW := fromW
    ValueX := fromX
    ValueY := fromY
    ValueZ := fromZ
    
    EasingModeW := Limit(EasingModeW, 0,2)
    EasingModeX := Limit(EasingModeX, 0,2)
    EasingModeY := Limit(EasingModeY, 0,2)
    EasingModeZ := Limit(EasingModeZ, 0,2)
    
    AmplitudeW := Limit(AmplitudeW, 0, 10)
    AmplitudeX := Limit(AmplitudeX, 0, 10)
    AmplitudeY := Limit(AmplitudeY, 0, 10)
    AmplitudeZ := Limit(AmplitudeZ, 0, 10)
endif

switch
  case(InProgress && !Paused)
    ValueW := GetBackEaseValue(EasingModeW, AmplitudeW, _fromW, _toW, Duration, ~elapsedSeconds)
    ValueX := GetBackEaseValue(EasingModeX, AmplitudeX, _fromX, _toX, Duration, ~elapsedSeconds)
    ValueY := GetBackEaseValue(EasingModeX, AmplitudeX, _fromX, _toX, Duration, ~elapsedSeconds)
    ValueZ := GetBackEaseValue(EasingModeX, AmplitudeX, _fromX, _toX, Duration, ~elapsedSeconds)
  
  case(Finished)
    ValueW := _toW
    ValueX := _toX
    ValueY := _toY
    ValueZ := _toZ
endswitch        BE_ICONS.DBM �        7  	   7 ,  
   7 ,     7 ,            7 ,            7 ,            7 ,            7 , + 5 =z  Animation z  Start        �?�   -    .    /    0            7            7 ,            7 ,            7 , 5 �       1       2       3       4 3 �    1  	  2  
  3    4                                     @g                      @g                     @g                     @g                    $@g                    $@g                    $@g                    $@g   "  ! - + 5 �      -  1    # �	 GetBackEaseValue   ��������������       .  2    # �	 GetBackEaseValue   ��������������       .  2    # �	 GetBackEaseValue   ��������������       .  2    # �	 GetBackEaseValue   ��������������  3 �   5 � 1    2    3    4      ��G  ?	   G  	 2  
 