function B=getP1(A , theta , d, t)
if exist('t','var')
    x2=A(1)+cos(theta)*d;
    y2=A(2)+sin(theta)*d;
    B=[x2 y2];
else
    x2=round(A(1)+cos(theta)*d);
    y2=round(A(2)+sin(theta)*d);
    B=[x2 y2];
end