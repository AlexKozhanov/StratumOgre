SB0  �      TextFileReader 	  HFileStrings     HANDLE�   FilePath     STRING    TotalStringsCount     FLOAT    hFileStream     HANDLE�  	 _filePath     STRING�   res     FLOAT�   i     FLOAT�   TotalStringCount     FLOAT�   FileReadingFinished     FLOAT�  
 �Handle HFileStrings
String FilePath
Float  TotalStringsCount

Handle local hFileStream
String local _filePath
Float  local res, i

if(_filePath != FilePath && FileExist(FilePath))
  hFileStream := CreateStream("FILE", FilePath, "READONLY")
  if(HFileStrings != #0)
    Delete(HFileStrings)
  endif
  HFileStrings := New()
  
  i:= 0
  while(!Eof(~hFileStream))
    res := vInsert(~HFileStrings, "String")
    VSet(~HFileStrings, ~i, "", ReadLn(~hFileStream))
    inc(~i)
  endwhile
  res := CloseStream(~hFileStream)
  
  TotalStringCount := vGetCount(~HFileStrings)
  FileReadingFinished := 1
  
  _filePath := FilePath
endif

if(FileReadingFinished); FileReadingFinished := 0; endif 
 system.dbm s   x  x  � x  �+ 5 g z  FILE  x  z  READONLY  �           S 5 '    ��                � - 5 R    z  String  �       z      � �� c3 1   �      �         �?  x  {    5 r               [b     
 