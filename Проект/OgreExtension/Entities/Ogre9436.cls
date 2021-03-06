SB0  =      OgreBillboardSet   HScene     HANDLE   
 HSceneNode     HANDLE    HBillboardSet     HANDLE�   Name     STRING    MaterialName     STRING    DefaultWidth   10 FLOAT    DefaultHeight   10 FLOAT   	 IsVisible   1 FLOAT    IsCastShadows   0 FLOAT    PoolSize   20 FLOAT    BillboardType  	 BBT_POINT FLOAT    CommonDirectionX     FLOAT    CommonDirectionY     FLOAT    CommonDirectionZ   1 FLOAT    CommonUpVectorX     FLOAT    CommonUpVectorY     FLOAT    CommonUpVectorZ   1 FLOAT    _hSceneNode     HANDLE�   _commonDirectionX     FLOAT�   _commonDirectionY     FLOAT�   _commonDirectionZ     FLOAT�   _commonUpVectorX     FLOAT�   _commonUpVectorY     FLOAT�   _commonUpVectorZ     FLOAT�   _defaultWidth     FLOAT�   _defaultHeight     FLOAT�   _isCastShadows     FLOAT�  
 _isVisible     FLOAT�   _billboardType     FLOAT�   isInitialize     FLOAT�   _materialName     STRING�  
 �Handle HScene, HSceneNode, HBillboardSet
String Name, MaterialName

Float  DefaultWidth, DefaultHeight,
       IsVisible, IsCastShadows,
       PoolSize, BillboardType, 
       CommonDirectionX, CommonDirectionY, CommonDirectionZ,
       CommonUpVectorX, CommonUpVectorY, CommonUpVectorZ

Handle local _hSceneNode

Float local _commonDirectionX, _commonDirectionY, _commonDirectionZ,
            _commonUpVectorX, _commonUpVectorY, _commonUpVectorZ,
            _defaultWidth, _defaultHeight,
            _isCastShadows, _isVisible, 
            _billboardType, isInitialize
            
String local _materialName

if(!isInitialize)
  if(~HScene)  
    HBillboardSet := BillboardSet_Create(~HScene, ~Name, ~PoolSize)
    BillboardSet_SetDefaultDimensions(~HBillboardSet, ~DefaultWidth, ~DefaultHeight)
    
    if(MaterialName != "" && Material_Get(~MaterialName) != #0)
      BillboardSet_SetMaterialName(~HBillboardSet, ~MaterialName)
      _materialName := ~MaterialName
    endif
    
    BillboardSet_SetBillboardType(~HBillboardSet, ~BillboardType)
    
    BillboardSet_SetCommonDirection(~HBillboardSet, ~CommonDirectionX, ~CommonDirectionY, ~CommonDirectionZ)
    BillboardSet_SetCommonUpVector(~HBillboardSet, ~CommonUpVectorX, ~CommonUpVectorY, ~CommonUpVectorZ)
    
    _defaultWidth := ~DefaultWidth
    _defaultHeight := ~DefaultHeight
    _billboardType := ~BillboardType
    
    _commonDirectionX := ~CommonDirectionX
    _commonDirectionY := ~CommonDirectionY
    _commonDirectionZ := ~CommonDirectionZ

    _commonUpVectorX := ~CommonUpVectorX
    _commonUpVectorY := ~CommonUpVectorY
    _commonUpVectorZ := ~CommonUpVectorZ
    
    isInitialize := 1
  endif
endif

if(~HBillboardSet)
  if(_hSceneNode != ~HSceneNode)
    Movable_SetParent(~HBillboardSet, ~HSceneNode)
    _hSceneNode := ~HSceneNode
  endif
  
  if(_isCastShadows != ~isCastShadows)
    Movable_SetCastShadows(~HBillboardSet, ~isCastShadows)
    _isCastShadows := ~isCastShadows
  endif
  
  if(_isVisible != ~IsVisible)
    Movable_SetVisible(~HBillboardSet, ~IsVisible)
    _isVisible := ~IsVisible
  endif
  
  if(_defaultWidth != ~DefaultWidth || _defaultHeight != ~DefaultHeight)
    BillboardSet_SetDefaultDimensions(~HBillboardSet, ~DefaultWidth, ~DefaultHeight)    
    _defaultWidth := ~DefaultWidth
    _defaultHeight := ~DefaultHeight
  endif
  
  if(_materialName != ~MaterialName && Material_Get(~MaterialName) != #0)
    BillboardSet_SetMaterialName(~HBillboardSet, ~MaterialName)
    _materialName := ~MaterialName
  endif
  
  if(_billboardType != ~BillboardType)
    BillboardSet_SetBillboardType(~HBillboardSet, ~BillboardType)
    _billboardType := ~BillboardType
  endif
  
  if(_commonDirectionX != ~CommonDirectionX || _commonDirectionY != ~CommonDirectionY || _commonDirectionZ != ~CommonDirectionZ)
    BillboardSet_SetCommonDirection(~HBillboardSet, ~CommonDirectionX, ~CommonDirectionY, ~CommonDirectionZ)    
    _commonDirectionX := ~CommonDirectionX
    _commonDirectionY := ~CommonDirectionY
    _commonDirectionZ := ~CommonDirectionZ
  endif
  
  if(_commonUpVectorX != ~CommonUpVectorX || _commonUpVectorY != ~CommonUpVectorY || _commonUpVectorZ != ~CommonUpVectorZ)
    BillboardSet_SetCommonUpVector(~HBillboardSet, ~CommonUpVectorX, ~CommonUpVectorY, ~CommonUpVectorZ)
    _commonUpVectorX := ~CommonUpVectorX
    _commonUpVectorY := ~CommonUpVectorY
    _commonUpVectorZ := ~CommonUpVectorZ
  endif
endif  SCIENCE.DBM =    - 5 t    o t    y   	 5        Ax  z    � y  �     S + 5 2   y  Cy  {     
 ;        =        ?         
                                  �?    o <    S 5 �     �        7 5 �     �        7 5 �     �        7     7 , 5 �       A        x  y  � y  �     S + 5 �   y  Cy  {     
 7 5 �    
 ; 
       7     7 ,     7 , 5         =                7     7 ,     7 , 5 <        ?               �[0   �  
 