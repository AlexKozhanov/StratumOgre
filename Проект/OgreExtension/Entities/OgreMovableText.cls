SB0  Q      OgreMovableText # 
 HSceneNode     HANDLE    HMovableText     HANDLE�   Name     STRING    Text     STRING    FontName  	 MyriadPro STRING   
 CharHeight   10 FLOAT   
 SpaceWidth     FLOAT    HorisontalAlignment  	 MTHA_LEFT FLOAT    VerticalAlignMent  
 MTVA_BELOW FLOAT    GlobalTranslationX     FLOAT    GlobalTranslationY     FLOAT    GlobalTranslationZ     FLOAT    LocalTranslationX     FLOAT    LocalTranslationY     FLOAT    LocalTranslationZ     FLOAT    Color   rgb(255,0,0) COLORREF    Alpha   1 FLOAT   	 IsVisible   1 FLOAT    _hSceneNode     HANDLE�   _text     STRING�  	 _fontName     STRING�   isInitialize     FLOAT�   _charHeight     FLOAT�   _spaceWidth     FLOAT�   _horisontalAlignment     FLOAT�   _verticalAlignMent     FLOAT�   _globalTranslationX     FLOAT�   _globalTranslationY     FLOAT�   _globalTranslationZ     FLOAT�   _localTranslationX     FLOAT�   _localTranslationY     FLOAT�   _localTranslationZ     FLOAT�   _alpha     FLOAT�  
 _isVisible     FLOAT�   _color     COLORREF�  
 wHandle   HSceneNode, HMovableText
String   Name, Text, FontName
Float    CharHeight, SpaceWidth, HorisontalAlignment, VerticalAlignMent,
         GlobalTranslationX, GlobalTranslationY, GlobalTranslationZ, 
         LocalTranslationX, LocalTranslationY, LocalTranslationZ
       
ColorRef Color
Float    Alpha, IsVisible

Handle   local _hSceneNode
String   local _text, _fontName
Float    local isInitialize, _charHeight, _spaceWidth, _horisontalAlignment, _verticalAlignMent,
               _globalTranslationX, _globalTranslationY, _globalTranslationZ, 
               _localTranslationX, _localTranslationY, _localTranslationZ,
               _alpha, _isVisible
ColorRef local _color

if(!isInitialize && RenderWindow_GetPrimary() != #0)
  HMovableText := MovableText_Create(Name, Text, FontName)
  isInitialize := 1
endif

if(~HMovableText)
  if(_hSceneNode != HSceneNode)
    Movable_SetParent(~HMovableText, HSceneNode)
    _hSceneNode := HSceneNode
  endif
  
  if(_text != Text)
    MovableText_SetCaption(~HMovableText, Text)
    _text := Text
  endif
  
  if(_fontName != FontName)
    MovableText_SetFontName(~HMovableText, FontName)
    _fontName := FontName
  endif
  
  if(_charHeight != CharHeight)
    MovableText_SetCharacterHeight(~HMovableText, CharHeight)
    _charHeight := CharHeight
  endif
  
  if(_spaceWidth != SpaceWidth)
    MovableText_SetSpaceWidth(~HMovableText, SpaceWidth)
    _spaceWidth := SpaceWidth
  endif
  
  if(_horisontalAlignment != HorisontalAlignment || _verticalAlignMent != VerticalAlignMent)
    MovableText_SetTextAlignment(~HMovableText, HorisontalAlignment, VerticalAlignMent)
    _horisontalAlignment := HorisontalAlignment
    _verticalAlignMent := VerticalAlignMent
  endif
  
  if(_globalTranslationX != GlobalTranslationX || _globalTranslationY != GlobalTranslationY || _globalTranslationZ != GlobalTranslationZ )
    MovableText_SetGlobalTranslation(~HMovableText, GlobalTranslationX, GlobalTranslationY, GlobalTranslationZ)
    _globalTranslationX := GlobalTranslationX
    _globalTranslationY := GlobalTranslationY
    _globalTranslationZ := GlobalTranslationZ
  endif
  
  if(_localTranslationX != LocalTranslationX || _localTranslationY != LocalTranslationY || _localTranslationZ != LocalTranslationZ)
    MovableText_SetLocalTranslation(~HMovableText, LocalTranslationX, LocalTranslationY, LocalTranslationZ)
    _localTranslationX := LocalTranslationX
    _localTranslationY := LocalTranslationY
    _localTranslationZ := LocalTranslationZ
  endif
  
  if(_color != Color || _alpha != Alpha)
    MovableText_SetColor(~HMovableText, GetRValue(Color)/255, GetGValue(Color)/255, GetBValue(Color)/255, Alpha)
    _color := Color
    _alpha := Alpha
  endif
  
  if(_isVisible != IsVisible || !isInitialize)
    Movable_SetVisible(~HMovableText, IsVisible)
    _isVisible := IsVisible
  endif
endif J   BE_ICONS.DBM %    - �     S + 5  x  x  x  �         �?    o $     S 5 /      �     x  x  � 5 ?   x  �x  {  x  x  � 5 O   x  �x  {      7 5 _     �        7 5 o     �        7     7 , 5 �       �           	 7    
 7 ,     7 , 5 �    	  
   � 	    
           7     7 ,     7 , 5 �         �             "   S      7 , 5     a      �o@   b      �o@   c      �o@   �   "       !   7   - , 5 $    �   !    �cX  j  
 