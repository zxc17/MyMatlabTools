function d=distance(a,b,w)
n=length(a);
if nargin<3
    w=ones(1,n);
end
s=0;
for i=1:n
	s=s+sq(1/w(i))*sq(a(i)-b(i));
end
d=sqrt(s);