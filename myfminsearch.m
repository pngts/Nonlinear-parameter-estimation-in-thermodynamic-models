function [x,fval,exitflag,output] = myfminsearch(ff,x0,MaxFunEvals_Data,MaxIter_Data)
%% This is an auto generated MATLAB file from Optimization Tool.

%% Start with the default options
options = optimset;
%% Modify options setting
options = optimset(options,'Display', 'off');
options = optimset(options,'MaxFunEvals', MaxFunEvals_Data);
options = optimset(options,'MaxIter', MaxIter_Data);
[x,fval,exitflag,output] = ...
fminsearch(ff,x0,options);
