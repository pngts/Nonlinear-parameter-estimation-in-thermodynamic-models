function [names A B C] = AntoineGet(id)
% This function loads AntoineTable and gets the specified rows in vector 'id'
% The function returns vectors with just the desired rows
% This function requires 'AntoineTable.mat'
if(~exist('AntoineTable','var'))
   db = load ('AntoineTable.mat');
   AntoineTable = db.AntoineTable; clear db;
end
ncomp = length(id);
for i = 1:ncomp
names{i} = AntoineTable{id(i),1};
A(i) = AntoineTable{id(i),2};
B(i) = AntoineTable{id(i),3};
C(i) = AntoineTable{id(i),4};
end
end

% ver 1.01 6/5/12 use struct var for 'load'
