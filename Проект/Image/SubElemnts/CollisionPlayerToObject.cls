SB0  �      CollisionPlayerToObject   Object     HANDLE    CollisionRay     FLOAT    Distance     FLOAT    PlayerPositionX     FLOAT�   PlayerPositionZ     FLOAT�   PlayerPositionY     FLOAT�   OffsetY     FLOAT    RayPositionX     FLOAT    RayPositionZ     FLOAT    RayPositionY     FLOAT    prePositionX     FLOAT�   prePositionZ     FLOAT�   prePositionY     FLOAT�  
 �HANDLE Object

FLOAT CollisionRay
FLOAT Distance
FLOAT PlayerPositionX
FLOAT PlayerPositionZ
FLOAT PlayerPositionY
FLOAT OffsetY

FLOAT RayPositionX
FLOAT RayPositionZ
FLOAT RayPositionY

FLOAT local prePositionX 
FLOAT local prePositionZ
FLOAT local prePositionY

if(~CollisionRay && abs(~RayPositionY - ~PlayerPositionY)>2)
 if(abs(~RayPositionX - ~PlayerPositionX)<1)
    PlayerPositionX :=  ~prePositionX  
 endif

 if(abs(~RayPositionZ - ~PlayerPositionZ)<1)
    PlayerPositionZ :=  ~prePositionZ   
 endif 
endif 

if(~CollisionRay && abs(~RayPositionY - ~PlayerPositionY)<2 && abs(~RayPositionY - ~PlayerPositionY) > 0.1)
   PlayerPositionY := (~RayPositionY + ~prePositionY + ~PlayerPositionY)/3 + OffsetY
   
endif   

if(!~CollisionRay && Round(~PlayerPositionY,1) != ~RayPositionY)
   PlayerPositionY := (~PlayerPositionY + OffsetY) - 0.5
endif

prePositionX := ~PlayerPositionX
prePositionY := ~PlayerPositionY
prePositionZ := ~PlayerPositionZ


    FOLDERS.DBM �      	    .         @8 + 5 5      .        �?: 5 #  
        .        �?: 5 5        	    .         @: +  	    .     ����?8 + 5 f  	              @        -          �?)  	 7 + 5 �             �?      
            �l(,  �  
 