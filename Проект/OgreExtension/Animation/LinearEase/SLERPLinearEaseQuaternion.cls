SB0  �      SLERPLinearEaseQuaternion + 	 IsForever     FLOAT    AutoresetInputEvents   1 FLOAT    Duration   1 FLOAT    FromW   1 FLOAT    FromX     FLOAT    FromY     FLOAT    FromZ     FLOAT    ToW   1 FLOAT    ToX     FLOAT    ToY     FLOAT    ToZ     FLOAT    ByW     FLOAT    ByX     FLOAT    ByY     FLOAT    ByZ     FLOAT   
 StartDelay     FLOAT    ValueW     FLOAT�   ValueX     FLOAT�   ValueY     FLOAT�   ValueZ     FLOAT�   Start     FLOAT    Stop     FLOAT    Pause     FLOAT    Started     FLOAT    Finished     FLOAT    Paused     FLOAT   
 InProgress     FLOAT    ElapsedSeconds     FLOAT    Stage     FLOAT   	 TickEvent     FLOAT    hStartQuaternion     HANDLE�   hEndQuaternion     HANDLE�   hValueQuaternion     HANDLE�   isInitialize     FLOAT�   _fromX     FLOAT�   _toX     FLOAT�   _fromY     FLOAT�   _toY     FLOAT�   _fromZ     FLOAT�   _toZ     FLOAT�   _fromW     FLOAT�   _toW     FLOAT�   alpha     FLOAT�               Duration Duration
 StartDelay
 StartDelay	 IsForever	 IsForever AutoresetInputEvents AutoresetInputEvents Stop Stop Pause Pause Started Started Finished Finished Paused Paused
 InProgress
 InProgress ElapsedSeconds ElapsedSeconds Stage Stage	 TickEvent	 TickEvent Start Start   BaseAnimationClass 	 Animation     ��@     �w@ 	 �      �  2D  � �                        Y@      Y@      Y@      Y@        h�    
 
    �#    
 �� N           ��@     �t@      @@      @@                      @@      @@    N          ��@     �w@      @@      @@      @@      `@      @@      @@    '     �       �    Animation Q          @�@     �u@              H@         @�@     �u@     @�@     �x@ �#    
 
 ��e      �        �?    
 
 ��o       VARPOINT.DBMo       BE_ICONS.DBM
 �Float IsForever, AutoresetInputEvents, Duration,
      FromW, FromX, FromY, FromZ, 
      ToW, ToX, ToY, ToZ, 
      ByW, ByX, ByY, ByZ, 
      StartDelay,  
      ValueW, ValueX, ValueY, ValueZ, 
      Start, Stop, Pause

Float Started, Finished, Paused, InProgress, ElapsedSeconds, Stage, TickEvent

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
    SetVar("AnimationTimer", "Start", 1)
    
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
    
    Quaternion_Set(~hStartQuaternion, ~_fromW, ~_fromX, ~_fromY, ~_fromZ)
    Quaternion_Set(~hEndQuaternion, ~_toW, ~_toX, ~_toY, ~_toZ)
    
  case(~InProgress && !~Paused && TickEvent)
    alpha := GetLinearEaseValue(0,1, Duration, ElapsedSeconds)
    Quaternion_Slerp(~hStartQuaternion, ~hEndQuaternion, ~alpha, ~hValueQuaternion)
    ValueW := Quaternion_GetW(~hValueQuaternion)
    ValueX := Quaternion_GetX(~hValueQuaternion)
    ValueY := Quaternion_GetY(~hValueQuaternion)
    ValueZ := Quaternion_GetZ(~hValueQuaternion)
    
  case(~Finished)
    ValueW := _toW
    ValueX := _toX
    ValueY := _toY
    ValueZ := _toZ
    
endswitch        BE_ICONS.DBM "   ! - 5 �        �?                           �	 Quaternion_Create  ����������         �?                           �	 Quaternion_Create  ����������         �?                           �	 Quaternion_Create  ����������          �? !       7  	   7 ,  
   7 ,     7 ,            7 ,            7 ,            7 ,            7 , + 5 �z  AnimationTimer  z  Start        �?�   "    $    &    (            7            7 ,            7 ,            7 , 5 )      #       %       '       ) 3 9   #  	  %  
  '    )                    (  "  $  & � Quaternion_Set   ����������     )  #  %  ' � Quaternion_Set   ����������  3 !    - +   + 5                 �?    �
 GetLinearEaseValue   ���������� *      *    �	 Quaternion_Slerp   ��������     � Quaternion_GetW  ����     � Quaternion_GetX  ����     � Quaternion_GetY  ����     � Quaternion_GetZ  ����  3 !  5 ! )    #    %    '      !]B   �  	 �  
 