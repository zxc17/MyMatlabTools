function Mybars(x,avgs,max,min,width,c)
%     h=plot(x,avgs,c);
%     set(h,'Marker','o','MarkerSize',10,'LineWidth',5,'Color',c);
    for i=1:length(x)
        MyBar(x(i),avg(i),max(i),min(i),width,c);
    end
end