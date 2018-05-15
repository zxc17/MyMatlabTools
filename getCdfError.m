function temp = getCdfError(data,Per)
figure;
h=cdfplot(data);
l=get(h);
XData=l.XData;
YData=l.YData;
temp=getError(XData,YData,Per);
close;