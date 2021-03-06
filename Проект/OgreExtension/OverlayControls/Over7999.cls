SB0  �
     # OverlayElement_GetAbsolutePositionY   HOverlayElement     HANDLE   RenderWindowWidth     FLOAT   RenderWindowHeight     FLOAT  	 positionX     FLOAT  	 positionY     FLOAT   absolutePositionY     FLOAT  horisontalAlignment     FLOAT   verticalAlignment     FLOAT   width     FLOAT   height     FLOAT   _hOverlayElement     HANDLE�   hParentContainer     HANDLE�   parentWidth     FLOAT�   parentHeight     FLOAT�   metricsMode     FLOAT   
 Function

Handle parameter HOverlayElement
Float  parameter RenderWindowWidth, RenderWindowHeight
Float local positionX, positionY, absolutePositionY, horisontalAlignment, verticalAlignment, width, height

if(HOverlayElement != #0 && RenderWindowWidth > 0 && RenderWindowHeight > 0)

  _hOverlayElement := HOverlayElement
  hParentContainer := OverlayElement_GetParent(~_hOverlayElement)
  while(~_hOverlayElement)
    OverlayElement_GetPosition(~_hOverlayElement, ~positionX, ~positionY)
    //OverlayElement_GetSize(~_hOverlayElement, ~width, ~height)
    //metricsMode := OverlayElement_GetMetricsMode(~_hOverlayElement)
    
    OverlayElement_GetAlignment(~_hOverlayElement, ~horisontalAlignment, ~verticalAlignment)
    
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
      case(~metricsMode == GMM_RELATIVE)
      case(~metricsMode == GMM_RELATIVE_ASPECT_ADJUSTED)
    endswitch
    
    switch
      case(~verticalAlignment == GVA_TOP)
        inc(~absolutePositionY, ~positionY)
        
      case(~verticalAlignment == GVA_CENTER)
        inc(~absolutePositionY, ~positionY + ~parentHeight/2)
        
      case(~verticalAlignment == GVA_BOTTOM)
        inc(~absolutePositionY, ~positionY + ~parentHeight)
    endswitch
    
    _hOverlayElement := ~hParentContainer
    if(~_hOverlayElement != #0)
      hParentContainer := OverlayElement_GetParent(~_hOverlayElement)
    endif
  endwhile
  
  return absolutePositionY
endif l      
 system.dbm �           S            8 +            8 + 5 �     
  
 �   
 o �  
 � � � 
 � � �       S 5 F   � � �3 N   
    
           �?6 5 Z 3 p            6 5 f 3 p           @6 5 p            6 5 � �   d3 �          �?6 5 � �             @  d3 �           @6 5 � �      d   
  
      S 5 �  
 �  3 #    �d�  �  
 