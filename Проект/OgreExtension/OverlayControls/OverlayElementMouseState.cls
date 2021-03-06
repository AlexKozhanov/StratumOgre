SB0  y      OverlayElementMouseState )  HSpace     HANDLE    HOverlayElement     HANDLE    AbsolutePositionX     FLOAT�   AbsolutePositionY     FLOAT�   LMBDown     FLOAT�   LMBDownState     FLOAT�   LMBUp     FLOAT�  
 LMBCapture     FLOAT�   RMBDown     FLOAT�   RMBDownState     FLOAT�   RMBUp     FLOAT�  
 RMBCapture     FLOAT�   MMBDown     FLOAT�   MMBDownState     FLOAT�   MMBUp     FLOAT�  
 MMBCapture     FLOAT�   CursorEnter     FLOAT�   CursorInside     FLOAT�   CursorLeave     FLOAT�  
 CursorPosX     FLOAT�  
 CursorPosY     FLOAT�   IsMouseHandled     FLOAT�   hRenderWindow     HANDLE�   isInitialize     FLOAT�   _LMBDown     FLOAT�   _LMBDownState     FLOAT�   _LMBUp     FLOAT�   _RMBDown     FLOAT�   _RMBDownState     FLOAT�   _RMBUp     FLOAT�   _MMBDown     FLOAT�   _MMBDownState     FLOAT�   _MMBUp     FLOAT�   width     FLOAT   height     FLOAT   absolutePosX     FLOAT   absolutePosY     FLOAT   renderWindowWidth     FLOAT   renderWindowHeight     FLOAT   IsAbsoluteVisible     FLOAT�   CheckMouseEvents     FLOAT      OgreMouseStateObserver  OgreMouseState     ��@     �w@ 	         2D  � �                         Y@      Y@      Y@      Y@          �    
 
  ��    
 
 �� N          ��@     �w@      @@      @@              t@      @@      @@    ,     �       �    OgreMouseState�%    
 
 ��o      
 system.dbm
 �Handle HSpace, HOverlayElement
Float  AbsolutePositionX, AbsolutePositionY
Float  LMBDown, LMBDownState, LMBUp, LMBCapture, RMBDown, RMBDownState, RMBUp, RMBCapture, MMBDown, MMBDownState, MMBUp, MMBCapture,
       CursorEnter, CursorInside, CursorLeave, CursorPosX, CursorPosY, IsMouseHandled

Handle local hRenderWindow
Float  local isInitialize, _LMBDown, _LMBDownState, _LMBUp, _RMBDown, _RMBDownState, _RMBUp, _MMBDown, _MMBDownState, _MMBUp,
             width, height, absolutePosX, absolutePosY, renderWindowWidth, renderWindowHeight

