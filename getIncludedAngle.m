function theta=getIncludedAngle(a1,a2)
theta=abs(a1-a2);
if theta>pi
    theta=2*pi-theta;
end