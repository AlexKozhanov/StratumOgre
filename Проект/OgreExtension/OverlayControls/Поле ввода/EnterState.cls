SB0  a     
 EnterState   HSpace     HANDLE    hRenderWindow     HANDLE�  	 ramkaMark     FLOAT�   ramkaNotMark     FLOAT�  
 ramkaRight     FLOAT�   RamkaNotRight     FLOAT�  	 RamkaHelp     FLOAT�   state     STRING�   LMBDown     FLOAT�   select     FLOAT�   Right     FLOAT�   reset     FLOAT�   help     FLOAT    true     FLOAT    false     FLOAT    isInitialize     FLOAT�   ramkaPressed     FLOAT    ShowAns     FLOAT�   helpon     FLOAT�   isEnable     FLOAT   	 isVisible     FLOAT      OgreMouseStateObserver  OgreMouseState      |@      l@ 	         2D  � �                         Y@      Y@      Y@      Y@        j@�    
 
  ��    
 
   N           |@      l@      @@      @@              t@      @@      @@    ,     �       �    OgreMouseState�%    
 
 ��o      
 system.dbm
 �Handle HSpace,hRenderWindow
float ramkaMark,ramkaNotMark,ramkaRight,RamkaNotRight,RamkaHelp
String  state
Float  LMBDown,select,Right,reset,help,true,false

if(HSpace != #0)
  if(!isInitialize)
    hRenderWindow := RenderWindow_GetPrimary()
    SetVar("OgreMouseState", "HRenderWindow", ~hRenderWindow)
    SetVar("OgreMouseState", "HSpace", HSpace)
    isInitialize := 1
  endif
endif

LMBDown := GetVarF("OgreMouseState", "LMBDown")//������� ���� � ������



if(~ramkaPressed)//������� ���� � �����
  //ramkaPressed:=0
  State:= "mark"
  select:=1
endif

if(~LMBDown && !~ramkaPressed)//������� ���� �� � �����
 State:= "notmark"
 select:=0
endif

if(~Right==1)
  State:= "right"
  select:=0
endif

if(~Reset)
  reset:=0
  right:=-1
  ShowAns:=0
  helpon:=0
  state:="notmark"
endif



if(~Right==0)
  state:="notright"
  //select:=0
endif


if(~help && ~true)
  state:="right"
  helpon:=1
endif

if(~help && ~false)
  state:="notright"
  helpon:=1
endif

if(~help && !~true && !~false )
  state:="mark"
  helpon:=1
endif

if(~helpon==1 && ~help==0)
  state:="notmark"
endif

if(~isEnable==0)
  state:="notmark"
  select:=0
endif
if(~ShowAns)
  State:= "right"
  select:=0
endif
if(~isVisible==0)
  state:="isVisible"
endif


switch
 case (State == "notmark")
 ramkaMark:=0
 ramkaNotMark:=1
 ramkaRight:=0
 RamkaNotRight:=0
 RamkaHelp:=1
 case (State == "mark")
 ramkaMark:=1
 ramkaNotMark:=0
 ramkaRight:=0
 RamkaNotRight:=0
 RamkaHelp:=1
 case (State == "right")
 ramkaMark:=0
 ramkaNotMark:=0
 ramkaRight:=1
 RamkaNotRight:=0
 RamkaHelp:=1   
 case (State == "notright")
 ramkaMark:=0
 ramkaNotMark:=0
 ramkaRight:=0
 RamkaNotRight:=1
 RamkaHelp:=1   
 case (State == "isVisible")
 ramkaMark:=0
 ramkaNotMark:=0
 ramkaRight:=0
 RamkaNotRight:=0
 RamkaHelp:=0   
 default
 ramkaMark:=0
 ramkaNotMark:=1
 ramkaRight:=0
 RamkaNotRight:=0
 RamkaHelp:=0 
endswitch     
 system.dbm �          S 5 @   - 5 @ �  z  OgreMouseState  z  HRenderWindow   �z  OgreMouseState  z  HSpace     �       �?  z  OgreMouseState  z  LMBDown �    5 e z  mark  {         �? 	     - + 5 | z  notmark {            	  
        �?6 5 � z  right {            	   5 �                   �?q  
                       z  notmark {   
          6 5 � z  notright  {      + 5 � z  right {         �?      + 5 � z  notright  {         �?      - +   - + 5 z  mark  {         �?           �?6            6 + 5 1z  notmark {             6 5 Jz  notmark {            	   5 \z  right {            	            6 5 oz  isVisible {  x  z  notmark � 5 �                  �?                               �?  3 �x  z  mark  � 5 �       �?                                          �?  3 �x  z  right � 5 �                             �?                    �?  3 �x  z  notright  � 5 .                                        �?         �?  3 �x  z  isVisible � 5 _                                                       3 �                  �?                                      ŀ�!  f  	 v  
 