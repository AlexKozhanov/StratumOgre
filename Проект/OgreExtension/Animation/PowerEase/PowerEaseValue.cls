SB0        PowerAnimationValue  
 EasingMode 0 - In, 1 - Out, 2 - InOut 1 FLOAT   Power   4 FLOAT   Duration т№хьџ рэшьрішш 1 FLOAT   	 IsForever     FLOAT    AutoresetInputEvents   1 FLOAT    From     FLOAT    To     FLOAT    By     FLOAT    Value     FLOAT  
 StartDelay т№хьџ чрфх№цъш   FLOAT    Start. єыру ёђр№ђр (Шёяюыќчѓхђёџ фыџ ёђр№ђр рэшьрішш)   FLOAT   Stop2 єыру юёђрэютр (Шёяюыќчѓхђёџ фыџ юёђрэютр рэшьрішш)   FLOAT    Pause, єыру ярѓчћ (Шёяюыќчѓхђёџ фыџ ярѓчћ рэшьрішш)   FLOAT    Started     FLOAT    Finished     FLOAT    Paused     FLOAT   
 InProgress     FLOAT    ElapsedSeconds) вхъѓљхх т№хьџ 0<=ElapsedSeconds<=duration   FLOAT   	 TickEvent     FLOAT    isInitialize     FLOAT   _from     FLOAT   _to     FLOAT   stage     FLOAT   animationStarted     FLOAT               Duration Duration
 StartDelay
 StartDelay	 IsForever	 IsForever AutoresetInputEvents AutoresetInputEvents Stop Stop Pause Pause Started Started Finished Finished Paused Paused
 InProgress
 InProgress ElapsedSeconds ElapsedSeconds Stage Stage	 TickEvent	 TickEvent   BaseAnimationClass 	 Animation     Р@      y@      џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ№џј  їxјџ№№   №џ№   №џ№џџ№№џџ  № џp№  p №   №№  p№ї  ј№ї №   №№x№№№ џ №№№їїїј џ№xј џџџџџџџ  џџџџџ џџџџџџџ  џџџџџ џџџџџџџ  џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ	 щ      н  2D  Ь з                        Y@      Y@      Y@      Y@          §    
 
    ќ#    
 џџ N           Р@      v@      @@      @@                      @@      @@    N          Р@      y@      @@      @@      @@      `@      @@      @@    '     §       Э    Animation Q          @@      w@              H@         @@      w@     @@      z@ ь#    
 
 џџe      џ        я?    
 
 џџo       VARPOINT.DBMo       BE_ICONS.DBM
 Float EasingMode, Power, Duration, IsForever, AutoresetInputEvents,
      From, To, By, Value, 
      StartDelay, Start, Stop, Pause, 
      Started, Finished, Paused, InProgress, ElapsedSeconds, TickEvent

Float local isInitialize, _from, _to, stage

if(animationStarted)
  SetVar("Animation", "Start", 0)
  animationStarted := 0
endif

switch
  case(Start && From != To)
    animationStarted := 1
    SetVar("Animation", "Start", 1)
    _from := From
    if(By != 0)
      _to := From + By
    else
      _to := To
    endif
    Value := From
    Power := Limit(Power, -10, 10)
    EasingMode := Limit(EasingMode, 0,2)
    
  case(InProgress && !Paused)
    Value := GetPowerEaseValue(EasingMode, Power, ~_from, ~_to, Duration, ~ElapsedSeconds - ~stage*Duration)
    
  case(Finished)
    Value := _to
endswitch

if(AutoResetInputEvents)
  if(Start); Start := 0; endif
endif        BE_ICONS.DBM Щ     5  z  Animation z  Start          Б            
     7 + 5         №?  z  Animation z  Start        №?Б               7 5 W        3 [                  $@q        $@g                      @g   3 Й     - + 5 Б                    о	 GetPowerEaseValue  џџџџџџџџџџџџџџ  3 Й   5 Й       5 Ш  
 5 Ш           
    аG  Т   Ъ  	 Е  
 