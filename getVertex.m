function [A,B,C,D]=getVertex(q,L1,L2,theta)
    [tx1,ty1]=getP2(q(1),q(2),theta+pi/2,L1);
    [tx2,ty2]=getP2(q(1),q(2),theta-pi/2,L1);
    [tx11,ty11]=getP2(tx1,ty1,theta+pi,L2);
    [tx12,ty12]=getP2(tx1,ty1,theta,L2);
    [tx21,ty21]=getP2(tx2,ty2,theta+pi,L2);
    [tx22,ty22]=getP2(tx2,ty2,theta,L2);
    A=[tx11,ty11];
    B=[tx12,ty12];
    C=[tx21,ty21];
    D=[tx22,ty22];
end