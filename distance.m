function d=distance(a,b,w)
n=length(a);
if nargin<3
    c=a-b;
    d=sqrt(sum(c.*c));
else
    s=0;
    for i=1:n
        s=s+sq(w(i))*sq(a(i)-b(i));
    end
    d=sqrt(s);
end
