function dis=propagate_reverse(TX,L0,alpha,rss,height,dis_r)
% rss=TX-L0-10*alpha*log10(norm([dis height])/dis_r)+noise;
dis=dis_r*power(10,(TX-L0-rss)/(10*alpha));
dis=sqrt(dis*dis-height*height);