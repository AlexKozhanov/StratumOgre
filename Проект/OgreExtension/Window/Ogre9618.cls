SB0  �      OgreRoot 
  PluginsFileName   Plugins.cfg STRING    ConfigFileName   Ogre.cfg STRING    LogFileName   Ogre.log STRING    ResourceFileName   Resources.cfg STRING    ShowConfigDialog   1 FLOAT    renderOK     FLOAT�   configOK     FLOAT�   isInitialized     FLOAT�   IsWindowSizeChanged     FLOAT    IsWindowPositionChanged     FLOAT   
 YString PluginsFileName, ConfigFileName, LogFileName, ResourceFileName
Float ShowConfigDialog

Float local renderOK, configOK, isInitialized

if(~!isInitialized && ConfigFileName!= "" && PluginsFileName != "" && LogFileName != "")
  Root_Create(PluginsFileName, ConfigFileName, LogFileName)
  
  if(~ShowConfigDialog)
    ConfigOK := Root_ShowConfigDialog();
    
    if(~!ConfigOK)
      ConfigOK := Root_RestoreConfig();
    endif
  else
    ConfigOK := Root_RestoreConfig();
    
    if(~!ConfigOK)
      ConfigOK := Root_ShowConfigDialog();
    endif
  endif
  
  Root_Initialise()
  
  if(~ResourceFileName != "")
    Root_AddResourceLocationFromConfigFile(ResourceFileName)
  endif
  isInitialized := 1  
endif

if(!~IsWindowSizeChanged && !~IsWindowPositionChanged)
  renderOK := Root_RenderOneFrame();
endif
//i:=~i+1 3   DIAMONDS.DBM ]     - x  z    � + x   z    � + x  z    � + 5 P x   x  x    5 2 	    - 5 0   3 =     - 5 = 	  y  z    � 5 I x         �?    -  	 - + 5 \ 
     (_l!  |  
 