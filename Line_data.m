function [data ,points, L]= Line_data( M , x1 , y1 , x2 , y2 ,len)
% Bresenham直线画线算法
% (x1,y1)为第一个点的坐标，x1是矩阵的行的位置，而非屏幕坐标系的定义
% (x2,y2)为第二个点的坐标
    
    height = size(M,1);
    width = size(M,2);
    temp=zeros(1,len);
    temp_points=zeros(len,2);
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
    I=1;
    if flag
        if x1>0 && x1<=height && y1>0 && y1<=width
            temp(1)=M(x1 , y1);
            temp_points(1,:)=[x1 y1];
            I=2;
        end
    else
        if y1>0 && y1<=height && x1>0 && x1<=width
            temp(1)=M(y1 , x1);
            temp_points(1,:)=[y1 x1];
            I=2;
        end
    end
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
            if ii+1>0 && ii+1<=height && yk>0 && yk<=width
                temp(I)=M(ii+1 , yk);
                temp_points(I,:)=[ii+1 yk];
                I=I+1;
            end
        else
            if ii+1>0 && ii+1<=width && yk>0 && yk<=height
                temp(I)=M(yk , ii+1);
                temp_points(I,:)=[yk ii+1];
                I=I+1;
            end
        end
    end
    if I>1
        if flag
            if x2>0 && x2<=height && y2>0 && y2<=width&&(temp_points(I-1,1)~=x2&&temp_points(I-1,2)~=y2)
                temp(I)=M(x2 , y2);
                temp_points(I,:)=[x2 y2];
            end
        else
            if y2>0 && y2<=width && x2>0 && x2<=height&&(temp_points(I-1,2)~=x2&&temp_points(I-1,1)~=y2)
                temp(I)=M(y2 , x2);
                temp_points(I,:)=[y2 x2];
            end
        end
    end
    if turn
        temp=fliplr(temp);
        temp_points=fliplr(temp_points);
    end
    filter=temp>0;
    temp=temp(filter);
    temp_points=temp_points(filter,:);
    L=length(temp);
    if(L>len)
        data=temp(1:len);
        points=temp_points(1:len,:);
        L=len;
    else
        data=temp;
        points=temp_points;
    end
end