SB0  &      Entity_GetIndexCount   HEntity     HANDLE  
 IndexCount     FLOAT�  i     FLOAT   subEntityCount     FLOAT�  
 5Function

Handle parameter HEntity
Float  IndexCount

Float local i, subEntityCount

if(HEntity)
  subEntityCount := Entity_GetSubEntityCount(HEntity)
  while(~i < ~subEntityCount)
    IndexCount := ~IndexCount + Entity_GetIndexCount(HEntity, ~i)
    inc(~i)
  endwhile
endif

return IndexCount       
 system.dbm        o     �
      : 5          
  � c3 	    �s  �   
 