SB0  j     	 EnterHelp   help     FLOAT    true     FLOAT�   false     FLOAT�   text     STRING    answer     STRING    n     FLOAT�   p     FLOAT�   notfalse     FLOAT�  
 *float help,true,false
string text,answer

if(~help)

  n:=1
  p:=0
  notfalse:=0
  true:=0
  while(~p!=-1)
    p:=pos(~answer,~text,~n)
    //logmessage(Right(Left(~answer,~p),1))
    
    if(Right(Left(~answer,~p),1)=="@")
      notfalse:=1
   
    
    if(Right(Left(~answer,~p+length(~text)+1),1)=="@")
      true:=1
    endif
     endif
     
    n:=~n+1
  endwhile
   
  if(~notfalse)
    false:=0
    else
    false:=1
  endif
  
    if(length(~text)<1)
    true:=0
    notfalse:=0
    false:=0
  endif
endif

 
 system.dbm �      5 �        �?                                            �?q 7 5 z y  y    �   y    }        �?~ z  @ � 5 n        �?  y    y  �         �? }        �?~ z  @ � 5 n        �?           �?   3     5 �            3 �        �?  y  �        �?: 5 �                                     �<"  �   
 