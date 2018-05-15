function r=getError(XData,YData,per)
y=YData-per;
y(y<0)=0-1e-3;
for i=1:length(y)
    if (y(i)>=0)
        r=XData(i);
        break;
    end;
end
