SB0  �      OverlayElement &  HParentOverlay     HANDLE    HParentContainer     HANDLE    HOverlayElement     HANDLE�   Name     STRING    MaterialName     STRING    Type   Panel STRING   	 PositionX     FLOAT   	 PositionY     FLOAT    Width   100 FLOAT    Height   100 FLOAT    HorisontalAlignment   GHA_LEFT FLOAT    VerticalAlignment   GVA_TOP FLOAT    MetricsMode  
 GMM_PIXELS FLOAT   	 IsVisible   1 FLOAT    CreateManually   1 FLOAT    BackgroundColor   rgb(255,255,255) COLORREF    BackgroundAlpha   1 FLOAT   	 _hOverlay     HANDLE   _hParentOverlay     HANDLE�   _hParentContainer     HANDLE�   hParent     HANDLE�  
 _positionX     FLOAT�  
 _positionY     FLOAT�   _width     FLOAT�   _height     FLOAT�   _angle     FLOAT   _horisontalAlignment     FLOAT�   _verticalAlignment     FLOAT�  
 _isVisible     FLOAT�   _backgroundOpacity     FLOAT   _metricsMode     FLOAT�   _backgroundAlpha     FLOAT�   renderWindowWidth     FLOAT   renderWindowHeight     FLOAT   isInitialized     FLOAT�   _materialName     STRING�   _overlayName     STRING   _backgroundColor     COLORREF�  
 �Handle   HParentOverlay, HParentContainer, HOverlayElement
String   Name, MaterialName, Type
Float    PositionX, PositionY, Width, Height, 
         HorisontalAlignment, VerticalAlignment, MetricsMode, 
         IsVisible, CreateManually
         
ColorRef BackgroundColor
Float    BackgroundAlpha

Handle local _hOverlay, _hParentOverlay, _hParentContainer, hParent
Float  local _positionX, _positionY, _width, _height, _angle, _horisontalAlignment, _verticalAlignment, _isVisible, _backgroundOpacity, _metricsMode, _backgroundAlpha, 
             renderWindowWidth, renderWindowHeight, isInitialized
String local _materialName, _overlayName
ColorRef local _backgroundColor


if(HParentOverlay != #0 || HParentContainer != #0 )
  if(HOverlayElement == #0 && Name != "")
    if(CreateManually)
      HOverlayElement := OverlayElement_Create(Type, Name)
    else
      HOverlayElement := OverlayElement_Get(Name)
      hParent := OverlayElement_GetParent(~HOverlayElement)
      OverlayElement_GetPosition(~HOverlayElement, ~PositionX, ~PositionY)
      OverlayElement_GetSize(~HOverlayElement, ~Width, ~Height)
      OverlayElement_GetAlignment(~HOverlayElement, ~HorisontalAlignment, ~VerticalAlignment)
    endif
    _positionX := !PositionX
    _positionY := !PositionY
    _isVisible := !IsVisible
    isInitialized := 1
  endif
endif

if(~HOverlayElement)
  if(~_hParentOverlay != ~HParentOverlay)
    if(~_hParentOverlay != #0)
      Overlay_RemoveChild(~_hParentOverlay, ~HOverlayElement)
    endif
    if(HParentOverlay != #0)
      Overlay_AddChild(HParentOverlay, ~HOverlayElement)
    endif
    _hParentOverlay := ~HParentOverlay
  endif
  
  if(~_hParentContainer != ~HParentContainer)
    if(~_hParentContainer != #0)
      OverlayContainer_RemoveChild(~_hParentContainer, ~HOverlayElement)
    endif
    if(~HParentContainer != #0 )
      OverlayContainer_AddChild(~HParentContainer, ~HOverlayElement)
      _hParentContainer := ~HParentContainer
    endif
  endif
  
  if(~_positionX != ~PositionX || ~_positionY != ~PositionY)
    OverlayElement_SetPosition(~HOverlayElement, ~PositionX, ~PositionY)
    _positionX := ~PositionX; _positionY := ~PositionY
  endif
  
  if(~_width != ~Width || ~_height != ~Height )
    OverlayElement_SetSize(~HOverlayElement, ~Width, ~Height)
    _width := ~Width; _height := ~Height
  endif
  
  if(~_horisontalAlignment != ~HorisontalAlignment || ~_verticalAlignment != ~VerticalAlignment || !isInitialized)
    OverlayElement_SetAlignment(~HOverlayElement, ~HorisontalAlignment, ~VerticalAlignment)
    _horisontalAlignment := ~HorisontalAlignment 
    _verticalAlignment := ~VerticalAlignment
  endif
  
  if(~_isVisible != IsVisible || !isInitialized)
    OverlayElement_SetVisible(~HOverlayElement, ~IsVisible)
    _isVisible := ~IsVisible
  endif
  
  if(~_materialName != ~MaterialName && Material_Get(~MaterialName) != #0)
    OverlayElement_SetMaterialName(~HOverlayElement, ~MaterialName)
    _materialName := ~MaterialName
  endif
  
  if(~_backgroundColor != ~BackgroundColor || ~_backgroundAlpha != ~BackgroundAlpha)
    OverlayElement_SetColour(~HOverlayElement, GetRValue(BackgroundColor)/255, GetGValue(BackgroundColor)/255, GetBValue(BackgroundColor)/255, BackgroundAlpha)
    _backgroundColor := ~BackgroundColor
    _backgroundAlpha := ~BackgroundAlpha
  endif
  
  if(~_metricsMode != ~MetricsMode)
    OverlayElement_SetMetricsMode(~HOverlayElement, ~MetricsMode)
    _metricsMode := ~MetricsMode
  endif
endif (   ART.DBM x          S        S , 5 `        R x  z    � + 5 `   5 + x  x  �  3 J x  �    �    � � �  � �	 �  �
 � �  -     -     -          �? "   o w     S 5 �        S 5 x     �        S 5 �      �         S 5 �        S 5 �     �       S 5 �     �        7     7 , 5 �       �            7    	 7 , 5 �      	 �     	      
 7     7 ,  " - , 5    
   � 
           7  " - , 5     �    y # y  � y  �     S + 5 2  y  �y  { #  %   S     7 , 5 g    a      �o@   b      �o@   c      �o@   �   %         7 5 w    �       �p2   �  
 