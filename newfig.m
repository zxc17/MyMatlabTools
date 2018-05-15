function  mcf=newfig( GridAlpha )
%NEWFIG 此处显示有关此函数的摘要
%   此处显示详细说明
    mcf=figure('color','white');
    hold on;
    box on;
    grid on;
    if nargin>0
        set(gca,'LineWidth',1,'GridLineStyle','--','GridAlpha',GridAlpha);
    end
end

