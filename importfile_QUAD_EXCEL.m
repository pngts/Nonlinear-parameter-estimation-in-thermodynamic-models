function [TK1,Pmmhg,X1,X2,X3,Y1,Y2,Y3] = importfile_QUAD_EXCEL(workbookFile,sheetName,startRow,endRow)
%IMPORTFILE2 Import data from a spreadsheet
%   [TK1,Pmmhg,X1,X2,X3,Y1,Y2,Y3] = IMPORTFILE2(FILE) reads data from the
%   first worksheet in the Microsoft Excel spreadsheet file named FILE and
%   returns the data as column vectors.
%
%   [TK1,Pmmhg,X1,X2,X3,Y1,Y2,Y3] = IMPORTFILE2(FILE,SHEET) reads from the
%   specified worksheet.
%
%   [TK1,Pmmhg,X1,X2,X3,Y1,Y2,Y3] = IMPORTFILE2(FILE,SHEET,STARTROW,ENDROW)
%   reads from the specified worksheet for the specified row interval(s).
%   Specify STARTROW and ENDROW as a pair of scalars or vectors of matching
%   size for dis-contiguous row intervals. To read to the end of the file
%   specify an ENDROW of inf.
%
%	Non-numeric cells are replaced with: NaN
%
% Example:
%   [TK1,Pmmhg,X1,X2,X3,Y1,Y2,Y3] = importfile2('quaternary1.xlsx','Sheet1',4,37);
%
%   See also XLSREAD.

% Auto-generated by MATLAB on 2018/03/13 21:48:03

%% Input handling

% If no sheet is specified, read first sheet
if nargin == 1 || isempty(sheetName)
    sheetName = 1;
end

% If row start and end points are not specified, define defaults
if nargin <= 3
    startRow = 4;
    endRow = 37;
end

%% Import the data
[~, ~, raw] = xlsread(workbookFile, sheetName, sprintf('A%d:H%d',startRow(1),endRow(1)));
for block=2:length(startRow)
    [~, ~, tmpRawBlock] = xlsread(workbookFile, sheetName, sprintf('A%d:H%d',startRow(block),endRow(block)));
    raw = [raw;tmpRawBlock]; %#ok<AGROW>
end
raw(cellfun(@(x) ~isempty(x) && isnumeric(x) && isnan(x),raw)) = {''};

%% Replace non-numeric cells with NaN
R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),raw); % Find non-numeric cells
raw(R) = {NaN}; % Replace non-numeric cells

%% Create output variable
I = cellfun(@(x) ischar(x), raw);
raw(I) = {NaN};
data = reshape([raw{:}],size(raw));

%% Allocate imported array to column variable names
TK1 = data(:,1);
Pmmhg = data(:,2);
X1 = data(:,3);
X2 = data(:,4);
X3 = data(:,5);
Y1 = data(:,6);
Y2 = data(:,7);
Y3 = data(:,8);

