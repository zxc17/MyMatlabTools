function s=n2s(n,p)
if nargin <2
    s=num2str(n);
else
    if n>1
        s=num2str(n,p+1);
    else
        s=num2str(n,p);
    end
end