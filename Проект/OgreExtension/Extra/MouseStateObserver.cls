SB0  S
      MouseStateObserver   HSpace     HANDLE   
 LMBUpEvent     FLOAT�  
 RMBUpEvent     FLOAT�  
 MMBUpEvent     FLOAT�   LMBDownEvent     FLOAT�   RMBDownEvent     FLOAT�   MMBDownEvent     FLOAT�   LMBDownState     FLOAT�   RMBDownState     FLOAT�   MMBDownState     FLOAT�   PosX     FLOAT    PosY     FLOAT   
 windowName     STRING�   isInitialize     FLOAT�   res     FLOAT�   windowWidth     FLOAT�   windowHeight     FLOAT�   GetMouseState     FLOAT   	 R       F   2D  � @                         Y@      Y@      Y@      Y@          
 �Handle HSpace
Float  LMBUpEvent, RMBUpEvent, MMBUpEvent, LMBDownEvent, RMBDownEvent, MMBDownEvent, LMBDownState, RMBDownState, MMBDownState
Float  PosX, PosY

string local windowName
Float  local isInitialize, res, windowWidth, windowHeight

if(not(HSpace))
  exit()
endif

if(!isInitialize)
  windowName := GetWindowName(HSpace)
  windowWidth := GetWindowWidth(GetWindowName(HSpace))
  windowHeight := GetWindowHeight(GetWindowName(HSpace))
  
  isInitialize := 1
endif

//��������� ������������ ������� �� ��������� ��������
if(LMBDownEvent);  LMBDownEvent := 0;  endif
if(RMBDownEvent);  RMBDownEvent := 0;  endif
if(MMBDownEvent);  MMBDownEvent := 0;  endif
if(LMBUpEvent);  LMBUpEvent := 0;  endif
if(LMBUpEvent);  LMBUpEvent := 0;  endif
if(LMBUpEvent);  LMBUpEvent := 0;  endif
  
if(GetMouseState)
  LMBDownState := GetAsyncKeyState(1)
  RMBDownState := GetAsyncKeyState(2)
  MMBDownState := GetAsyncKeyState(4)

  if(LMBDownState != ~LMBDownState || RMBDownState != ~RMBDownState || MMBDownState != ~MMBDownState)
    res := GetMousePos(~windowName, ~PosX, ~PosY)
    if(~PosX >=0 && ~PosY >=0 && ~PosX <=~windowWidth && ~PosY<=~windowHeight)
      LMBDownEvent := ~LMBDownState
      RMBDownEvent := ~RMBDownState
      MMBDownEvent := ~MMBDownState
    
      LMBUpEvent := !~LMBDownState
      RMBUpEvent := !~RMBDownState
      MMBUpEvent := !~MMBDownState
    else
      LMBDownState := 0
      RMBDownState := 0
      MMBDownState := 0
    endif
  endif
endif       
 SYSTEM.DBM �      W 5      - 5 #    � {     � �      � �          �?    5 .              5 9              5 D              5 O              5 Z              5 e              5 �        �?�           @�          @�  	     7     7 ,  	  	 7 , 5 � y  �
 � �    
          9            9 +  
   ; +     ; + 5 �          	     -     -    	 -   3 �                                 	    wv    	 Y  
 