%% gauss_probability
% DESCRIPTIVE TEXT
function p=guass_probability(x,st,l)
if nargin>2
    p=log(1/(sqrt(2*pi)*st))-sq(x)/(2*sq(st));
else
    p=exp(-sq(x)/(2*sq(st)))/(sqrt(2*pi)*st);
end