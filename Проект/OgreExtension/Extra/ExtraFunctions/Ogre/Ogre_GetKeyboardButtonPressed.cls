SB0        Ogre_GetKeyboardButtonPressed   HSpace     HANDLE   HRenderWindow     HANDLE   KeyCode     FLOAT   Pressed     FLOAT� 
 Function

Handle parameter HSpace, HRenderWindow
Float  parameter KeyCode

if(HSpace != #0)
  Pressed := GetAsyncKeyState(KeyCode)
else
  if(HRenderWindow != #0)
    Pressed := RenderWindow_GetKeyboardButtonPressed(HRenderWindow, KeyCode)
  endif
endif

return Pressed
         
 system.dbm            S 5    � 
  3         S 5      
     RL�   �   
 