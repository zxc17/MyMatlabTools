function [row_rssi, row_var, row_rssi_set]=create_fingerprint(ap_num,RSSI_data)
% rssi_data��һ���ο����RSSI���ݣ��������������������������AP���
row_rssi=mean(RSSI_data);
row_var=var(RSSI_data);
row_rssi_set=cell(1,ap_num);
for i=1:ap_num
    T=tabulate(RSSI_data(:,i)); %�ҵ�ÿ��AP-RSSIֵ����Ƶ��
    disp(T);
    T=sortrows(T,2); %���Ӵ�С����
%     T=T(end:-1:1,:);
    disp('sort');
    T=T(T(:,3)>0,:); %ֻҪƵ�ʸ���0%��fi
    disp(T);
    row_rssi_set{i}=(T(:,1))';
end