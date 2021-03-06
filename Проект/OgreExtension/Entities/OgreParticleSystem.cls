SB0  �      OgreParticleSystem   HAttachingNode- ����, � �������� ������������� ������� ������   HANDLE    HParticleSystem% ���������� ����������� ������� ������   HANDLE�   Name ���������� ��� ������� ������   STRING    TemplateName ������ ������� ������   STRING    LifeTimeX ����� ������������� (� ��������). ���� -1, �� ����� ������������� ��������� �����������  -1 FLOAT    Delay( ����� �������� �� �������� (� ��������).   FLOAT    ResetInputEvents5 ����� ������� Create � Destroy �������������� ������� 1 FLOAT    CreateEvent) ��������� � 1 ��� �������� ������� ������   FLOAT�   DestroyEvent) ��������� � 1 ��� �������� ������� ������   FLOAT�  	 IsVisible   1 FLOAT    IsCastShadows   1 FLOAT    startedTime     FLOAT�  
 _isVisible     FLOAT�   _isCastShadows     FLOAT�   isLifeTimeExpired     FLOAT�   delayStarted     FLOAT�  
 eHandle HAttachingNode, HParticleSystem
String Name, TemplateName
Float  LifeTime, Delay, ResetInputEvents, CreateEvent, DestroyEvent, IsVisible, IsCastShadows

Float local startedTime, _isVisible, _isCastShadows, isLifeTimeExpired, delayStarted

if(HAttachingNode!=#0)
  
  if(CreateEvent)
    if(HParticleSystem!=#0)
      ParticleSystem_Destroy(HParticleSystem)
      HParticleSystem := #0
    endif

    delayStarted := 1
    
    _isVisible := IsVisible
    _isCastShadows := IsCastShadows
    
    startedTime := GetTickCount()
  endif
  
  if(~delayStarted)
    if( GetTickCount() - ~startedTime > Delay*1000)
      HParticleSystem := ParticleSystem_CreateEx(HAttachingNode, Name, TemplateName)
      Movable_SetCastShadows(~HParticleSystem, IsCastShadows)
      
      _isVisible := IsVisible
      _isCastShadows := IsCastShadows
      
      delayStarted := 0
    endif
  endif
  
  if(~HParticleSystem != #0)
    
    isLifeTimeExpired := (GetTickCount()-~startedTime > LifeTime*1000) && LifeTime != -1
    if( DestroyEvent || ~isLifeTimeExpired )
      ParticleSystem_Destroy(~HParticleSystem)
      HParticleSystem := #0
    endif
    
    if(~_isVisible != IsVisible)
      Movable_SetVisible(~HParticleSystem, IsVisible)
      _isVisible := IsVisible
    endif
    
    if(~_isCastShadows != IsCastShadows)
      Movable_SetCastShadows(~HParticleSystem, IsCastShadows)
      _isCastShadows := IsCastShadows
    endif
    
  endif
  
  if(ResetInputEvents)
    if(CreateEvent); CreateEvent := 0; endif
    if(DestroyEvent); DestroyEvent := 0; endif
  endif
  
endif 5  
 PEOPLE.DBM �           S 5 �   5 .        S 5    �              �?   	    
   s     5 ^ s            @�@ 8 5 ^    x  x  �     
 � 	    
                     S 5 � s            @�@ 8          �?q 7 +       , 5 �   �          	 7 5 �    	 � 	      
 7 5 �    
 � 
     5 �   5 �              5 �               �r�  {  
 