SB0  �      GUIOpenHelp   ClickHelpButton     FLOAT    ClickCloseHelpWindow     FLOAT    ShowHelpWindow     FLOAT�  
 � FLOAT ClickHelpButton
FLOAT ClickCloseHelpWindow
FLOAT ShowHelpWindow

if(~ClickHelpButton) 
 if(!~ShowHelpWindow)
   ShowHelpWindow :=1
 else
   ShowHelpWindow :=0  
 endif
endif

if(~ClickCloseHelpWindow)
  ShowHelpWindow :=0 
endif  
 
 system.dbm %      5    - 5         �?  3               5 $               )0,  }   
 