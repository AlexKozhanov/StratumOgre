SB0  �      Control_Image   speed_p     FLOAT    px1     FLOAT�   py1     FLOAT�   pz1     FLOAT�   px2     FLOAT    py2     FLOAT    pz2     FLOAT    speedx_p     FLOAT�   speedy_p     FLOAT�   speedz_p     FLOAT�   a     FLOAT�   b     FLOAT�   speed_r     FLOAT    rx     FLOAT�   ry     FLOAT�   rz     FLOAT�   x     FLOAT    y     FLOAT    z     FLOAT    alf     FLOAT    alf_t     FLOAT�   n     FLOAT�   speed_s     FLOAT    sizex1     FLOAT�   sizey1     FLOAT�   sizez1     FLOAT�   sizex2     FLOAT    sizey2     FLOAT    sizez2     FLOAT   
 �//����������� �� �����������
float speed_p
//���-�������
float px1,py1,pz1
//���
float px2,py2,pz2
float speedx_p
float speedy_p
float speedz_p
float a,b
//������������� ��������
//float f,x
//��������� �������� �������
//f:=sin(x)
//����
float speed_r
float rx,ry,rz,x,y,z
float alf, alf_t,n
//������
float speed_s
float sizex1,sizey1,sizez1
float sizex2,sizey2,sizez2
//////////////////////////////
if(~speed_p!=0)
  a:=((px2-px1))/(sqrt(sqr(px2-px1)+sqr(pz2-pz1)))
  speedx_p:=abs(speed_p)*a
  speedx_p:=Round(~speedx_p,2)
  speedz_p:=abs(speed_p)*sqrt(1-sqr(a))
  speedz_p:=Round(~speedz_p,2)
  b:=(sqr(px2-px1))/(sqrt(sqr(px2-px1))*sqrt(sqr(px2-px1)+sqr(py2-py1)))
  speedy_p:=abs(speed_p)*sqrt(1-sqr(b))
  speedy_p:=Round(~speedy_p,2)
  if(~px1<=px2)
    px1:=~px1+speedx_p
  endif
  if(~pz1<=pz2)
    pz1:=~pz1+speedz_p
  endif
  if(~py1<=py2)
    py1:=~py1+speedy_p
  endif
endif
//////////////////////////////
if(~speed_r!=0)
  if(alf==0)
    if(x!=0)
      rx:=~rx+speed_r
      else
        if(y!=0)
          ry:=~ry+speed_r
          else
            if(z!=0)
            rz:=~rz+speed_r          
            endif
        endif
    endif
      else
      n:=rad(alf)
      if(alf_t<=n)
        if(x!=0)
          rx:=~rx+speed_r
          alf_t:=~alf_t+speed_r
          else
            if(y!=0)
              ry:=~ry+speed_r
              alf_t:=~alf_t+speed_r
              else
                if(z!=0)
                rz:=~rz+speed_r
                alf_t:=~alf_t+speed_r             
                endif
            endif
        endif
      endif
  endif
endif
//////////////////////////////
if(speed_s!=0)
  if(sizex2!=0 & ~sizex1<=sizex2)
    sizex1:=~sizex1+speed_s
    else
      if(sizey2!=0 & ~sizey1<=sizey2)
        sizey1:=~sizey1+speed_s
        else
          if(sizez2!=0 & ~sizez1<=sizez2)
            sizez1:=~sizez1+speed_s
          endif
      endif
  endif
endif
////////////////////////////// �              7 5 �           #      #  "   
    .  
              @)      .        �? 
 #  "   	  	         @)  	      #      # "      #      #  "        .        �?  #  "              @)       ; 5 �            ; 5 �    	        ; 5 �                   7 5 T           6 5 �            7 5 �        3 �            7 5 �        3 �            7 5 �        3 T  0       ; 5 T           7 5 "              3 T           7 5 <              3 T           7 5 T                         7 5 �           7     ; i 5 w       3 �           7     ; i 5 �       3 �           7     ; i 5 �           �.    
 