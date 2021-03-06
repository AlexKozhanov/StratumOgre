SB0        GetElasticEaseValue  
 EasingMode     FLOAT   Oscillations     FLOAT   Springiness     FLOAT   From     FLOAT   To     FLOAT   Duration     FLOAT   Elapsed     FLOAT   a0w     FLOAT�   ww     FLOAT�   bettaw     FLOAT�   Value     FLOAT� 
 xFunction

Float parameter EasingMode, Oscillations, Springiness, From, To, Duration, Elapsed

if(To != From)
  a0w := To - From 
  ww := 2 * Pi / (Duration / (((2 * Oscillations - 1) + 1) / 2 + 0.25))  
  bettaw := Springiness / Duration
  
  switch
    case(EasingMode == 0)
      Value := From + a0w * exp(-bettaw * (Duration - Elapsed)) * cos(ww * (Duration - Elapsed))
      
    case(EasingMode == 1)
      Value := To - a0w * exp(-bettaw * Elapsed) * cos(ww * Elapsed)
        
    case(EasingMode == 2)
      if(Elapsed <= Duration / 2)
        Value := From + a0w / 2 * exp(-bettaw * 2 * (Duration / 2 - Elapsed)) * cos(2 * ww * (Duration / 2 - Elapsed))
      else
        Value := To - a0w / 2 * exp(-bettaw * 2 * (Elapsed - Duration / 2)) * cos(2 * ww * (Elapsed - Duration / 2))
      endif
  endswitch
else
  Value := To
endif

return Value
    
 X      
 SYSTEM.DBM $      7 5      
          @ ��DT�!	@           @          �?        �?         @        �?   
       
 	             6 5 n      	 q       !             
 
 3           �?6 5 �      	 q    !          
 
 3            @6 5             @ ; 5 �             @  	 q         @           @     !          @             @        
 
 3             @  	 q         @             @   !          @               @      
 
 3 #  
 
    ���  "  
 