SB0        GetRenderView   RenderWindow     HANDLE�   Viewport     HANDLE�   x     FLOAT    y     FLOAT    width     FLOAT    height     FLOAT   
 HANDLE RenderWindow
HANDLE Viewport

RenderWindow:= RenderWindow_GetPrimary()

if(~RenderWindow)
RenderWindow_GetPosition(~RenderWindow, ~x, ~y)
RenderWindow_GetSize(~RenderWindow, ~width, ~height)
Viewport := RenderWindow_GetViewport(~RenderWindow, 0)
endif
 
 system.dbm     �      o     � �     � � !                 
��-  �   
 