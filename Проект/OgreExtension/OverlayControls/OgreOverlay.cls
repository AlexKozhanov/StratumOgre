SB0  *	      OgreOverlay   HOverlay     HANDLE�   Name     STRING    ZOrder   10 FLOAT�  	 IsVisible   1 FLOAT�   ScaleX   1 FLOAT    ScaleY   1 FLOAT    ScrollX     FLOAT    ScrollY     FLOAT    RotationAngle     FLOAT�   CreateManually   1 FLOAT    _zOrder     FLOAT�  
 _isVisible     FLOAT�   _rotationAngle     FLOAT�   _scaleX     FLOAT�   _scaleY     FLOAT�   _scrollX     FLOAT�   _scrollY     FLOAT�  
 �Handle HOverlay
String Name
Float  ZOrder, IsVisible, ScaleX, ScaleY, ScrollX, ScrollY, RotationAngle, CreateManually

Float  local _zOrder, _isVisible, _rotationAngle, _scaleX, _scaleY, _scrollX, _scrollY

if(HOverlay == #0)
  if(Name != "" && RenderWindow_GetPrimary() != #0)
    if(RenderWindow_GetViewportCount(RenderWindow_GetPrimary()))
      if(CreateManually)
        HOverlay := Overlay_Create(~Name)
      else
        HOverlay := Overlay_Get(~Name)
        ZOrder := Overlay_GetZOrder(~HOverlay)
        IsVisible := Overlay_GetVisible(~HOverlay)
        RotationAngle := Overlay_GetRotate(~HOverlay)
        Overlay_GetScale(~HOverlay, ~ScaleX, ~ScaleY)
        Overlay_GetScroll(~HOverlay, ~ScrollX, ~ScrollY)
      endif
    endif
  endif
endif

if(~HOverlay)
  if(~_zOrder != ZOrder)
    Overlay_SetZOrder(~HOverlay, ZOrder)
    _zOrder := ZOrder
  endif
  
  if(~_isVisible != IsVisible)
    Overlay_SetVisible(~HOverlay, IsVisible)
    _isVisible := IsVisible
  endif
  
  if(~_scaleX != ScaleX || ~_scaleY!= ScaleY)
    Overlay_SetScale(~HOverlay, ScaleX, ScaleY)
    _scaleX := ScaleX 
    _scaleY := ScaleY
  endif
  
  if(~_scrollX != ScrollX || ~_scrollY!= ScrollY)
    Overlay_SetScroll(~HOverlay, ScaleX, ScaleY)
    _scrollX := ScrollX 
    _scrollY := ScrollY
  endif
  
  if(~_rotationAngle != RotationAngle)
    Overlay_SetRotate(~HOverlay, RotationAngle)
    _rotationAngle := RotationAngle
  endif
endif

   
 system.dbm �           R 5 G x  z    � �     S + 5 G �5 G  	 5 % y  �   3 G y  �      �     �     �     � � �   � � �   o �  
   7 5 [      �   
     7 5 k      �        7     7 , 5 �        �            7     7 , 5 �        �            7 5 �      �       n�  �  
 