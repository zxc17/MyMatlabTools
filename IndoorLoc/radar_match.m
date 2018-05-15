switch search_mode
    case 'SBS'
        [r, index]=max(test_feature(I,:));
    case 'KNN'
        switch direction_mode
            case 'U'
                search_mask= true(rqs_num,1);
            case 'UM'
                search_mask=rqs_d==testd;
            case 'M'
                includedAngle=zeros(size(ref_angle));
                for i=1:length(ref_angle)
                    includedAngle(i)=getIncludedAngle(ref_angle(i),measure_d(I));
                end
                [t,i]=min(includedAngle);
                search_mask= false(rqs_num,1);
                search_mask(i:4:end)=true;
        end
        search_num=sum(search_mask);
        search_dis=zeros(search_num,1);
        search_cdn=rqs_cdn(search_mask,:);
        switch feature_mode
            case 'R'
                search_feature=rqs_rssi(search_mask,:);
            case 'D'
                search_feature=rqs_rssi(search_mask,:);
            case 'MHD'
                search_feature=rqs_magnetic(search_mask,:);
            case 'MM'
                search_feature=rqs_magnitude(search_mask,:);
            case 'R+MHD'
                search_feature=[rqs_magnetic rqs_rssi];
        end
        if (strcmp(distance_mode,'WE')&&strcmp(distance_mode,'WM'))
            search_rssi_var=rqs_rssi_var(search_mask,:);
        end
        for i=1:search_num
            switch distance_mode
                case 'E'
                    search_dis(i)=feature_match(distance_mode,search_feature(i,:),test_feature);
                case 'M'
                    search_dis(i)=feature_match(distance_mode,search_feature(i,:),test_feature);
                case 'WE'
                    search_dis(i)=feature_match(distance_mode,search_feature(i,:),test_feature,search_rssi_var(i,:));
                case 'WM'
                    search_dis(i)=feature_match(distance_mode,search_feature(i,:),test_feature,search_rssi_var(i,:));
            end
        end
        [search_dis,index]=sort(search_dis);
end
result_create;
    