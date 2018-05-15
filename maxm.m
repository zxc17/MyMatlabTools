function m=maxm(a)
dim=ndims(a);
for i=1:dim
	a=max(a);
end
m=a;