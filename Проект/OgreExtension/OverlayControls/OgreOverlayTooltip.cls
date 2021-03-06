SB0  �!      OgreOverlayTooltip *  HRenderWindow     HANDLE    HScene     HANDLE   	 HViewport     HANDLE   
 HModelNode     HANDLE    Name     STRING    PanelTexture     STRING   
 FontFamily     STRING   	 PositionX     FLOAT   	 PositionY     FLOAT    Width     FLOAT    Height     FLOAT    HorisontalAlignment   GHA_LEFT FLOAT    VerticalAlignment   GVA_TOP FLOAT   
 FontHeight   20 FLOAT    CursorDependPosition     FLOAT    IsEnable   1 FLOAT   	 TextColor   rgb(255,255,255) COLORREF    IsObjectSelected     FLOAT    SelectedEntityName     STRING    hTextContainer     HANDLE�   hOverlay     HANDLE�   hText     HANDLE�   hStream     HANDLE�  	 hFileList     HANDLE�   hEnityNameList     HANDLE�  
 folderPath     STRING�   previousSelectedEntityName     STRING�  
 entityName     STRING�   text     STRING�   fileName     STRING�   colorStr     STRING�   isInitialize     FLOAT�   attr     FLOAT  
 filesCount     FLOAT�   res     FLOAT�   entityTooltipExisted     FLOAT�   i     FLOAT�   j     FLOAT�   entityCount     FLOAT�   lmbState     FLOAT�   cursorPositionX     FLOAT   cursorPositionY     FLOAT               HRenderWindow HRenderWindow HScene HScene	 HViewport	 HViewport
 HModelNode HContainerNode IsObjectSelected IsObjectSelected SelectedEntityName SelectedEntityName   Element3dSelector  Element3dSelector     X�@     h�@ 	 �      �  2D  � �                        Y@      Y@      Y@      Y@          �    
 
    �+   
 
   N          X�@     h�@      @@      @@      @@      X@      @@      @@    /     �       �    Element3dSelector N           @�@      }@      @@      @@                      @@      @@    Q          ��@      ~@              P@         ��@      ~@     ��@      �@ �#    
 
 ��e      �        �?    
 
 ��o       BE_ICONS.DBMo       VARPOINT.DBM
 �Handle   HRenderWindow, HScene, HViewport, HModelNode
String   Name, PanelTexture, FontFamily
Float    PositionX, PositionY, Width, Height, HorisontalAlignment, VerticalAlignment, FontHeight, CursorDependPosition, IsEnable
ColorRef TextColor
Float    IsObjectSelected
String   SelectedEntityName

Handle local hTextContainer, hOverlay, hText, hStream, hFileList, hEnityNameList
String local folderPath, previousSelectedEntityName, entityName, text, fileName, colorStr
Float  local isInitialize, attr, filesCount, res, entityTooltipExisted, i, j, entityCount, lmbState, cursorPositionX, cursorPositionY


