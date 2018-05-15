switch search_mode
    case 'SBS'
        switch trace_mode
            case 'ON'
            case 'OFF'
                result.cdn(I,:)=aps(index);
                result.err(I)=distance(test_cdn(I),result.cdn(I,:));
        end
    case 'KNN'
        switch trace_mode
            case 'ON'
                result_mask=index(1:K);
                result_cdn=search_cdn(result_mask,:);
                if K>1
                    result.cdn(I,J,:)=mean(result_cdn);
                else
                    result.cdn(I,J,:)=reshape(result_cdn,1,1,2);
                end
                result.err(I,J)=distance(test_cdn(I,J,:),result.cdn(I,J,:));
            case 'OFF'
                for k=1:K
                    result_mask=index(1:k);
                    result_cdn=search_cdn(result_mask,:);
                    if k>1
                        result.cdn(I,k,:)=mean(result_cdn);
                    else
                        result.cdn(I,k,:)=reshape(result_cdn,1,1,2);
                    end
                    result.err(I,k)=distance(test_cdn(I,:),result.cdn(I,k,:));
                end
        end
end

