function setupdatefun(fun)
datacursormode on;
dcm_obj = datacursormode(gcf);
set(dcm_obj,'UpdateFcn',fun);