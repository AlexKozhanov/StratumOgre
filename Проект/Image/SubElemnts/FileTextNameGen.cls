SB0        FileTextNameGen   Name     STRING    OverlayName     STRING�   BorderPanelName     STRING�   BorderMatrialName     STRING�   PaneMatrialName     STRING�   FileTextBlockName     STRING�  
 ySTRING Name
STRING OverlayName
STRING BorderPanelName
STRING BorderMatrialName, PaneMatrialName
STRING FileTextBlockName

if(Name != "")
OverlayName := ~Name + "Overlay"
BorderPanelName := ~Name + "BorderPanelName"
FileTextBlockName := ~Name + "FileTextBlockName"
BorderMatrialName := ~Name + "BorderMatrialName"
PaneMatrialName := ~Name + "PaneMatrialName"
endif
 
 system.dbm R   x   z    � 5 Q y   z  Overlay | {  y   z  BorderPanelName | {  y   z 	 FileTextBlockName | {  y   z 	 BorderMatrialName | {  y   z  PaneMatrialName | {     Ӳ2,  �   
 