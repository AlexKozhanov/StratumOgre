SB0  �2      OgreTexturedMaterial : 	 HMaterial ���������� ���������   HANDLE�  
 HTechnique ���������� ������� ���������   HANDLE�   HPass ���������� ������� ���������   HANDLE�   Name ���������� ��� ���������   STRING    TextureFileName     STRING    TextureType ��� �������� TEX_TYPE_2D FLOAT    Ambient  
 rgb(0,0,0) COLORREF�   Diffuse   rgb(255,255,255) COLORREF�   Specular  
 rgb(0,0,0) COLORREF�   SelfIllumination  
 rgb(0,0,0) COLORREF�   AmbientAlpha   1 FLOAT    DiffuseAlpha   1 FLOAT    SpecularAlpha   1 FLOAT    SelfIlluminationAlpha   1 FLOAT   	 Shininess   15 FLOAT�   SourceBlendingFactor   SBF_ONE FLOAT    DestBlendingFactor   SBF_ZERO FLOAT    LightingEnabled   1 FLOAT�   DepthCheckEnabled   1 FLOAT�   DepthWriteEnabled   1 FLOAT�   DepthFunction   CMPF_LESS_EQUAL FLOAT�   ColorWriteEnabled   1 FLOAT�   CullingMode   CULL_CLOCKWISE FLOAT�   ShadingMode  
 SO_GOURAUD FLOAT�   PolygonMode   PM_SOLID FLOAT�   AlphaRejectFunction   CMPF_ALWAYS_PASS FLOAT    AlphaRejectValue     FLOAT    CreateManuallyF ���� 1 - �������� ��������� ������, 0 - ���������� �� ������� �� ����� 1 FLOAT    hRenderWindow     HANDLE�   hTextureUnitState     HANDLE�   _textureFileName     STRING�   _ambient     COLORREF�   _diffuse     COLORREF�  	 _specular     COLORREF�   _selfIllumination     COLORREF�   _ambientAlpha     FLOAT�   _diffuseAlpha     FLOAT�   _specularAlpha     FLOAT�   _selfIlluminationAlpha     FLOAT�  
 _shininess     FLOAT�   _sourceBlendingFactor     FLOAT�   _destBlendingFactor     FLOAT�   _lightingEnabled     FLOAT�   _depthCheckEnabled     FLOAT�   _depthWriteEnabled     FLOAT�   _depthFunction     FLOAT�   _colorWriteEnabled     FLOAT�   _cullingMode     FLOAT�   _shadingMode     FLOAT�   _polygonMode     FLOAT�   _alphaRejectFunction     FLOAT�   _alphaRejectValue     FLOAT�   _textureType     FLOAT�   r     FLOAT   g     FLOAT   b     FLOAT   a     FLOAT   IsEnable   1 FLOAT   
 �!Handle   HMaterial, HTechnique, HPass
String   Name, TextureFileName
Float    TextureType
ColorRef Ambient, Diffuse, Specular, SelfIllumination
Float    AmbientAlpha, DiffuseAlpha, SpecularAlpha, SelfIlluminationAlpha, Shininess, SourceBlendingFactor, DestBlendingFactor, LightingEnabled, 
         DepthCheckEnabled, DepthWriteEnabled, DepthFunction, ColorWriteEnabled, CullingMode, ShadingMode, PolygonMode, 
         AlphaRejectFunction, AlphaRejectValue, CreateManually

Handle local hRenderWindow, hTextureUnitState
String local _textureFileName
ColorRef local _ambient, _diffuse, _specular, _selfIllumination 
Float local _ambientAlpha, _diffuseAlpha, _specularAlpha, _selfIlluminationAlpha, _shininess, _sourceBlendingFactor, _destBlendingFactor, _lightingEnabled,
            _depthCheckEnabled, _depthWriteEnabled, _depthFunction, _colorWriteEnabled, _cullingMode, _shadingMode, _polygonMode, 
            _alphaRejectFunction, _alphaRejectValue, _textureType, r, g, b, a
            
