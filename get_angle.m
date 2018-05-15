% Get angle of the vector between two points
% getAngle(P1,P2) is the angle of P1 -> P2
% (x,y)
function theta=get_angle(P1,P2)
t=P2-P1;
theta=atan2(t(2),t(1));
