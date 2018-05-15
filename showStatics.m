function showStatics(v)
disp(inputname(1));
disp(['var:     ' num2str(var(v))]);
disp(['mean:    ' num2str(mean(v))]);
disp(['max-min: ' num2str(max(v-min(v)))]);
disp(' ');
