SB0        OgreClickableEntity &  HRenderWindow     HANDLE   	 HViewport     HANDLE    HScene     HANDLE    HEntity     HANDLE   
 HSceneNode     HANDLE    Name     STRING    MeshName     STRING    MaterialName     STRING    SubEntityCount     FLOAT    VertexCount     FLOAT   
 IndexCount     FLOAT   	 IsVisible   1 FLOAT    IsCastShadows   1 FLOAT    AddManually   1 FLOAT    RenderWindowWidth     FLOAT    RenderWindowHeight     FLOAT    cursorPositionX     FLOAT�   cursorPositionY     FLOAT�   posX     FLOAT    posY     FLOAT    posZ     FLOAT    dirX     FLOAT    dirY     FLOAT    dirZ     FLOAT    objectsCount     FLOAT�   i     FLOAT    _lmbDown     FLOAT�   _rmbDown     FLOAT�   _mmbDown     FLOAT�   LMBDown     FLOAT�  
 LMBPressed     FLOAT�   RMBDown     FLOAT�  
 RMBPressed     FLOAT�   MMBDown     FLOAT�  
 MMBPressed     FLOAT�   LMBUp     FLOAT�   RMBUp     FLOAT�   MMBUp     FLOAT�               HScene HScene HEntity HEntity
 HSceneNode
 HSceneNode Name Name MaterialName MaterialName MeshName MeshName SubEntityCount SubEntityCount VertexCount VertexCount
 IndexCount
 IndexCount	 IsVisible	 IsVisible IsCastShadows IsCastShadows AddManually AddManually           HRenderWindow HRenderWindow 	 
         HSpace HSpace  
 OgreEntity  Entity     �w@      s@  OgreMouseStateObserver  OgreMouseStateObserver     �z@      s@  LGSpace	        �~@      s@ 	 �      �  2D  � �                        Y@      Y@      Y@      Y@        ;@�    
 
 
       ��  
  
   N          �w@      s@      @@      @@      `@      `@      @@      @@    $     �       �    Entity N           �w@      p@      @@      @@                      @@      @@    Q          �x@      q@              H@         �x@      q@     �x@      t@  N          �z@      s@      @@      @@              t@      @@      @@    4     �       �    OgreMouseStateObserver Q           x@      q@      L@      H@         �{@      t@      x@      q@  N          �~@      s@      @@      @@      @@      ~@      @@      @@       	  �        Q   
        {@      t@      T@       @          {@     �t@      �@      t@ �K    
 
 ��e      �        e      �        e      �        �U    
 
 ��o       BE_ICONS.DBMo       VARPOINT.DBMo      
 system.dbm
  HANDLE HRenderWindow, HViewport, HScene, HEntity, HSceneNode
String Name, MeshName, MaterialName
Float  SubEntityCount, VertexCount, IndexCount, IsVisible, IsCastShadows, AddManually

//��������, ���� ��� �-��� ����������� �������� ����
Float  RenderWindowWidth, RenderWindowHeight

Float  cursorPositionX, cursorPositionY, posX, posY, posZ, dirX, dirY, dirZ, objectsCount, i, _lmbDown, _rmbDown, _mmbDown

if(HRenderWindow && HEntity)
  _lmbDown := GetVarF("OgreMouseStateObserver", "LMBDown")
  _rmbDown := GetVarF("OgreMouseStateObserver", "RMBDown")
  _mmbDown := GetVarF("OgreMouseStateObserver", "MMBDown")
  
  if(~_lmbDown || ~_rmbDown || ~_mmbDown)
    cursorPositionX := GetVarF("OgreMouseStateObserver", "CursorPositionX")
    cursorPositionY := GetVarF("OgreMouseStateObserver", "CursorPositionY")
    Viewport_GetRay(HViewport, ~cursorPositionX / RenderWindowWidth, ~cursorPositionY / RenderWindowHeight, ~posX, ~posY, ~posZ, ~dirX, ~dirY, ~dirZ)
    Collision_RayCast(HScene, ~posX, ~posY, ~posZ, ~dirX, ~dirY, ~dirZ)
    Collision_Sort()
    
    objectsCount := Collision_GetResultCount()
    while(~i<~objectsCount)
      if(Collision_GetObject(~i) == HEntity)
        LMBDown := ~_lmbDown;  LMBPressed := ~_lmbDown
        RMBDown := ~_rmbDown;  RMBPressed := ~_rmbDown
        MMBDown := ~_mmbDown;  MMBPressed := ~_mmbDown
        break
      endif
      inc(~i)
    endwhile
  endif
  
  if(~LMBPressed)
    LMBUp := GetVarF("OgreMouseStateObserver", "LMBUp")
    if(~LMBUp);  LMBPressed := 0;  endif
  endif
  
  if(~RMBPressed)
    RMBUp := GetVarF("OgreMouseStateObserver", "RMBUp")
    if(~RMBUp);  RMBPressed := 0;  endif
  endif
  
  if(~MMBPressed)
    MMBUp := GetVarF("OgreMouseStateObserver", "RMBUp")
    if(~MMBUp);  MMBPressed := 0;  endif
  endif
  
  if(LMBDown); LMBDown := 0; endif
  if(RMBDown); RMBDown := 0; endif
  if(MMBDown); MMBDown := 0; endif
    
  if(LMBUp); LMBUp := 0; endif
  if(RMBUp); RMBUp := 0; endif
  if(MMBUp); MMBUp := 0; endif
endif     L   BE_ICONS.DBM �       U o �z  OgreMouseStateObserver  z  LMBDown �  z  OgreMouseStateObserver  z  RMBDown �  z  OgreMouseStateObserver  z  MMBDown �      ,   , 5 � z  OgreMouseStateObserver  z  CursorPositionX �  z  OgreMouseStateObserver  z  CursorPositionY �              � � � � � � 2              ���      : 5 �   �  R 5 �                     !    " 3 � � c3 �   5 z  OgreMouseStateObserver  z  LMBUp � #  # 5               5 0z  OgreMouseStateObserver  z  RMBUp � $  $ 5 0             " 5 Uz  OgreMouseStateObserver  z  RMBUp � %  % 5 U          "   5 `             5 k            ! 5 v          !  # 5 �          #  $ 5 �          $  % 5 �          %    Ev  �  	 �	  
 