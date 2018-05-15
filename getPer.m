function r=getPer(XData,YData,error)
x=XData-error;
x(x<0)=0;
for i=1:length(x)
    if (x(i)>0)
        r=YData(i);
        break;
    end;
end
