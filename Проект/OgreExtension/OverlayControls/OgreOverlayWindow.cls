SB0  =      OgreOverlayWindow   HSpace     HANDLE    HParentOverlay     HANDLE    HParentContainer     HANDLE    HOverlayWindow     HANDLE    Name     STRING    BackgroundTexture     STRING   	 PositionX   0 FLOAT   	 PositionY   0 FLOAT    Width   300 FLOAT    Height   200 FLOAT    HorisontalAlignment   GHA_LEFT FLOAT    VerticalAlignment   GVA_TOP FLOAT    MetricsMode  
 GMM_PIXELS FLOAT    BorderWidth   10 FLOAT   	 IsVisible   0 FLOAT   IsAlphaBlendingEnabled   1 FLOAT    AbsolutePositionX     FLOAT    AbsolutePositionY     FLOAT    IsMouseHandled     FLOAT    Show     FLOAT    Hide     FLOAT                BackgroundTexture TextureFileName Name Name IsAlphaBlendingEnabled IsAlphaBlendingEnabled           HSpace HSpace HParentOverlay HParentOverlay HParentContainer HParentContainer HOverlayWindow HBorderPanel Name Name	 PositionX	 PositionX	 PositionY	 PositionY Width Width Height Height HorisontalAlignment HorisontalAlignment VerticalAlignment VerticalAlignment MetricsMode MetricsMode BorderWidth BorderSizeLeft BorderWidth BorderSizeTop BorderWidth BorderSizeRight BorderWidth BorderSizeBottom	 IsVisible	 IsVisible AbsolutePositionX AbsolutePositionX AbsolutePositionY AbsolutePositionY IsMouseHandled IsMouseHandled  	         Name MaterialName Name BorderMaterialName   OgreOverlayBorderPanel         @     v@  OgreOverlayMaterial        Ŕ@     v@ 	 %        2D  Ě                         Y@      Y@      Y@      Y@        @@ý    
 
 	      ü    
 ˙˙ N           @     v@      @@      @@                      @@      @@         ý        N            @      s@      @@      @@                      @@      @@    N          Ŕ@     v@      @@      @@      P@      @      @@      @@         ý        Q          @      t@      L@      L@         @      t@     @@     w@  Q          @      t@              L@         @      t@     @     w@  Q   	       @     w@      L@                 @@     w@     @     w@ ěK    
 
 ˙˙e      ˙        e      ˙        e      ˙        ďT    
 
 ˙˙o      
 system.dbmo       VARPOINT.DBMo       default.dbm
 ĚHandle HSpace, HParentOverlay, HParentContainer, HOverlayWindow
String Name, BackgroundTexture
Float  PositionX, PositionY, Width, Height, HorisontalAlignment, VerticalAlignment, MetricsMode, BorderWidth, IsVisible, IsAlphaBlendingEnabled,
       AbsolutePositionX, AbsolutePositionY, IsMouseHandled

Float  Show, Hide

if(HOverlayWindow)
  switch
    case(Show)
      IsVisible := 1
      
    case(Hide)
      IsVisible := 0
  endswitch
endif      A   WINDOWS.DBM      o    5         đ?  3    5                ÝS˘   ĺ  	 	  
 