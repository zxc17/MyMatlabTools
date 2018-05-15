function [row_rssi, row_var, row_rssi_set]=create_fingerprint(ap_num,RSSI_data)
% rssi_data是一个参考点的RSSI数据，行数代表采样次数，列数代表AP序号
row_rssi=mean(RSSI_data);
row_var=var(RSSI_data);
row_rssi_set=cell(1,ap_num);
for i=1:ap_num
    T=tabulate(RSSI_data(:,i)); %找到每个AP-RSSI值出现频率
    disp(T);
    T=sortrows(T,2); %按从大到小排列
%     T=T(end:-1:1,:);
    disp('sort');
    T=T(T(:,3)>0,:); %只要频率高于0%的fi
    disp(T);
    row_rssi_set{i}=(T(:,1))';
end