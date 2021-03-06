SB0  �      GetBounceEaseValue  
 EasingMode     FLOAT   Bounces     FLOAT  
 Bounciness     FLOAT   From     FLOAT   To     FLOAT   Duration     FLOAT   Elapsed     FLOAT   Bn     FLOAT�   Sn     FLOAT�   t     FLOAT�   ti     FLOAT�   i     FLOAT    ret     FLOAT�   tii_1     FLOAT�   c0     FLOAT�   a0     FLOAT�   Value     FLOAT� 
 �Function

Float parameter EasingMode, Bounces, Bounciness, From, To, Duration, Elapsed

if(From != To)
  if(Bounciness == 1)
    Bn := 0.5
    Sn := Bounces + Bn
  else
    Bn := (Bounciness ^ Bounces) / 2
    Sn := (1 - Bounciness ^ Bounces) / (1-Bounciness) + Bn
  endif
  
  switch
    case(EasingMode == 0)
      t := 1 - Elapsed / Duration
      
    case(EasingMode == 1)
      t := Elapsed / Duration  
      
    case(EasingMode == 2)
      if(Elapsed <= Duration / 2)
        t := 1 - 2 * Elapsed / Duration
      else
        t := 2 * Elapsed / Duration - 1
      endif
  endswitch
  
  if(Bounciness == 1)
    ti := 1 - Bounces / Sn
  else
    ti := 1 - ((1 - Bounciness ^ Bounces) / (1 - Bounciness)) / Sn
  endif
  
  while(t >= ti)
    inc(~i)
    if(Bounciness == 1)
      ti := 1 - (Bounces - ~i) / Sn
    else
      ti := 1 - ((1 - Bounciness ^ (Bounces - ~i)) / (1 - Bounciness)) / Sn
    endif
    ret := 1
  endwhile
        
  tii_1 := ti - Bounciness ^ (Bounces - i) / (2 * Sn)
  if(i == 0)
    ret := Sqr(Sn / Bn) * sqr(t)
  else
    t := t - tii_1
    if (Bounciness == 1)
      c0 := 1
    else
      c0 := 1 - tii_1
    endif
    a0 := c0 / Sqr(Bounciness ^ (Bounces - i) / (2 * Sn))
    ret := 1 - (c0 - a0*Sqr(t))
  endif
    
  switch
    case(~EasingMode == 0)
      Value := (1 - ret)*(To - From) + From
        
    case(~EasingMode == 1)
      Value := ret * (To - From) + From
        
    case(~EasingMode == 2)
      if(Elapsed <= ~duration / 2)
        Value := 0.5*(1 - ret)*(To - From) + From
      else
        Value := (0.5*ret + 0.5)*(To - From) + From
      endif  
    endswitch
else
  Value := To
endif

return Value �      
 system.dbm ?      7 5 :         �?6 5 !        �?
       
  3 G               @ 
         �?              �?       
              6 5 `        �?      
 	 3 �           �?6 5 s      
 	 3 �            @6 5 �             @ ; 5 �        �?        @       
 	 3 �         @             �? 
 	          �?6 5 �        �?      
 
 3 �        �?       �?              �?        
 
  	  
 9 5 ;� c         �?6 5        �?         
 
 3 2       �?       �?                 �?        
 
        �?
  3 �  
                  @     
             6 5 i     #  	 #  
  3 � 	    
 	          �?6 5 �       �?
  3 �       �?   
                     @    #  
         �?     	 #    
              6 5 �       �?            
  3 8          �?6 5 �           
  3 8           @6 5 8            @ ; 5        �?       �?             
  3 8       �?          �?          
  3 >  
     �u�  �  
 