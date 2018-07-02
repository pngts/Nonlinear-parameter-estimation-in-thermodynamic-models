function [x,fval,maxfval,exitflag,output,lambda] = myfminimax(x0,MaxFunctionEvaluations_Data,OptimalityTolerance_Data,ConstraintTolerance_Data)
%% This is an auto generated MATLAB file from Optimization Tool.

%% Start with the default options
options = optimoptions('fminimax');
%% Modify options setting
options = optimoptions(options,'Display', 'off');
options = optimoptions(options,'MaxFunctionEvaluations', MaxFunctionEvaluations_Data);
options = optimoptions(options,'OptimalityTolerance', OptimalityTolerance_Data);
options = optimoptions(options,'FunctionTolerance', OptimalityTolerance_Data);
options = optimoptions(options,'ConstraintTolerance', ConstraintTolerance_Data);
[x,fval,maxfval,exitflag,output,lambda] = ...
fminimax(@ff,x0,[],[],[],[],[],[],[],options);
