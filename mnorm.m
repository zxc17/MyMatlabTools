function V=mnorm(m,d)
if d==1
    col=size(m,2);
    V=zeros(1,col);
    for i=1:col
        V(i)=norm(m(:,i));
    end
elseif d==2
    row=size(m,1);
    V=zeros(row,1);
    for i=1:row
        V(i)=norm(m(i,:));
    end
end