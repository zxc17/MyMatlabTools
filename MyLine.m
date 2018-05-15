function [points , L]= MyLine( A , B )
% Bresenham直线画线算法
% (x1,y1)为第一个点的坐标，x1是矩阵的行的位置，而非屏幕坐标系的定义
% (x2,y2)为第二个点的坐标
    x1=A(1);
    y1=A(2);
    x2=B(1);
    y2=B(2);
    points=[];
    k = (y1-y2)/(x1-x2);
    flag = 1;
    if abs(k) > 1
        [x1, y1] = SwapXY( y1, x1 );
        [x2, y2] = SwapXY( y2, x2 );
        k = 1/k;
        flag = 0;
    end
    turn = 0;
    if x1 > x2
        [x1, x2] = SwapXY(x2, x1);
        [y1, y2] = SwapXY(y2, y1);
        turn = 1;
    end

    deltaX = x2 - x1;
    deltaY = abs(y2 - y1);
    p = 2*deltaY - deltaX;

    minX = min(x1, x2);
    maxX = max(x1, x2);

    yk = y1;
    if flag
        points(1,:)=[x1 y1];
    else
        points(1,:)=[y1 x1];
    end
    I=2;
    for ii = minX : maxX-1
        if p < 0
            p = p + 2 * deltaY;
        else
            if k > 0
                yk = yk + 1;
            else
                yk = yk - 1;
            end
            p = p + 2 * deltaY - 2 * deltaX;
        end
        if flag
            points(I,:)=[ii+1 yk];
            I=I+1;
        else
            points(I,:)=[yk ii+1];
            I=I+1;
        end
    end
    if I>1
        if flag
            if (points(I-1,1)~=x2&&points(I-1,2)~=y2)
                points(I,:)=[x2 y2];
            end
        else
            if (points(I-1,2)~=x2&&points(I-1,1)~=y2)
                points(I,:)=[y2 x2];
            end
        end
    end
    if turn
        points=flipud(points);
    end
    L=size(points,1);
end