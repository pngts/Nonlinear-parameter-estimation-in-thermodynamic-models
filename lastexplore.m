function [ Du_new] = lastexplore(MAX,MIN,Du_old)

numb1=rand;

ra=0.90+rand*(0.1);
ra2=(995+rand*(5))/1000;
if numb1>0.5
   %afksanete
   Du_new=Du_old+(MAX-Du_old)*(1-ra^(1-ra2));
else
    %mionete
Du_new=Du_old-(Du_old-MIN)*(1-ra^(1-ra2));
end
