SB0  �      Plane   HScene     HANDLE   
 HSceneNode     HANDLE    MaterialName     STRING    Width   1 FLOAT    Height   1 FLOAT   
 MarginLeft     FLOAT   	 MarginTop     FLOAT    MarginRight     FLOAT    MarginBottom     FLOAT   	 IsVisible   1 FLOAT    IsCastShadow   1 FLOAT    hBanner     HANDLE�   isInitialize     FLOAT�   _width     FLOAT�   _height     FLOAT�  
 _isVisible     FLOAT�   _isCastShadow     FLOAT�  
 �	Handle HScene, HSceneNode
String MaterialName
Float  Width, Height, MarginLeft, MarginTop, MarginRight, MarginBottom, IsVisible, IsCastShadow

Handle local hBanner
Float  local isInitialize, _width, _height, _isVisible, _isCastShadow

if(not(HScene) || not(HSceneNode))
  exit()
endif

if(!isInitialize)
  hBanner := ManualObject_Create(HScene, "")
  ManualObject_Begin(~hBanner, MaterialName, OT_TRIANGLE_STRIP)
  
  ManualObject_Position(~hBanner, MarginLeft, MarginTop, 0)
  ManualObject_TextureCoord(~hBanner, 0,1)
  
  ManualObject_Position(~hBanner, Width - MarginRight, MarginTop, 0)
  ManualObject_TextureCoord(~hBanner, 1,1)
  
  ManualObject_Position(~hBanner, MarginLeft, Height - MarginBottom, 0)
  ManualObject_TextureCoord(~hBanner, 0,0)
  
  ManualObject_Position(~hBanner, Width - MarginRight, Height - MarginBottom, 0)
  ManualObject_TextureCoord(~hBanner, 1,0)
  
  ManualObject_Index(~hBanner, 0)
  ManualObject_Index(~hBanner, 1)
  ManualObject_Index(~hBanner, 2)
  ManualObject_Index(~hBanner, 3)
  
  ManualObject_End(~hBanner)
  
  Movable_SetParent(~hBanner, HSceneNode)
  Movable_SetVisible(~hBanner, IsVisible)
  Movable_SetCastShadows(~hBanner, IsCastShadow)
  
  _isVisible := IsVisible
  _isCastShadow := IsCastShadow
  
  isInitialize := 1
endif

if(_width != Width || _height != Height)
  ManualObject_Clear(~hBanner)
  ManualObject_Begin(~hBanner, MaterialName, OT_TRIANGLE_STRIP)
  
  ManualObject_Position(~hBanner, MarginLeft, MarginTop, 0)
  ManualObject_TextureCoord(~hBanner, 0,1)
  
  ManualObject_Position(~hBanner, Width - MarginRight, MarginTop, 0)
  ManualObject_TextureCoord(~hBanner, 1,1)
  
  ManualObject_Position(~hBanner, MarginLeft, Height - MarginBottom, 0)
  ManualObject_TextureCoord(~hBanner, 0,0)
  
  ManualObject_Position(~hBanner, Width - MarginRight, Height - MarginBottom, 0)
  ManualObject_TextureCoord(~hBanner, 1,0)
  
  ManualObject_Index(~hBanner, 0)
  ManualObject_Index(~hBanner, 1)
  ManualObject_Index(~hBanner, 2)
  ManualObject_Index(~hBanner, 3)
  
  ManualObject_End(~hBanner)
  
  Movable_SetParent(~hBanner, HSceneNode)
  _width := Width; _height := Height
endif

if(~_isVisible != IsVisible)
  Movable_SetVisible(~hBanner, IsVisible)
  _isVisible := IsVisible
endif

if(~_isCastShadow != IsCastShadow)
  Movable_SetCastShadows(~hBanner, IsCastShadow)
  _isCastShadow := IsCastShadow
endif "  
 system.dbm �     W   W , 5 
     - 5 �    z    �    x         @�               �                  �?�                  �         �?       �?�                  �                    �                     �         �?         �           �         �?�          @�         @�  �    �   	 �   
 � 	    
          �?      7     7 , 5 �  �  x         @�               �                  �?�                  �         �?       �?�                  �                    �                     �         �?         �           �         �?�          @�         @�  �    �           	 7 5 �   	 � 	      
 7 5 �   
 � 
      �~�  �  
 