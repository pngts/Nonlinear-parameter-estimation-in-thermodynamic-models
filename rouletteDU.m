function [i] = rouletteDU(fit_values,fitness)
n_rand = rand()*fitness;
sum_fit = 0;
for i=1:length(fit_values),
    sum_fit = sum_fit + fit_values(i);
    if sum_fit >= n_rand
           break;
    end
end