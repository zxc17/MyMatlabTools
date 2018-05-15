function m=minm(a)
dim=ndims(a);
for i=1:dim
	a=min(a);
end
m=a;