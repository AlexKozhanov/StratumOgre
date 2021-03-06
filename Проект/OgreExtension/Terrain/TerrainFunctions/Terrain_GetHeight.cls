SB0  �      Terrain_GetHeight   TerrainMatrixId     FLOAT  	 PositionX     FLOAT  	 PositionZ     FLOAT   TerrainMinX     FLOAT   TerrainMinZ     FLOAT   TerrainMaxX     FLOAT   TerrainMaxZ     FLOAT   TerrainStepCount     FLOAT   kLerpX     FLOAT�   kLerpZ     FLOAT�   mI     FLOAT�   mJ     FLOAT�   mIRound     FLOAT�   mJRound     FLOAT�   kX     FLOAT�   kZ     FLOAT�   mIJY     FLOAT�   mIY     FLOAT�   mJY     FLOAT�   mkIY     FLOAT�   mkJY     FLOAT�  	 PositionY     FLOAT� 
 Function

Float parameter TerrainMatrixId, PositionX, PositionZ, TerrainMinX, TerrainMinZ, TerrainMaxX, TerrainMaxZ, TerrainStepCount

if(TerrainMatrixId != 0)
  kLerpX := (~PositionX - ~terrainMinX)/(~terrainMaxX - ~terrainMinX)
  kLerpZ := (~PositionZ - ~terrainMinZ)/(~terrainMaxZ - ~terrainMinZ)
      
  mI := Lerp(0, ~TerrainStepCount, ~kLerpX)
  mJ := Lerp(0, ~TerrainStepCount, ~kLerpZ)
  mIRound := Round(~mI, 0)
  mJRound := Round(~mJ, 0)
      
  kX := ~mI - ~mIRound
  kZ := ~mJ - ~mJRound
      
  mIJY := MGet(TerrainMatrixId, ~mIRound, ~mJRound, 1)
  if(~kX < 0)
    mIY := MGet(~TerrainmatrixId, Floor(~mI), ~mJRound, 1)
  else
    mIY := MGet(~TerrainmatrixId, Roof(~mI), ~mJRound, 1)
  endif
  if(~kZ < 0)
    mJY := MGet(~TerrainmatrixId, ~mIRound, Floor(~mJ), 1)
  else
    mJY := MGet(~TerrainmatrixId, ~mIRound, Roof(~mJ), 1)
  endif
  mkIY := Lerp(~mIJY, ~mIY, abs(~kX))
  mkJY := Lerp(~mIJY, ~mJY, abs(~kZ))
           
  PositionY := ~mkIY + ~mkJY - ~mIJY
  return PositionY
endif

 �      
 system.dbm               7 5            
             
 	              � Lerp   ��������
 
             	 � Lerp   ��������
   
          ) 
             ) 
   
    
       
                �?? 
             : 5 �     
 � Floor  ����         �?? 
  3 �     
 � Roof   ����         �?? 
             : 5 �        � Floor  ����       �?? 
  3 �        � Roof   ����       �?? 
        . � Lerp   ��������
        . � Lerp   ��������
          
     �X�  /  
 