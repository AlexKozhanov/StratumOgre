SB0  �     
 EnterCheck   check     FLOAT�   right     FLOAT�   text     STRING    answer     STRING�   temp     STRING   text1     STRING�   leng     FLOAT�   text2     STRING�  
 float check,right
string text,answer
string local temp
if(~check)
  check:=0
  
  answer:=Change(~answer,",",".")
  text1:=Change(~text,",",".")
    
  if(Right(~text1,1)=="0" && pos(~text1,".",1)>=0)
    leng:=length(~text1)
    text1:=Left(~text1,~leng-1)
  endif
  
  if(pos(~text1,".",1)>=0)
    text2:=~text1+"0"
  endif
  
  if(pos(~answer,"@"+~text1+"@",1)>=0 || pos(~answer,"@"+~text2+"@",1)>=0)
    right:=1
  else
    right:=0
  endif
  if(~right==0 && ~text=="")
    right:=2
  endif
  
endif 
 system.dbm �      5 �             y  z  , z  . w {  y  z  , z  . w {  y         �?~ z  0 � y  z  .        �?�          9 + 5 S y  �   y           �? } {  y  z  .        �?�          9 5 n y  z  0 | {  y  z  @ y  | z  @ |        �?�          9 y  z  @ y  | z  @ |        �?�          9 , 5 �        �?  3 �                       6 y  z    � + 5 �         @     	�8"  �   
 