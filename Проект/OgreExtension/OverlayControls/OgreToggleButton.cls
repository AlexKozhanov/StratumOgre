SB0  O+      OgreToggleButton 2  HSpace     HANDLE    HOverlayButton     HANDLE    HParentContainer     HANDLE    Name   ToggleButton STRING    DownTexture   ChekboxChecked.png STRING    DownPressedTexture   CheckboxCheckedPressed.png STRING�  	 UpTexture   ChekboxUnChecked.png STRING    UpPressedTexture   CheckboxUncheckedPressed.png STRING�   CursorHoverDownTexture   CheckBoxHoverChecked.png STRING�   CursorHoverUpTexture   ChekboxHoverUnchecked.png STRING�   DisabledTexture     STRING�   KeyboardButton     STRING   	 PanelType   BorderPanel STRING   	 PositionX ������� �� X   FLOAT   	 PositionY ������� �� Y   FLOAT    Width ������  25 FLOAT    Height ������ 25 FLOAT    HorisontalAlignment< ������������ �� ����������� ������������ �������� ���������� GHA_LEFT FLOAT    VerticalAlignment: ������������ �� ��������� ������������ �������� ���������� GVA_TOP FLOAT    BorderWidth   3 FLOAT    MetricsMode  	 GMM_PIXEL FLOAT   	 IsVisible   1 FLOAT    IsEnable   1 FLOAT    PressedState   0 FLOAT�   Text     STRING    FontName  	 MyriadPro STRING    FontSize   20 FLOAT    TextOffsetX   -25 FLOAT    TextOffsetY   -10 FLOAT    TextHorisontalAlignment  
 GHA_CENTER FLOAT    TextVerticalAlignment  
 GVA_CENTER FLOAT    TextDownColor  
 rgb(0,0,0) COLORREF    TextUpColor   rgb(255,255,255) COLORREF    TextDownHoverColor  
 rgb(0,0,0) COLORREF    TextUpHoverColor   rgb(255,255,255) COLORREF    TextDownPressedColor  
 rgb(0,0,0) COLORREF    TextUpPressedColor  
 rgb(0,0,0) COLORREF    TextDisabledColor   rgb(127,127,127) COLORREF    IsMouseHandled     FLOAT�   AbsolutePositionX     FLOAT    AbsolutePositionY     FLOAT    hRenderWindow     HANDLE�   isInitialize     FLOAT�   isButtonDown     FLOAT   keyCode     FLOAT�   _pressedState     FLOAT�  
 keyPressed     FLOAT�  	 _isEnable     FLOAT�  
 _isVisible     FLOAT�   isAbsoluteVisible     FLOAT�       	        Name Name   
        Name Name HOverlayButton HBorderPanel HParentContainer HParentContainer Width Width Height Height HorisontalAlignment HorisontalAlignment VerticalAlignment VerticalAlignment MetricsMode MetricsMode	 IsVisible	 IsVisible	 PositionX	 PositionX	 PositionY	 PositionY HSpace HSpace AbsolutePositionX AbsolutePositionX AbsolutePositionY AbsolutePositionY BorderWidth BorderSizeLeft BorderWidth BorderSizeTop BorderWidth BorderSizeRight BorderWidth BorderSizeBottom IsMouseHandled IsMouseHandled	 PanelType Type           Name MaterialName Name BorderMaterialName           HPanel HParentContainer           HOverlayButton HParentContainer TextVerticalAlignment VerticalAlignment TextHorisontalAlignment HorisontalAlignment TextOffsetX	 PositionX TextOffsetY	 PositionY           Text Text FontSize
 CharHeight FontName FontName   KeyCode  KeyCode     ��@     �y@  OgreOverlayBorderPanel  ButtonPanel     ��@     �y@  OgreOverlayPanel 	 TextPanel      �@     �|@  OgreTextAreaOverlayElement  TextArea      �@      �@  OgreOverlayMaterial  ButtonMaterial      �@     �y@ 	 �      �  2D  � �                        Y@      Y@      Y@      Y@          �$     
     
 	       ��    
 �� N          ��@     �y@      @@      @@      @@      �@      @@      @@    %     �       �    KeyCode N           ��@     �v@      @@      @@                      @@      @@    N           �@     �|@      @@      @@      x@              @@      @@    N          ��@     �y@      @@      @@                      @@      @@    '     �       �    TextPanel Q   	        �@     �w@      H@      H@          �@     �w@     ��@     �z@  Q   
        �@     �w@              H@          �@     �w@      �@     �z@  Q           �@     �z@      H@                 ��@     �z@      �@     �z@  )     �       �    ButtonPanel N           �@      �@      @@      @@              ~@      @@      @@    &     �       �    TextArea Q          ��@     �}@              L@         ��@     �}@     ��@     ��@  Q           �@     �w@      H@      X@          �@     �w@     ��@     �}@  Q           �@     �w@      H@      c@          �@     �w@     ��@     ��@  N           �@     �y@      @@      @@      P@      �@      @@      @@    ,     �       �    ButtonMaterial��    
 
 ��e      �        e      �        e      �        e      �        e      �        e      �        �k    
 
 ��o      
 system.dbmo       VARPOINT.DBMo       WINDOWS.DBMo       default.dbm
 �Handle HSpace, HOverlayButton, HParentContainer
