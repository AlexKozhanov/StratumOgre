SB0  �	      ActionClick   clickButton     FLOAT    rayClick     FLOAT    visible     FLOAT�   Object     HANDLE    PosX     FLOAT    PosY     FLOAT    PosZ     FLOAT    Distance     FLOAT    strPos     STRING�  
 ObjectName     STRING�   Text     STRING�   TextOgre     STRING�   lText     STRING�   lVisible     FLOAT�  	 ClickPlay     FLOAT    Sound     HANDLE�   strDir     STRING�  
 cFLOAT clickButton
FLOAT rayClick
float visible
HANDLE Object
FLOAT PosX, PosY, PosZ, Distance
string strPos
STRING ObjectName
STRING Text
STRING TextOgre
STRING local lText
FLOAT Distance
FLOAT lVisible
FLOAT ClickPlay
HANDLE Sound

Movable_GetName(~Object, ~ObjectName)
ObjectName := change(~ObjectName, "cBox", "")
strPos := string(~PosX) + " " + string(~PosY) + " " + string(~PosZ)
Text := ~ObjectName + " Position: " + ~strPos + " Distance:" + string(~Distance)
lText := ~Text


if(~rayClick && ~Visible == 0 && ~ObjectName != "plane01" &&  ~ObjectName !="boy")
  visible:= 1
  TextOgre := "�� ������ �� " + ~ObjectName + "!"
  lVisible := ~Visible
  strDir := GetProjectDirectory()
  strDir := ~strDir + "\rsrc\"
  if(~ObjectName == "sinbad")
    strDir:=~strDir +  "ogre.mp3"
  endif  
  if(~ObjectName == "Zebra")
    strDir:=~strDir +  "zebra7.mp3"
  endif  
  if(~ObjectName == "Tree")
    strDir:=~strDir +  "tree.mp3"
  endif
  if(~ObjectName == "Giraffe")
    strDir:=~strDir +  "giraffe.mp3"
  endif  
endif 





if(~ClickPlay && ~strDir != "")
  if(!AudioIsPlaying(~Sound))
   Sound := AudioOpenSound(~strDir)
   if(~Sound)
     AudioSetRepeat(~Sound, 1)
     AudioPlay(~Sound)
   endif 
  endif
endif  

if(~clickButton)
  visible:= 0
  if(~Sound)
   AudioSetRepeat(~Sound, 0)
  endif
endif
   
 

 
 system.dbm +    �	 �y 	 z  cBox  z    w { 	   � z    |   � | z    |   � | {  y 	 z   Position:  | y  | z   Distance:  |   � | { 
 y 
 {               6 + y 	 z  plane01 � + y 	 z  boy � + 5 �        �?  z  �� ������ ��  y 	 | z  ! | {      � {  y  z  \rsrc\  | {  y 	 z  sinbad  � 5 � y  z  ogre.mp3  | {  y 	 z  Zebra � 5 � y  z  zebra7.mp3  | {  y 	 z  Tree  � 5 � y  z  tree.mp3  | {  y 	 z  Giraffe � 5 � y  z  giraffe.mp3 | {    y  z    � + 5   %- 5 y  "    o          �?'  #   5 *             o *           '   �b),  �  
 