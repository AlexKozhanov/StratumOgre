SB0  h      BaseAnimationClass   Duration     FLOAT   
 StartDelay     FLOAT   	 IsForever     FLOAT    AutoresetInputEvents     FLOAT    Start     FLOAT�   Stop     FLOAT�   Pause     FLOAT    Started     FLOAT�   Finished     FLOAT�   Paused     FLOAT�  
 InProgress     FLOAT�   ElapsedSeconds     FLOAT�   Stage     FLOAT�  	 TickEvent     FLOAT    isInitialized     FLOAT�              	 TickEvent	 TickEvent   AnimationTimer  AnimationTimer      o@      a@ 	 �      �  2D  � �                        Y@      Y@      Y@      Y@          �    
 
    �(   
 
 �� N           o@      a@      @@      @@                      @@      @@    ,     �       �    AnimationTimer N            o@      V@      @@      @@                      @@      @@    Q          �p@      Z@              H@         �p@      Z@     �p@      c@ �#    
 
 ��e      �        �=    
 
 ��o      
 system.dbmo       VARPOINT.DBM
 9Float Duration, StartDelay, IsForever, AutoresetInputEvents, Start, Stop, Pause,
      Started, Finished, Paused, InProgress, ElapsedSeconds, Stage, TickEvent

Float local isInitialized

if(!isInitialized)
  SetVar("AnimationTimer", "Rate", 11)
  isInitialized := 1
endif

switch
  case(Start)
    InProgress := 1
    Paused := 0
    //Finished := 0
    Start := 0
    Started := 1
    ElapsedSeconds := 0
    stage := 0
    SetVar("AnimationTimer", "Start", 1)
    SetVar("AnimationTimer", "StartDelay", StartDelay*1000)
    exit()

  case(Pause)
    Paused := 1
  
  case(Stop && (Paused || InProgress))
    InProgress := 0
    Paused := 0
    Finished := 1
    SetVar("AnimationTimer","Stop", 1)
endswitch

if(~TickEvent && !Paused)
  ElapsedSeconds := GetVarF("AnimationTimer", "ElapsedMilliseconds")/1000
  if(~ElapsedSeconds >= Duration*(stage+1))
    if(IsForever)
      inc(~stage)
    else
      SetVar("AnimationTimer","Stop", 1)
      InProgress := 0
      Paused := 0
      Finished := 1
      exit()
    endif
  endif
endif

if(AutoresetInputEvents)
  if(Start); Start := 0; endif
  if(Stop); Stop := 0; endif
endif

if(Finished)
  Finished := 0
  SetVar("AnimationTimer", "Stop", 0)
endif
  
if(Started)
  Started := 0
  SetVar("AnimationTimer","Start", 0)
endif        BE_ICONS.DBM �    - 5 ! z  AnimationTimer  z  Rate         &@�       �?    5 �        �? 
           	                   �?                        z  AnimationTimer  z  Start        �?�z  AnimationTimer  z  StartDelay          @�@ �  3 �   5 �        �? 	 3 �    	  
 , + 5 �           
           	        �?  z  AnimationTimer  z  Stop         �?�   	 - + 5 .z  AnimationTimer  z 
 ElapsedMilliseconds �      @�@                 �?  9 5 .  5 � c3 .z  AnimationTimer  z  Stop         �?�          
           	        �?      5 H  5 =             5 H             5 h           z  AnimationTimer  z  Stop           �  5 �           z  AnimationTimer  z  Start          �   h�G     	 �  
 