% Load in density data;
% Ensemble Members;
open_Default = fopen('Default_Filenames.txt');
data_Default = textscan(open_Default,'%s');
filenames_Default = data_Default{1};

open_Arctic = fopen('Arctic_Filenames.txt');
data_Arctic = textscan(open_Arctic,'%s');
filenames_Arctic = data_Arctic{1};

open_Mixed = fopen('Mixed_Filenames.txt');
data_Mixed = textscan(open_Mixed,'%s');
filenames_Mixed = data_Mixed{1};

% Default Ensemble;
mean_CRPS_Default_Mar2018 = ncread('CRPS_Scores.nc','CRPS_Def_Mar2018_Density');
mean_CRPS_Default_Mar2019 = ncread('CRPS_Scores.nc','CRPS_Def_Mar2019_Density');
mean_CRPS_Default_Mar2022 = ncread('CRPS_Scores.nc','CRPS_Def_Mar2022_Density');
mean_CRPS_Default_Mar2023 = ncread('CRPS_Scores.nc','CRPS_Def_Mar2023_Density');

% Arctic Ensemble;
mean_CRPS_Arctic_Mar2018 = ncread('CRPS_Scores.nc','CRPS_Arc_Mar2018_Density');
mean_CRPS_Arctic_Mar2019 = ncread('CRPS_Scores.nc','CRPS_Arc_Mar2019_Density');
mean_CRPS_Arctic_Mar2022 = ncread('CRPS_Scores.nc','CRPS_Arc_Mar2022_Density');
mean_CRPS_Arctic_Mar2023 = ncread('CRPS_Scores.nc','CRPS_Arc_Mar2023_Density');

% Mixed Ensemble;
mean_CRPS_Mixed_Mar2018 = ncread('CRPS_Scores.nc','CRPS_Mixed_Mar2018_Density');
mean_CRPS_Mixed_Mar2019 = ncread('CRPS_Scores.nc','CRPS_Mixed_Mar2019_Density');
mean_CRPS_Mixed_Mar2022 = ncread('CRPS_Scores.nc','CRPS_Mixed_Mar2022_Density');
mean_CRPS_Mixed_Mar2023 = ncread('CRPS_Scores.nc','CRPS_Mixed_Mar2023_Density');

%% Find mean of all March's;

% Get the number of columns in the dataset
num_columns = size(mean_CRPS_Default_Mar2018,2);

% Initialize arrays to store mean values for each dataset
mean_values_Default = zeros(1,num_columns);
mean_values_Arctic = zeros(1,num_columns);
mean_values_Mixed = zeros(1,num_columns);

% Loop through each column
for col = 1:num_columns
    % Calculate the mean value for Default
    mean_values_Default(col) = mean([mean_CRPS_Default_Mar2018(:,col),mean_CRPS_Default_Mar2019(:,col),mean_CRPS_Default_Mar2022(:,col),mean_CRPS_Default_Mar2023(:,col)]);
    % Calculate the mean value for Arctic
    mean_values_Arctic(col) = mean([mean_CRPS_Arctic_Mar2018(:,col),mean_CRPS_Arctic_Mar2019(:,col),mean_CRPS_Arctic_Mar2022(:,col),mean_CRPS_Arctic_Mar2023(:,col)]);
        % Calculate the mean value for Mixed
    mean_values_Mixed(col) = mean([mean_CRPS_Mixed_Mar2018(:,col),mean_CRPS_Mixed_Mar2019(:,col),mean_CRPS_Mixed_Mar2022(:,col),mean_CRPS_Mixed_Mar2023(:,col)]);
end

% Flp data and transpose to match dimensions with filenames
mean_values_Default = transpose(mean_values_Default); % Transpose the Default mean values
mean_values_Arctic = transpose(mean_values_Arctic); % Transpose the Arctic mean values
mean_values_Mixed = transpose(mean_values_Mixed);   % Transpose the Mixed mean values

% Associate CRPS scores with filenames
C = 1:120;  % Indices for Default filenames
A = 1:120;  % Indices for Arctic filenames
M = 1:120;  % Indices for Mixed filenames

% Concatenate filenames with mean values for Default dataset
filenames_mean_Default = cat(2, transpose(C), mean_values_Default);

% Concatenate filenames with mean values for Arctic dataset
filenames_mean_Arc = cat(2, transpose(A), mean_values_Arctic);

% Concatenate filenames with mean values for Mixed dataset
filenames_mean_Mixed = cat(2, transpose(M), mean_values_Mixed);

% Sort the rows of filenames_mean_Default based on the second column (mean values)
[sorted_Default, sortingIndexDefault] = sortrows(filenames_mean_Default, 2);

% Sort the rows of filenames_mean_Arc based on the second column (mean values)
[sorted_Arctic, sortingIndexArc] = sortrows(filenames_mean_Arc, 2);

% Sort the rows of filenames_mean_Mixed based on the second column (mean values)
[sorted_Mixed, sortingIndexMixed] = sortrows(filenames_mean_Mixed, 2);

