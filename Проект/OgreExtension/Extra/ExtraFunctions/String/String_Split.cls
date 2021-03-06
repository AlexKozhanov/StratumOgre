SB0  �      String_Split 	  Str     STRING  	 Delimiter     STRING   IgnoreEmpty     FLOAT   tempStr     STRING�   res     FLOAT�   posNext     FLOAT�   HStringList     HANDLE�  posPrev     FLOAT�   i     FLOAT�  
 �Function

String parameter Str, Delimiter
Float  parameter IgnoreEmpty

String local tempStr
Float  local res, posNext

if(Str!="")
  HStringList := new()
  
  posPrev := 0
  posNext := pos(Str, Delimiter, 1)
  i:= 1
  
  while(posNext != -1)
    tempStr := SubStr(Str, posPrev, posNext-posPrev)
    if(!(IgnoreEmpty && tempStr == ""))
      res := VInsert(HStringList, "String")
      VSet(HStringList, VGetCount(HStringList)-1, "", tempStr)
    endif
    inc(i)
    posPrev := posNext
    posNext := pos(Str, Delimiter, i)
    if(posNext == -1 && posPrev != length(Str))
      posNext := Length(Str)
    endif
  endwhile
endif

return HStringList ,     
 system.dbm �   x   z    � 5 � �           
  x   x         �?� 
         �?
           �?q 7 5 � x           �    x  z    � + - 5 d   z  String  �
      �       �? z    x  �� c  
  x   x    � 
           �?q 6   x   � 7 + 5 � x   � 
  3 %    nk4  �   
 