%This script is to browse the Antoine table to see the
%index values and temperature limits.
if(~exist('AntoineTable','var'))
    db = load('AntoineTable.mat');
    AntoineTable = db.AntoineTable; clear db;
end
fprintf('%d %s %s %s %s\n',1, AntoineTable{1,1}, AntoineTable{1,5}, AntoineTable{1,6}, AntoineTable{1,7})
for i=2:length(AntoineTable(:,1))
    %disp([i AntoineTable(i,1) AntoineTable(i,5) AntoineTable(i,6)])
    fprintf('%d %s %.1f %.1f %d\n',i, AntoineTable{i,1}, AntoineTable{i,5}, AntoineTable{i,6}, AntoineTable{i,7})
end

% ver 1.01 6/5/12 improve printing, use struct var for 'load'