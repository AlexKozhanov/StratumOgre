SB0  �      GetBackEaseValue 	 
 EasingMode     FLOAT  	 Amplitude     FLOAT   From     FLOAT   To     FLOAT   Duration     FLOAT   Elapsed     FLOAT   t     FLOAT�   ret     FLOAT�   Value     FLOAT� 
 �Function

Float parameter EasingMode, Amplitude, From, To, Duration, Elapsed

if(To != From)
  switch
    case(EasingMode == 0)
      t := Elapsed / Duration  
      
    case(EasingMode == 1)
      t := 1 - Elapsed / Duration
      
    case(EasingMode == 2)
      if(Elapsed <= Duration / 2)
        t := 2 * Elapsed / Duration
      else
        t := 2 - 2 * Elapsed / Duration
      endif  
  endswitch
    
  ret := t ^ 3 - t * Amplitude * sin(t * Pi)
    
  switch
    case(EasingMode == 0)
      Value := ret*(To - From) + From
        
    case(EasingMode == 1)
      Value := (1 - ret)*(To - From) + From
        
    case(EasingMode == 2)
      if(Elapsed <= Duration / 2)
        Value := 0.5 * ret*(To - From) + From
      else
        Value := (0.5*(1 - ret) + 0.5)*(To - From) + From
      endif  
  endswitch
else
  Value := To
endif

return Value H      
 system.dbm       7 5             6 5       
  3 l           �?6 5 3        �?      
  3 l            @6 5 l             @ ; 5 Y         @      
  3 l         @        @       
           @          ��DT�!	@    
              6 5 �            
  3 	          �?6 5 �        �?            
  3 	           @6 5 	            @ ; 5 �        �?            
  3 	       �?       �?           �?          
  3   
     	V�  �   
 