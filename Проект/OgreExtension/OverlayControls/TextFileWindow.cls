SB0  n      TextFileWindow   HSpace     HANDLE    HRenderWindow     HANDLE    HParentContainer     HANDLE    HParentOverlay     HANDLE    HPanel     HANDLE    Name     STRING    BorderMaterialName     STRING    TextFilePath     STRING    FontName  	 MyriadPro STRING   	 PositionX     FLOAT   	 PositionY     FLOAT    Width   600 FLOAT    Height   350 FLOAT    HorizontalAlignment  
 GHA_CENTER FLOAT    VerticalAlignment  
 GVA_CENTER FLOAT    BorderWidth   32 FLOAT   	 IsVisible   0 FLOAT�   IsCloseButtonVisible   1 FLOAT   	 TextColor   rgb(255,255,255) COLORREF    FontSize   20 FLOAT    StringsOnPage   30 FLOAT    TextHorisontalOffset   25 FLOAT    TextVerticalOffset   25 FLOAT    IsMouseHandled     FLOAT    isInitialize     FLOAT�   _width     FLOAT   _height     FLOAT   Show     FLOAT                HBorderPanel HParentPanel  	         HBorderPanel HParentContainer         
  BorderMaterialName BorderMaterialName BorderMaterialName MaterialName Width Width Height Height HorizontalAlignment HorisontalAlignment VerticalAlignment VerticalAlignment	 IsVisible	 IsVisible HParentContainer HParentContainer HParentOverlay HParentOverlay HPanel HBorderPanel BorderWidth BorderSizeLeft BorderWidth BorderSizeTop BorderWidth BorderSizeRight BorderWidth BorderSizeBottom IsMouseHandled IsMouseHandled Name Name	 PositionX	 PositionX	 PositionY	 PositionY         
 	 TextColor	 TextColor TextFilePath FilePath FontName FontName FontSize FontSize StringsOnPage StringsOnPage HSpace HSpace HRenderWindow HRenderWindow         
  IsCloseButtonVisible	 IsVisible   OgreOverlayFileTextBlock  FileTextViewer     @�@      q@ 
 OgreButton  CloseButton     @�@      t@  OgreOverlayBorderPanel  BorderPanel     ��@      q@ 	 �      �  2D  �                         Y@      Y@      Y@      Y@          �   	  
    	     
 �Z    
 �� N          @�@      q@      @@      @@      @@      v@      @@      @@    ,     �       �    FileTextViewer N          @�@      t@      @@      @@      d@      @@      @@      @@    )     �       �    CloseButton N          ��@      q@      @@      @@                      @@      @@    )     �       �    BorderPanel Q          @�@      r@      H@                 @�@      r@     ��@      r@  Q   	       @�@      r@      H@      H@         @�@      r@     ��@      u@  N   
        ��@      l@      @@      @@                      @@      @@    Q          @�@      n@              H@         @�@      n@     @�@      r@  Q          @�@      n@      H@      H@         @�@      n@     ��@      r@  Q          @�@      n@      H@      X@         @�@      n@     ��@      u@ �s    
 
 ��e      �        e      �        e      �        e      �        e      �        �T    
 
 ��o      
 system.dbmo       default.dbmo       VARPOINT.DBM
 DHandle HSpace, HRenderWindow, HParentContainer, HParentOverlay, HPanel
       
String Name, BorderMaterialName, TextFilePath, FontName
Float  PositionX, PositionY, Width, Height, HorizontalAlignment, VerticalAlignment, BorderWidth, IsVisible, IsCloseButtonVisible
ColorRef TextColor
Float  FontSize, StringsOnPage, TextHorisontalOffset, TextVerticalOffset
Float  IsMouseHandled

Float local isInitialize, _width, _height

if(!isInitialize)
  SetVar("BorderPanel", "Name", Name + "BorderPanel")
  
  SetVar("FileTextViewer", "Name", Name + "FileTextViewer")
  SetVar("FileTextViewer", "PositionX", TextHorisontalOffset)
  SetVar("FileTextViewer", "PositionY", TextVerticalOffset)
  
  SetVar("CloseButton", "Name", Name + "CloseButton")
  SetVar("CloseButton", "Text", "�������")
  SetVar("CloseButton", "Width", 150)
  SetVar("CloseButton", "Height", 60)
  SetVar("CloseButton", "PositionX", -75)
  SetVar("CloseButton", "PositionY", -60)
  SetVar("CloseButton", "TextOffsetX", -30)
  SetVar("CloseButton", "TextOffsetY", -10)
  SetVar("CloseButton", "BorderWidth", 12)
  SetVar("CloseButton", "HorisontalAlignment", GHA_CENTER)
  SetVar("CloseButton", "VerticalAlignment", GVA_BOTTOM)
  
  isInitialize := 1
endif

if(GetVarF("CloseButton", "ButtonUp"))
  IsVisible := 0
endif

if(Show)
  IsVisible := 1
endif     @   WINDOWS.DBM �    - 5 az  BorderPanel z  Name  x  z  BorderPanel | �z  FileTextViewer  z  Name  x  z  FileTextViewer  | �z  FileTextViewer  z  PositionX   �z  FileTextViewer  z  PositionY   �z  CloseButton z  Name  x  z  CloseButton | �z  CloseButton z  Text  z  ������� �z  CloseButton z  Width       �b@�z  CloseButton z  Height         N@�z  CloseButton z  PositionX       �R@q �z  CloseButton z  PositionY        N@q �z  CloseButton z  TextOffsetX        >@q �z  CloseButton z  TextOffsetY        $@q �z  CloseButton z  BorderWidth        (@�z  CloseButton z 
 HorisontalAlignment        �?�z  CloseButton z 	 VerticalAlignment         @�       �?  z  CloseButton z  ButtonUp  �5 z             5 �       �?     �L3   `  	 �  
 