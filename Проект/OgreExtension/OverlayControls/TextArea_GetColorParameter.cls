SB0  G      TextArea_GetColorParameter  	 HTextArea     HANDLE   ColorParameterName     STRING   hStrings     HANDLE�   value     STRING   r     FLOAT�   g     FLOAT�   b     FLOAT�  	 TextColor     COLORREF� 
 8Function

Handle parameter HTextArea
String parameter ColorParameterName

Handle local hStrings
String local value
Float  local r,g,b

if(HTextArea != #0 && ColorParameterName != "")
  StringInterface_GetParameter(~HTextArea, "colour", ~value)
  hStrings := String_Split(~value, " ", 1)
  r := Float(VGetS(~hStrings, 0, ""))
  g := Float(VGetS(~hStrings, 1, ""))
  b := Float(VGetS(~hStrings, 2, ""))
  //TextColorAlpha := Float(VGetS(~hStrings, 3, ""))*255
  TextColor := RGB(~r*255,~g*255,~b*255)
  Delete(~hStrings)
endif
      
return TextColor $     
 system.dbm }           S x  z    � + 5 |    z  colour  x  x  z           �?� String_Split   ��������             z    �� 
           �?z    �� 
            @z    �� 
          �o@         �o@         �o@ �     �   Mp4  �   
 