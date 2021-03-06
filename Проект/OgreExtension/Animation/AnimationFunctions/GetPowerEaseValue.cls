SB0  �      GetPowerEaseValue 	 
 EasingMode     FLOAT   Power     FLOAT   From     FLOAT   To     FLOAT   Duration     FLOAT   Elapsed     FLOAT   t     FLOAT�   k     FLOAT�   Value     FLOAT� 
 xFunction

Float parameter EasingMode, Power, From, To, Duration, Elapsed

Float local t, k

if(From != To && Duration > 0)
  switch
    case(~EasingMode == 0)
      t := Elapsed / Duration  
    
    case(~EasingMode == 1)
      t := 1 - Elapsed / Duration
    
    case(~EasingMode == 2)
      if(Elapsed <= Duration / 2)
        t := 2 * Elapsed / Duration
      else
        t := 2 - 2 * Elapsed / Duration
      endif  
  endswitch

  k := t ^ Power

  switch
    case(EasingMode == 0)
      Value := k *(To - From) + From
    
    case(EasingMode == 1)
      Value := (1 - k)*(To - From) + From
    
    case(EasingMode == 2)
      if(Elapsed <= Duration / 2)
        Value := 0.5 * k * (To - From) + From
      else
        Value := (0.5 * (1 - k) + 0.5) * (To - From) + From
      endif  
  endswitch
else
  Value := To
endif

return Value H      
 system.dbm       7            8 + 5             6 5 #      
  3 u           �?6 5 <        �?      
  3 u            @6 5 u             @ ; 5 b         @      
  3 u         @        @       
        
              6 5 �            
  3 �           �?6 5 �        �?            
  3 �            @6 5 �             @ ; 5 �        �?            
  3 �        �?       �?           �?          
  3   
     �m�  �   
 