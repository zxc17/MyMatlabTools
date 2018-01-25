function savegcf(figname)
    saveas(gcf,[figname '.fig']);
    saveas(gcf,[figname '.png']);
    saveas(gcf,[figname '.eps'],'psc2'); 
end