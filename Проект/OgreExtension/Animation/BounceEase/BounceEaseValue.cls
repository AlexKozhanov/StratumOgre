SB0        BounceEaseValue   EasingModeX 0 - In, 1 - Out, 2 - InOut 1 FLOAT    EasingModeY 0 - In, 1 - Out, 2 - InOut 1 FLOAT    EasingModeZ 0 - In, 1 - Out, 2 - InOut 1 FLOAT    From     FLOAT    To     FLOAT    By     FLOAT    Value     FLOAT   Bounces     FLOAT  
 Bounciness     FLOAT   Duration т№хьџ рэшьрішш 4 FLOAT   
 StartDelay т№хьџ чрфх№цъш   FLOAT   	 IsForever     FLOAT    AutoresetInputEvents     FLOAT    Start. єыру ёђр№ђр (Шёяюыќчѓхђёџ фыџ ёђр№ђр рэшьрішш)   FLOAT    Stop2 єыру юёђрэютр (Шёяюыќчѓхђёџ фыџ юёђрэютр рэшьрішш)   FLOAT    Pause, єыру ярѓчћ (Шёяюыќчѓхђёџ фыџ ярѓчћ рэшьрішш)   FLOAT    Started     FLOAT    Finished     FLOAT    Paused     FLOAT   
 InProgress     FLOAT    ElapsedSeconds) вхъѓљхх т№хьџ 0<=ElapsedSeconds<=duration   FLOAT    Stage     FLOAT    _from     FLOAT   _to     FLOAT  
 EasingMode     FLOAT               Duration Duration
 StartDelay
 StartDelay	 IsForever	 IsForever AutoresetInputEvents AutoresetInputEvents Stop Stop Pause Pause Started Started Finished Finished Paused Paused
 InProgress
 InProgress ElapsedSeconds ElapsedSeconds Stage Stage   BaseAnimationClass 	 Animation     `@     |@      џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ №џpxї џ pј  №    № ј   їџp№џџ№№јpџ №№ј№№   №№   №  p№џ p№ї № ј № јџp№№ №ј џ№№№xїџџ џџџџџџџџ џџџџ џџџџџџџџ џџџџ џџџџџџџџ џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ	 щ      н  2D  Ь з                        Y@      Y@      Y@      Y@          §    
 
    ќ#   
 
 џџ N           `@     y@      @@      @@                      @@      @@    N          `@     |@      @@      @@      @@      `@      @@      @@    '     §       Э    Animation Q           @     z@              H@          @     z@      @     }@ ь#    
 
 џџe      џ        я?    
 
 џџo       VARPOINT.DBMo       BE_ICONS.DBM
 /Float EasingModeX, EasingModeY, EasingModeZ
Float From, To, By, Value, Bounces, Bounciness,
      Duration, StartDelay, IsForever, AutoresetInputEvents, Start, Stop, Pause,
      Started, Finished, Paused, InProgress, ElapsedSeconds, Stage

Float local _from, _to

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
    Bounces := Limit(trunc(Bounces), 0, 10)
    Bounciness := limit(trunc(Bounciness), 1, 10)
endif

switch
  case(InProgress && !Paused)
    Value := GetBounceEaseValue(EasingMode, Bounces, Bounciness, From, To, Duration, ~elapsedSeconds)
    
  case(Finished)
    Value := _to
endswitch        BE_ICONS.DBM Ћ         7            7 , + 5 s z  Animation z  Start        №?Б               7 5 <        3 @                            @g    P                 $@g    P        №?       $@g      - + 5 Ђ            	   о
 GetBounceEaseValue   џџџџџџџџџџџџџџџџ  3 Њ   5 Њ        ЛG  ѕ   §  	 ш  
 