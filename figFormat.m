function figFormat(fontsize,xL,yL,ws,xt,xtl,yt,ytl)
set(gcf,'Color','w')
set(gca,'FontSize',fontsize,'FontName','times new roman','FontWeight','bold');
xlabel(xL,'fontsize',fontsize,'FontWeight','bold','FontName','times new roman');
ylabel(yL,'fontsize',fontsize,'FontWeight','bold','FontName','times new roman');
if nargin>3&&~isempty(ws)
    set(gcf,'Units','centimeters','Position',[1 1 ws(1) ws(2)]);
else
    set(gcf,'Units','centimeters','Position',[1 1 24 20]);
end
if nargin>4
    set(gca,'xtick',xt);
    set(gca,'xticklabel',xtl);
end
if nargin>6
    set(gca,'ytick',yt);
    set(gca,'yticklabel',ytl);
end
grid on;
set(gca,'LineWidth',1,'GridLineStyle','--','GridAlpha',0.8);
end