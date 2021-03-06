SB0  �      SLERPBackEaseQuaternion ) 
 EasingMode     FLOAT�  	 Amplitude     FLOAT�   FromW     FLOAT    FromX     FLOAT    FromY     FLOAT    FromZ     FLOAT    ToW     FLOAT    ToX     FLOAT    ToY     FLOAT    ToZ     FLOAT    ByW     FLOAT    ByX     FLOAT    ByY     FLOAT    ByZ     FLOAT    Duration     FLOAT   
 StartDelay     FLOAT    ValueW     FLOAT�   ValueX     FLOAT�   ValueY     FLOAT�   ValueZ     FLOAT�   Start     FLOAT    Stop     FLOAT    Pause     FLOAT    Started     FLOAT�   Finished     FLOAT�   Paused     FLOAT�  
 InProgress     FLOAT�   ElapsedSeconds     FLOAT�   hStartQuaternion     HANDLE�   hEndQuaternion     HANDLE�   hValueQuaternion     HANDLE�   isInitialize     FLOAT�   _fromX     FLOAT�   _toX     FLOAT�   _fromY     FLOAT�   _toY     FLOAT�   _fromZ     FLOAT�   _toZ     FLOAT�   _fromW     FLOAT�   _toW     FLOAT�   alpha     FLOAT�     AnimationTimer  AnimationTimer     ��@      x@ 	         2D  � �                         Y@      Y@      Y@      Y@        &��    
 
  ��    
 
   N          ��@      x@      @@      @@                      @@      @@    ,     �       �    AnimationTimer�%    
 
 ��o      
 system.dbm
 �Float EasingMode, Amplitude,
      FromW, FromX, FromY, FromZ, 
      ToW, ToX, ToY, ToZ, 
      ByW, ByX, ByY, ByZ, 
      Duration,
      StartDelay,  
      ValueW, ValueX, ValueY, ValueZ, 
      Start, Stop, Pause

Float Started, Finished, Paused, InProgress, ElapsedSeconds

Handle local hStartQuaternion, hEndQuaternion, hValueQuaternion
Float  local isInitialize, _fromX, _toX, _fromY, _toY, _fromZ, _toZ, _fromW, _toW, alpha


if(!isInitialize)
  hStartQuaternion := Quaternion_Create(1,0,0,0)
  hEndQuaternion := Quaternion_Create(1,0,0,0)
  hValueQuaternion := Quaternion_Create(1,0,0,0)
  isInitialize := 1
endif 

switch
  case(Start && (ToX!=FromX || ToY!=FromY || ToZ!=FromZ || ToW!=FromW || ByX != 0 || ByY != 0 || ByZ != 0 || ByW != 0))
    InProgress := 1
    Paused := 0
    Finished := 0
    Started := 1
    elapsedSeconds := 0
    
    SetVar("AnimationTimer", "Start", 1)
    SetVar("AnimationTimer", "Rate", 10)
    SetVar("AnimationTimer", "StartDelay", StartDelay*1000)
    
    _fromX := FromX
    _fromY := FromY
    _fromZ := FromZ
    _fromW := FromW
    if(ByX !=0 || ByY!=0 || ByZ !=0 || ByW !=0)
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
    
    EasingMode := Limit(EasingMode, 0,2)
    Amplitude := Limit(Amplitude, 0,10)
    
    Quaternion_Set(~hStartQuaternion, ~_fromW, ~_fromX, ~_fromY, ~_fromZ)
    Quaternion_Set(~hEndQuaternion, ~_toW, ~_toX, ~_toY, ~_toZ)
    exit()
    
  case(Pause)
    Paused := 1
    
  case(Stop)
    InProgress := 0
    Paused := 0
    Finished := 1
    ///
    SetVar("AnimationTimer","Stop", 1)
endswitch

if(GetVarF("AnimationTimer", "TickEvent") && !Paused)
  elapsedSeconds := GetVarF("AnimationTimer", "ElapsedMilliseconds")/1000
  if(~elapsedSeconds>=abs(~Duration))
    SetVar("AnimationTimer","Stop", 1)
    ValueW := _toW
    ValueX := _toX
    ValueY := _toY
    ValueZ := _toZ
    
    InProgress := 0
    Paused := 0
    Finished := 1
    exit()
  endif
  
  alpha := GetBackEaseValue(EasingMode, Amplitude, 0,1, Duration, ~elapsedSeconds)
  
  Quaternion_Slerp(~hStartQuaternion, ~hEndQuaternion, ~alpha, ~hValueQuaternion)
  ValueW := Quaternion_GetW(~hValueQuaternion)
  ValueX := Quaternion_GetX(~hValueQuaternion)
  ValueY := Quaternion_GetY(~hValueQuaternion)
  ValueZ := Quaternion_GetZ(~hValueQuaternion)
  
  //LogMessage("W, X, Y, Z = " + string(~ValueW) + " " + string(~ValueX) + " " + string(~ValueY) + " " + string(~ValueZ))
endif


///��������� ������� ������������ �������
if(Finished)
  Finished := 0
  SetVar("AnimationTimer", "Stop", 0)
endif
if(Started)
  Started := 0
  SetVar("AnimationTimer","Start", 0)
endif        BE_ICONS.DBM m    - 5 �        �?                           �	 Quaternion_Create  ����������         �?                           �	 Quaternion_Create  ����������         �?                           �	 Quaternion_Create  ����������         �?        7     7 ,  	   7 ,     7 ,            7 ,            7 ,            7 ,  
          7 , + 5 �       �?                               �?             z  AnimationTimer  z  Start        �?�z  AnimationTimer  z  Rate         $@�z  AnimationTimer  z  StartDelay          @�@ �        "    $    &            7            7 ,            7 ,  
          7 , 5 |      !       #       %    
   ' 3 �   !    #  	  %    '                                     @g                     $@g     &     "  $ � Quaternion_Set   ����������     '  !  #  % � Quaternion_Set   ����������    3 .  5         �?  3 .  5 .                             �?  z  AnimationTimer  z  Stop         �?�z  AnimationTimer  z  TickEvent �  - + 5 ,z  AnimationTimer  z 
 ElapsedMilliseconds �      @�@       . 9 5 �z  AnimationTimer  z  Stop         �?� '    !    #    %                                �?                         �?    �	 GetBackEaseValue   �������������� (      (   �	 Quaternion_Slerp   ��������    � Quaternion_GetW  ����    � Quaternion_GetX  ����    � Quaternion_GetY  ����    � Quaternion_GetZ  ����    5 L           z  AnimationTimer  z  Stop           �  5 l           z  AnimationTimer  z  Start          �   �]G   #  	 3  
 