%% Load in Default Ensemble Data;

Default_Mar2018 = ncread('Density_SSA_Profiles.nc','SSA_Default_Mar2018'); % March 2018;
Default_Nov2018 = ncread('Density_SSA_Profiles.nc','SSA_Default_Nov2018'); % November 2018; 
Default_Jan2019 = ncread('Density_SSA_Profiles.nc','SSA_Default_Jan2019'); % January 2019; 
Default_Mar2019 = ncread('Density_SSA_Profiles.nc','SSA_Default_Mar2019'); % March 2019;
Default_Mar2022 = ncread('Density_SSA_Profiles.nc','SSA_Default_Mar2022'); % March 2022; 
Default_Mar2023 = ncread('Density_SSA_Profiles.nc','SSA_Default_Mar2023'); % March 2023;

%% Load in Arctic Ensemble Data;

Arctic_Mar2018 = ncread('Density_SSA_Profiles.nc','SSA_Arctic_Mar2018'); % March 2018;
Arctic_Nov2018 = ncread('Density_SSA_Profiles.nc','SSA_Arctic_Nov2018'); % November 2018; 
Arctic_Jan2019 = ncread('Density_SSA_Profiles.nc','SSA_Arctic_Jan2019'); % January 2019; 
Arctic_Mar2019 = ncread('Density_SSA_Profiles.nc','SSA_Arctic_Mar2019'); % March 2019;
Arctic_Mar2022 = ncread('Density_SSA_Profiles.nc','SSA_Arctic_Mar2022'); % March 2022; 
Arctic_Mar2023 = ncread('Density_SSA_Profiles.nc','SSA_Arctic_Mar2023'); % March 2023;

%% Load in Mixed Ensemble Data;

Mixed_Mar2018 = ncread('Density_SSA_Profiles.nc','SSA_Mixed_Mar2018'); % March 2018;
% Mixed_Nov2018 = ncread('Density_SSA_Profiles.nc','SSA_Mixed_Nov2018'); % November 2018; 
% Mixed_Jan2019 = ncread('Density_SSA_Profiles.nc','SSA_Mixed_Jan2019'); % January 2019; 
Mixed_Mar2019 = ncread('Density_SSA_Profiles.nc','SSA_Mixed_Mar2019'); % March 2019;
Mixed_Mar2022 = ncread('Density_SSA_Profiles.nc','SSA_Mixed_Mar2022'); % March 2022; 
Mixed_Mar2023 = ncread('Density_SSA_Profiles.nc','SSA_Mixed_Mar2023'); % March 2023;

%% Load in Normalized Depths; 

Depths = ncread('Density_SSA_Profiles.nc','Normalized_depths'); % March 2018;
%% Load in Pit Profiles; 

% Specify the path to your netCDF file
filename = 'Measured_Density_SSA.nc';

% Get information about the variables in the netCDF file
info = ncinfo(filename);

% Loop through each variable in the file
for i = 1:numel(info.Variables)
    % Get the name of the current variable
    var_name = info.Variables(i).Name;
    
    % Read the data for the current variable
    data = ncread(filename, var_name);
    
    % Create a variable in the MATLAB workspace with the same name as the netCDF variable
    assignin('base', var_name, data);
end

%% Calculate Mean, Min and Max; 

% Loop through default variables and find statistical values
variables = {'Default_Mar2018', 'Default_Nov2018', 'Default_Jan2019','Default_Mar2019','Default_Mar2022','Default_Mar2023'};
for i = 1:numel(variables)
    % Create variable names for max, min, mean, median, and IQR
    max_variable_name = strcat('max_', variables{i});
    min_variable_name = strcat('min_', variables{i});
    mean_variable_name = strcat('mean_', variables{i});
    median_variable_name = strcat('median_', variables{i});
    IQR_75_variable_name = strcat('IQR_75_', variables{i});
    IQR_25_variable_name = strcat('IQR_25_', variables{i});

    % Find statistical values
    max_value = max(eval(variables{i}), [], 2);
    min_value = min(eval(variables{i}), [], 2);
    mean_value = mean(eval(variables{i}), 2, 'omitnan');
    median_value = median(eval(variables{i}), 2, 'omitnan');
    IQR_75_value = prctile(eval(variables{i}), 75, 2);
    IQR_25_value = prctile(eval(variables{i}), 25, 2);

    % Assign values to created variables
    eval([max_variable_name, ' = max_value;']);
    eval([min_variable_name, ' = min_value;']);
    eval([mean_variable_name, ' = mean_value;']);
    eval([median_variable_name, ' = median_value;']);
    eval([IQR_75_variable_name, ' = IQR_75_value;']);
    eval([IQR_25_variable_name, ' = IQR_25_value;']);
