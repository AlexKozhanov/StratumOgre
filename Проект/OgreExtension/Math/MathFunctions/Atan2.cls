SB0  �      Atan2   Y     FLOAT   X     FLOAT   Result     FLOAT� 
 �Function

Float parameter Y, X 
Float Result



if(x || y)
  switch
    case(x > 0)
      Result := Arctan(y/x)
      
    case(y>=0 && x<0)
      Result := Arctan(y/x) + pi
      
    case(y<0 && x<0)
      Result := Arctan(y/x) - pi
      
    case(y>0 && x == 0)
      Result := pi/2
      
    case(y<0 && x == 0)
      Result := -pi/2
      
  endswitch
  //Result := 2*arctan(Y/(sqrt(sqr(X)+sqr(Y))+X))
endif

return Result       
 system.dbm �        , 5 �            8 5         
  3 �             9            : + 5 >         ��DT�!	@ 
  3 �             :            : + 5 a         ��DT�!	@ 
  3 �             8            6 + 5 �  ��DT�!	@        @ 
  3 �             :            6 + 5 �  ��DT�!	@q         @ 
     �x-  N   
 