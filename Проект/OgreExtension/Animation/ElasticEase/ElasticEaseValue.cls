SB0  Ў      ElasticEaseValue  
 EasingMode   1 FLOAT   Oscillations   1 FLOAT   Springiness   1 FLOAT   From   0 FLOAT    To   1 FLOAT    By     FLOAT    Value     FLOAT   Duration я№юфюыцшђхыќэюёђќ рэшьрішш 1 FLOAT   
 StartDelay чрфх№цър рэшьрішш   FLOAT   	 IsForever     FLOAT    AutoResetInputEvents     FLOAT    Start. єыру ёђр№ђр (Шёяюыќчѓхђёџ фыџ ёђр№ђр рэшьрішш)   FLOAT    Stop2 єыру юёђрэютр (Шёяюыќчѓхђёџ фыџ юёђрэютр рэшьрішш)   FLOAT    Pause, єыру ярѓчћ (Шёяюыќчѓхђёџ фыџ ярѓчћ рэшьрішш)   FLOAT    Started     FLOAT    Finished     FLOAT    Paused     FLOAT   
 InProgress     FLOAT    ElapsedSeconds) вхъѓљхх т№хьџ 0<=ElapsedSeconds<=duration   FLOAT    Stage     FLOAT    _from     FLOAT   _to     FLOAT               Duration Duration
 StartDelay
 StartDelay	 IsForever	 IsForever AutoresetInputEvents AutoresetInputEvents Stop Stop Pause Pause Started Started Finished Finished Paused Paused
 InProgress
 InProgress ElapsedSeconds ElapsedSeconds Stage Stage   BaseAnimationClass 	 Animation     @@      p@      џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ xw№ їwј № №  №  №№  №џ џї№џ№№џџ џџ№џp№  p№џ№ №№  №№џї№ ј№ї №№  №џ №  №џ №џwј №џ№wј џџџџџ№ џџџџџ џџџџ№ џџџџџ џџџџ№ џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ	 щ      н  2D  Ь з                        Y@      Y@      Y@      Y@          §    
 
    ќ#   
 
   N           @@      j@      @@      @@                      @@      @@    N          @@      p@      @@      @@      @@      `@      @@      @@    '     §       Э    Animation Q          Р@      l@              H@         Р@      l@     Р@      q@ ь#    
 
 џџe      џ        я?    
 
 џџo       VARPOINT.DBMo       BE_ICONS.DBM
 =Float EasingMode, Oscillations, Springiness, From, To, By, Value, 
      Duration, StartDelay, IsForever,
      AutoResetInputEvents,
      Start, Stop, Pause,
      Started, Finished, Paused, InProgress, 
      ElapsedSeconds, Stage
      
Float local _from, _to
      
if(Start && (To != From || By != 0))
  SetVar("Animation", "Start", 1)
  _from := From    
  if(By != 0)
    _to := From + By
  else
    _to := To
  endif
  Value := From
    
  EasingMode := Limit(EasingMode, 0,2)
  Oscillations := Limit(trunc(Oscillations), 1, 100000)
  Springiness := Limit(trunc(Springiness), 1, 100000)
endif

switch
  case(InProgress && !Paused)
    Value := GetElasticEaseValue(EasingMode, Oscillations, Springiness, _from, _to, Duration, ~elapsedSeconds)
    
  case(Finished)
    Value := _to
endswitch  я№шьх№ фыџ ё№ртэхэшџ №рсюђћ
http://samples.msdn.microsoft.com/Silverlight/silverlight_next/Animations/easing_functions_gallery/testpage.html        BE_ICONS.DBM Ћ         7            7 , + 5 s z  Animation z  Start        №?Б               7 5 <        3 @                             @g     P        №?      jј@g    P        №?      jј@g      - + 5 Ђ                о
 GetElasticEaseValue  џџџџџџџџџџџџџџџџ  3 Њ   5 Њ        МG  k   s  	 ^  
    