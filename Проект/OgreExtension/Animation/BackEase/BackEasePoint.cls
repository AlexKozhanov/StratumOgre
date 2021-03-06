SB0  �      BackEasePoint   EasingModeX 0 - In, 1 - Out, 2 - InOut 1 FLOAT�   EasingModeY 0 - In, 1 - Out, 2 - InOut 1 FLOAT�  
 AmplitudeX     FLOAT�  
 AmplitudeY     FLOAT�   FromX ���������� � ��������� ������   FLOAT    FromY ���������� � ��������� ������   FLOAT    ToX ���������� � �������� ������   FLOAT    ToY ���������� � �������� ������   FLOAT    ByX� �� ������� ������ ���������� ����������(���� �� ���� ����� ��������� ����� ToX(ToY,ToZ), ����� ToX(ToY,ToZ) = FromX(FromY,FromZ)+ByX(ByY,ByZ))   FLOAT    ByY� �� ������� ������ ���������� ����������(���� �� ���� ����� ��������� ����� ToX(ToY,ToZ), ����� ToX(ToY,ToZ) = FromX(FromY,FromZ)+ByX(ByY,ByZ))   FLOAT    ValueX �������� ����������   FLOAT�   ValueY �������� ����������   FLOAT�   Duration ����� �������� 1 FLOAT   
 StartDelay ����� ��������   FLOAT   	 IsForever     FLOAT    AutoResetInputEvents     FLOAT    Start. ���� ������ (������������ ��� ������ ��������)   FLOAT    Stop2 ���� �������� (������������ ��� �������� ��������)   FLOAT    Pause, ���� ����� (������������ ��� ����� ��������)   FLOAT    Started     FLOAT    Finished     FLOAT    Paused     FLOAT   
 InProgress     FLOAT    ElapsedSeconds) ������� ����� 0<=ElapsedSeconds<=duration   FLOAT    Stage     FLOAT    _fromX     FLOAT�   _toX     FLOAT�   _fromY     FLOAT�   _toY     FLOAT�               Duration Duration
 StartDelay
 StartDelay	 IsForever	 IsForever AutoresetInputEvents AutoresetInputEvents Stop Stop Pause Pause Started Started Finished Finished Paused Paused
 InProgress
 InProgress ElapsedSeconds ElapsedSeconds Stage Stage   BaseAnimationClass 	 Animation      �@      v@      ������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������ �p��  ����  � � ��  � ��  ������  ��� ���������������p�������    � ���  � �   �����  �p���  �����  ��� ���� � ���������������  ������  ������  ������  ������ ������  ����������������������������������������������������������������������	 �      �  2D  � �                        Y@      Y@      Y@      Y@          �    
 
    �#   
 
 �� N            �@      s@      @@      @@                      @@      @@    N           �@      v@      @@      @@      @@      `@      @@      @@    '     �       �    Animation Q          ��@      t@              H@         ��@      t@     ��@      w@ �#    
 
 ��e      �        �?    
 
 ��o       VARPOINT.DBMo       BE_ICONS.DBM
 �Float EasingModeX, EasingModeY, AmplitudeX, AmplitudeY,
      FromX, FromY, ToX, ToY, ByX, ByY, ValueX, ValueY,
      Duration, StartDelay, IsForever, 
      AutoResetInputEvents,
      Start, Stop, Pause, 
      Started, Finished, Paused, InProgress, 
      ElapsedSeconds, Stage

Float local _fromX, _toX, _fromY, _toY

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
    EasingModeY := Limit(EasingModeY, 0,2)
    
    AmplitudeX := Limit(AmplitudeX, 0, 10)
    AmplitudeY := Limit(AmplitudeY, 0, 10)
endif

switch
  case(InProgress && !Paused)
    ValueX := GetBackEaseValue(EasingModeX, AmplitudeX, _fromX, _toX, Duration, ~elapsedSeconds)
    ValueY := GetBackEaseValue(EasingModeY, AmplitudeY, _fromY, _toY, Duration, ~elapsedSeconds)
  
  case(Finished)
    ValueX := _toX
    ValueY := _toY
endswitch        BE_ICONS.DBM         7     7 ,            7 ,  	          7 , + 5 � z  Animation z  Start        �?�                   7  	          7 , 5 _           	    3 g            
                         @g                      @g                    $@g                    $@g      - + 5 �              �	 GetBackEaseValue   �������������� 
             �	 GetBackEaseValue   ��������������  3   5    
        ��G  �   �  	 �
  
 