end

% Loop through Arctic variables and find statistical values
variables = {'Arctic_Mar2018', 'Arctic_Nov2018', 'Arctic_Jan2019','Arctic_Mar2019','Arctic_Mar2022','Arctic_Mar2023'};
for i = 1:numel(variables)
    % Create variable names for max, min, mean, median, and IQR
    max_variable_name = strcat('max_', variables{i});
    min_variable_name = strcat('min_', variables{i});
    mean_variable_name = strcat('mean_', variables{i});
    median_variable_name = strcat('median_', variables{i});
    IQR_75_variable_name = strcat('IQR_75_', variables{i});
    IQR_25_variable_name = strcat('IQR_25_', variables{i});

    % Find statistical values
    max_value = max(eval(variables{i}), [], 2);
    min_value = min(eval(variables{i}), [], 2);
    mean_value = mean(eval(variables{i}), 2, 'omitnan');
    median_value = median(eval(variables{i}), 2, 'omitnan');
    IQR_75_value = prctile(eval(variables{i}), 75, 2);
    IQR_25_value = prctile(eval(variables{i}), 25, 2);

    % Assign values to created variables
    eval([max_variable_name, ' = max_value;']);
    eval([min_variable_name, ' = min_value;']);
    eval([mean_variable_name, ' = mean_value;']);
    eval([median_variable_name, ' = median_value;']);
    eval([IQR_75_variable_name, ' = IQR_75_value;']);
    eval([IQR_25_variable_name, ' = IQR_25_value;']);
end

%% FIGURE 4: March SSA Profiles; 
figure(1);
t=tiledlayout(2,4);
t.TileSpacing='compact';
t.Padding='compact';

nexttile
stairs(SSA_a_Final_Pit_Mar2018(:,:),SSA_b_Final_Pit_Mar2018(:,:),'k','LineWidth',1);
ylabel('Normalized Depth');
xlim([0 60]);
xticks([0 10 20 30 40 50 60]);
xticklabels({'0','10','20','30','40','50','60'});
title('March 2018','FontSize',14);
legend('Pit Measurements');

nexttile
stairs(SSA_a_Final_Pit_Mar2019(:,:),SSA_b_Final_Pit_Mar2019(:,:),'k','LineWidth',1);
ylabel('Normalized Depth');
xlim([0 60]);
xticks([0 10 20 30 40 50 60]);
xticklabels({'0','10','20','30','40','50','60'});
title('March 2019','FontSize',14);

nexttile
stairs(SSA_a_Final_Pit_Mar2022(:,:),SSA_b_Final_Pit_Mar2022(:,:),'k','LineWidth',1);
ylabel('Normalized Depth');
xlim([0 60]);
xticks([0 10 20 30 40 50 60]);
xticklabels({'0','10','20','30','40','50','60'});
title('March 2022','FontSize',14);

nexttile
stairs(SSA_a_Final_Pit_Mar2023(:,:),SSA_b_Final_Pit_Mar2023(:,:),'k','LineWidth',1);
ylabel('Normalized Depth');
xlim([0 60]);
xticks([0 10 20 30 40 50 60]);
xticklabels({'0','10','20','30','40','50','60'});
title('March 2023','FontSize',14);

