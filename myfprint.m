function myfprint(data,s)
if nargin>0
    for i=1:length(data)
        fprintf(['%1.' num2str(s) 'f \t'],data(i));
    end
    fprintf('\n');
else
    for i=1:length(data)
        fprintf('%1.4f \t',data(i));
    end
    fprintf('\n');
end