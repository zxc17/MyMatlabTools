% set prefix of rssi_data.mat before run this script
load([prefix '\ori_data.mat']);
ap_num=size(ori_rssi,2);
rqs_num=max(ori_Id)-min(ori_Id)+1;
rqs_cdn=zeros(rqs_num,2); %实际位置
rqs_rssi=cell(rqs_num,ap_num); %每个RSSI存所有RSSI-fi
for w=0:rqs_num-1
    for i=1:ap_num
        disp(['AP: ' num2str(i)]);
        if sum(ori_Id==w)==0
            continue;
        end
        T=tabulate(ori_rssi(ori_Id==w,i)); %找到每个AP-RSSI值出现频率
        [T,I]=sort(T,1,'descend'); %按从大到小排列
        disp('sort');
        T=T(T(:,3)>0,:); %只要频率高于0%的fi
        disp(T);
        rqs_rssi{w+1,i}=(T(:,1))'; 
    end
end

clear i I T w
save fingerprint.mat