if(HMaterial == #0 && Name != "" && IsEnable)
  hrenderWindow := RenderWindow_GetPrimary() 
  if(~hrenderWindow != #0)
    if(CreateManually)
      HMaterial := Material_Create(~Name)
      if(~HMaterial != #0)
        HTechnique := Material_GetTechniqueByIndex(~HMaterial, 0)
        HPass := Technique_GetPassByIndex(~HTechnique, 0)
        hTextureUnitState := TextureUnitState_Create(~HPass, "")
        TextureUnitState_SetTexture(~hTextureUnitState, ~TextureFileName, ~TextureType)
      
        Pass_SetAmbient(~HPass, GetRValue(~Ambient)/255, GetGValue(~Ambient)/255, GetBValue(~Ambient)/255, ~AmbientAlpha)
        Pass_SetDiffuse(~HPass, GetRValue(~Diffuse)/255, GetGValue(~Diffuse)/255, GetBValue(~Diffuse)/255, ~DiffuseAlpha)
        Pass_SetSpecular(~HPass, GetRValue(~Specular)/255, GetGValue(~Specular)/255, GetBValue(~Specular)/255, ~SpecularAlpha)
        Pass_SetSelfIllumination(~HPass, GetRValue(~SelfIllumination)/255, GetGValue(~SelfIllumination)/255, GetBValue(~SelfIllumination)/255, ~SelfIlluminationAlpha)
        Pass_SetShininess(~HPass, ~Shininess)
        Pass_SetSceneBlending(~HPass, ~SourceBlendingFactor, ~DestBlendingFactor)
        Pass_SetLightingEnabled(~HPass, ~LightingEnabled)
        Pass_SetDepthCheckEnabled(~HPass, ~DepthCheckEnabled)
        Pass_SetDepthWriteEnabled(~HPass, ~DepthWriteEnabled)
        Pass_SetColourWriteEnabled(~HPass, ~ColorWriteEnabled)
        Pass_SetCullingMode(~HPass, ~CullingMode)
        Pass_SetShadingMode(~HPass, ~ShadingMode)
        Pass_SetPolygonMode(~HPass, ~PolygonMode)
        Pass_SetAlphaRejectSettings(~HPass, ~AlphaRejectFunction, ~AlphaRejectValue)
      endif
    else
      HMaterial := Material_Get(Name)
      if(~HMaterial != #0)
        HTechnique := Material_GetTechniqueByIndex(~HMaterial, 0)
        HPass := Technique_GetPassByIndex(~HTechnique, 0)
        //hTextureUnitState := Pass_GetTextureUnitStateByIndex(HPass, 0)
        //�� ����������� �-��� ��������� ����� � ���� ��������
         
        Pass_GetAmbient(~HPass, ~r, ~g, ~b, ~AmbientAlpha);  
        Ambient := RGB(~r*255, ~g*255, ~b*255); _ambient := ~Ambient; _ambientAlpha := ~AmbientAlpha
       
        Pass_GetDiffuse(~HPass, ~r, ~g, ~b, ~DiffuseAlpha);  
        Diffuse := RGB(~r*255, ~g*255, ~b*255); _diffuse := ~Diffuse; _diffuseAlpha := ~DiffuseAlpha
        
        Pass_GetSpecular(~HPass, ~r, ~g, ~b, ~SpecularAlpha);  
        Specular := RGB(~r*255, ~g*255, ~b*255); _specular := ~Specular; _specularAlpha := ~SpecularAlpha
       
        Pass_GetSelfIllumination(~HPass, ~r, ~g, ~b, ~SelfIlluminationAlpha);  
        SelfIllumination := RGB(~r*255, ~g*255, ~b*255); _selfIllumination := ~SelfIllumination; _selfIlluminationAlpha := ~SelfIlluminationAlpha
        
        Pass_GetSceneBlending(~HPass, ~SourceBlendingFactor, ~DestBlendingFactor)
        _sourceBlendingFactor := ~SourceBlendingFactor; _destBlendingFactor := ~DestBlendingFactor
         
        Pass_GetAlphaRejectSettings(~HPass, ~AlphaRejectFunction, ~AlphaRejectValue)
        _alphaRejectFunction := ~AlphaRejectFunction; _alphaRejectValue := ~AlphaRejectValue
        
        Shininess := Pass_GetShininess(~HPass)
        LightingEnabled := Pass_GetLightingEnabled(~HPass)
        DepthWriteEnabled := Pass_GetDepthWriteEnabled(~HPass)
        DepthCheckEnabled := Pass_GetDepthCheckEnabled(~HPass)
        DepthFunction := Pass_GetDepthFunction(~HPass)
        ColorWriteEnabled := Pass_GetColourWriteEnabled(~HPass)
        CullingMode := Pass_GetCullingMode(~HPass)
        ShadingMode := Pass_GetShadingMode(~HPass)
        PolygonMode := Pass_GetPolygonMode(~HPass)
      endif
        
      _ambient := Ambient
      _diffuse := Diffuse
      _specular := Specular
      _selfIllumination := SelfIllumination
      _shininess := ~Shininess
      _lightingEnabled := ~LightingEnabled
      _depthWriteEnabled := ~DepthWriteEnabled
      _depthCheckEnabled := ~DepthCheckEnabled
      _depthFunction := ~DepthFunction
      _colorWriteEnabled := ~ColorWriteEnabled
      _cullingMode := ~CullingMode
      _shadingMode := ~ShadingMode
      _polygonMode := ~PolygonMode
      _textureFileName := ~TextureFileName
      _textureType := ~TextureType
    endif
  endif
endif
    
if(~HPass != #0 )
  if(~_ambient != ~Ambient || ~_ambientAlpha != ~AmbientAlpha)
    Pass_SetAmbient(~HPass, GetRValue(~Ambient)/255, GetGValue(~Ambient)/255, GetBValue(~Ambient)/255, ~AmbientAlpha)
    _ambientAlpha := ~AmbientAlpha
    _ambient := ~Ambient
  endif
    
  if(~_diffuse != ~Diffuse || ~_diffuseAlpha != ~DiffuseAlpha)
    Pass_SetDiffuse(~HPass, GetRValue(~Diffuse)/255, GetGValue(~Diffuse)/255, GetBValue(~Diffuse)/255, ~DiffuseAlpha)
    _diffuseAlpha := ~DiffuseAlpha
    _diffuse := ~Diffuse
  endif
  
  if(~_specular != ~Specular || ~_specularAlpha != ~SpecularAlpha)
    Pass_SetSpecular(~HPass, GetRValue(~Specular)/255, GetGValue(~Specular)/255, GetBValue(~Specular)/255, ~SpecularAlpha)
    _specular := ~Specular
    _specularAlpha := ~SpecularAlpha
  endif
  
  if(~_selfIllumination != ~SelfIllumination || ~_selfIlluminationAlpha != ~SelfIlluminationAlpha)
    Pass_SetSelfIllumination(~HPass, GetRValue(~SelfIllumination)/255, GetGValue(~SelfIllumination)/255, GetBValue(~SelfIllumination)/255, ~SelfIlluminationAlpha)
    _selfIllumination := ~SelfIllumination
    _selfIlluminationAlpha := ~SelfIlluminationAlpha
  endif
  
  if(~_shininess != ~Shininess)
    Pass_SetShininess(~HPass, ~Shininess)
    _shininess := ~Shininess
  endif
  
  if(~_sourceBlendingFactor != ~SourceBlendingFactor || ~_destBlendingFactor != ~DestBlendingFactor)
    Pass_SetSceneBlending(~HPass, ~SourceBlendingFactor, ~DestBlendingFactor)
    _sourceBlendingFactor := ~SourceBlendingFactor; _destBlendingFactor := ~DestBlendingFactor
  endif
  
  if(~_lightingEnabled != ~LightingEnabled)
    Pass_SetLightingEnabled(~HPass, ~LightingEnabled)
    _lightingEnabled := ~LightingEnabled
  endif
  
  if(~_depthCheckEnabled != ~DepthCheckEnabled)
    Pass_SetDepthCheckEnabled(~HPass, ~DepthCheckEnabled)
    _depthCheckEnabled := ~DepthCheckEnabled
  endif
  
  if(~_depthWriteEnabled != ~DepthWriteEnabled)
    Pass_SetDepthWriteEnabled(~HPass, ~DepthWriteEnabled)
    _depthWriteEnabled := ~DepthWriteEnabled
  endif
  
  if(~_depthFunction != ~DepthFunction)
    Pass_SetDepthFunction(~HPass, ~DepthFunction)
    _depthFunction := ~DepthFunction
  endif
  
  if(~_colorWriteEnabled != ~ColorWriteEnabled)
    Pass_SetColourWriteEnabled(~HPass, ~ColorWriteEnabled)
    _colorWriteEnabled := ~ColorWriteEnabled
  endif
  
  if(~_cullingMode != ~CullingMode)
    Pass_SetCullingMode(~HPass, ~CullingMode)
    _cullingMode := ~CullingMode
  endif
  
  if(~_shadingMode != ~ShadingMode)
    Pass_SetShadingMode(~HPass, ~ShadingMode)
    _shadingMode := ~ShadingMode
  endif
  
  if(~_polygonMode != ~PolygonMode)
    Pass_SetPolygonMode(~HPass, ~PolygonMode)
    _polygonMode := ~PolygonMode
  endif
  
  if(~_alphaRejectFunction != ~AlphaRejectFunction || ~_alphaRejectValue != ~AlphaRejectValue)
    Pass_SetAlphaRejectSettings(~HPass, ~AlphaRejectFunction, ~AlphaRejectValue)
    _alphaRejectFunction := ~AlphaRejectFunction
    _alphaRejectValue := ~AlphaRejectValue
  endif
  
  if( (~_textureFileName != ~TextureFileName || ~_textureType != ~TextureType))
    TextureUnitState_SetTexture(~hTextureUnitState, ~TextureFileName, ~TextureType)
    _textureFileName := ~TextureFileName
    _textureType := ~TextureType
  endif
endif  �������� �������� � �����    ART.DBM *          R x  z    � +  9 + 5 i�         S 5 i  5 	y  �           S 5             �             &    z    '    y    (    a      �o@   b      �o@   c      �o@  
 �    a      �o@   b      �o@   c      �o@   �    a      �o@   b      �o@   c      �o@   �   	 a      �o@  	 b      �o@  	 c      �o@   �    �      �    �    �    �    �    �    �    �      �3 ix  �           S 5 -            �             &    �5 �6 �7 �
 � 5       �o@  6       �o@  7       �o@ �        
  #   �5 �6 �7 � � 5       �o@  6       �o@  7       �o@ �           $   �5 �6 �7 � � 5       �o@  6       �o@  7       �o@ �      !    %   �5 �6 �7 � � 5       �o@  6       �o@  7       �o@ �  	  	  "    &   � � �   (    )   � �    2    3   �         �    �    �    �    �                      !  	  "    '    *    ,    +    -    .    /    0    1 y  {     4        S 5 )    S  #  
 7 , 5 �    a      �o@   b      �o@   c      �o@  
 � 
  #          S  $   7 , 5 �    a      �o@   b      �o@   c      �o@   �   $       !   S  %   7 , 5     a      �o@   b      �o@   c      �o@   �   !    %  "  	 S  &   7 , 5 E   	 a      �o@  	 b      �o@  	 c      �o@   � 	  "    &  '   7 5 U    �   '  (   7  )   7 , 5 q      �   (    )  *   7 5 �    �   *  +   7 5 �    �   +  ,   7 5 �    �   ,  -   7 5 �    �   -  .   7 5 �    �   .  /   7 5 �    �   /  0   7 5 �    �   0  1   7 5 �    �   1  2   7  3   7 , 5       �   2    3 y  y  �  4   7 , 5 )  y    (y  {     4    vm�  H  
 #*   