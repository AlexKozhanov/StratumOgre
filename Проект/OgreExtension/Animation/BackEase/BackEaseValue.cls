SB0  [      BackEaseValue  
 EasingMode   1 FLOAT  	 Amplitude     FLOAT   From     FLOAT    To     FLOAT    By     FLOAT    Value     FLOAT   Duration т№хьџ рэшьрішш 1 FLOAT   
 StartDelay т№хьџ чрфх№цъш   FLOAT   	 IsForever     FLOAT    AutoresetInputEvents     FLOAT    Start. єыру ёђр№ђр (Шёяюыќчѓхђёџ фыџ ёђр№ђр рэшьрішш)   FLOAT    Stop2 єыру юёђрэютр (Шёяюыќчѓхђёџ фыџ юёђрэютр рэшьрішш)   FLOAT    Pause, єыру ярѓчћ (Шёяюыќчѓхђёџ фыџ ярѓчћ рэшьрішш)   FLOAT    Started     FLOAT    Finished     FLOAT    Paused     FLOAT   
 InProgress     FLOAT    ElapsedSeconds) вхъѓљхх т№хьџ 0<=ElapsedSeconds<=duration   FLOAT    Stage     FLOAT    _from     FLOAT   _to     FLOAT  	 frameRate     FLOAT               Duration Duration
 StartDelay
 StartDelay	 IsForever	 IsForever AutoresetInputEvents AutoresetInputEvents Stop Stop Pause Pause Started Started Finished Finished Paused Paused
 InProgress
 InProgress ElapsedSeconds ElapsedSeconds Stage Stage   BaseAnimationClass 	 Animation      @      x@      џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ џp№№  јїї  ј ї №№  № №№  №№№№№ј  №№ №№№№ї№џ№№џџ№јp№џ№џ№№ї    џ №џ№  џ №   џ№ї№  џp№џї  ї№№№№  №№№ №ј ї №џ№№№№џџ№№џјїї  џџџџ№џ  џџџџџџ  џџџџ№џ  џџџџџџ џџџџ№џ  џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ	 щ      н  2D  Ь з                        Y@      Y@      Y@      Y@          §    
 
    ќ#   
 
 џџ N            @      u@      @@      @@                      @@      @@    N           @      x@      @@      @@      @@      `@      @@      @@    '     §       Э    Animation Q          @      v@              H@         @      v@     @      y@ ь#    
 
 џџe      џ        я?    
 
 џџo       VARPOINT.DBMo       BE_ICONS.DBM
 РFloat EasingMode, Amplitude, From, To, By, Value,
      Duration, StartDelay, IsForever, AutoresetInputEvents, Start, Stop, Pause,
      Started, Finished, Paused, InProgress, ElapsedSeconds, Stage
      
Float local _from, _to, frameRate

if(Start && (To != From || By != 0))
  SetVar("Animation", "Start", 1)
    
  _from := From
  if(By !=0)
    _to := From + By
  else
    _to := To
  endif
  Value := From
    
  EasingMode := Limit(EasingMode, 0,2)
  Amplitude := Limit(Amplitude, 0,10)
endif

switch
  case(InProgress && !Paused)
    Value := GetBackEaseValue(EasingMode, Amplitude, _from, _to, Duration, ~elapsedSeconds)
    
  case(Finished)
    Value := _to
endswitch        BE_ICONS.DBM     
     7            7 , + 5 b z  Animation z  Start        №?Б               7 5 <        3 @                             @g                     $@g      - + 5               о	 GetBackEaseValue   џџџџџџџџџџџџџџ  3    5         ЎG  P   X  	 C  
 