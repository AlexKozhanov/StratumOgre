SB0  �     ! OverlayElement_GetAbsoluteVisible   HOverlayElement     HANDLE   _hOverlayElement     HANDLE�   hParentContainer     HANDLE�  	 IsVisible     FLOAT� 
 bFunction

Handle parameter HOverlayElement

Handle local _hOverlayElement, hParentContainer

if(HOverlayElement)
  _hOverlayElement := HOverlayElement
  hParentContainer := OverlayElement_GetParent(~_hOverlayElement)
  
  IsVisible := OverlayElement_GetVisible(HOverlayElement)
  
  while(~_hOverlayElement != #0 && IsVisible)
    _hOverlayElement := ~hParentContainer
    IsVisible := OverlayElement_GetVisible(~_hOverlayElement)
    
    if(~_hOverlayElement != #0)
      hParentContainer := OverlayElement_GetParent(~_hOverlayElement)
    endif
  endwhile
  
  return IsVisible
endif
       
 system.dbm 6      o 5        �     �
         S   + 5 5       �
         S 5 3   �  3     �]3   �   
 