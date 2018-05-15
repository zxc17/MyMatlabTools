clear;
clc;
load fingerprint.mat
load testdata1.mat

figure('color','white');
box on;
grid on;
hold on;
xlim([0,M]);
ylim([0,N]);
x=aps(:,1);
y=aps(:,2);
plot(x,y,'rp','MarkerSize',15,'MarkerFaceColor','r','MarkerEdgeColor','r');
xt=0:4:44;
yt=0:4:24;
set(gca,'xtick',xt);
set(gca,'xticklabel',xt);
set(gca,'ytick',yt);
set(gca,'yticklabel',yt);
x=rqs_cdn(:,1);
y=rqs_cdn(:,2);
plot(x,y,'ro','MarkerSize',5,'MarkerFaceColor','k','MarkerEdgeColor','k');
set(gcf,'Units','centimeters','Position',[1 1 30 20]);
set(gca,'FontSize',30,'FontName','times new roman','FontWeight','bold');
x=test_cdn(:,1);
y=test_cdn(:,2);
plot(x,y,'b*');