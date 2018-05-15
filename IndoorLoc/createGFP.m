% set prefix of rssi_data.mat before run this script
load([prefix '\ori_data.mat']);
ap_num=size(ori_rssi,2);
rqs_num=max(ori_Id)-min(ori_Id)+1;
rqs_cdn=zeros(rqs_num,2); %ʵ��λ��
rqs_rssi=cell(rqs_num,ap_num); %ÿ��RSSI������RSSI-fi
for w=0:rqs_num-1
    for i=1:ap_num
        disp(['AP: ' num2str(i)]);
        if sum(ori_Id==w)==0
            continue;
        end
        T=tabulate(ori_rssi(ori_Id==w,i)); %�ҵ�ÿ��AP-RSSIֵ����Ƶ��
        [T,I]=sort(T,1,'descend'); %���Ӵ�С����
        disp('sort');
        T=T(T(:,3)>0,:); %ֻҪƵ�ʸ���0%��fi
        disp(T);
        rqs_rssi{w+1,i}=(T(:,1))'; 
    end
end

clear i I T w
save fingerprint.mat
