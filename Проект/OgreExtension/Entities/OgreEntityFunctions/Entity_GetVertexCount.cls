SB0  -      Entity_GetVertexCount   HEntity     HANDLE   VertexCount     FLOAT�  i     FLOAT   subEntityCount     FLOAT�  
 :Function

Handle parameter HEntity
Float  VertexCount

Float local i, subEntityCount

if(HEntity)
  subEntityCount := Entity_GetSubEntityCount(HEntity)
  while(~i < ~subEntityCount)
    VertexCount := ~VertexCount + Entity_GetVertexCount(HEntity, ~i)
    inc(~i)
  endwhile
endif

return VertexCount       
 system.dbm        o     �
      : 5          
  � c3 	    r  �   
 