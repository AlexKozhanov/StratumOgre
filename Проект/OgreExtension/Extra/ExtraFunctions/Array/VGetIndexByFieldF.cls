SB0  L      VGetIndexByFieldF   HArray     HANDLE  	 FieldName     STRING   Value     FLOAT   i     FLOAT�   result     FLOAT� 
 +Function

Handle parameter HArray
String parameter FieldName
Float  parameter Value

if(HArray)
  i:= 0; result := -1
  while(~i<vGetCount(HArray))
    if(vGetF(HArray, ~i, FieldName) == Value)
      result := ~i
      break
    endif
    inc(~i)
  endwhile
  
  return result
endif      
 system.dbm 3      o 2          
         �?q 
       �: 5 2      x  �  6 5 -   
  3 2 � c3     �ph  �   
 