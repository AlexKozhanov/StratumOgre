SB0  h2      OgreRadioButton 7  HSpace     HANDLE    HParentContainer     HANDLE    HOverlayButton     HANDLE    Name   RadioButton STRING   	 GroupName   Group1 STRING    DownTexture   RadioButtonSelected.png STRING    DownPressedTexture   RadioButtonHoverSelected.png STRING   	 UpTexture   RadioButtonUnselected.png STRING    CursorHoverDownTexture   RadioButtonHoverSelected.png STRING    CursorHoverUpTexture   RadioButtonHoverUnselected.png STRING    DisabledTexture     STRING    KeyboardButton     STRING   	 PanelType   Panel STRING   	 PositionX     FLOAT   	 PositionY     FLOAT    Width   15 FLOAT    Height   15 FLOAT    BorderWidth   12 FLOAT    HorisontalAlignment   GHA_LEFT FLOAT    VerticalAlignment   GVA_TOP FLOAT    MetricsMode  	 GMM_PIXEL FLOAT    IsAlphaBlendingEnabled   1 FLOAT   	 IsVisible   1 FLOAT   	 IsEnabled   1 FLOAT   
 IsSelected   0 FLOAT�  
 IsNullable   1 FLOAT    AbsolutePositionX     FLOAT    AbsolutePositionY     FLOAT    IsMouseHandled     FLOAT�   Text   Text STRING    FontName  	 MyriadPro STRING    FontSize   20 FLOAT    TextOffsetX   0 FLOAT    TextOffsetY   0 FLOAT    TextHorisontalAlignment   GHA_LEFT FLOAT    TextVerticalAlignment   GVA_LEFT FLOAT    TextDownColor  
 rgb(0,0,0) COLORREF    TextUpColor   rgb(255,255,255) COLORREF    TextDownHoverColor  
 rgb(0,0,0) COLORREF    TextUpHoverColor   rgb(255,255,255) COLORREF    TextDownPressedColor  
 rgb(0,0,0) COLORREF    TextUpPressedColor   rgb(255,255,255) COLORREF    TextDisabledColor   rgb(191,191,191) COLORREF    hRenderWindow     HANDLE�   selectedGroupName     STRING�   isInitialize     FLOAT�   isButtonDown     FLOAT   keyCode     FLOAT�   _pressedState     FLOAT  
 keyPressed     FLOAT�   _isSelected     FLOAT�  
 _isEnabled     FLOAT�  
 _isVisible     FLOAT�   isSelectedMessage     FLOAT�   isAbsoluteVisible     FLOAT�      	 
        Name Name HOverlayButton HBorderPanel HParentContainer HParentContainer Width Width Height Height HorisontalAlignment HorisontalAlignment VerticalAlignment VerticalAlignment MetricsMode MetricsMode	 IsVisible	 IsVisible	 PositionX	 PositionX	 PositionY	 PositionY AbsolutePositionX AbsolutePositionX AbsolutePositionY AbsolutePositionY HSpace HSpace BorderWidth BorderSizeLeft BorderWidth BorderSizeTop BorderWidth BorderSizeRight BorderWidth BorderSizeBottom	 PanelType Type           Name Name IsAlphaBlendingEnabled IsAlphaBlendingEnabled 	          Name MaterialName Name BorderMaterialName           HPanel HParentContainer           HOverlayButton HParentContainer TextVerticalAlignment VerticalAlignment TextHorisontalAlignment HorisontalAlignment TextOffsetX	 PositionX TextOffsetY	 PositionY           Text Text FontSize
 CharHeight FontName FontName   OgreOverlayMaterial  ButtonMaterial     ��@      {@  KeyCode  KeyCode     @�@      {@  OgreOverlayBorderPanel	  ButtonPanel      �@      {@  OgreTextAreaOverlayElement  TextArea     ��@      �@  OgreOverlayPanel 	 TextPanel     ��@     �~@ 	 �      �  2D  � �        b@              Y@      Y@      Y@      Y@          �$     
      
       ��    
 �� N          @�@      {@      @@      @@      @@      �@      @@      @@    %     �       �    KeyCode N            �@     �w@      @@      @@                      @@      @@    Q          ��@      |@      L@                 @�@      |@     ��@      |@  N          ��@      �@      @@      @@              ~@      @@      @@    N           �@      {@      @@      @@                      @@      @@    &     �       �    TextArea )   	  �       �    ButtonPanel Q   
       ��@     �x@              L@         ��@     �x@     ��@      |@  N          ��@     �~@      @@      @@      x@              @@      @@    N          ��@      {@      @@      @@      P@      �@      @@      @@    ,     �       �    ButtonMaterial Q          ��@     �x@      L@      L@         ��@     �x@     @�@      |@  '     �       �    TextPanel Q          @�@     �@              L@         @�@     �@     @�@     ��@  Q          ��@     �x@      L@      \@         ��@     �x@     @�@     �@  Q          ��@     �x@      L@      e@         ��@     �x@     @�@     ��@ ��    
 
 ��e      �        e      �        e      �        e      �        e      �        e      �        �k    
 
 ��o      
 system.dbmo       VARPOINT.DBMo       WINDOWS.DBMo       default.dbm
 YHandle HSpace, HParentContainer, HOverlayButton
String Name, GroupName, DownTexture, DownPressedTexture, UpTexture, CursorHoverDownTexture, CursorHoverUpTexture, DisabledTexture, KeyboardButton, PanelType
Float  PositionX, PositionY, Width, Height, BorderWidth, HorisontalAlignment, VerticalAlignment, MetricsMode, IsAlphaBlendingEnabled, IsVisible, IsEnabled, IsSelected, IsNullable,
       AbsolutePositionX, AbsolutePositionY, IsMouseHandled
       
String Text, FontName
Float  FontSize, TextOffsetX, TextOffsetY, TextHorisontalAlignment, TextVerticalAlignment
ColorRef TextDownColor, TextUpColor, TextDownHoverColor, TextUpHoverColor, TextDownPressedColor, TextUpPressedColor, TextDisabledColor

Handle local hRenderWindow
String local selectedGroupName
Float  local isInitialize, isButtonDown, keyCode, _pressedState, keyPressed, _isSelected, _isEnabled, _isVisible, isSelectedMessage, isAbsoluteVisible

if(HOverlayButton)
  if(!isInitialize)
    hRenderWindow := RenderWindow_GetPrimary()
    if(KeyboardButton != "")
      keyCode := GetVarF("KeyCode", KeyboardButton)
    endif
    if(IsSelected)
      SetVar("ButtonMaterial", "TextureFileName", DownTexture)
    else
      SetVar("ButtonMaterial", "TextureFileName", UpTexture)
    endif
    
    SetVar("TextPanel", "Name", Name + "TextPanel")
    SetVar("TextPanel", "CheckMouseEvents", 0)
    
    SetVar("TextArea", "Name", Name + "TextArea")
    SetVar("TextArea", "TextColor", TextUpColor)
    
    selectedGroupName := GroupName
    _isSelected := IsSelected
    isInitialize := 1
  endif

  if(IsEnabled)
    isAbsoluteVisible := OverlayElement_GetAbsoluteVisible(HOverlayButton)
    if(~isAbsoluteVisible)
      if(HSpace)
        keyPressed := GetAsyncKeyState(~keyCode)
      else
        keyPressed := RenderWindow_GetKeyboardButtonPressed(~hRenderWindow, ~keyCode)
      endif
    
      if(GetVarF("ButtonPanel", "LMBDown"))
        IsMouseHandled := 1
        
        if(DownPressedTexture == "")
          SetVar("ButtonMaterial", "TextureFileName", DownTexture)
          SetVar("TextArea", "TextColor", TextDownColor)
        else
          SetVar("ButtonMaterial", "TextureFileName", DownPressedTexture)
          SetVar("TextArea", "TextColor", TextDownPressedColor)
        endif
      endif
    
      if(GetVarF("ButtonPanel", "CursorEnter"))
        if(IsSelected)
          if(CursorHoverDownTexture != "")
            SetVar("ButtonMaterial", "TextureFileName", CursorHoverDownTexture)
            SetVar("TextArea", "TextColor", TextDownHoverColor)
          endif
        else
          if(CursorHoverUpTexture != "")
            SetVar("ButtonMaterial", "TextureFileName", CursorHoverUpTexture)
            SetVar("TextArea", "TextColor", TextUpHoverColor)
          endif
        endif
      endif
    
      if(GetVarF("ButtonPanel", "CursorLeave"))
        if(IsSelected)
          SetVar("ButtonMaterial", "TextureFileName", DownTexture)
          SetVar("TextArea", "TextColor", TextDownColor)
        else
          if(CursorHoverUpTexture != "")
            SetVar("ButtonMaterial", "TextureFileName", UpTexture)
            SetVar("TextArea", "TextColor", TextUpColor)
          endif
        endif
      endif

      if(GetVarF("ButtonPanel", "LMBUp") || (~keyPressed && !keyPressed) || ~_isSelected != ~IsSelected)
        selectedGroupName := GroupName
        if(!_isSelected)
          //�������� �� ��� ������ RadioButton ��������� � ����������� ��������� ���������� IsSelected
          isSelectedMessage := 1 
          SendMessage("", "OgreRadioButton", "isSelectedMessage", "isSelectedMessage", "GroupName", "SelectedGroupName")
          //����� �� ��� ������� RadioButton ��������� � ����������� ��������� ���������� IsSelected
          isSelectedMessage := 0
          SendMessage("", "OgreRadioButton", "isSelectedMessage", "isSelectedMessage", "GroupName", "SelectedGroupName")
         
          IsSelected := 1
          SetVar("ButtonMaterial", "TextureFileName", DownTexture)
          SetVar("TextArea", "TextColor", TextDownColor)
        else
          if(IsNullable)
            IsSelected := 0
            SetVar("ButtonMaterial", "TextureFileName", UpTexture)
            SetVar("TextArea", "TextColor", TextUpColor)
          endif
        endif
        SetVar("ButtonMaterial", "TextureFileName", DownTexture)
        SetVar("TextArea", "TextColor", TextDownColor)
        _isSelected := ~IsSelected
      endif
    endif
  endif
  
  if(~isSelectedMessage && ~selectedGroupName == ~GroupName)
    IsSelected := 0
    SetVar("ButtonMaterial", "TextureFileName", UpTexture)
    SetVar("TextArea", "TextColor", TextUpColor)
    _isSelected := ~IsSelected
  endif
  
  if(_isEnabled != IsEnabled)
    if(IsEnabled)
      if(IsSelected)
        SetVar("ButtonMaterial", "TextureFileName", DownTexture)
        SetVar("TextArea", "TextColor", TextDownColor)
      else
        SetVar("ButtonMaterial", "TextureFileName", UpTexture)
        SetVar("TextArea", "TextColor", TextUpColor)
      endif
    else 
      if(DisabledTexture != "")
        SetVar("ButtonMaterial", "TextureFileName", DisabledTexture)
        SetVar("TextArea", "TextColor", TextDisabledColor)
      else
        SetVar("ButtonMaterial", "TextureFileName", UpTexture)
        SetVar("TextArea", "TextColor", TextUpColor)
      endif
    endif
    _isEnabled := IsEnabled
  endif
  
  if(_isVisible != IsVisible)
    SetVar("ButtonPanel", "CheckMouseEvents", IsVisible && IsEnabled)
    _isVisible := IsVisible
  endif
  
  if(IsMouseHandled);    IsMouseHandled := 0;   endif
endif     �  �    o � - - 5 � � + x  z    � 5  z  KeyCode x  � /   5 < z  ButtonMaterial  z  TextureFileName x  �3 S z  ButtonMaterial  z  TextureFileName x  �z  TextPanel z  Name  x  z  TextPanel | �z  TextPanel z 	 CheckMouseEvents           �z  TextArea  z  Name  x  z  TextArea  | �z  TextArea  z  TextColor  % �x  { ,    2        �? -   5 {  � OverlayElement_GetAbsoluteVisible  ���� 6  6 5 {   o �  / �  1 3 �  +  /  1 z  ButtonPanel z  LMBDown �5 _       �?  x  z    � 5 7z  ButtonMaterial  z  TextureFileName x  �z  TextArea  z  TextColor  $ �3 _z  ButtonMaterial  z  TextureFileName x  �z  TextArea  z  TextColor  ( �z  ButtonPanel z  CursorEnter �5 �  5 �x  z    � 5 �z  ButtonMaterial  z  TextureFileName x  �z  TextArea  z  TextColor  & �3 �x 	 z    � 5 �z  ButtonMaterial  z  TextureFileName x 	 �z  TextArea  z  TextColor  ' �z  ButtonPanel z  CursorLeave �5 I  5 z  ButtonMaterial  z  TextureFileName x  �z  TextArea  z  TextColor  $ �3 Ix 	 z    � 5 Iz  ButtonMaterial  z  TextureFileName x  �z  TextArea  z  TextColor  % �z  ButtonPanel z  LMBUp � 1  1 - + ,  2   7 , 5 {x  { ,  2 - 5        �? 5 z    z  OgreRadioButton z 	 isSelectedMessage z 	 isSelectedMessage z  GroupName z 	 SelectedGroupName X           5 z    z  OgreRadioButton z 	 isSelectedMessage z 	 isSelectedMessage z  GroupName z 	 SelectedGroupName X        �?  z  ButtonMaterial  z  TextureFileName x  �z  TextArea  z  TextColor  $ �3 O  5 O           z  ButtonMaterial  z  TextureFileName x  �z  TextArea  z  TextColor  % �z  ButtonMaterial  z  TextureFileName x  �z  TextArea  z  TextColor  $ �   2  5 y , y  � + 5 �           z  ButtonMaterial  z  TextureFileName x  �z  TextArea  z  TextColor  % �   2  3   7 5 y  5   5 �z  ButtonMaterial  z  TextureFileName x  �z  TextArea  z  TextColor  $ �3 z  ButtonMaterial  z  TextureFileName x  �z  TextArea  z  TextColor  % �3 ux 
 z    � 5 Mz  ButtonMaterial  z  TextureFileName x 
 �z  TextArea  z  TextColor  * �3 uz  ButtonMaterial  z  TextureFileName x  �z  TextArea  z  TextColor  % �   3  4   7 5 �z  ButtonPanel z 	 CheckMouseEvents      + �   4   5 �              g�3  �  	 �  
 