function  mcf=newfig( GridAlpha )
%NEWFIG �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    mcf=figure('color','white');
    hold on;
    box on;
    grid on;
    if nargin>0
        set(gca,'LineWidth',1,'GridLineStyle','--','GridAlpha',GridAlpha);
    end
end

