SB0  �      AnimationTimer  	 TickEvent     FLOAT�  
 StartDelay6 �������� �� 1�� ������� ������� (����� � ������������) 0 FLOAT    Start     FLOAT    Stop     FLOAT    Rate= �������. ���-�� �����������, ����� ������� ������ ����������� 15 FLOAT    ElapsedMilliseconds     FLOAT�   TotalMilliseconds     FLOAT    init     FLOAT   startTickCount     FLOAT�   i     FLOAT�   canTick     FLOAT�   currTickCount     FLOAT�   prevTickCount     FLOAT�  
 �float TickEvent, StartDelay, Start, Stop,  Rate, ElapsedMilliseconds, TotalMilliseconds
float local init, startTickCount, i, canTick, currTickCount

if(TickEvent);  TickEvent := 0;  endif

if(Stop)
  canTick := 0
  currTickCount := 0
  prevTickCount := 0
  ElapsedMilliseconds := 0
endif

if(Start)
  i := 1
  currTickCount := 0
  prevTickCount := 0
  startTickCount := GetTickCount()
  ElapsedMilliseconds := 0
  canTick := 1
endif

if(~canTick)
  currTickCount := GetTickCount() - ~startTickCount
  if(~currTickCount > ~StartDelay)
    ElapsedMilliseconds := ~currTickCount - StartDelay
    if(~currTickCount - ~prevTickCount >= Rate)
      TickEvent := 1
      prevTickCount := ~currTickCount
    endif
  endif
endif
   
 system.dbm �      5                5 +           
                                    5 U        �? 	                       s                     �? 
  
 5 � s          8 5 �               9 5 �        �?          ��	  �  
 