SB0  �      GenName   m_Entity     HANDLE    m_MaterialName     STRING�   lcreate     FLOAT�  
 VisibleBox     FLOAT    AlphaRejectMode     FLOAT�  
 SHANDLE m_Entity
STRING m_MaterialName
FLOAT local lcreate
FLOAT VisibleBox
FLOAT AlphaRejectMode

if(!~lcreate && ~m_Entity != #0 )
 Movable_GetName(~m_Entity, ~m_MaterialName)
 m_MaterialName:= ~m_MaterialName + "cBoxm"
 lcreate := 1
endif

if(~VisibleBox)
   AlphaRejectMode:= 0
else
   AlphaRejectMode:= 2
endif     

 
 system.dbm 7     -         S + 5 "    � �y  z  cBoxm | {         �?    5 /            3 6         @     ��#+  �   
 