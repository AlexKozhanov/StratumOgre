SB0  �      KeyState   HRenderWindow     HANDLE    HSpace     HANDLE    Key     STRING    Pressed     FLOAT�   pressedState     FLOAT�     KeyCode  KeyCode      �@      v@ 	       �   2D  � �                         Y@      Y@      Y@      Y@          �    
 
  ��    
 
 �� N           �@      v@      @@      @@      @@      �@      @@      @@    %     �       �    KeyCode�%    
 
 ��o      
 system.dbm
 �Handle HRenderWindow, HSpace
String Key
Float  Pressed

Float local pressedState

if(HRenderWindow)
  if(HSpace)
    pressedState := GetAsyncKeyState(GetVarF("KeyCode", Key))
  else
    pressedState := RenderWindow_GetKeyboardButtonPressed(~HRenderWindow, GetVarF("KeyCode", Key))
  endif
  
  if(~pressedState != pressedState)
    Pressed := ~pressedState
  endif
endif     %  
 system.dbm 0      o /   o  z  KeyCode x  ��   3 $    z  KeyCode x  �      7 5 /        JL�  �   	 �  
 