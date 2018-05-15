clear;
clc;
colorquene='bgrmykkkkkkk';


% search_mode='KNN';
search_mode='SBS';
trace_mode='OFF';
direction_mode='U';
direction_i='';
distance_mode='E';
switch direction_mode
    case 'U'
        filename=[search_mode '_TRACE_' trace_mode '_DIR_' direction_mode '_DIS_' distance_mode '_result.mat'];
    case 'M'
        filename=[search_mode '_TRACE_' trace_mode '_DIR_' direction_mode num2str(direction_means(direction_i)) '_DIS_' distance_mode '_result.mat'];
end
load (filename);
mycdfplot(result.err,[0 50],0:10:50,'b','--',1);


search_mode='KNN';
switch direction_mode
    case 'U'
        filename=[search_mode '_TRACE_' trace_mode '_DIR_' direction_mode '_DIS_' distance_mode '_result.mat'];
    case 'M'
        filename=[search_mode '_TRACE_' trace_mode '_DIR_' direction_mode num2str(direction_means(direction_i)) '_DIS_' distance_mode '_result.mat'];
end
load (filename);
mycdfplot(result.err(:,3),[0 50],0:10:50,colorquene(3),'-',0);
legend('Strongest BS','Empirical','location','Southeast');


figure('color','white');
res=zeros(K,2);
for i=1:10
    tmp=mycdfplot(result.err(:,i),[0 30],0:5:30,colorquene(i),'-',0);
    res(i,1)=tmp(10);
    res(i,2)=tmp(1);
end


figure('color','white');
hold on;
plot(1:K,res(:,1),'r-x','LineWidth',5,'MarkerSize',15);
plot(1:K,res(:,2),'b-s','LineWidth',5,'MarkerSize',15);
xlim([0,K]);
ylim([0,7]);
set(gca,'FontSize',35,'FontName','times new roman','FontWeight','bold')
ylabel('Error Distance(m)','fontsize',35,'FontWeight','bold','FontName','times new roman');
xlabel('Number of neighbors averaged (k)','fontsize',35,'FontWeight','bold','FontName','times new roman');
legend('25%','50%','location','Southeast');
set(gcf,'Units','centimeters','Position',[1 1 24 20]);
box on;
grid on;
set(gca,'xtick',0:2:11);
set(gca,'xticklabel',0:2:11);
set(gca,'ytick',0:1:7);
set(gca,'yticklabel',0:1:7);

% % direction ... 
% search_mode='KNN';
% % search_mode='SBS';
% K=10;
% trace_mode='OFF';
% 
% % direction_mode='U';
% % Æ½¾ù1 5 10 15 20 25W
% direction_vars=[1.35,6.3,13,19,25.2];
% direction_means=[1 5 10 15 20];
% distance_mode='E';
% load KNN_TRACE_OFF_DIR_U_DIS_E_result
% mycdfplot(result.err(:,3),[0 30],0:5:30,'k','--',1);
% 
% 
% direction_mode='M';
% hold on;
% % for direction_i=1
% %     filename=[search_mode '_TRACE_' trace_mode '_DIR_' direction_mode num2str(direction_means(direction_i)) '_DIS_' distance_mode '_result.mat'];
% %     load(filename);
% %     tmp=mycdfplot(result.err(:,3),[0 30],0:5:30,colorquene(direction_i),'-',0);
% % end
% filename=[search_mode '_TRACE_' trace_mode '_DIR_' direction_mode num2str(direction_means(1)) '_DIS_' distance_mode '_result.mat'];
% load(filename);
% tmp=mycdfplot(result.err(:,3),[0 30],0:5:30,colorquene(1),'-',0);
% legend('Direction unknown','Direction given','LineWidth',3,'location','Southeast');
% % filename=[search_mode '_TRACE_' trace_mode '_DIR_' direction_mode num2str(direction_means(5)) '_DIS_' distance_mode '_result.mat'];
% % load(filename);
% % tmp=mycdfplot(result.err(:,3),[0 30],0:5:30,colorquene(3),'-',0);