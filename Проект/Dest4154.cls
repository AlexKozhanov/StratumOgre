SB0  �      Destroy 	  m_Scene     HANDLE    Name     STRING    m_Camera     HANDLE    m_SceneNode     HANDLE   
 m_Viewport     HANDLE    destroy     FLOAT    l_Camera     HANDLE�  
 l_Viewport     HANDLE�   l_SceneNode     HANDLE�  
 HANDLE m_Scene
STRING Name
HANDLE m_Camera
HANDLE m_SceneNode
HANDLE m_Viewport

float destroy
handle local l_Camera, l_Viewport, l_SceneNode

if(~m_Scene)
if(destroy)
  if(l_Camera != ~m_Camera)
    Camera_Destroy(~m_Camera)
    l_Camera:=~m_Camera
  endif
  if(l_Viewport != ~m_Viewport)
    Viewport_Destroy(~m_Viewport)
    l_Viewport:=~m_Viewport
  endif
  if(l_SceneNode != ~m_SceneNode)
    SceneNode_Destroy(~m_SceneNode)
    l_SceneNode:=~m_SceneNode
  endif
endif
endif



 

 
 �  3      o 2   5 2     S 5    �        S 5 $   +        S 5 2           ���.    
 