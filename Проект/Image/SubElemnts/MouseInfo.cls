SB0  r     	 MouseInfo   MouseX     FLOAT    MouseY     FLOAT    MosueZ     FLOAT    Mouse2DX     FLOAT    Mouse2DY     FLOAT    DirX     FLOAT    DirY     FLOAT    DirZ     FLOAT   
 ObjectName     STRING    ObjectX     FLOAT    ObjectY     FLOAT    ObjectZ     FLOAT    TextInfo     STRING�  
 �FLOAT MouseX, MouseY, MosueZ
FLOAT Mouse2DX, Mouse2DY
FLOAT DirX, DirY, DirZ
STRING ObjectName
FLOAT ObjectX, ObjectY, ObjectZ

STRING TextInfo

TextInfo := "MousePos3D: X=" + MouseX + " Y=" + MouseY + " Z=" + MosueZ
TextInfo := ~TextInfo + "\nMousePos2D: " + "X=" + Mouse2DX + " Y=" + Mouse2DY
TextInfo := ~TextInfo + "\nDirection: " + "X=" + DirX + " Y=" + DirY + " Z=" + DirZ
TextInfo := ~TextInfo + "\nObject: " + ObjectName + " X=" + ObjectX + " Y=" + ObjectY + " Z=" + ObjectZ 
 system.dbm �   z  MousePos3D: X=     z   Y= |   z   Z= |   {  y  z  \nMousePos2D:   | z  X=  |   z   Y= |   {  y  z  \nDirection:  | z  X=  |   z   Y= |   z   Z= |   {  y  z  \nObject:   | x  | z   X= |  	 z   Y= |  
 z   Z= |   {     z),  K  
 