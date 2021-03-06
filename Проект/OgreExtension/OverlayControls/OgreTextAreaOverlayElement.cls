SB0  !      OgreTextAreaOverlayElement 5  HParentContainer     HANDLE   	 HTextArea     HANDLE    Name     STRING    Text     STRING    FontName  	 MyriadPro STRING    MaterialName     STRING    Type   TextArea STRING    TextAlignment   left STRING   
 CharHeight ������ ������ 20 FLOAT�  
 SpaceWidth     FLOAT�  	 PositionX     FLOAT   	 PositionY     FLOAT    Width   200 FLOAT    Height   50 FLOAT    HorizontalAlignment   GHA_LEFT FLOAT    VerticalAlignment   GVA_TOP FLOAT    MetricsMode  
 GMM_PIXELS FLOAT   	 IsVisible   1 FLOAT    UseGradientColor   0 FLOAT    TextColorAlpha   1 FLOAT�   GradientTopAlpha   1 FLOAT�   GradientBottomAlpha   1 FLOAT�  	 TextColor  
 rgb(0,0,0) COLORREF�   GradientTop  
 rgb(0,0,0) COLORREF�   GradientBottom  
 rgb(0,0,0) COLORREF�   CreateManually   1 FLOAT    _hParentContainer     HANDLE   _text     STRING�   value     STRING   colorStr     STRING�  	 _fontName     STRING�   _materialName     STRING   str     STRING�   _textAlignment     STRING�   _charHeight     FLOAT�  
 _positionX     FLOAT  
 _positionY     FLOAT   _width     FLOAT   _height     FLOAT   _horizontalAlignment     FLOAT   _verticalAlignMent     FLOAT   _metricsMode     FLOAT   _spaceWidth     FLOAT�  
 _isVisible     FLOAT   _textColorAlpha     FLOAT�   _gradientTopAlpha     FLOAT�   _gradientBottomAlpha     FLOAT�   _zOrder     FLOAT  	 isUpdated     FLOAT   isInitialized     FLOAT�  
 _textColor     COLORREF�   _gradientTop     COLORREF�   _gradientBottom     COLORREF�              	 HTextArea HOverlayElement HParentContainer HParentContainer Name Name MaterialName MaterialName	 PositionX	 PositionX	 PositionY	 PositionY Width Width Height Height MetricsMode MetricsMode	 IsVisible	 IsVisible CreateManually CreateManually Type Type HorizontalAlignment HorisontalAlignment VerticalAlignment VerticalAlignment   OverlayElement         �@      y@ 	 �      �  2D  � �                        Y@      Y@      Y@      Y@          �    
 
    �   
 
 �� N           ��@      y@      @@      @@                      @@      @@    N           �@      y@      @@      @@      @@      X@      @@      @@         �        Q           �@      z@      H@                  �@      z@     ��@      z@ �#    
 
 ��e      �        �:    
 
 ��o       VARPOINT.DBMo       ART.DBM
  Handle   HParentContainer, HTextArea
String   Name, Text, FontName, MaterialName, Type, TextAlignment
Float    CharHeight, SpaceWidth, PositionX, PositionY, Width, Height, HorizontalAlignment, VerticalAlignment, MetricsMode, IsVisible, UseGradientColor,
         TextColorAlpha, GradientTopAlpha, GradientBottomAlpha
ColorRef TextColor, GradientTop, GradientBottom
Float    CreateManually

Handle   local _hParentContainer
String   local _text, value, colorStr, _fontName, _materialName, str, _textAlignment
Float    local _charHeight, _positionX, _positionY, _width, _height, _horizontalAlignment, _verticalAlignMent, _metricsMode, _spaceWidth, _isVisible,
               _textColorAlpha, _gradientTopAlpha, _gradientBottomAlpha, _zOrder, isUpdated, isInitialized
ColorRef local _textColor, _gradientTop, _gradientBottom

