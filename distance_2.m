function d=distance_2(a,b)
n=length(a);
s=0;
for i=1:n
	s=s+sq(a(i)-b(i));
end
d=sqrt(s);