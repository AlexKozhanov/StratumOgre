SB0  �     	 OgreLight    HScene     HANDLE   
 HSceneNode     HANDLE    HLight     HANDLE�   Name     STRING    Diffuse   rgb(255,255,255) COLORREF    Specular  
 rgb(0,0,0) COLORREF    Type   LT_POINT FLOAT   
 PowerScale   1 FLOAT    AttenuationRange   100000 FLOAT    AttenuationConstant   1 FLOAT    AttenuationLinear     FLOAT    AttenuationQuadratic     FLOAT    SpotlightInnerAngle   2 FLOAT    SpotlightOuterAngle   3 FLOAT    SpotlightFalloff   1 FLOAT    IsCastShadows   1 FLOAT   	 IsVisible   1 FLOAT    _hSceneNode     HANDLE�   _diffuse     COLORREF�  	 _specular     COLORREF�   _type     FLOAT�   _powerScale     FLOAT�   _attenuationRange     FLOAT�   _attenuationConstant     FLOAT�   _attenuationLinear     FLOAT�   _attenuationQuadratic     FLOAT�   _spotlightInnerAngle     FLOAT�   _spotlightOuterAngle     FLOAT�   _spotlightFalloff     FLOAT�   _isCastShadows     FLOAT�  
 _isVisible     FLOAT�   isInitialize     FLOAT�  
 KHandle HScene, HSceneNode, HLight
String Name
ColorRef Diffuse, Specular
Float  Type, PowerScale,
       AttenuationRange, AttenuationConstant, AttenuationLinear, AttenuationQuadratic,
       SpotlightInnerAngle, SpotlightOuterAngle, SpotlightFalloff, 
       IsCastShadows, IsVisible
       
Handle local _hSceneNode
ColorRef local _diffuse, _specular
Float  local _type, _powerScale, 
             _attenuationRange, _attenuationConstant, _attenuationLinear, _attenuationQuadratic,
             _spotlightInnerAngle, _spotlightOuterAngle, _spotlightFalloff, 
             _isCastShadows, _isVisible, isInitialize
       
if(HScene)
  if(!isInitialize)
    HLight := Light_Create(HScene, Name)
    Movable_GetName(~HLight, Name)
    Movable_SetVisible(~HLight, IsVisible)
    Movable_SetCastShadows(~HLight, IsCastShadows)
    isInitialize := 1
  endif

  if(~HLight)
    if(_hSceneNode != HSceneNode)
      Movable_SetParent(~HLight, HSceneNode)
      _hSceneNode := HSceneNode
    endif
    
    if(_type != Type)
      Light_SetType(~HLight, Type)
      _type := Type
    endif
    
    if(_powerScale != PowerScale)
      Light_SetPowerScale(~HLight, PowerScale)
      _powerScale := PowerScale
    endif
    
    if(_attenuationRange != AttenuationRange || _attenuationConstant != AttenuationConstant || _attenuationLinear != AttenuationLinear || _attenuationQuadratic != AttenuationQuadratic)
      Light_SetAttenuation(~HLight, AttenuationRange, AttenuationConstant, AttenuationLinear, AttenuationQuadratic)
      _attenuationRange := AttenuationRange
      _attenuationConstant := AttenuationConstant
      _attenuationLinear := AttenuationLinear
      _attenuationQuadratic := AttenuationQuadratic
    endif
    
    if(_spotlightInnerAngle != SpotlightInnerAngle || _spotlightOuterAngle != SpotlightOuterAngle || _spotlightFalloff != SpotlightFalloff)
      if(Type == LT_SPOTLIGHT)
        Light_SetSpotlightRange(~HLight, SpotlightInnerAngle, SpotlightOuterAngle, SpotlightFalloff)
        _spotlightInnerAngle := SpotlightInnerAngle
        _spotlightOuterAngle := SpotlightOuterAngle
        _spotlightFalloff := SpotlightFalloff
      endif
    endif
    
    if(_isCastShadows != IsCastShadows)
      Movable_SetCastShadows(~HLight, IsCastShadows)
      _isCastShadows := IsCastShadows
    endif
    
    if(_isVisible != IsVisible)
      Movable_SetVisible(~HLight, IsVisible)
      _isVisible := IsVisible
    endif
    
    if(_diffuse != Diffuse)
      Light_SetDiffuseColour(~HLight, GetRValue(Diffuse)/255, GetGValue(Diffuse)/255, GetBValue(Diffuse)/255)
      _diffuse := Diffuse
    endif
    
    if(_specular != Specular)
      Light_SetSpecularColour(~HLight, GetRValue(Specular)/255, GetGValue(Specular)/255, GetBValue(Specular)/255)
      _specular := Specular
    endif
  endif
endif    BE_ICONS.DBM 3     o 2  - 5 &    x  �    � �    �    �       �?    o 2    S 5 :     �        7 5 J     �        7 5 Z     �        7    	 7 ,    
 7 ,     7 , 5 �      	  
   �     	    
           7     7 ,     7 , 5 �           @6 5 �         �                7 5 �     �        7 5 �     �        S 5 	    a      �o@   b      �o@   c      �o@ �        S 5 2    a      �o@   b      �o@   c      �o@ �       +��    
 