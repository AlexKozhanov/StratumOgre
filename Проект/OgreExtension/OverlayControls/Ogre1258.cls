SB0  �
      OgreOverlayMaterial  	 HMaterial     HANDLE�  
 HTechnique     HANDLE�   HPass     HANDLE�   Name     STRING    TextureFileName     STRING    TextureType   TEX_TYPE_2D FLOAT    IsAlphaBlendingEnabled   1 FLOAT    CreateManually   1 FLOAT    hRenderWindow     HANDLE�   hTextureUnitState     HANDLE�   hTextureType     HANDLE   _textureFileName     STRING�   _textureType     FLOAT�  
 mHandle   HMaterial, HTechnique, HPass
String   Name, TextureFileName
Float    TextureType
Float    IsAlphaBlendingEnabled, CreateManually

Handle   local hRenderWindow, hTextureUnitState, hTextureType
String   local _textureFileName
Float    local _textureType

if(HMaterial == #0 && Name != "")
  hrenderWindow := RenderWindow_GetPrimary() 
  if(~hrenderWindow != #0)
    if(RenderWindow_GetViewportCount(~hrenderWindow))
      if(CreateManually)
        HMaterial := Material_Create(~Name)
        if(~HMaterial != #0)
          HTechnique := Material_GetTechniqueByIndex(~HMaterial, 0)
          HPass := Technique_GetPassByIndex(~HTechnique, 0)
          hTextureUnitState := TextureUnitState_Create(~HPass, "")
          TextureUnitState_SetTexture(~hTextureUnitState, ~TextureFileName, ~TextureType)
          
          if(IsAlphaBlendingEnabled)
            Pass_SetSceneBlending(~HPass, SBF_SOURCE_ALPHA, SBF_ONE_MINUS_SOURCE_ALPHA)
          else
            Pass_SetSceneBlending(~HPass, SBF_ONE, SBF_ZERO)
          endif
          Pass_SetLightingEnabled(~HPass, 0)
          Pass_SetDepthCheckEnabled(~HPass, 0)
        endif
      else
        HMaterial := Material_Get(Name)
        if(~HMaterial != #0)
          HTechnique := Material_GetTechniqueByIndex(~HMaterial, 0)
          HPass := Technique_GetPassByIndex(~HTechnique, 0)
          //hTextureUnitState := Pass_GetTextureUnitStateByIndex(HPass, 0)
          //TextureUnitState_GetTexture(~hTextureUnitState, ~TextureFileName, ~hTextureType) - �� �������
        endif
      endif
    endif
  endif
endif
    
if(~HPass != #0 )
  if( (~_textureFileName != ~TextureFileName || ~_textureType != ~TextureType))
    TextureUnitState_SetTexture(~hTextureUnitState, ~TextureFileName, ~TextureType)
    _textureFileName := ~TextureFileName
    _textureType := ~TextureType
  endif
endif �  �           R x  z    � + 5 � �         S 5 �   5 �   5 � y  �           S 5 �             �             &    z    ' 	  	 y    (  5 f          @       "@�3 s                   �?�           �           �3 � x  �           S 5 �             �             &         S 5 � y  y  �     7 , 5 �  	 y    (y  {         U�4  �  
 