% Rearrange filenames_Default according to the sorting order of mean values
sorted_filenames_Default = filenames_Default(sortingIndexDefault(:, 1), :);

% Rearrange filenames_Arctic according to the sorting order of mean values
sorted_filenames_Arc = filenames_Arctic(sortingIndexArc(:, 1), :);

% Rearrange filenames_Mixed according to the sorting order of mean values
sorted_filenames_Mixed = filenames_Mixed(sortingIndexMixed(:, 1), :);

%% FIGURE 8: Line Plot of CRPS Scores; 
figure (1);
plot(sorted_Default(:,2),'b','LineWidth',2);
hold on;
plot(sorted_Arctic(:,2),'r','LineWidth',2);
hold on;
plot(sorted_Mixed(:,2),'g','LineWidth',2);
hold on;
xlim([1 120]);
hold on;
ylim([70 160]);
hold on; 
ylabel('CRPS Score (kg m^-^3)','FontSize',14);
hold on;
xlabel('Ensemble Member');
legend('Default SVS2-Crocus Ensemble','Arctic SVS2-Crocus Ensemble','Mixed SVS2-Crocus Ensemble');

%% Extract the first 30 ensemble members for each dataset
sorted_filenames_Default = sorted_filenames_Default(1:30, 1);
sorted_filenames_Arc = sorted_filenames_Arc(1:30, 1);
sorted_filenames_Mixed = sorted_filenames_Mixed(1:30, 1);

% Split filenames into columns for Default dataset
Default_Split = cellfun(@(x) strsplit(x, '_'), sorted_filenames_Default, 'UniformOutput', false);
Default_Split_Filenames = vertcat(Default_Split{:});

% Indices of columns to delete
colsToDelete = [1, 2, 4, 5];

% Delete the specified columns
Default_Split_Filenames(:, colsToDelete) = [];

% Split filenames into columns for Arctic dataset
Arc_Split = cellfun(@(x) strsplit(x, '_'), sorted_filenames_Arc, 'UniformOutput', false);
Arc_Split_Filenames = vertcat(Arc_Split{:});

% Indices of columns to delete
colsToDelete = [1, 2, 4, 5];

% Delete the specified columns
Arc_Split_Filenames(:, colsToDelete) = [];

% Split filenames into columns for Mixed dataset
Mixed_Split = cellfun(@(x) strsplit(x, '_'), sorted_filenames_Mixed, 'UniformOutput', false);
Mixed_Split_Filenames = vertcat(Mixed_Split{:});

% Indices of columns to delete
colsToDelete = [1, 2, 4, 5];

% Delete the specified columns
Mixed_Split_Filenames(:, colsToDelete) = [];

% For each column, find unique values and their occurrences for Default dataset
uniqueValuesCell = cell(1, size(Default_Split_Filenames, 2));
occurrenceCountCell = cell(1, size(Default_Split_Filenames, 2));

for col = 1:size(Default_Split_Filenames, 2)
    uniqueValuesCell{col} = unique(Default_Split_Filenames(:, col));
    
    % Count occurrences for each unique value using a loop
    occurrenceCount = zeros(size(uniqueValuesCell{col}));
    for i = 1:numel(uniqueValuesCell{col})
        occurrenceCount(i) = sum(strcmp(uniqueValuesCell{col}{i}, Default_Split_Filenames(:, col)));
    end
    
    occurrenceCountCell{col} = occurrenceCount;
end

% Concatenate unique values with their occurrence counts for Default dataset
resultCell_Default = cellfun(@(u, c) strcat(u, {' ('}, cellfun(@num2str, num2cell(c), 'UniformOutput', false), {')'}), uniqueValuesCell, occurrenceCountCell, 'UniformOutput', false);

% Find the maximum length of occurrenceCountCell for padding
maxLen = max(cellfun(@numel, occurrenceCountCell));

% Pad shorter arrays with zeros using a loop
occurrenceCountPadded = cellfun(@(x) [x(:); zeros(maxLen - numel(x), 1)], occurrenceCountCell, 'UniformOutput', false);

% Convert padded cell array to matrix
occurrenceCountMatrix = cell2mat(occurrenceCountPadded);

% Sort each column individually in descending order
occurrenceCountMatrixSorted = zeros(size(occurrenceCountMatrix));
for col = 1:size(occurrenceCountMatrix, 2)
    [~, idx] = sort(occurrenceCountMatrix(:, col), 'descend');
    occurrenceCountMatrixSorted(:, col) = occurrenceCountMatrix(idx, col);
end

% Transpose the sorted occurrence count matrix for plotting
Final_Matrix_Default = occurrenceCountMatrixSorted';

% For each column, find unique values and their occurrences for Arctic dataset
uniqueValuesCell = cell(1, size(Arc_Split_Filenames, 2));
occurrenceCountCell = cell(1, size(Arc_Split_Filenames, 2));

