SB0  V      LinearAnimationQuaternion '  Duration   4 FLOAT    IsAutoReverse     FLOAT   	 IsForever     FLOAT    FromW     FLOAT    FromX     FLOAT    FromY     FLOAT    FromZ     FLOAT    ToW     FLOAT    ToX     FLOAT    ToY     FLOAT    ToZ     FLOAT    ByW     FLOAT    ByX     FLOAT    ByY     FLOAT    ByZ     FLOAT    ValueW     FLOAT�   ValueX     FLOAT�   ValueY     FLOAT�   ValueZ     FLOAT�  
 StartDelay     FLOAT    Start     FLOAT�   Stop     FLOAT�   Pause     FLOAT    Started     FLOAT�   Finished     FLOAT�   Paused     FLOAT�  
 InProgress     FLOAT�   AutoResetInputEvents     FLOAT    ElapsedSeconds     FLOAT�   isInitialize     FLOAT   _fromW     FLOAT�   _fromX     FLOAT�   _fromY     FLOAT�   _fromZ     FLOAT�   _toW     FLOAT�   _toX     FLOAT�   _toY     FLOAT�   _toZ     FLOAT�   stage     FLOAT     AnimationTimer  AnimationTimer     ��@      ~@ 	         2D  � �                         Y@      Y@      Y@      Y@          �    
 
  ��    
 
 �� N          ��@      ~@      @@      @@                      @@      @@    ,     �       �    AnimationTimer�%    
 
 ��o      
 system.dbm
 �	Float Duration, IsAutoReverse, IsForever,
      FromW, FromX, FromY, FromZ, 
      ToW, ToX, ToY, ToZ, 
      ByW, ByX, ByY, ByZ, 
      ValueW, ValueX, ValueY, ValueZ, 
      StartDelay, Start, Stop, Pause, 
      Started, Finished, Paused, InProgress, AutoResetInputEvents,
      ElapsedSeconds

Float local isInitialize, _fromW, _fromX, _fromY, _fromZ, _toW, _toX, _toY, _toZ, stage

if(Finished)
  Finished := 0
  SetVar("AnimationTimer", "Stop", 0)
endif
  
if(Started)
  Started := 0
  SetVar("AnimationTimer","Start", 0)
endif

switch
  case(Start && (ToW != FromW || ByW != 0 || ToX != FromX || ByX != 0 || ToY != FromY || ByY != 0 || ToZ != FromZ || ByZ != 0))
    InProgress := 1
    Paused := 0
    Finished := 0
    Started := 1
    elapsedSeconds := 0
    
    SetVar("AnimationTimer", "Start", 1)
    SetVar("AnimationTimer", "Rate", 10)
    SetVar("AnimationTimer", "StartDelay", StartDelay*1000)
    
    _fromW := FromW
    _fromX := FromX
    _fromY := FromY
    _fromZ := FromZ
    if(ByW != 0 || ByX != 0 || ByY != 0 || ByZ != 0)
      _toW := FromW + ByW
      _toX := FromX + ByX
      _toY := FromY + ByY
      _toZ := FromZ + ByZ
    else
      _toW := ToW
      _toX := ToX
      _toY := ToY
      _toX := ToZ
    endif
    ValueW := FromW
    ValueX := FromX
    ValueY := FromY
    ValueZ := FromZ

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
  if(~elapsedSeconds>=abs(~Duration)*(~stage+1))
    if(IsForever)
      inc(~stage)
    else
      ValueW := _toW
      ValueX := _toX
      ValueY := _toY
      ValueZ := _toZ
      
      SetVar("AnimationTimer","Stop", 1)
      InProgress := 0
      Paused := 0
      Finished := 1
      exit()
    endif
  endif
  
  ValueW := GetLinearEaseValue(FromW, ToW, Duration, ~elapsedSeconds - ~stage*Duration)
  ValueX := GetLinearEaseValue(FromX, ToX, Duration, ~elapsedSeconds - ~stage*Duration)
  ValueY := GetLinearEaseValue(FromY, ToY, Duration, ~elapsedSeconds - ~stage*Duration)
  ValueZ := GetLinearEaseValue(FromZ, ToZ, Duration, ~elapsedSeconds - ~stage*Duration)
endif

if(AutoResetInputEvents)
  if(Start); Start := 0; endif
  if(Stop); Stop := 0; endif
endif        BE_ICONS.DBM �    5              z  AnimationTimer  z  Stop           �  5 @            z  AnimationTimer  z  Start          �      7            7 ,     7 ,            7 ,  	   7 ,            7 ,  
   7 ,            7 , + 5 ]       �?                               �?             z  AnimationTimer  z  Start        �?�z  AnimationTimer  z  Rate         $@�z  AnimationTimer  z  StartDelay          @�@ �                !            7            7 ,            7 ,            7 , 5 ;      "       #       $       % 3 K   "    #  	  $  
  #                 3 �  5 j       �?  3 �  5 �                             �?  z  AnimationTimer  z  Stop         �?�z  AnimationTimer  z  TickEvent �  - + 5 �z  AnimationTimer  z 
 ElapsedMilliseconds �      @�@        .  &        �?  9 5 $  5 ��& c3 $ "    #    $    %   z  AnimationTimer  z  Stop         �?�                             �?              &      �
 GetLinearEaseValue   ����������            &      �
 GetLinearEaseValue   ����������     	       &      �
 GetLinearEaseValue   ����������     
       &      �
 GetLinearEaseValue   ����������    5 �  5 �             5 �              �Z�  �  	 �  
 