nexttile
jbfill(flipud(Depths(:,1))',IQR_75_Default_Mar2018(:,1)',IQR_25_Default_Mar2018(:,1)','b','b',1,0.2);
hold on;
plot(flipud(Depths(:,1)),median_Default_Mar2018,'b','LineWidth',2);
hold on;
jbfill(flipud(Depths(:,1))',IQR_75_Arctic_Mar2018',IQR_25_Arctic_Mar2018','r','r',1,0.2);
hold on;
plot(flipud(Depths(:,1)),median_Arctic_Mar2018,'r','LineWidth',2);
xlabel('Normalized Depth');
camroll(-90);
set(gca,'yticklabel',[]);
ylabel('SSA (m^2 kg m^-^2)');
ylim([0 60]);
yticks([0 10 20 30 40 50 60]);
yticklabels({'0','10','20','30','40','50','60'});
xlim([0 1]);
xticks([0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0]);
xticklabels({'1','0.9','0.8','0.7','0.6','0.5','0.4','0.3','0.2','0.1','0'});
legend('Default Ensemble','Default Ensemble Median','Arctic Ensemble','Arctic Ensemble Median');

nexttile
jbfill(flipud(Depths(:,1))',IQR_75_Default_Mar2019',IQR_25_Default_Mar2019','b','b',1,0.2);
hold on;
plot(flipud(Depths(:,1)),median_Default_Mar2019,'b','LineWidth',2);
hold on;
jbfill(flipud(Depths(:,1))',IQR_75_Arctic_Mar2019',IQR_25_Arctic_Mar2019','r','r',1,0.2);
hold on;
plot(flipud(Depths(:,1)),median_Arctic_Mar2019,'r','LineWidth',2);
xlabel('Normalized Depth');
camroll(-90);
set(gca,'yticklabel',[]);
ylabel('SSA (m^2 kg m^-^2)');
ylim([0 60]);
yticks([0 10 20 30 40 50 60]);
yticklabels({'0','10','20','30','40','50','60'});
xlim([0 1]);
xticks([0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0]);
xticklabels({'1','0.9','0.8','0.7','0.6','0.5','0.4','0.3','0.2','0.1','0'});

nexttile
jbfill(flipud(Depths(:,1))',IQR_75_Default_Mar2022(:,1)',IQR_25_Default_Mar2022(:,1)','b','b',1,0.2);
hold on;
plot(flipud(Depths(:,1)),median_Default_Mar2022,'b','LineWidth',2);
hold on;
jbfill(flipud(Depths(:,1))',IQR_75_Arctic_Mar2022',IQR_25_Arctic_Mar2022','r','r',1,0.2);
hold on;
plot(flipud(Depths(:,1)),median_Arctic_Mar2022,'r','LineWidth',2);
xlabel('Normalized Depth');
camroll(-90);
set(gca,'yticklabel',[]);
ylabel('SSA (m^2 kg m^-^2)');
ylim([0 60]);
yticks([0 10 20 30 40 50 60]);
yticklabels({'0','10','20','30','40','50','60'});
xlim([0 1]);
xticks([0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0]);
xticklabels({'1','0.9','0.8','0.7','0.6','0.5','0.4','0.3','0.2','0.1','0'});

nexttile
jbfill(flipud(Depths(:,1))',IQR_75_Default_Mar2023(:,1)',IQR_25_Default_Mar2023(:,1)','b','b',1,0.2);
hold on;
plot(flipud(Depths(:,1)),median_Default_Mar2023,'b','LineWidth',2);
hold on;
jbfill(flipud(Depths(:,1))',IQR_75_Arctic_Mar2023',IQR_25_Arctic_Mar2023','r','r',1,0.2);
hold on;
plot(flipud(Depths(:,1)),median_Arctic_Mar2023,'r','LineWidth',2);
hold on;
xlabel('Normalized Depth');
camroll(-90);
set(gca,'yticklabel',[]);
ylabel('SSA (m^2 kg m^-^2)');
ylim([0 60]);
yticks([0 10 20 30 40 50 60]);
yticklabels({'0','10','20','30','40','50','60'});
xlim([0 1]);
xticks([0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0]);
xticklabels({'1','0.9','0.8','0.7','0.6','0.5','0.4','0.3','0.2','0.1','0'});

%% FIGURE 6: Temporal SSA Profiles; 
figure(2);
t=tiledlayout(2,3);
t.TileSpacing='compact';
t.Padding='compact';

nexttile
stairs(SSA_a_Final_Pit_Nov2018(:,:),SSA_b_Final_Pit_Nov2018(:,:),'k','LineWidth',1);
ylabel('Normalized Depth');
ylim([0 1]);
xlim([0 60]);
xticks([0 10 20 30 40 50 60]);
xticklabels({'0','10','20','30','40','50','60'});
title('November 2018','FontSize',14);
legend('Pit Measurements');

nexttile
stairs(SSA_a_Final_Pit_Jan2019(:,:),SSA_b_Final_Pit_Jan2019(:,:),'k','LineWidth',1);
ylabel('Normalized Depth');
xlabel('SSA (m^2 kg m^-^2)');
xlim([0 60]);
xticks([0 10 20 30 40 50 60]);
xticklabels({'0','10','20','30','40','50','60'});
title('January 2019','FontSize',14);

nexttile
stairs(SSA_a_Final_Pit_Mar2019(:,:),SSA_b_Final_Pit_Mar2019(:,:),'k','LineWidth',1);
ylabel('Normalized Depth');
xlabel('SSA (m^2 kg m^-^2)');
xlim([0 60]);
xticks([0 10 20 30 40 50 60]);
xticklabels({'0','10','20','30','40','50','60'});
title('March 2019','FontSize',14);

nexttile
jbfill(flipud(Depths(:,1))',IQR_75_Default_Nov2018',IQR_25_Default_Nov2018','b','b',1,0.2);
hold on;
plot(flipud(Depths(:,1)),median_Default_Nov2018,'b','LineWidth',2);
hold on;
jbfill(flipud(Depths(:,1))',IQR_75_Arctic_Nov2018',IQR_25_Arctic_Nov2018','r','r',1,0.2);
hold on;
plot(flipud(Depths(:,1)),median_Arctic_Nov2018,'r','LineWidth',2);
xlabel('Normalized Depth');
camroll(-90);
set(gca,'yticklabel',[]);
xlabel('SSA (m^2 kg m^-^2)');
ylim([0 60]);
yticks([0 10 20 30 40 50 60]);
yticklabels({'0','10','20','30','40','50','60'});
xlim([0 1]);
xticks([0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0]);
xticklabels({'1','0.9','0.8','0.7','0.6','0.5','0.4','0.3','0.2','0.1','0'});
legend('Default Ensemble','Default Ensemble Median','Arctic Ensemble','Arctic Ensemble Median');

nexttile
jbfill(flipud(Depths(:,1))',IQR_75_Default_Jan2019',IQR_25_Default_Jan2019','b','b',1,0.2);
hold on;
plot(flipud(Depths(:,1)),median_Default_Jan2019,'b','LineWidth',2);
hold on;
jbfill(flipud(Depths(:,1))',IQR_75_Arctic_Jan2019',IQR_25_Arctic_Jan2019','r','r',1,0.2);
hold on;
plot(flipud(Depths(:,1)),median_Arctic_Jan2019,'r','LineWidth',2);
xlabel('Normalized Depth');
camroll(-90);
set(gca,'yticklabel',[]);
ylabel('SSA (m^2 kg m^-^2)');
ylim([0 60]);
yticks([0 10 20 30 40 50 60]);
yticklabels({'0','10','20','30','40','50','60'});
xlim([0 1]);
xticks([0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0]);
xticklabels({'1','0.9','0.8','0.7','0.6','0.5','0.4','0.3','0.2','0.1','0'});

nexttile
jbfill(flipud(Depths(:,1))',IQR_75_Default_Mar2019',IQR_25_Default_Mar2019','b','b',1,0.2);
hold on;
plot(flipud(Depths(:,1)),median_Default_Mar2019,'b','LineWidth',2);
hold on;
jbfill(flipud(Depths(:,1))',IQR_75_Arctic_Mar2019',IQR_25_Arctic_Mar2019','r','r',1,0.2);
hold on;
plot(flipud(Depths(:,1)),median_Arctic_Mar2019,'r','LineWidth',2);
xlabel('Normalized Depth');
camroll(-90);
set(gca,'yticklabel',[]);
ylabel('SSA (m^2 kg m^-^2)');
ylim([0 60]);
yticks([0 10 20 30 40 50 60]);
yticklabels({'0','10','20','30','40','50','60'});
xlim([0 1]);
xticks([0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0]);
xticklabels({'1','0.9','0.8','0.7','0.6','0.5','0.4','0.3','0.2','0.1','0'});

