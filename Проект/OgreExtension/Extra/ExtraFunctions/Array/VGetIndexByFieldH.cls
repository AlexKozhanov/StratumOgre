SB0  M      VGetIndexByFieldH   HArray     HANDLE  	 FieldName     STRING   Value     HANDLE   i     FLOAT�   result     FLOAT� 
 +Function

Handle parameter HArray
String parameter FieldName
Handle parameter Value

if(HArray)
  i:= 0; result := -1
  while(~i<vGetCount(HArray))
    if(vGetH(HArray, ~i, FieldName) == Value)
      result := ~i
      break
    endif
    inc(~i)
  endwhile
  
  return result
endif      
 system.dbm 3      o 2          
         �?q 
       �: 5 2      x  �  R 5 -   
  3 2 � c3     qph  �   
 