function r=feature_match(distance_mode,pmatch,dmatch,varargin)
switch distance_mode
    % Euclidean distance
    case 'E'
        r=distance(pmatch,dmatch);
    % Manhattan distance
    case 'M'
        r=sum(abs(pmatch-dmatch));
    % Weighted Euclidean distance
    case 'WE'
        paras=varargin{:};
        r=distance(pmatch,dmatch,paras);
    % Weighted Manhattan distance
    case 'WM'
        paras=varargin{:};
        r=sum(paras.*abs(pmatch-dmatch));
end
% if isstruct(setting)
%     distance_mode=setting.distance;
% else
%     distance_mode=setting;
% end
%         if isstruct(setting)
%             if isfield(setting,'weight')
%                 switch setting.weight
%                     case 'MR'
%                         w=0.01*max(pmatch,dmatch)+1;
%                         r=distance(pmatch,dmatch,w);
%                     case 'BR'
%                         w=max(pmatch,dmatch)>-83;
%                         r=distance(pmatch,dmatch,w);
%                     otherwise
%                         r=distance(pmatch,dmatch);
%                 end
%             else
%                 r=distance(pmatch,dmatch);
%             end
%         else
%             r=distance(pmatch,dmatch);
%         end