SB0  �
      MouseSpeedChecker 	  HSpace     HANDLE    HRenderWindow     HANDLE    SpeedX, �������� ����������� �������� � ������� �� �   FLOAT�   SpeedY, �������� ����������� �������� � ������� �� Y   FLOAT�   startSpeedChecking     FLOAT�   lastPosX     FLOAT�   lastPosY     FLOAT�   timerStarted     FLOAT�   timerStopped     FLOAT�               HSpace HSpace HRenderWindow HRenderWindow   AnimationTimer  Timer     ��@      m@  OgreMouseStateObserver 
 MouseState     ��@      m@ 	 [      O  2D  � I                        Y@      Y@      Y@      Y@          �    
 
     ��   
 
 �� N          ��@      m@      @@      @@                      @@      @@    #     �       �    Timer N          ��@      m@      @@      @@              t@      @@      @@    (     �       �    MouseState N           ��@      f@      @@      @@                      @@      @@    Q          @�@      h@              L@         @�@      h@     @�@      o@ �#    
 
 ��e      �        �=    
 
 ��o      
 system.dbmo       VARPOINT.DBM
 �Handle HSpace, HRenderWindow
Float  SpeedX, SpeedY

Float  local startSpeedChecking, lastPosX, lastPosY, timerStarted, timerStopped

if(GetVarF("MouseState", "LMBDown"))
  startSpeedChecking := 1
  SetVar("Timer", "Start", 1)
  SetVar("Timer", "Rate", 10)
  
  lastPosX := GetVarF("MouseState", "CursorPositionX")
  lastPosY := GetVarF("MouseState", "CursorPositionY")
  
  timerStarted := 1
endif

if(GetVarF("MouseState", "LMBUp"))
  startSpeedChecking := 0
  SetVar("Timer", "Stop", 1)
  timerStopped := 1
endif

if(startSpeedChecking)
  if(GetVarF("Timer", "TickEvent"))
    lastPosX := GetVarF("MouseState", "CursorPositionX")
    lastPosY := GetVarF("MouseState", "CursorPositionY")
    
    SpeedX := (~lastPosX - lastPosX)*10
    SpeedY := (~lastPosY - lastPosY)*10
  endif
endif

if(timerStarted) 
  SetVar("Timer", "Start", 0)
  timerStarted := 0
endif

if(timerStopped) 
  SetVar("Timer", "Stop", 0)
  timerStopped := 0
endif       %  z  MouseState  z  LMBDown �5 i        �?  z  Timer z  Start        �?�z  Timer z  Rate         $@�z  MouseState  z  CursorPositionX �  z  MouseState  z  CursorPositionY �         �?  z  MouseState  z  LMBUp �5 �            z  Timer z  Stop         �?�       �?    5 � z  Timer z  TickEvent �5 � z  MouseState  z  CursorPositionX �  z  MouseState  z  CursorPositionY �              $@               $@     5 	z  Timer z  Start          �             5 $z  Timer z  Stop           �              �du     	 m  
 