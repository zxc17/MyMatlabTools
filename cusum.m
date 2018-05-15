% function [S T]=cusum(data,k)
% len=length(data);
% S=zeros(size(data));
% T=zeros(size(data));
% reshape(S,1,len);
% reshape(T,1,len);
% u=mean(data);
% v=sqrt(var(data));
% z=(data(1)-u)/k;
% S(1)=max(0,z-k);
% T(1)=min(0,z+k);
% for i=2:len
%     z=(data(i)-u)/v;
%     S(i)=max(0,S(i-1)+z-k);
%     T(i)=min(0,T(i-1)+z+k);
% end
% reshape(S,size(data,1),size(data,2));
% reshape(T,size(data,1),size(data,2));

function [Z]=cusum(data)
len=length(data);
Z=zeros(size(data));
reshape(Z,1,len);
Z(1)=0;
u=mean(data);
for i=2:len
    Z(i)=max(0,Z(i-1)+data(i)-u);
end
reshape(Z,size(data,1),size(data,2));