if(HRenderWindow!=#0)
  if(!isInitialize && RenderWindow_GetViewportCount(HRenderWindow)>0)
    //SetVar("Overlay", "Name", Name + "Overlay")
    hOverlay := Overlay_Create(Name + "Overlay")
    Overlay_SetScale(~hOverlay, 1,1)
    Overlay_SetZOrder(~hOverlay, 100)
    Overlay_SetVisible(~hOverlay, 1)
    
    folderPath := GetProjectDirectory() + "\ToolTipContent\"
    hFileList := GetFileList(~folderPath+"*.txt", ~attr)
    filesCount := vGetCount(~hFileList)
    
    if(~filesCount>0)
      hEnityNameList := new()
      while(~i<~filesCount)
        fileName := vGetS(~hFileList, ~i, "Name")
        entityName := substr(~fileName, 0, length(~fileName)-4)
        res := vInsert(~hEnityNameList, "String")
        vSet(~hEnityNameList, vGetCount(~hEnityNameList)-1, "", ~entityName)
        
        hTextContainer := OverlayElement_Create("Panel", Name + ~entityName + "TextContainer")
        OverlayElement_SetMetricsMode(~hTextContainer, GMM_PIXELS)
        OverlayElement_SetPosition(~hTextContainer, PositionX, PositionY)
        OverlayElement_SetSize(~hTextContainer, Width, Height)
        OverlayElement_SetVisible(~hTextContainer, 0)
        if(!CursorDependPosition)
          OverlayElement_SetAlignment(~hTextContainer, HorisontalAlignment, VerticalAlignment)
        endif
        
        hStream := CreateStream("FILE", ~folderPath + ~fileName, "READONLY")
        j := 0
        while(!Eof(~hStream))
          text := ReadLn(~hStream)

          hText := OverlayElement_Create("TextArea", Name + ~entityName + "Text" + string(~j))
          OverlayElement_SetPosition(~hText, 0, ~j*20)
          OverlayElement_SetSize(~hText, 500,100)
          OverlayElement_SetCaption(~hText, ~text)
          OverlayElement_SetVisible(~hText, 1)
          OverlayElement_SetMetricsMode(~hText, GMM_PIXELS)
          OverlayElement_SetAlignment(~hText, GHA_LEFT, GVA_TOP)
          
          StringInterface_SetParameter(~hText, "font_name", FontFamily)
          StringInterface_SetParameter(~hText, "alignment", "left")
          StringInterface_SetParameter(~hText, "char_height", string(FontHeight))
          colorStr := string(GetRValue(~TextColor)/255) + " " + string(GetGValue(~TextColor)/255) + " " + string(GetBValue(~TextColor)/255) + " 1"
          StringInterface_SetParameter(~hText, "colour", ~colorStr)
          
          OverlayContainer_AddChild(~hTextContainer, ~hText)
          inc(~j)
        endwhile
        
        Overlay_AddChild(~hOverlay, ~hTextContainer)
        inc(~i)
      endwhile
    endif
    Delete(~hFileList)
    isInitialize := 1
  endif
  
  if(IsObjectSelected)
    entityTooltipExisted := 0
    entityCount := vGetCount(~hEnityNameList)
    i := 0
    while(~i<~entityCount)
      if(vGetS(~hEnityNameList, ~i, "") == SelectedEntityName)
        entityTooltipExisted := 1
        break
      endif
      inc(~i)
    endwhile
  
    if(~entityTooltipExisted)
      hTextContainer := OverlayElement_Get(Name + SelectedEntityName + "TextContainer")
      OverlayElement_SetVisible(~hTextContainer, 1)
      if(CursorDependPosition)
        RenderWindow_GetCursorPosition(HRenderWindow, ~cursorPositionX, ~cursorPositionY)
        OverlayElement_SetPosition(~hTextContainer, ~cursorPositionX + PositionX, ~cursorPositionY + PositionY)
      endif
    
      i := 0
      while(~i<OverlayContainer_GetChildCount(~hTextContainer))
        hText := OverlayContainer_GetChild(~hTextContainer, ~i)
        StringInterface_SetParameter(~hText, "char_height", string(FontHeight))
        inc(~i)
      endwhile
      
      if(previousSelectedEntityName != "" && previousSelectedEntityName != SelectedEntityName)
        hTextContainer := OverlayElement_Get(Name + previousSelectedEntityName + "TextContainer")
        OverlayElement_SetVisible(~hTextContainer, 0)
      endif
      previousSelectedEntityName := SelectedEntityName
    endif
  endif
  
  lmbState := RenderWindow_GetMouseButtonPressed(HRenderWindow, 0)
  if(~lmbState && !lmbState && !~entityTooltipExisted)
    if(previousSelectedEntityName != "")
      hTextContainer := OverlayElement_Get(Name + previousSelectedEntityName + "TextContainer")
      OverlayElement_SetVisible(~hTextContainer, 0)
      previousSelectedEntityName := ""
    endif
  endif
  
  if(entityTooltipExisted); entityTooltipExisted := 0; endif
endif     \  	 SIGNS.DBM �          S 5 �  -             8 + 5 �x  z  Overlay | �           �?       �?�         Y@�         �?�� z 	 \ToolTipContent\  | {  y  z  *.txt |    �    � !  !          8 5 ��   $  ! : 5 �   $ z  Name  �{  y           y  �        @  {    z  String  � "     �       �? z    y  �z  Panel x  y  | z  TextContainer | �           �?�      �   	  
 �           �  - 5 �       �z  FILE  y  y  | z  READONLY  �             %   � - 5 �  � {  z  TextArea  x  y  | z  Text  |  % � | �              %        4@ �        @@       Y@�  y  �         �?�         �?�                    �  z  font_name x    z  alignment z  left    z  char_height   �   a      �o@ � z    |   b      �o@ � | z    |   c      �o@ � | z   1  | {    z  colour  y      ��% c3     ��$ c3 n   �       �?    5 �          #   � &           $  $  & : 5 )   $ z    �x  � 5 $       �? # 3 )�$ c3  # 5 �x  x  | z  TextContainer | �           �?�  5 _   �( �)    (     )    �          $  $   �: 5 �   $ �    z  char_height   � �$ c3 fx  z    � x  x  � + 5 �x  x  | z  TextContainer | �             �x  {               '  '  ' - +  # - + 5 �x  z    � 5 �x  x  | z  TextContainer | �             �z    {   # 5 �          #    ۍ=  �  	 �  
 