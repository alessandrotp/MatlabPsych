function [arclen,seglen] = arclength_custom(px,py,varargin)

% compile the curve into one array
data = [px(:),py(:)];

% defaults for method and tol
method = 'linear';

% what dimension do we live in?
nd = size(data,2);

% compute the chordal linear arclengths
seglen = sqrt(sum(diff(data,[],1).^2,2));
arclen = sum(seglen);



end % function arclength



