SB0  �      GetLinearEaseValue   From     FLOAT   To     FLOAT   Duration     FLOAT   Elapsed     FLOAT   Value     FLOAT� 
 � Function

Float parameter From, To, Duration, Elapsed

if(From != To)
  Value := Lerp(From, To, Elapsed / Duration)
else
  Value := To
endif

return Value (      
 system.dbm #        7 5            � Lerp   ��������
  3 "   
     �X�  �   
 