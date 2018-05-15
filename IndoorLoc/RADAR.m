clear;
disp('radar running');
load radar_set.mat
MAXVALUE=1e10;
%% search_mode
% KNN; RADAR
% SBS: Strongest Base station
% K  : Number of neighbour
%% trace_mode
% ON : trace on
% OFF: trace off
%% direction_mode
% M: 给定方向测量误差均值
% U: 未知方向
%
% 平均1 5 10 15 20 25
% direction_vars=[1.35,6.3,13,19,25.2];
% direction_means=[1 5 10 15 20];
%% distance_mode
% E: 欧式距离
% M: 曼哈顿距离
% G: 哥斯拉距离
%% feature_mode
% R: RSSI
% D: RSSI转换为距离
% MHD: Magnetic Horizontal Decomposition 
% MM: Magnetic Magnitude
%%
load([prefix '\fingerprint.mat']);
load([prefix '\testdata_' num2str(test_no) '.mat'])
switch search_mode
    case 'SBS'
        disp('Strongest Base Station...');
    case 'KNN'
        disp('K Nearest Neighbor...');
end
switch trace_mode
    case 'ON'
        result.cdn=zeros(test_num,nNodes,2);
        result.err=zeros(test_num,nNodes);
    case 'OFF'
        result.err=zeros(test_num,K);
        result.cdn=zeros(test_num,K,2);
end
if direction_mode=='M'
    measure_d=test_d+deg2rad(normrnd(0,direction_vars(direction_i),test_num,1));
end
switch feature_mode
    case 'R'
        test_features=test_rssi;
    case 'D'
        test_features=test_rssi;
    case 'MHD'
        test_features=test_magnetic;
    case 'MM'
        test_features=test_magnitude;
    case 'R+MHD'
        test_features=[test_magnetic test_rssi];
end
for I=1:test_num
    switch trace_mode
    case 'ON'
        for J=1:nNodes
            test_feature=test_features(I,J,:);
            radar_match
        end
    case 'OFF'
        test_feature=test_features(I,:);
        if direction_mode=='UM'
            testd=test_d(I);
        end
        radar_match
    end
    
end
switch trace_mode
    case 'ON'
        disp('Navigation...');
        result.num=size(result.err,1);
        result.mean=mean(result.err);
        filename=[search_mode '_TRACE_' trace_mode '_DIR_' direction_mode num2str(direction_means(direction_i)) '_G_' godzilla_filter '_DIS_' distance_mode '_result' num2str(test_no) '.mat'];
        disp(['save to ' filename]);
        save(filename,'result','search_mode','trace_mode','direction_mode','direction_means','direction_i','distance_mode','K');
        O_cdn=result.cdn;
        sigL=var(result.err(:));
        save(['obs_data_' num2str(test_no) '.mat'], 'O_cdn','sigL');
    case 'OFF'
        disp('Localization...');
        result.num=length(result.err);
        result.accuracy=sum(result.err==0)/result.num;
        result.mean=mean(result.err);
        filename=[search_mode '_TRACE_' trace_mode '_DIR_' direction_mode num2str(direction_means(direction_i)) '_G_' godzilla_filter '_DIS_' distance_mode '_result.mat'];
        disp(['save to ' filename]);
        save(filename,'result','search_mode','trace_mode','direction_mode','direction_means','direction_i','distance_mode','K');
        disp(['K  : ' num2str(1:K)]);
        disp(['mean: ' num2str(mean(result.err))]);
        disp(['accuracy: ' num2str(mean(result.accuracy))]);
end
% cdfplot(result.err);