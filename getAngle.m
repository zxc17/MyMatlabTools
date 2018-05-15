% Get angle of the vector between two points
% getAngle(P1,P2) is the angle of P1 -> P2
% (y,x)
function theta=getAngle(P1,P2)
t=P2-P1;
theta=atan2(t(1),t(2));
