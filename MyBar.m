function MyBar(x,avg,max,min,width,c)
    plot([x x],[min max],'Color',c,'LineWidth',3);
    plot([x-width x+width],[min min],'Color',c,'LineWidth',3);
    plot([x-width x+width],[max max],'Color',c,'LineWidth',3);
end