if(HOverlayElement != #0)
  if(IsMouseHandled); IsMouseHandled := 0; endif
  if(~_LMBUp); LMBCapture := 0; endif
  if(~_RMBUp); RMBCapture := 0; endif
  if(~_MMBUp); MMBCapture := 0; endif
  
  if(LMBDown); LMBDown := 0; endif
  if(RMBDown); RMBDown := 0; endif
  if(MMBDown); MMBDown := 0; endif
    
  if(LMBUp); LMBUp := 0; endif
  if(RMBUp); RMBUp := 0; endif
  if(MMBUp); MMBUp := 0; endif
      
  if(CursorEnter); CursorEnter := 0; endif
  if(CursorLeave); CursorLeave := 0; endif

  if(!isInitialize)
    hRenderWindow := RenderWindow_GetPrimary()
    SetVar("OgreMouseState", "HRenderWindow", ~hRenderWindow)
    SetVar("OgreMouseState", "HSpace", HSpace)
    OverlayElement_GetSize(HOverlayElement, ~width, ~height)
    
    isInitialize := 1
  endif
  
  IsAbsoluteVisible := OverlayElement_GetAbsoluteVisible(HOverlayElement)
  if(CheckMouseEvents && ~IsAbsoluteVisible)
    _LMBDown := GetVarF("OgreMouseState", "LMBDown")
    _RMBDown := GetVarF("OgreMouseState", "RMBDown")
    _MMBDown := GetVarF("OgreMouseState", "MMBDown")
  
    _LMBDownState := GetVarF("OgreMouseState", "LMBDownState")
    _RMBDownState := GetVarF("OgreMouseState", "RMBDownState")
    _MMBDownState := GetVarF("OgreMouseState", "MMBDownState")
  
    _LMBUp := GetVarF("OgreMouseState", "LMBUp")
    _RMBUp := GetVarF("OgreMouseState", "RMBUp")
    _MMBUp := GetVarF("OgreMouseState", "MMBUp")
  
    CursorPosX := GetVarF("OgreMouseState", "CursorPositionX")
    CursorPosY := GetVarF("OgreMouseState", "CursorPositionY")
  
    RenderWindow_GetSize(~hRenderWindow, ~renderWindowWidth, ~renderWindowHeight)
    AbsolutePositionX := OverlayElement_GetAbsolutePositionX(HOverlayElement, ~renderWindowWidth, ~renderWindowHeight)
    AbsolutePositionY := OverlayElement_GetAbsolutePositionY(HOverlayElement, ~renderWindowWidth, ~renderWindowHeight)
    
    CursorInside := 0
    if(~CursorPosX > ~AbsolutePositionX && ~CursorPosY > ~AbsolutePositionY)
      if(~CursorPosX < ~AbsolutePositionX + ~width && ~CursorPosY < ~AbsolutePositionY + ~height)
        CursorInside := 1
      endif
    endif
  
    CursorEnter := ~CursorInside && !CursorInside
    CursorLeave := CursorInside && !~CursorInside
    
    if(~CursorInside)
      if(~_LMBDown); LMBCapture := 1; endif
      if(~_RMBDown); RMBCapture := 1; endif
      if(~_MMBDown); MMBCapture := 1; endif
      
      LMBDown := ~_LMBDown
      RMBDown := ~_RMBDown
      MMBDown := ~_MMBDown
    
      LMBDownState := ~_LMBDownState
      RMBDownState := ~_RMBDownState
      MMBDownState := ~_MMBDownState
      
      LMBUp := ~_LMBUp
      RMBUp := ~_RMBUp
      MMBUp := ~_MMBUp
    else
      LMBDownState := 0
      RMBDownState := 0
      MMBDownState := 0
    endif
    
    if(~LMBDown || ~LMBUp || ~RMBDown || ~RMBUp || ~MMBDown || ~MMBUp || ~LMBDownState || ~RMBDownState || ~MMBDownState)
      IsMouseHandled := 1
    endif
  endif
endif

       �         S 5 �  5               5               5 )               5 4              5 ?              5 J              5 U              5 `             
 5 k           
   5 v              5 �              5 �              - 5 � �  z  OgreMouseState  z  HRenderWindow   �z  OgreMouseState  z  HSpace     �  �! �" �       �?    � OverlayElement_GetAbsoluteVisible  ���� '  (  ' + 5 �z  OgreMouseState  z  LMBDown �  z  OgreMouseState  z  RMBDown �  z  OgreMouseState  z  MMBDown �  z  OgreMouseState  z  LMBDownState  �  z  OgreMouseState  z  RMBDownState  �  z  OgreMouseState  z  MMBDownState  �  z  OgreMouseState  z  LMBUp �  z  OgreMouseState  z  RMBUp �  z  OgreMouseState  z  MMBUp �   z  OgreMouseState  z  CursorPositionX �  z  OgreMouseState  z  CursorPositionY �    �% �& !   %  & � OverlayElement_GetAbsolutePositionX  ��������     %  & � OverlayElement_GetAbsolutePositionY  ��������                 8     8 + 5 B     !  :      "  : + 5 B       �?      - +       - +     5 �  5 a       �?    5 l       �?    5 w       �?                     	            
      3 �                     	                ,   ,  
 ,   ,   ,   ,  	 ,   , 5 �       �?     eV�  �  	 �  
 