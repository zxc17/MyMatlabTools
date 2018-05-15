function rss=propagate(TX,L0,alpha,dis,height,dis_r,noise)
rss=round(TX-L0-10*alpha*log10(norm([dis height])/dis_r)+noise);