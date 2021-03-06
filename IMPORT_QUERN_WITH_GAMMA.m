%% Import data from spreadsheet
% Script for importing data from the following spreadsheet:
%
%    Workbook: E:\THESIS\piramatika voutsas\TERNARY\quaternary1_GAMMA.xlsx
%    Worksheet: SHEET1
%
% To extend the code for use with different selected data or a different
% spreadsheet, generate a function instead of a script.

% Auto-generated by MATLAB on 2018/03/14 12:31:56

%% Import the data
[~, ~, raw] = xlsread('E:\THESIS\piramatika voutsas\quaternary\quaternary1_GAMMA.xlsx','SHEET1','A4:L37');

%% Create output variable
data = reshape([raw{:}],size(raw));

%% Allocate imported array to column variable names
TK = data(:,1);
PmmHg = data(:,2);
X1 = data(:,3);
X2 = data(:,4);
X3 = data(:,5);
Y1 = data(:,6);
Y2 = data(:,7);
Y3 = data(:,8);
gamma_exp1 = data(:,9);
gamma_exp2 = data(:,10);
gamma_exp3 = data(:,11);
gamma_exp4 = data(:,12);

%% Clear temporary variables
clearvars data raw;