SB0  �      AudioPlayer   HAudioPleer     HANDLE�   FilePath     STRING    Volume   1 FLOAT    Balance   0 FLOAT    Tone   1 FLOAT    Position     FLOAT    Repeat     FLOAT    Length     FLOAT    Play     FLOAT�   Stop     FLOAT�   Reset     FLOAT�  	 IsPlaying     FLOAT�  
 IsSeekable     FLOAT�   StopWhenFileChanging     FLOAT    AutoResetInputEvents   1 FLOAT   	 _filePath     STRING�   _volume     FLOAT�   _balance     FLOAT�   _tone     FLOAT�  	 _position     FLOAT�   _repeat     FLOAT�  
 XHandle HAudioPleer
String FilePath
Float  Volume, Balance, Tone, Position, Repeat, Length, Play, Stop, Reset, IsPlaying, IsSeekable, StopWhenFileChanging, AutoResetInputEvents

String local _filePath
Float  local _volume, _balance, _tone, _position, _repeat

if(HAudioPleer == #0 && FilePath != "")
  if(FileExist(FilePath))
    HAudioPleer := AudioOpenSound(FilePath)
    IsSeekable :=  AudioIsSeekable(HAudioPleer)
    IsPlaying := AudioIsPlaying(HAudioPleer)
    _filePath := FilePath
  endif
endif

if(~HAudioPleer)
  if(_filePath != FilePath && FileExist(FilePath))
    if(StopWhenFileChanging && ~HAudioPleer != #0)
      AudioStop(~HAudioPleer)
    endif
    HAudioPleer := AudioOpenSound(FilePath)
    IsSeekable :=  AudioIsSeekable(HAudioPleer)
    IsPlaying := AudioIsPlaying(HAudioPleer)
    _filePath := FilePath
  endif

  if(_volume != Volume)
    AudioSetVolume(~HAudioPleer, Limit(Volume, 0,1))
    _volume := Volume
  endif
  
  if(_balance != Balance)
    AudioSetBalance(~HAudioPleer, Limit(Balance, -1,1))
    _balance := Balance
  endif
  
  if(_tone != Tone)
    AudioSetTone(~HAudioPleer, Limit(Tone, 0.5,2))
    _tone := Tone
  endif
  
  if(_position != Position && IsSeekable)
    AudioSetPosition(~HAudioPleer, Position)
    _position := Position
  endif
  
  if(_repeat != Repeat)
    AudioSetRepeat(~HAudioPleer, Repeat)
    _repeat := Repeat
  endif
  
  if(Stop)
    AudioStop(~HAudioPleer)
    IsPlaying := AudioIsPlaying(~HAudioPleer)
  endif
  
  if(Reset)
    AudioReset(~HAudioPleer)
    IsPlaying := AudioIsPlaying(~HAudioPleer)
  endif
  
  if(Play)
    AudioPlay(~HAudioPleer)
    IsPlaying := AudioIsPlaying(~HAudioPleer)
  endif
  
  if(AutoResetInputEvents)
    if(Play); Play := 0; endif
    if(Stop); Stop := 0; endif
    if(Reset); Reset := 0; endif
  endif
endif .   BE_ICONS.DBM           R x  z    � + 5 ' x  �5 ' x  "      /     %  x  {     o x  x  � x  �+ 5 W           S + 5 D    $x  "      /     %  x  {      7 5 r                      �?g)        7 5 �             �?q        �?g+        7 5 �             �?        @g-        7   + 5 �      0        7 5 �      '     	 5 �    $   %   
 5 �    &   %    5 �    #   %    5   5 �             	 5 
          	  
 5           
    k�3   2  
 