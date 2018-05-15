function plot_path(M,N,path_cdn,c)
plot(path_cdn(:,1),path_cdn(:,2),c);
xlim([0 M]);
ylim([0 N]);