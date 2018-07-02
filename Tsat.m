function Tsat()
%This function looks up the Antoine constants by id and 
%finds the saturation temperature (in C).
%Use 'run AntoineTableBrowse' for a quick overview of available constants.
[names A B C] = AntoineGet(3)
P = 220; %pressure to match mmHg
disp(sprintf('P(mmHg) %g',P))
T = fzero(@(T)(10^(A-B/(T+C))-P),25);
disp(sprintf('Tsat(C) %g', T))
end