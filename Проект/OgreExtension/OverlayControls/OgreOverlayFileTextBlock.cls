SB0  wG      OgreOverlayFileTextBlock M  HSpace     HANDLE    HRenderWindow     HANDLE    HParentPanel     HANDLE    HPanel     HANDLE    Name     STRING    FilePath     STRING    FontName  	 MyriadPro STRING    TextAlignment   left STRING    ScrollerTexture     STRING    FontSize   20 FLOAT   
 SpaceWidth   0 FLOAT    StringSpacing   1 FLOAT    StringsOnPage   10 FLOAT   	 PositionX     FLOAT   	 PositionY     FLOAT    Width   200 FLOAT    Height   250 FLOAT   	 IsVisible   1 FLOAT    TotalPageCount     FLOAT    TotalStringCount     FLOAT    CurrentPage   0 FLOAT    ScrollerWidth   5 FLOAT    IsMouseHandled     FLOAT   	 TextColor  
 rgb(0,0,0) COLORREF    TextColorAlpha   1 FLOAT    hStringList     HANDLE�   hFileStream     HANDLE   hOverlayElement     HANDLE�  	 hScroller     HANDLE�   hTextContainer     HANDLE�  	 _filePath     STRING  	 _fontName     STRING   _textAlignment     STRING   colorStr     STRING   str     STRING   isInitialize     FLOAT�   i     FLOAT�  	 _fontSize     FLOAT   _spaceWidth     FLOAT   _stringSpacing     FLOAT   _stringsOnPage     FLOAT  
 _positionX     FLOAT  
 _positionY     FLOAT   _width     FLOAT   _height     FLOAT  
 _isVisible     FLOAT   _currentPage     FLOAT   _textColorAlpha     FLOAT   res     FLOAT  
 _textColor     COLORREF   TotalStringsCount     FLOAT�   createdStringCount     FLOAT�   textContainerHeight     FLOAT�   ScrollerHeight0     FLOAT�   updateStringVisibility     FLOAT�   textElementsCreated     FLOAT�   cursorPositionY0     FLOAT�   _cursorPositionY     FLOAT�   posX0     FLOAT    posY0     FLOAT    animationStopped     FLOAT�   scrollingStarted     FLOAT�   cursorPositionY     FLOAT�   veritcalScrollingChanged     FLOAT�   deltaY     FLOAT�   posY     FLOAT�   posX     FLOAT    kScrollerPosY     FLOAT�   ScrollerPathLength     FLOAT�   ScrollerPosY     FLOAT�   kScrollerHeight     FLOAT�   ScrollerHeight     FLOAT�   mouseSpeedY     FLOAT�   animationStarted     FLOAT�   scrollInProgress     FLOAT�   strPosX     FLOAT    strPosY     FLOAT             
   HPanel HPanel HParentPanel HParentContainer Name Name	 PositionX	 PositionX	 PositionY	 PositionY Width Width Height Height	 IsVisible	 IsVisible IsMouseHandled IsMouseHandled HSpace HSpace           FilePath FilePath           HSpace HSpace HPanel HParentContainer           Name MaterialName Name Name           ScrollerTexture TextureFileName           IsMouseHandled IsMouseHandled HSpace HSpace           HSpace HSpace HRenderWindow HRenderWindow   TextFileReader 
 FileReader     ��@     �w@  OgreOverlayPanel 	 TextPanel     ��@     �w@  PowerAnimationValue  TextAnimation      �@     �w@  OgreOverlayPanel  ScrollerPanel     @�@     �z@  OgreOverlayMaterial  ScrollerMaterial     ��@     �z@  MouseSpeedChecker  MouseSpeedChecker     ��@     �z@ 	       �  2D  � �                        Y@      Y@      Y@      Y@          �(     
          	  
   �j    
 �� Q          @�@      u@      L@      L@         @�@      u@      �@     �x@  N           �@     �w@      @@      @@      @@      `@      @@      @@    N           ��@      t@      @@      @@                      @@      @@    Q          @�@      u@              L@         @�@      u@     @�@     �x@  N          ��@     �w@      @@      @@                      @@      @@    (     �       �    FileReader +     �       �    TextAnimation N   	       ��@     �w@      @@      @@      x@              @@      @@    N   
       @�@     �z@      @@      @@      x@              @@      @@    '     �      	 �    TextPanel +     �      
 �    ScrollerPanel Q          ��@     �x@      H@      H@         @�@     �x@     ��@     �{@  N          ��@     �z@      @@      @@      P@      �@      @@      @@    .     �       �    ScrollerMaterial Q           �@     �{@      L@                  �@     �{@     ��@     �{@  Q           �@      u@      Z@      Z@         @�@      u@      �@     �{@  Q          ��@      u@      H@      Z@         @�@      u@     ��@     �{@  N          ��@     �z@      @@      @@              `@      @@      @@    /     �       �    MouseSpeedChecker Q          @�@      u@      L@      Z@	         @�@      u@      �@     �{@ ��    
 
 ��e      �        e      �        e      �        e      �        e      �        e      �        e     	 �        ��    
 
 ��o      
 system.dbmo       VARPOINT.DBMo       WINDOWS.DBMo       BE_ICONS.DBMo       default.dbm
 @%Handle HSpace, HRenderWindow,
       HParentPanel, HPanel
String Name, FilePath, FontName, TextAlignment, ScrollerTexture
Float  FontSize, SpaceWidth, StringSpacing, StringsOnPage,
       PositionX, PositionY, Width, Height, IsVisible, TotalPageCount, TotalStringCount, CurrentPage, ScrollerWidth,
       IsMouseHandled
      
ColorRef TextColor
Float    TextColorAlpha

Handle local hStringList, hFileStream, hOverlayElement, hScroller, hTextContainer
String local _filePath, _fontName, _textAlignment, colorStr, str
Float local isInitialize, i, _fontSize, _spaceWidth, _stringSpacing, _stringsOnPage,
            _positionX, _positionY, _width, _height, _isVisible, _currentPage, _textColorAlpha, res
            
ColorRef local _textColor

///
//TODO: ������� �� FileTextBlock � OverlayPanelScroller
///

if(HPanel)
  if(!isInitialize)
    hTextContainer := OverlayElement_Create("Panel", Name + "TextContainer")
    OverlayElement_SetMetricsMode(~hTextContainer, GMM_PIXELS)
    OverlayContainer_AddChild(HPanel, ~hTextContainer)
    SetVar("FileReader", "FilePath", FilePath)
    SetVar("TextAnimation", "Duration", 0.5) 
    
    SetVar("ScrollerPanel", "Name", Name + "Scroller")
    SetVar("ScrollerPanel", "PositionX", Width)
    SetVar("ScrollerPanel", "Width", ScrollerWidth)
    
    SetVar("ScrollerMaterial", "IsAlphaBlendingEnabled", 1)
    isInitialize := 1
  endif
  
  if(GetVarF("FileReader", "FileReadingFinished") || !isInitialize)
    //���� OverlayTextArea ������, ��� ���� ������� ��� ����������� ������������ �����, ������� ��������������
    //(���������� ������ ��� ������� ������ �� ���������, �.�. ���������� �������� ������ �������)
    i := 0
    TotalStringsCount := GetVarF("FileReader", "TotalStringCount")
    if(~createdStringCount < ~TotalStringsCount)
      createdStringCount := ~TotalStringsCount
    endif
    
    hStringList := GetVarH("FileReader", "HFileStrings")
    while(~i < ~createdStringCount)
      if(~i >= createdStringCount)
        hOverlayElement := OverlayElement_Create("TextArea", Name + "String" + string(~i))
        OverlayElement_SetPosition(~hOverlayElement, 0, ~i*FontSize*StringSpacing)
        OverlayElement_SetSize(~hOverlayElement, Width, FontSize)
        OverlayElement_SetMetricsMode(~hOverlayElement, GMM_PIXELS)
        
        StringInterface_SetParameter(~hOverlayElement, "font_name", FontName)
        StringInterface_SetParameter(~hOverlayElement, "char_height", string(FontSize))
        StringInterface_SetParameter(~hOverlayElement, "alignment", TextAlignment)
        StringInterface_SetParameter(~hOverlayElement, "space_width", string(SpaceWidth))
        
        OverlayContainer_AddChild(~hTextContainer, ~hOverlayElement)
      else
        hOverlayElement := OverlayElement_Get(Name + "String" + string(~i))
      endif
      OverlayElement_SetCaption(~hOverlayElement, "")
      inc(~i)
    endwhile
   
    textContainerHeight := ~TotalStringsCount*FontSize*StringSpacing
    OverlayElement_SetSize(~hTextContainer, Width, ~textContainerHeight)

    OverlayElement_SetPosition(~hTextContainer, 0, 0)
    ScrollerHeight0 := Height
    if(~textContainerHeight != 0 && ~textContainerHeight > Height)
      ScrollerHeight0 := sqr(Height)/~textContainerHeight
    endif
    if(~hScroller != #0)
      SetVar("ScrollerPanel", "Height", ~ScrollerHeight0)
      SetVar("ScrollerPanel", "PositionY", 0)
    endif
    
    updateStringVisibility := 1
    textElementsCreated := 1
  endif
  
  if(hScroller == #0)
    hScroller := GetVarH("ScrollerPanel", "HPanel")
  endif
  
  //���������� ������
  if(~textElementsCreated)
    i := 0
    while(~i < ~TotalStringsCount)
      hOverlayElement := OverlayElement_Get(Name + "String" + string(~i))
      OverlayElement_SetCaption(~hOverlayElement, vGetS(~hStringList, ~i, ""))
      inc(~i)
    endwhile
    SetVar("ScrollerPanel", "Height", ~ScrollerHeight0)
    textElementsCreated := 0
  endif
  
  if(GetVarF("TextPanel", "LMBDown"))
    cursorPositionY0 := GetVarF("TextPanel", "CursorPosY")
    _cursorPositionY := ~cursorPositionY0
    OverlayElement_GetPosition(~hTextContainer, ~posX0, ~posY0)
    SetVar("TextAnimation", "Stop", 1)
    animationStopped := 1
    scrollingStarted := 1
  endif
  
  if(~scrollingStarted)
    cursorPositionY := GetVarF("TextPanel", "CursorPosY")
    veritcalScrollingChanged := ~cursorPositionY != ~_cursorPositionY
    if(~veritcalScrollingChanged)
      deltaY := ~cursorPositionY - ~cursorPositionY0
      posY := ~posY0 + ~deltaY
      OverlayElement_SetPosition(~hTextContainer, ~posX, ~posY)
      
      kScrollerPosY := ~posY / -(~textContainerHeight - Height)
      ScrollerPathLength := Height - ScrollerHeight0
      if(Height == ScrollerHeight0)
        ScrollerPathLength := Height
      endif
      ScrollerPosY := Lerp(0, ~ScrollerPathLength, ~kScrollerPosY)
      switch
        case(~ScrollerPosY < 0)
          kScrollerHeight := (~ScrollerHeight0 + ~ScrollerPosY) / ~ScrollerHeight0
          ScrollerPosY := 0
        case(~ScrollerPosY > Height - ~ScrollerHeight0)
          kScrollerHeight := (Height - ~ScrollerPosY) / ~ScrollerHeight0
        default 
          kScrollerHeight := 1
      endswitch
      ScrollerHeight := Lerp(0, ~ScrollerHeight0, ~kScrollerHeight)
      
      SetVar("ScrollerPanel", "PositionY", ~ScrollerPosY)
      SetVar("ScrollerPanel", "Height", ~ScrollerHeight)
      
      updateStringVisibility := 1
      _cursorPositionY := ~cursorPositionY
    endif
  endif

  //������������� �������� ���������
  if(~scrollingStarted && (GetVarF("TextPanel", "LMBUp")/* || GetVarF("TextPanel", "CursorLeave")*/))
    scrollingStarted := 0
    OverlayElement_GetPosition(~hTextContainer, ~posX, ~posY)
    mouseSpeedY := GetVarF("MouseSpeedChecker", "SpeedY")*2
    //�������� �������� ������ � �������� ���������
    //OverlayElement_GetPosition(~hTextContainer, ~posX, ~posY)
    SetVar("TextAnimation", "From", ~posY)
    switch
      case(~posY > 0 || ~textContainerHeight < Height)
        animationStarted := 1
        SetVar("TextAnimation", "To", 0)
        SetVar("TextAnimation", "Start", 1)
        SetVar("TextAnimation", "Power", 4)
        SetVar("TextAnimation", "Duration", 0.5)
        
      case(abs(~posY) > ~textContainerHeight - Height)
        animationStarted := 1
        SetVar("TextAnimation", "To", -(~textContainerHeight - Height))
        SetVar("TextAnimation", "Start", 1)
        SetVar("TextAnimation", "Power", 4)
        SetVar("TextAnimation", "Duration", 0.5)
          
      case(abs(~mouseSpeedY) > 0)
        animationStarted := 1
        scrollInProgress := 1
        SetVar("TextAnimation", "From", ~posY + ~mouseSpeedY/10)
        SetVar("TextAnimation", "Power", 3)
        SetVar("TextAnimation", "To", ~posY + ~mouseSpeedY)
        SetVar("TextAnimation", "Duration", 1)
        SetVar("TextAnimation", "Start", 1)
    endswitch
    updateStringVisibility := 1
  endif
  
  if(GetVarF("TextAnimation", "InProgress"))
    posY := GetVarF("TextAnimation", "Value")
    if(~scrollInProgress)
    switch
      case(~posY > 0 || ~textContainerHeight < Height)
        posY := 0
        SetVar("TextAnimation", "Stop", 1)
        scrollInProgress := 0
        animationStopped := 1
        
      case(abs(~posY) > ~textContainerHeight - Height)
        posY := -(~textContainerHeight - Height)
        SetVar("TextAnimation", "Stop", 1)
        scrollInProgress := 0
        animationStopped := 1
    endswitch
    endif
      
    OverlayElement_SetPosition(~hTextContainer, ~posX, ~posY)
    kScrollerPosY := ~posY / -(~textContainerHeight - Height)
    ScrollerPosY := Lerp(0, Height - ScrollerHeight0, ~kScrollerPosY)
    ScrollerPathLength := Height - ScrollerHeight0
    if(Height == ScrollerHeight0)
      ScrollerPathLength := Height
    endif
    ScrollerPosY := Lerp(0, ~ScrollerPathLength, ~kScrollerPosY)
    switch
      case(~ScrollerPosY < 0)
        kScrollerHeight := (~ScrollerHeight0 + ~ScrollerPosY) / ~ScrollerHeight0
        ScrollerPosY := 0
      case(~ScrollerPosY > Height - ~ScrollerHeight0)
        kScrollerHeight := (Height - ~ScrollerPosY) / ~ScrollerHeight0
      default 
        kScrollerHeight := 1
    endswitch
    ScrollerHeight := Lerp(0, ~ScrollerHeight0, ~kScrollerHeight)
      
    SetVar("ScrollerPanel", "PositionY", ~ScrollerPosY)
    SetVar("ScrollerPanel", "Height", ~ScrollerHeight)
    updateStringVisibility := 1
  endif
  
  //���������� ��������� �����, ��������� �� ������� ������
  if(~updateStringVisibility)
    OverlayElement_GetPosition(~hTextContainer, ~posX, ~posY)
    //posY := GetVarF("TextPanel", "CursorPosY")
    i := 0
    while(~i < ~TotalStringsCount)
      hOverlayElement := OverlayElement_Get(Name + "String" + string(~i))
      Overlayelement_GetPosition(~hOverlayElement, ~strPosX, ~strPosY)
      if(~posY + ~strPosY < 0 || ~posY + ~strPosY > Height)
        OverlayElement_SetVisible(~hOverlayElement, 0)
      else
        OverlayElement_SetVisible(~hOverlayElement, 1)
      endif
      inc(~i)
    endwhile
    updateStringVisibility := 0
  endif
  
  if(animationStarted) 
    SetVar("TextAnimation", "Start", 0) 
    animationStarted := 0 
  endif
  if(animationStopped)
    SetVar("TextAnimation", "Stop", 0) 
    animationStopped := 0
  endif
endif
       
 system.dbm g    o f # - 5 � z  Panel x  z  TextContainer | �           �?�    �z  FileReader  z  FilePath  x  �z  TextAnimation z  Duration         �?�z  ScrollerPanel z  Name  x  z  Scroller  | �z  ScrollerPanel z  PositionX   �z  ScrollerPanel z  Width   �z 	 ScrollerMaterial  z  IsAlphaBlendingEnabled         �?�       �? # z  FileReader  z 
 FileReadingFinished � # - , 5           $ z  FileReader  z 	 TotalStringCount  � 2  3  2 : 5 �  2  3 z  FileReader  z  HFileStrings  �   $  3 : 5 � $  3 9 5 �z  TextArea  x  z  String  |  $ � | �              $  	     �     	 �         �?�  z  font_name x    z  char_height  	 �   z  alignment x    z  space_width  
 �     �3 �x  z  String  |  $ � | �    z    ��$ c3  2  	      4      4 �                    �   5  4          7  4   8 + 5 �  #  4   5        S 5 z  ScrollerPanel z  Height   5 �z  ScrollerPanel z  PositionY          �       �? 6        �? 7        R 5 8z  ScrollerPanel z  HPanel  �   7 5 �          $  $  2 : 5 jx  z  String  |  $ � | �       $ z    ���$ c3 Cz  ScrollerPanel z  Height   5 �          7 z  TextPanel z  LMBDown �5 �z  TextPanel z  CursorPosY  � 8  8  9   �: �; �z  TextAnimation z  Stop         �?�       �? <        �? =  = 5 �z  TextPanel z  CursorPosY  � >  >  9 7  ?  ? 5 � >  8   @  ;  @   A    B  A � A  4    q   C    5   D    5 6 5 %   D           D  C � Lerp   �������� E  E          : 5 W 5  E   5   F           E 3 t E    5  8 5 m   E   5   F 3 t       �? F           5  F � Lerp   �������� G z  ScrollerPanel z  PositionY  E �z  ScrollerPanel z  Height   G �       �? 6  >  9  = z  TextPanel z  LMBUp �+ 5 _          =   �B �A �z 	 MouseSpeedChecker z  SpeedY  �        @  H z  TextAnimation z  From   A � A          8  4   : , 5 n       �? I z  TextAnimation z  To           �z  TextAnimation z  Start        �?�z  TextAnimation z  Power        @�z  TextAnimation z  Duration         �?�3 X A .  4    8 5 �       �? I z  TextAnimation z  To   4    q �z  TextAnimation z  Start        �?�z  TextAnimation z  Power        @�z  TextAnimation z  Duration         �?�3 X H .          8 5 X       �? I        �? J z  TextAnimation z  From   A  H        $@  �z  TextAnimation z  Power        @�z  TextAnimation z  To   A  H  �z  TextAnimation z  Duration         �?�z  TextAnimation z  Start        �?�       �? 6 z  TextAnimation z  InProgress  �5 �z  TextAnimation z  Value � A  J 5 � A          8  4   : , 5 �          A z  TextAnimation z  Stop         �?�          J        �? < 3 � A .  4    8 5 � 4    q  A z  TextAnimation z  Stop         �?�          J        �? <    B  A � A  4    q   C             5   C � Lerp   �������� E    5   D    5 6 5 4   D           D  C � Lerp   �������� E  E          : 5 f 5  E   5   F           E 3 � E    5  8 5 |   E   5   F 3 �       �? F           5  F � Lerp   �������� G z  ScrollerPanel z  PositionY  E �z  ScrollerPanel z  Height   G �       �? 6  6 5 (  �B �A �          $  $  2 : 5 !x  z  String  |  $ � | �    �K �L � A  L           :  A  L    8 , 5            �3          �?��$ c3 �          6  I 5 Gz  TextAnimation z  Start          �          I  < 5 fz  TextAnimation z  Stop           �          <    	z1   ;  	 ?  
 