function [ Du_new] = NONuniMUTA(MAX,MIN,Du_old,gi,G )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
numb1=rand;

% if (G-G/10)>gi
% ra=rand;
% else
% ra=1-gi/G;
% end 
ra=rand;
if numb1>0.5
   %afksanete
   Du_new=Du_old+(MAX-Du_old)*(1-ra^(1-gi/G));
else
    %mionete
Du_new=Du_old-(Du_old-MIN)*(1-ra^(1-gi/G));

end

