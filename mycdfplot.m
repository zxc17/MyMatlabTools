function [XData,YData]=mycdfplot(data,n,xL,yL,c,lt,xl,xt)
if(n==1)
	figure('color','white');
end
hold on;
h=cdfplot(data);
l=get(h);
XData=l.XData;
YData=l.YData;
if nargin>2
	xlabel(xL,'fontsize',35,'FontWeight','bold','FontName','times new roman');
	ylabel(yL,'fontsize',35,'FontWeight','bold','FontName','times new roman');
else
	xlabel('Value','fontsize',35,'FontWeight','bold','FontName','times new roman');
	ylabel('CDF','fontsize',35,'FontWeight','bold','FontName','times new roman');
end
if nargin>4
	set(h,'LineWidth',5,'Color',c,'LineStyle',lt);
else
	set(h,'LineWidth',5,'Color','b','LineStyle','-');
end
title('');
box on;
ylim([0 1]);
set(gca,'FontSize',35,'FontName','times new roman','FontWeight','bold');
set(gca,'ytick',0.2:0.2:1);
set(gca,'yticklabel',0.2:0.2:1);
grid on;
set(gca,'LineWidth',2,'GridLineStyle','--','GridAlpha',0.8);
if nargin>6
    xlim(xl);
    set(gca,'xtick',xt);
    set(gca,'xticklabel',xt);
end
set(gcf,'Units','centimeters','Position',[1 1 24 20]);