SB0       
 EnterText1   Hspace     HANDLE    text     STRING�   State     STRING    answer     STRING    CursorPosition     FLOAT�  
 textLength     FLOAT    reset     FLOAT�   ShowAns     FLOAT�   msg     FLOAT   shift     FLOAT�   select     FLOAT�   timer     FLOAT�   n     FLOAT�  	 maxlength   8 FLOAT    pressed     FLOAT�   timeron     FLOAT�   t0     FLOAT�   tc     FLOAT�   tick     FLOAT�   mreset     FLOAT�   isEnable     FLOAT    mShowAns     FLOAT�  
 mHandle Hspace
String text,State,answer
float CursorPosition,textLength,reset,ShowAns
float local msg

/*if(!init) � ��������� �������� �� ��������
  RegisterObject(~HSpace, ~HSpace, "", WM_KEYDOWN  ,0)
  init:=1
endif*/ 

 if(GetAsyncKeyState(16)||GetAsyncKeyState(20))
   shift:=1
   else
   shift:=0
 endif
     
 
if(~select==1)
if(~timer==0)
//if(~msg==WM_KEYDOWN ) 
 /////////����� ��� �������
  n:=48
  while(~n<58)
  if(GetAsyncKeyState(~n) && length(~text)<=maxlength && ~pressed==0)
    Text:=Left(~Text,~CursorPosition)+chr(~n)+Right(~Text,~textLength-~CursorPosition)
    CursorPosition:=~CursorPosition+1
    pressed:=1
    timeron:=1

  endif
  n:=~n+1
  endwhile

//////////������� ����� ������
  if(GetAsyncKeyState(37))
    if(~CursorPosition>0)
    CursorPosition:=~CursorPosition-1
    endif
    timeron:=1
  endif   
   
  if(GetAsyncKeyState(39))
    if(~CursorPosition<~textLength)
    CursorPosition:=~CursorPosition+1
    endif
    timeron:=1
  endif
  
/////////////////backspace
  if(GetAsyncKeyState(08)&& ~pressed==0)
    if(~CursorPosition>0)
    Text:=Left(~Text,~CursorPosition-1)+Right(~Text,~textLength-~CursorPosition)
    CursorPosition:=~CursorPosition-1
    endif
    pressed:=1
    timeron:=1
  endif
////////////////////del
  if(GetAsyncKeyState(46)&& ~pressed==0)
    if(~CursorPosition<~textLength)
    Text:=Left(~Text,~CursorPosition)+Right(~Text,~textLength-~CursorPosition-1)
    endif
    pressed:=1
    timeron:=1
  endif
  
/////////����� ���
  n:=96
  while(~n<106)
  if(GetAsyncKeyState(~n)&& length(~text)<=maxlength && ~pressed==0)
    Text:=Left(~Text,~CursorPosition)+chr(~n-48)+Right(~Text,~textLength-~CursorPosition)
    CursorPosition:=~CursorPosition+1
    timeron:=1
    pressed:=1
  endif
  n:=~n+1
  endwhile 
  
////////�������������� �����
  n:=106
  while(~n<112)
    if(GetAsyncKeyState(~n)&& length(~text)<=maxlength && ~pressed==0)
      Text:=Left(~Text,~CursorPosition)+chr(~n-64)+Right(~Text,~textLength-~CursorPosition)
      CursorPosition:=~CursorPosition+1
      timeron:=1
      pressed:=1
    endif
    n:=~n+1
  endwhile 
////////����� ���  ����
if(~shift==0)
  n:=65
  while(~n<91)
  if(GetAsyncKeyState(~n)&& length(~text)<=maxlength && ~pressed==0)
    Text:=Left(~Text,~CursorPosition)+Lower(chr(~n))+Right(~Text,~textLength-~CursorPosition)
    CursorPosition:=~CursorPosition+1
    timeron:=1
    pressed:=1
  endif
  n:=~n+1
  endwhile
  endif
  
 ////////����� � �������
 if(~shift)
  n:=65
  while(~n<91)
  if(GetAsyncKeyState(~n)&& length(~text)<=~maxlength && ~pressed==0)
    Text:=Left(~Text,~CursorPosition)+chr(~n)+Right(~Text,~textLength-~CursorPosition)
    CursorPosition:=~CursorPosition+1
    timeron:=1
    pressed:=1
  endif
  n:=~n+1
  endwhile
  endif
 //////�����, �������
  if(GetAsyncKeyState(190)&& length(~text)<=~maxlength&& ~pressed==0)
     Text:=Left(~Text,~CursorPosition)+"."+Right(~Text,~textLength-~CursorPosition)
    CursorPosition:=~CursorPosition+1
    timeron:=1
     pressed:=1
  endif   
  if(GetAsyncKeyState(188)&& length(~text)<=~maxlength&& ~pressed==0)
    Text:=Left(~Text,~CursorPosition)+","+Right(~Text,~textLength-~CursorPosition)
    CursorPosition:=~CursorPosition+1
    timeron:=1
     pressed:=1
  endif 
 
  
//endif
endif

pressed:=0

if(~timeron)
t0:=GetTickCount()
timeron:=0
timer:=1
endif

if( ~tc-~t0<0.1*1000 )
 tc:= GetTickCount()
 tick:= 0
 else
 //tc:= GetTickCount()
 t0:=~tc
 tick:= 1
 timer:=0
 endif

endif

///////������ �����
if(~reset)
  reset:=0
  select:=0
  text:=""
  mreset:=1
  CursorPosition:=0
endif

////////////������ �������� �����
if(~ShowAns && ~isEnable)
  ShowAns:=0
  mShowAns:=1
  n:=1
  text:=""
  while(~n<Pos(~answer,"@",2))
  text:=~text+Right(Left(~answer,~n+1),1)
  n:=~n+1
  endwhile
endif
  


 
 system.dbm :         0@�        4@� , 5         �? 	 3            	  
        �?6 5 �           6 5 t       H@           M@: 5 �   � y  �   ; +            6 + 5 � y    }   � | y       ~ | {           �?          �?         �?           �?   3 :       �B@� 5 �            8 5 �          �?          �?        �C@� 5 �     : 5 �          �?          �?          @�            6 + 5            8 5 y           �? } y       ~ | {           �?          �?         �?         G@�            6 + 5 Y    : 5 Ky    } y              �? ~ | {         �?         �?         X@          �Z@: 5 �  � y  �   ; +            6 + 5 �y    }          H@ � | y       ~ | {           �?          �?         �?           �?   3 `      �Z@           \@: 5 !  � y  �   ; +            6 + 5 y    }          P@ � | y       ~ | {           �?          �?         �?           �?   3 � 	          6 5 �      @P@          �V@: 5 �  � y  �   ; +            6 + 5 ~y    }   � � | y       ~ | {           �?          �?         �?           �?   3 2 	 5 �      @P@          �V@: 5 �  � y  �   ; +            6 + 5 �y    }   � | y       ~ | {           �?          �?         �?           �?   3 �      �g@� y  �   ; +            6 + 5 0y    } z  . | y       ~ | {           �?          �?         �?        �g@� y  �   ; +            6 + 5 ty    } z  , | y       ~ | {           �?          �?         �?               5 �s                     �?        �������?      @�@ : 5 �s              3 �           �?               5 �                     
 z    {         �?                 + 5 9                  �?         �?  z    {    y  z  @         @� : 5 9y  y           �? }        �?~ | {           �?   3    Ǔ�!    
 