if(HTextArea)
  if(!CreateManually)
    OverlayElement_GetCaption(HTextArea, ~Text)
    StringInterface_GetParameter(HTextArea, "font_name", ~FontName) 
    StringInterface_GetParameter(HTextArea, "char_height", ~value)
    CharHeight := float(~value)
    StringInterface_GetParameter(HTextArea, "alignment", TextAlignment)
    StringInterface_GetParameter(HTextArea, "space_width", ~value)
    SpaceWidth := float(~value)
    
    TextColor := TextArea_GetColorParameter(HTextArea, "colour")
    TextColorAlpha := TextArea_GetColorParameterAlpha(HTextArea, "colour")
     
    GradientTop := TextArea_GetColorParameter(HTextArea, "colour_top")
    GradientTopAlpha := TextArea_GetColorParameterAlpha(HTextArea, "colour_top")
      
    GradientBottom := TextArea_GetColorParameter(HTextArea, "colour_bottom")
    GradientBottomAlpha := TextArea_GetColorParameterAlpha(HTextArea, "colour_bottom")
    
    _text := ~Text
    _fontName := ~FontName
    _charHeight := ~CharHeight
    _textAlignment := ~TextAlignment
    _spaceWidth := ~SpaceWidth
    _textColor := TextColor
    _TextColorAlpha := _textColorAlpha
    _gradientTop := GradientTop
    _gradientTopAlpha := GradientTopAlpha
    _gradientBottom := GradientBottom
    _gradientBottomAlpha := GradientBottomAlpha
  else
    isInitialized := 1
  endif

  if(~_text != ~Text)
    str := ~Text
    str := Change(~str, "\n", chr(10))
    OverlayElement_SetCaption(HTextArea, ~str)
    _text := ~Text
  endif

  if(~_fontName != ~FontName && ~FontName != "")
    StringInterface_SetParameter(HTextArea, "font_name", ~FontName)
    _fontName := ~FontName
  endif
  
  if(~_textAlignMent != ~TextAlignMent && ~TextAlignMent != "")
    StringInterface_SetParameter(HTextArea, "alignment", ~TextAlignMent)
    _textAlignMent := ~TextAlignMent
  endif
  
  if(~_spaceWidth != ~SpaceWidth)
    StringInterface_SetParameter(HTextArea, "space_width", string(~SpaceWidth))
    _spaceWidth := ~SpaceWidth
  endif
  
  if(~_charHeight != ~CharHeight && ~CharHeight > 0 && isInitialized)
    StringInterface_SetParameter(HTextArea, "char_height", string(~CharHeight))
    _charHeight := ~CharHeight
  endif

  if(UseGradientColor)  
    if(~_gradientTop != ~GradientTop || ~_gradientTopAlpha != ~GradientTopAlpha)
      colorStr := string(GetRValue(~GradientTop)/255) + " " + string(GetGValue(~GradientTop)/255) + " " + string(GetBValue(~GradientTop)/255) + " " + string(~GradientTopAlpha)
      StringInterface_SetParameter(HTextArea, "colour_top", ~colorStr)
      _gradientTop := ~GradientTop
      _gradientTopAlpha := ~GradientTopAlpha
    endif
  
    if(~_gradientBottom != ~GradientBottom || ~_gradientBottomAlpha != ~GradientBottomAlpha)
      colorStr := string(GetRValue(~GradientBottom)/255) + " " + string(GetGValue(~GradientBottom)/255) + " " + string(GetBValue(~GradientBottom)/255) + " " + string(~GradientBottomAlpha)
      StringInterface_SetParameter(HTextArea, "colour_bottom", ~colorStr)
      _gradientBottom := ~GradientBottom
      _gradientBottomAlpha := ~GradientBottomAlpha
    endif
  else
    if(~_textColor != ~TextColor || ~_textColorAlpha != ~TextColorAlpha)
      colorStr := string(GetRValue(~TextColor)/255) + " " + string(GetGValue(~TextColor)/255) + " " + string(GetBValue(~TextColor)/255) + " " + string(~TextColorAlpha)
      StringInterface_SetParameter(HTextArea, "colour", ~colorStr)
      _textColor := ~TextColor
      _textColorAlpha := ~TextColorAlpha
    endif
  endif
endif       
 system.dbm �    o �  - 5 <  � �  z  font_name y    z  char_height y  y  �     z  alignment x    z  space_width y  y  �  	   z  colour  � TextArea_GetColorParameter   ������    z  colour  � TextArea_GetColorParameterAlpha  ������    z  colour_top  � TextArea_GetColorParameter   ������    z  colour_top  � TextArea_GetColorParameterAlpha  ������    z  colour_bottom � TextArea_GetColorParameter   ������    z  colour_bottom � TextArea_GetColorParameterAlpha  ������  y  {  y  {     " y  { !  	  *    2  ,  ,    3    -    4    . 3 C       �? 1 y  y  � 5 fy  {   y   z  \n         $@� w {     y   �y  {  y  y  � y  z    � + 5 �  z  font_name y  y  {  y ! y  � y  z    � + 5 �  z  alignment y  y  { !  *  	 7 5 �  z  space_width  	 �  	  *  "   7            8 +  1 + 5 �  z  char_height   �    "   5 � 3   S  -   7 , 5 8  a      �o@ � z    |   b      �o@ � | z    |   c      �o@ � | z    |   � | {    z  colour_top  y     3    -  4   S  .   7 , 5 �  a      �o@ � z    |   b      �o@ � | z    |   c      �o@ � | z    |   � | {    z  colour_bottom y     4    . 3 � 2   S  ,   7 , 5 �  a      �o@ � z    |   b      �o@ � | z    |   c      �o@ � | z    |   � | {    z  colour  y     2    ,    �R4  !  	 �	  
 