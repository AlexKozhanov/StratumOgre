SB0  (      CursorPosition = 	 PositionX     FLOAT   	 PositionY     FLOAT    Width   100 FLOAT    Height     FLOAT    CurPosX     FLOAT    CurPosY     FLOAT    LMBDown     FLOAT    absposx     FLOAT   	 IsVisible     FLOAT    curdX     FLOAT�   curdY     FLOAT�   poledx     FLOAT�   poledY     FLOAT�   ramdX     FLOAT�   ramdY     FLOAT�   HParentContainer     HANDLE    Hspace     HANDLE    Text     STRING    Name     STRING    color     COLORREF�   textdX     FLOAT�   textdY     FLOAT�  
 textLength     FLOAT�  
 letterSize   10.3 FLOAT    CursorPosition     FLOAT�  
 CursorPosX     FLOAT�  
 CursorPosY     FLOAT�   PolePosX     FLOAT�   PolePosY     FLOAT�  	 RamkaPosX     FLOAT�  	 RamkaPosY     FLOAT�   TextPosX     FLOAT�   TextPosY     FLOAT�   CursorWidth     FLOAT�   CursorHeight     FLOAT�  	 PoleWidth     FLOAT�  
 PoleHeight     FLOAT�  
 RamkaWidth     FLOAT�   RamkaHeight     FLOAT�  	 TextWidth     FLOAT�  
 TextHeight     FLOAT�   X     FLOAT�   init     FLOAT�   PanelForEnter1     STRING�   PanelForEnter2     STRING�   PanelForEnter3     STRING�   PanelForEnter4     STRING�   PanelForEnter5     STRING�   PanelForEnter6     STRING�   ButtonForEnter1     STRING�   ButtonForEnter2     STRING�   Blue     STRING�   Green     STRING�   Red     STRING�   White     STRING�   Black     STRING�   HorisontalAlignment     FLOAT�   VerticalAlignment     FLOAT�   LMBDown1     FLOAT�   TextOffsetX     FLOAT�   FontName     STRING�  
 �Float  PositionX, PositionY, Width, Height,CurPosX,CurPosY,LMBDown,absposx,IsVisible
float local curdX,curdY,poledx,poledY,ramdX,ramdY
Handle HParentContainer, Hspace
String Text,Name
Colorref color

curdX:=4
curdY:=3
poledx:=2
poledy:=2
ramdx:=0
ramdY:=0
textdX:=10
textdY:=3

textLength := Length(~text)

CursorPosX:=~PositionX+curdX+~textLength*letterSize-(~textLength-~CursorPosition)*letterSize
CursorPosY:=~PositionY+curdY
PolePosX:=~PositionX+poledX
PolePosY:=~PositionY+poledY
RamkaPosX:=~PositionX+ramdX
RamkaPosY:=~PositionY+ramdY
TextPosX:=~PositionX+textdX
TextPosY:=~PositionY+textdY

CursorWidth:=2
CursorHeight:=Height-2*curdY
PoleWidth:=Width-2*poledX
PoleHeight:=Height-2*poledY
RamkaWidth:=Width-2*ramdX
RamkaHeight:=Height-2*ramdY
TextWidth:=Width-2*TextdX
TextHeight:=Height-2*TextdY

if(~LMBDown==1) //&& ~CurPosY<~PolePosY && ~PolePosY+~PoleHeight>~CurPosY && )
  X:=~curposx-~absposx-~curdX
  CursorPosition:=round(~X/~letterSize,0)
  if(~CursorPosition>length(~text))
    CursorPosition:=length(~text)
  endif
  
endif

if(~init==0)
  init:=1
  PanelForEnter1:= Name + "TextBox1"
  PanelForEnter2:= Name + "TextBox2"
  PanelForEnter3:= Name + "TextBox3"
  PanelForEnter4:= Name + "TextBox4"
  PanelForEnter5:= Name + "TextBox5"
  PanelForEnter6:= Name + "TextBox6"
  ButtonForEnter1:= Name + "Button"+"TextBox1"
  ButtonForEnter2:= Name + "Button"+"TextBox2"
  Blue:="BlueDot.png"
  Green:="GreenDot.png"
  Red:="RedDot.png"
  White:="WhiteDot.png"
  Black:="BlackDot.png"
  HorisontalAlignment:=1
  VerticalAlignment:=2
  LMBDown1:=1
  color:=RGB(0,0,0)
  TextOffsetX:=-45
  FontName:="CourierNew"
 endif
  


 
 system.dbm          @ 	        @ 
         @          @                               $@         @  y  �       	                      
                                                          @ !           @ 
    "           @     #           @     $           @     %           @     &           @     '           @     (          �?6 5       	   )  )             )     y  � 8 5 y  �    *          6 5        �? * x  z  TextBox1  | { + x  z  TextBox2  | { , x  z  TextBox3  | { - x  z  TextBox4  | { . x  z  TextBox5  | { / x  z  TextBox6  | { 0 x  z  Button  | z  TextBox1  | { 1 x  z  Button  | z  TextBox2  | { 2 z  BlueDot.png { 3 z  GreenDot.png  { 4 z  RedDot.png  { 5 z  WhiteDot.png  { 6 z  BlackDot.png  { 7        �? 8         @ 9        �? :                            �         �F@q  ; z  CourierNew  { <    y�!  \  
 