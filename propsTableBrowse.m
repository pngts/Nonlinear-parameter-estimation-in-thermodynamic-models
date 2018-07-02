%This script is to browse the Antoine table to see the
%index values and temperature limits.
if(~exist('props','var'))
    db = load ('props.mat');
    props = db.props; clear db;
end
for i=1:length(props(:,1))
    fprintf('%d %s %s\n', i,props{i,2},props{i,3});
end

% ver 1.02 6/5/12 use structured variable with 'load', improved printing
% version 1.01 4/9/12 modified for new props.mat with new short name column