String Name, DownTexture, DownPressedTexture, UpTexture, UpPressedTexture, CursorHoverDownTexture, CursorHoverUpTexture, DisabledTexture, KeyboardButton, PanelType
Float  PositionX, PositionY, Width, Height, HorisontalAlignment, VerticalAlignment, BorderWidth, MetricsMode, IsVisible, IsEnable,
       PressedState
       
String Text, FontName
Float  FontSize, TextOffsetX, TextOffsetY, TextHorisontalAlignment, TextVerticalAlignment
ColorRef TextDownColor, TextUpColor, TextDownHoverColor, TextUpHoverColor, TextDownPressedColor, TextUpPressedColor, TextDisabledColor

Float  IsMouseHandled, AbsolutePositionX, AbsolutePositionY

Handle local hRenderWindow
Float  local isInitialize, isButtonDown, keyCode, _pressedState, keyPressed, _isEnable, _isVisible

if(HOverlayButton && HParentContainer)
  if(!isInitialize)
    hRenderWindow := RenderWindow_GetPrimary()
    if(KeyboardButton != "")
      keyCode := GetVarF("KeyCode", KeyboardButton)
      SetVar("ButtonMaterial", "TextureFileName", UpTexture)
    endif
    
    if(DownPressedTexture == "")
      DownPressedTexture := DownTexture
    endif
    if(CursorHoverDownTexture == "")
      CursorHoverDownTexture := DownTexture
    endif
    if(CursorHoverUpTexture == "")
      CursorHoverUpTexture := UpTexture
    endif
    if(DisabledTexture == "")
      DisabledTexture := UpTexture
    endif
    if(UpPressedTexture == "")
      UpPressedTexture := DownTexture
    endif
    
    SetVar("TextPanel", "Name", Name + "TextPanel")
    SetVar("TextPanel", "CheckMouseEvents", 0)
    
    SetVar("TextArea", "Name", Name + "TextArea")
    SetVar("TextArea", "TextColor", TextUpColor)
    
    isInitialize := 1
  endif
  
  if(IsVisible && IsEnable)
    isAbsoluteVisible := OverlayElement_GetAbsoluteVisible(HOverlayButton)
    if(~isAbsoluteVisible)
      if(HSpace)
        keyPressed := GetAsyncKeyState(~keyCode)
      else
        keyPressed := RenderWindow_GetKeyboardButtonPressed(~hRenderWindow, ~keyCode)
      endif
      if(GetVarF("ButtonPanel", "LMBDown") || (~keyPressed && !keyPressed) )
        if(PressedState)
          SetVar("TextArea", "TextColor", TextUpPressedColor)
          SetVar("ButtonMaterial", "TextureFileName", UpPressedTexture)
        else
          SetVar("TextArea", "TextColor", TextDownPressedColor)
          SetVar("ButtonMaterial", "TextureFileName", DownPressedTexture)
        endif
        IsMouseHandled := 1
      endif
    
      if(GetVarF("ButtonPanel", "LMBUp") || (~keyPressed && !keyPressed) )
        PressedState := !PressedState
      endif
  
      if(GetVarF("ButtonPanel", "CursorEnter"))
        if(PressedState)
          SetVar("TextArea", "TextColor", TextDownHoverColor)
          SetVar("ButtonMaterial", "TextureFileName", CursorHoverDownTexture)
        else
          SetVar("TextArea", "TextColor", TextUpHoverColor)
          SetVar("ButtonMaterial", "TextureFileName", CursorHoverUpTexture)
        endif
      endif
   
      if(GetVarF("ButtonPanel", "CursorLeave"))
        if(PressedState)
          SetVar("TextArea", "TextColor", TextDownColor)
          SetVar("ButtonMaterial", "TextureFileName", DownTexture)
        else
          SetVar("TextArea", "TextColor", TextUpColor)
          SetVar("ButtonMaterial", "TextureFileName", UpTexture)
        endif
      endif
  
      if(~_pressedState != ~PressedState)
        if(~PressedState)
          SetVar("TextArea", "TextColor", TextDownColor)
          SetVar("ButtonMaterial", "TextureFileName", DownTexture)
        else
          SetVar("TextArea", "TextColor", TextUpColor)
          SetVar("ButtonMaterial", "TextureFileName", UpTexture)
        endif
        _pressedState := ~PressedState
      endif
    endif
  endif
  
  if(_isEnable != IsEnable)
    if(IsEnable)
      if(PressedState)
        SetVar("TextArea", "TextColor", TextDownColor)
        SetVar("ButtonMaterial", "TextureFileName", DownTexture)
      else
        SetVar("TextArea", "TextColor", TextUpColor)
        SetVar("ButtonMaterial", "TextureFileName", UpTexture)
      endif
    else 
      SetVar("ButtonMaterial", "TextureFileName", DisabledTexture)
    endif
    _isEnable := IsEnable
  endif
  
  if(_isVisible != IsVisible)
    SetVar("ButtonPanel", "CheckMouseEvents", IsVisible)
    _isVisible := IsVisible
  endif
  
  if(IsMouseHandled); IsMouseHandled := 0; endif
