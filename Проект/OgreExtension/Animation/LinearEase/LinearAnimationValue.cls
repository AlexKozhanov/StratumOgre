SB0  5      LinearAnimationValue   Duration   1 FLOAT    Speed   1 FLOAT    IsAutoReverse     FLOAT   	 IsForever     FLOAT    From     FLOAT    To     FLOAT    By     FLOAT    Value     FLOAT�  
 StartDelay     FLOAT    Start     FLOAT�   Stop     FLOAT�   Pause     FLOAT    Started     FLOAT�   Finished     FLOAT�   Paused     FLOAT�  
 InProgress     FLOAT�   AutoResetInputEvents   1 FLOAT    ElapsedSeconds     FLOAT�   _hObject     HANDLE   isInitialize     FLOAT   _from     FLOAT�   _to     FLOAT�   stage     FLOAT   t     FLOAT�     AnimationTimer  AnimationTimer     ��@     �v@  GetLinearEaseValue         �@     �v@ 	 v      j  2D  � d                        Y@      Y@      Y@      Y@          �    
 
   ��    
 
 �� N          ��@     �v@      @@      @@                      @@      @@    ,     �       �    AnimationTimer N           �@     �v@      @@      @@                      @@      @@         �       �%    
 
 ��o      
 system.dbm
 8Float Duration, Speed, IsAutoReverse, IsForever,
      From, To, By, Value, 
      StartDelay, Start, Stop, Pause,
      Started, Finished, Paused, InProgress, AutoResetInputEvents,
      ElapsedSeconds

Handle local _hObject
Float local isInitialize, _from, _to, stage, t

if(Finished)
  Finished := 0
  SetVar("AnimationTimer", "Stop", 0)
endif
  
if(Started)
  Started := 0
  SetVar("AnimationTimer","Start", 0)
endif

switch
  case(Start)
    InProgress := 1
    Paused := 0
    Finished := 0
    Started := 1
    elapsedSeconds := 0
    
    SetVar("AnimationTimer", "Start", 1)
    SetVar("AnimationTimer", "Rate", 8)
    SetVar("AnimationTimer", "StartDelay", StartDelay*1000)
    
    _from := From
    if(By != 0)
      _to := From + By
    else
      _to := To
    endif
    Value := From

  case(Pause)
    Paused := 1
  
  case(Stop)
    InProgress := 0
    Paused := 0
    Finished := 1
    SetVar("AnimationTimer","Stop", 1)
endswitch


if(GetVarF("AnimationTimer", "TickEvent") && !Paused)
  elapsedSeconds := GetVarF("AnimationTimer", "ElapsedMilliseconds")/1000
  if(Value >= _to)
    if(IsForever)
      inc(~stage)
    else
      Value := _to
      SetVar("AnimationTimer","Stop", 1)
      InProgress := 0
      Paused := 0
      Finished := 1
      exit()
    endif
  endif
  
  t := t + (~elapsedSeconds - elapsedSeconds)*Speed
  Value := GetLinearEaseValue(From, To, Duration, (~t - ~stage*Duration))
endif

if(AutoResetInputEvents)
  if(Start); Start := 0; endif
  if(Stop); Stop := 0; endif
endif        BE_ICONS.DBM �    5              z  AnimationTimer  z  Stop           �  5 @            z  AnimationTimer  z  Start          � 	 5 �        �?                               �?             z  AnimationTimer  z  Start        �?�z  AnimationTimer  z  Rate          @�z  AnimationTimer  z  StartDelay          @�@ �               7 5 �        3 �         3   5 �        �?  3  
 5                              �?  z  AnimationTimer  z  Stop         �?�z  AnimationTimer  z  TickEvent �  - + 5 �z  AnimationTimer  z 
 ElapsedMilliseconds �      @�@       9 5 ~  5 O� c3 ~    z  AnimationTimer  z  Stop         �?�                             �?                                 �
 GetLinearEaseValue   ����������    5 � 	 5 �          	  
 5 �          
    �m�  �  	 A  
 