SB0  �      vClear   HArray     HANDLE   i     FLOAT�   res     FLOAT�  
 � Function

Handle parameter HArray

Float  local i

if(HArray)
  i := vGetCount(HArray)-1
  while(~i>=0)
    LogMessage(vGetType(HArray, ~i))
    res := vDelete(HArray, ~i)
    dec(~i)
  endwhile
endif       
 system.dbm ,      o +    �       �? 
             9 5 +      ��     �
  � e3     �ki  R   
 