endif       y      U o x * - 5 � � ) x  z    � 5 9 z  KeyCode x  � , z  ButtonMaterial  z  TextureFileName x  �x  z    � 5 E x  {  x  z    � 5 Q x  {  x 	 z    � 5 ] x  { 	 x 
 z    � 5 i x  { 
 x  z    � 5 u x  {  z  TextPanel z  Name  x  z  TextPanel | �z  TextPanel z 	 CheckMouseEvents           �z  TextArea  z  Name  x  z  TextArea  | �z  TextArea  z  TextColor    �       �? *     + 5 �  � OverlayElement_GetAbsoluteVisible  ���� 1  1 5 �   o  , �  . 3 
 )  ,  . z  ButtonPanel z  LMBDown � .  . - + , 5   5 Pz  TextArea  z  TextColor  $ �z  ButtonMaterial  z  TextureFileName x  �3 xz  TextArea  z  TextColor  # �z  ButtonMaterial  z  TextureFileName x  �       �? & z  ButtonPanel z  LMBUp � .  . - + , 5 �  -   z  ButtonPanel z  CursorEnter �5   5 �z  TextArea  z  TextColor  ! �z  ButtonMaterial  z  TextureFileName x  �3 z  TextArea  z  TextColor  " �z  ButtonMaterial  z  TextureFileName x 	 �z  ButtonPanel z  CursorLeave �5 m  5 Ez  TextArea  z  TextColor   �z  ButtonMaterial  z  TextureFileName x  �3 mz  TextArea  z  TextColor    �z  ButtonMaterial  z  TextureFileName x  � -   7 5 �  5 �z  TextArea  z  TextColor   �z  ButtonMaterial  z  TextureFileName x  �3 �z  TextArea  z  TextColor    �z  ButtonMaterial  z  TextureFileName x  �   -  /   7 5 L  5 1  5 z  TextArea  z  TextColor   �z  ButtonMaterial  z  TextureFileName x  �3 /z  TextArea  z  TextColor    �z  ButtonMaterial  z  TextureFileName x  �3 Hz  ButtonMaterial  z  TextureFileName x 
 �   /  0   7 5 mz  ButtonPanel z 	 CheckMouseEvents    �   0  & 5 x          &    :M�  �  	 �  
 