for col = 1:size(Arc_Split_Filenames, 2)
    uniqueValuesCell{col} = unique(Arc_Split_Filenames(:, col));
    
    % Count occurrences using a loop
    occurrenceCount = zeros(size(uniqueValuesCell{col}));
    
    for i = 1:numel(uniqueValuesCell{col})
        occurrenceCount(i) = sum(strcmp(uniqueValuesCell{col}{i}, Arc_Split_Filenames(:, col)));
    end
    
    occurrenceCountCell{col} = occurrenceCount;
end

% Concatenate unique values and occurrence counts
resultCell_Arctic = cellfun(@(u, c) strcat(u, {' ('}, cellfun(@num2str, num2cell(c), 'UniformOutput', false), {')'}), uniqueValuesCell, occurrenceCountCell, 'UniformOutput', false);

% Find the maximum length of occurrenceCountCell
maxLen = max(cellfun(@numel, occurrenceCountCell));

% Pad shorter arrays with zeros using a loop
occurrenceCountPadded = cellfun(@(x) [x(:); zeros(maxLen - numel(x), 1)], occurrenceCountCell, 'UniformOutput', false);

% Convert padded cell array to matrix
occurrenceCountMatrix = cell2mat(occurrenceCountPadded);

% Sort each column individually
occurrenceCountMatrixSorted = zeros(size(occurrenceCountMatrix));

for col = 1:size(occurrenceCountMatrix, 2)
    [~, idx] = sort(occurrenceCountMatrix(:, col), 'descend');
    occurrenceCountMatrixSorted(:, col) = occurrenceCountMatrix(idx, col);
end

Final_Matrix_Arc = occurrenceCountMatrixSorted';

% For each column, find unique values and their occurrences for Mixed dataset
uniqueValuesCell = cell(1, size(Mixed_Split_Filenames, 2));
occurrenceCountCell = cell(1, size(Mixed_Split_Filenames, 2));

for col = 1:size(Arc_Split_Filenames, 2)
    uniqueValuesCell{col} = unique(Mixed_Split_Filenames(:, col));
    
    % Count occurrences using a loop
    occurrenceCount = zeros(size(uniqueValuesCell{col}));
    
    for i = 1:numel(uniqueValuesCell{col})
        occurrenceCount(i) = sum(strcmp(uniqueValuesCell{col}{i}, Mixed_Split_Filenames(:, col)));
    end
    
    occurrenceCountCell{col} = occurrenceCount;
end

% Concatenate unique values and occurrence counts
resultCell_Mixed = cellfun(@(u, c) strcat(u, {' ('}, cellfun(@num2str, num2cell(c), 'UniformOutput', false), {')'}), uniqueValuesCell, occurrenceCountCell, 'UniformOutput', false);

% Find the maximum length of occurrenceCountCell
maxLen = max(cellfun(@numel, occurrenceCountCell));

% Pad shorter arrays with zeros using a loop
occurrenceCountPadded = cellfun(@(x) [x(:); zeros(maxLen - numel(x), 1)], occurrenceCountCell, 'UniformOutput', false);

% Convert padded cell array to matrix
occurrenceCountMatrix = cell2mat(occurrenceCountPadded);

% Sort each column individually
occurrenceCountMatrixSorted = zeros(size(occurrenceCountMatrix));

for col = 1:size(occurrenceCountMatrix, 2)
    [~, idx] = sort(occurrenceCountMatrix(:, col), 'descend');
    occurrenceCountMatrixSorted(:, col) = occurrenceCountMatrix(idx, col);
end

Final_Matrix_Mixed = occurrenceCountMatrixSorted';

% FIGURE 9: Plot stacked bar chart for all columns of occurrenceCountMatrixSorted
figure;
subplot(3,1,1);
bar(Final_Matrix_Default(:,:), 'stacked', 'FaceColor', 'none', 'EdgeColor', 'k');
hold on;
xlabel('Process');
ylabel('Number of Occurence');
title('Default SVS2-Crocus Ensemble');
xt = get(gca, 'XTick');
set(gca, 'XTick', xt, 'XTickLabel', {'SD','FS','TC','LWC','C','TF'});

subplot(3,1,2);
bar(Final_Matrix_Mixed(:,:), 'stacked', 'FaceColor', 'none', 'EdgeColor', 'k');
xlabel('Process');
ylabel('Number of Occurence');
title('Mixed SVS2-Crocus Ensemble');
xt = get(gca, 'XTick');
set(gca, 'XTick', xt, 'XTickLabel', {'SD','FS','TC','LWC','C','TF'});

subplot(3,1,3);
bar(Final_Matrix_Arc(:,:), 'stacked', 'FaceColor', 'none', 'EdgeColor', 'k');
xlabel('Process');
ylabel('Number of Occurence');
title('Arctic SVS2-Crocus Ensemble');
xt = get(gca, 'XTick');
set(gca, 'XTick', xt, 'XTickLabel', {'SD','FS','TC','LWC','C','TF'});