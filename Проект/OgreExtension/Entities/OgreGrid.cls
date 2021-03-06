SB0  	      OgreGrid   HScene     HANDLE    HParentNode     HANDLE    Name     STRING    MaterialName     STRING    Rows   2 FLOAT    Columns   2 FLOAT   	 IsVisible   1 FLOAT    IsCastShadows   1 FLOAT    _enable   1 FLOAT    hGrid     HANDLE�   _hParentNode     HANDLE�   isInitialized     FLOAT�   i     FLOAT�   _rows     FLOAT�   _columns     FLOAT�  
 _isVisible     FLOAT�   _isCastShadows     FLOAT�  
 hHandle HScene, HParentNode
String Name, MaterialName
Float  Rows, Columns, IsVisible, IsCastShadows, _enable

Handle local hGrid, _hParentNode
Float  local isInitialized, i, _rows, _columns, _isVisible, _isCastShadows

if(HScene)
  if(!isInitialized)
    hGrid := ManualObject_Create(HScene, Name)
    _isVisible := !IsVisible
    _isCastShadows := !IsCastShadows
  
    isInitialized := 1
  endif

  if(~hGrid != #0)
    if(_hParentNode != HParentNode)
      Movable_SetParent(~hGrid, HParentNode)
      _hParentNode := HParentNode
    endif
  
    if(_rows != Rows || _columns != Columns)
      ManualObject_Begin(~hGrid, MaterialName, OT_LINE_LIST)
      while(~i<=Rows)
        ManualObject_Position(~hGrid, ~i, 0, 0)
        ManualObject_Position(~hGrid, ~i, Columns, 0)
        inc(~i)
      endwhile
    
      i:=0
      while(~i<=Columns)
        ManualObject_Position(~hGrid, 0, ~i, 0)
        ManualObject_Position(~hGrid, Rows, ~i, 0)
        inc(~i)
      endwhile
      ManualObject_End(~hGrid)
    
      _rows := Rows; _columns := Columns
    endif
  
    if(~_isVisible != IsVisible)
      Movable_SetVisible(~hGrid, IsVisible)
      _isVisible := IsVisible
    endif
  
    if(_isVisible != IsCastShadows)
      Movable_SetCastShadows(~hGrid, IsVisible)
      _isCastShadows := IsCastShadows
    endif
  endif
endif @@      SCIENCE.DBM �      o �   - 5 !    x  � 	   -     -          �?   	      S 5 �  
   S 5 9  	   �   
     7     7 , 5 �  	 x          @�    ; 5 w  	                     � 	              �� c3 P                ; 5 �  	                     � 	              �� c3 ~  	 �            7 5 �  	   �        7 5 �  	   �       ъU  �  
 