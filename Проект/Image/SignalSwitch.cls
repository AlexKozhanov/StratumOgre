SB0  �      SignalSwitch   Signal1     FLOAT    Signal2     FLOAT    State     FLOAT�  
 � FLOAT Signal1, Signal2, State
if(~Signal1 == 1)
  if(~state == 0)
   state:=1
  else
    if(~Signal2 == 2)
      state:=0
    endif
  endif
endif  �������������   
 system.dbm /             �?6 5 .            6 5         �?  3 .           @6 5 .               ���-  `   
 �    