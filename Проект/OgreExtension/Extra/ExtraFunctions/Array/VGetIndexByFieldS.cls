SB0  <      VGetIndexByFieldS   HArray     HANDLE  	 FieldName     STRING   Value     STRING   i     FLOAT�   result     FLOAT� 
 Function

Handle parameter HArray
String parameter FieldName, Value

if(HArray)
  i:= 0; result := -1
  while(~i<vGetCount(HArray))
    if(vGetS(HArray, ~i, FieldName) == Value)
      result := ~i
      break
    endif
    inc(~i)
  endwhile
  
  return result
endif      
 system.dbm 3      o 2          
         �?q 
       �: 5 2      x  �x  � 5 -   
  3 2 � c3     Koh  �   
 