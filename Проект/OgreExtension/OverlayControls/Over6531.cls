SB0  j     # OverlayElement_GetAbsolutePositionX   HOverlayElement     HANDLE   RenderWindowWidth     FLOAT   RenderWindowHeight     FLOAT   _hOverlayElement     HANDLE�   hParentContainer     HANDLE�  	 positionX     FLOAT  	 positionY     FLOAT   absolutePositionX     FLOAT  horisontalAlignment     FLOAT   verticalAlignment     FLOAT   parentWidth     FLOAT�   parentHeight     FLOAT�   metricsMode     FLOAT�   kX     FLOAT�   kY     FLOAT�  
 �Function

Handle parameter HOverlayElement
Float  parameter RenderWindowWidth, RenderWindowHeight

Handle local _hOverlayElement, hParentContainer
Float local positionX, positionY, absolutePositionX, horisontalAlignment, verticalAlignment, parentWidth, parentHeight

if(HOverlayElement != #0 && RenderWindowWidth > 0 && RenderWindowHeight > 0)
  _hOverlayElement := HOverlayElement
  hParentContainer := OverlayElement_GetParent(~_hOverlayElement)
  while(~_hOverlayElement)
    OverlayElement_GetPosition(~_hOverlayElement, ~positionX, ~positionY)
    metricsMode := OverlayElement_GetMetricsMode(~_hOverlayElement)
    OverlayElement_GetAlignMent(~_hOverlayElement, ~horisontalAlignment, ~verticalAlignment)
    
    if(~hParentContainer != #0)
      OverlayElement_GetSize(~hParentContainer, ~parentWidth, ~parentHeight)
    else
      parentWidth := RenderWindowWidth 
      parentHeight := RenderWindowHeight 
    endif
    
    //���� �� ��������������
    //��������� ���������� ��������������� �������� ������� � ������� ������������ ������
    switch
      case(~metricsMode == GMM_PIXELS)
        kX := 1;  kY := 1
        
      case(~metricsMode == GMM_RELATIVE)
        kX := RenderWindowWidth;  kY := RenderWindowHeight
        
      case(~metricsMode == GMM_RELATIVE_ASPECT_ADJUSTED)
        //??
        
    endswitch
    
    switch
      case(~horisontalAlignment == GHA_LEFT)
        inc(~absolutePositionX, ~positionX)
        
      case(~horisontalAlignment == GHA_CENTER)
        inc(~absolutePositionX, ~positionX + ~parentWidth/2)
        
      case(~horisontalAlignment == GHA_RIGHT)
        inc(~absolutePositionX, ~positionX + ~parentWidth)
    endswitch
    
    _hOverlayElement := ~hParentContainer
    if(~_hOverlayElement != #0)
      hParentContainer := OverlayElement_GetParent(~_hOverlayElement)
    endif
  endwhile
  return absolutePositionX
endif l      
 system.dbm �           S            8 +            8 + 5 �        �    o �   � � �  �
    � �	 �       S 5 K   �
 � �3 S   
 
   
           �?6 5 m        �?
         �?
  3 �            6 5 �   
    
  3 �           @6 5 �            6 5 � �   d3 �          �?6 5 � �    
         @  d3 �           @6 5 � �    
  d           S 5 �   �  3 #    `�  �  
 