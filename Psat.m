function Psat()
%This function looks up the Antoine constants by id and 
%calculates the vapor pressure (mmHg) at a specified temperature (in C).
%Use 'run AntoineTableBrowse' for a quick overview of available constants.
[names A B C] = AntoineGet([4 8])
T = 100; %T in C
disp(sprintf('T(C) %g', T))
P =10.^(A-B./(T+C)); 
disp(sprintf('Psat(mmHg) %g ',P))
end