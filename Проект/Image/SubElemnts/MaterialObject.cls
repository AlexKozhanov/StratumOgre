SB0  �      MaterialEx2 ! 
 m_Material     HANDLE�   l_Create     FLOAT�   m_MaterialName     STRING    l_Technique     HANDLE�   l_Pass     HANDLE�   l_TUS     HANDLE�  	 m_Texture     STRING   	 l_Texture     STRING�   Ambient   rgb(255,255,255) COLORREF    Diffuse   rgb(255,255,255) COLORREF    Specular   rgb(255,255,255) COLORREF   	 Shininess   0 FLOAT    SelfIllumination   rgb(255,255,255) COLORREF    DepthWriteEnabled   0 FLOAT    ColourWriteEnabled   0 FLOAT    PolygonMode   0 FLOAT    SB_SourceFactor   7 FLOAT    SB_DestFactor   9 FLOAT    AlphaRejectMode   0 FLOAT    AlphaRejectValue   0 FLOAT   	 l_Ambient     COLORREF�  	 l_Diffuse     COLORREF�  
 l_Specular     COLORREF�   Alpha   1 FLOAT    l_Shininess     FLOAT�   l_SelfIllumination     COLORREF�   l_DepthWriteEnabled     FLOAT�   l_ColourWriteEnabled     FLOAT�   l_PolygonMode     FLOAT�   l_SB_SourceFactor     FLOAT�   l_SB_DestFactor     FLOAT�   l_AlphaReject     FLOAT�   hRenderWindow     HANDLE�  
 HANDLE m_Material
FLOAT local l_Create
STRING m_MaterialName

HANDLE local l_Technique
HANDLE local l_Pass
HANDLE local l_TUS

STRING m_Texture
STRING local l_Texture

COLORREF Ambient
COLORREF Diffuse
COLORREF Specular
FLOAT Shininess
COLORREF SelfIllumination
FLOAT DepthWriteEnabled
FLOAT ColourWriteEnabled
FLOAT PolygonMode
FLOAT SB_SourceFactor 
FLOAT SB_DestFactor 
FLOAT AlphaRejectMode
FLOAT AlphaRejectValue



COLORREF local l_Ambient
COLORREF local l_Diffuse
COLORREF local l_Specular
FLOAT Alpha
FLOAT local l_Shininess
COLORREF local l_SelfIllumination
FLOAT local l_DepthWriteEnabled
FLOAT local l_ColourWriteEnabled
FLOAT local l_PolygonMode
FLOAT local l_SB_SourceFactor 
FLOAT local l_SB_DestFactor 
FLOAT local l_AlphaReject


Handle local hRenderWindow
hrenderWindow := RenderWindow_GetPrimary() 
if(~hrenderWindow == #0)
  exit()
endif

if(!RenderWindow_GetViewportCount(~hrenderWindow))
  exit()
endif
  
if(m_MaterialName != "" && ~!l_Create)
  m_Material := Material_Create(~m_MaterialName)
  if(~m_Material != #0)
   l_Technique:= Material_GetTechniqueByIndex(~m_Material, 0)
   l_Pass := Technique_GetPassByIndex(~l_Technique, 0) 
   l_TUS := TextureUnitState_Create(~l_Pass, "tus"+m_MaterialName)
  endif 
  l_Create := 1
endif

if(~l_create && l_Texture != ~m_Texture)
  TextureUnitState_SetTexture(~l_TUS, ~m_Texture, TEX_TYPE_2D)
  l_Texture := ~m_Texture
endif
    
if(~l_Pass)
  if(l_Ambient != ~Ambient)
    Pass_SetAmbient(~l_Pass, GetRValue(~Ambient) / 255, GetGValue(~Ambient) / 255, GetBValue(~Ambient) / 255, 1)
    l_Ambient := ~Ambient
  endif
  
  if(l_Diffuse != ~Diffuse)
    Pass_SetDiffuse(~l_Pass, GetRValue(~Diffuse) / 255, GetGValue(~Diffuse) / 255, GetBValue(~Diffuse) / 255, 1)
    l_Diffuse := ~Diffuse
  endif
  
  if(l_Specular != ~Specular)
    Pass_SetSpecular(~l_Pass, GetRValue(~Specular) / 255, GetGValue(~Specular) / 255, GetBValue(~Specular) / 255, 1)
    l_Specular := ~Specular
  endif
  
  if(l_Shininess != ~Shininess)
    Pass_SetShininess(~l_Pass, ~Shininess)
    l_Shininess := ~Shininess
  endif
  
  if(l_SelfIllumination != ~SelfIllumination)
    Pass_SetSelfIllumination(~l_Pass, GetRValue(~SelfIllumination) / 255, GetGValue(~SelfIllumination) / 255, GetBValue(~SelfIllumination) / 255, 1)
    l_SelfIllumination := ~SelfIllumination
  endif
  
  if(l_DepthWriteEnabled != ~DepthWriteEnabled)
    Pass_SetDepthWriteEnabled(~l_Pass, ~DepthWriteEnabled)
    l_DepthWriteEnabled := ~DepthWriteEnabled
  endif
  
  if(l_ColourWriteEnabled != ~ColourWriteEnabled)
    Pass_SetColourWriteEnabled(~l_Pass, ~ColourWriteEnabled)
    l_ColourWriteEnabled := ~ColourWriteEnabled
  endif
  
  if(l_PolygonMode != ~PolygonMode)
    Pass_SetPolygonMode(~l_Pass, ~PolygonMode)
    l_PolygonMode := ~PolygonMode
  endif
  
  if(l_AlphaReject != ~AlphaRejectMode + ~AlphaRejectValue)
    Pass_SetAlphaRejectSettings(~l_Pass, ~AlphaRejectMode, ~AlphaRejectValue)
    l_AlphaReject := ~AlphaRejectMode + ~AlphaRejectValue
  endif
  
  if(~l_SB_SourceFactor != ~SB_SourceFactor || ~l_SB_DestFactor != ~SB_DestFactor)
    Pass_SetSceneBlending(~l_Pass, ~SB_SourceFactor, ~SB_DestFactor)
    l_SB_SourceFactor := ~SB_SourceFactor
    l_SB_DestFactor := ~SB_DestFactor
  endif
endif        FOLDERS.DBM �  �           R 5       - 5    x  z    �   - + 5 S y  �           S 5 L             �             &    z  tus x  | '         �?    x  y  � + 5 k   y          @(y  {    o �    S 5 �     a      �o@   b      �o@   c      �o@        �?�       	 S 5 �    	 a      �o@  	 b      �o@  	 c      �o@        �?� 	      
 S 5 �    
 a      �o@  
 b      �o@  
 c      �o@        �?� 
       7 5 	    �        S 5 7    a      �o@   b      �o@   c      �o@        �?�        7 5 G    �        7 5 W    �        7 5 g    �           7 5       �           7     7 , 5 �      �           =��*  ?  
 