SB0  @      TextArea_GetColorParameterAlpha  	 HTextArea     HANDLE   ColorParameterName     STRING   hStrings     HANDLE�   value     STRING   r     FLOAT   g     FLOAT   b     FLOAT   TextColorAlpha     FLOAT� 
 �Function

Handle parameter HTextArea
String parameter ColorParameterName

Handle local hStrings
String local value
Float  local r,g,b

if(HTextArea != #0 && ColorParameterName != "")
  StringInterface_GetParameter(~HTextArea, "colour", ~value)
  hStrings := String_Split(~value, " ", 1)
  TextColorAlpha := Float(VGetS(~hStrings, 3, ""))
  Delete(~hStrings)
endif
      
return TextColorAlpha (     
 system.dbm F           S x  z    � + 5 E    z  colour  x  x  z           �?� String_Split   ��������           @z    �� 
    �   �p4  �   
 