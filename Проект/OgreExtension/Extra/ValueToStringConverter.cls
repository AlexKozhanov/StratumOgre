SB0  %      ValueToStringConverter 
  Preffix     STRING    Suffix     STRING    Value     FLOAT   
 Precission   2 FLOAT    StringValue     STRING�   valueStr     STRING�   _value     FLOAT�   i     FLOAT�   additionalZeroes     FLOAT�   isInitialized     FLOAT�  
 �String Preffix, Suffix
Float  Value, Precission
String StringValue

String local valueStr
Float local _value, i, additionalZeroes, isInitialized

if(_value != Value || !isInitialized)
  valueStr := string(round(Value,Precission))
  
  if(Precission > 0)
    if(!String_Contain(~valueStr, "."))
      valueStr := ~valueStr + "."
      additionalZeroes := Precission
    else 
      additionalZeroes := Precission - (length(~valueStr) - pos(~valueStr, ".", 1) - 1)
    endif
  
    i := 0
    while(~i < ~additionalZeroes)
      valueStr := ~valueStr + "0"
      inc(~i)
    endwhile
  endif
  StringValue := Preffix + ~valueStr + Suffix
  
  _value := Value
  isInitialized := 1
endif 
 system.dbm �       7  	 - , 5 �     ) � {             8 5 v y  z  . � String_Contain   ������- 5 A y  z  . | {      3 [   y  � y  z  .        �?�         �?                   : 5 v y  z  0 | {  � c3 b x   y  | x  | {             �? 	    +d�   &  
 