%% Load in SR50 measured snow depth data; 

load('SR50_Measured.mat'); % Load in measured dataset;

%% Load in Ensemble Data; 

% SWE (mm); 
Arctic_SWE = ncread('Raw_SD_SWE_BD.nc','Arctic_SWE_Data');
Default_SWE = ncread('Raw_SD_SWE_BD.nc','Default_SWE_Data');

% Snow Depth (m); 
Arctic_SD = ncread('Raw_SD_SWE_BD.nc','Arctic_SD_Data');
Default_SD = ncread('Raw_SD_SWE_BD.nc','Default_SD_Data');

% Bulk Density (kg m-3); 
Arctic_BD = ncread('Raw_SD_SWE_BD.nc','Arctic_BD_Data');
Default_BD = ncread('Raw_SD_SWE_BD.nc','Default_BD_Data');

% Time;
Time = ncread('Raw_SD_SWE_BD.nc','Time');

%% Find Max and Min Values of the Ensemble (SWE); 

% Default Ensemble; 
Max_SWE_Default=max(Default_SWE,[],2); % Max of Default;
Min_SWE_Default=min(Default_SWE,[],2); % Min of Default;
Mean_SWE_Default=mean(Default_SWE,2,'omitnan'); % Mean of Default;
Median_SWE_Default=median(Default_SWE,2,'omitnan'); % Median of Default; 

% Arctic Ensemble;
Max_SWE_Arctic=max(Arctic_SWE,[],2); % Max of Arctic;
Min_SWE_Arctic=min(Arctic_SWE,[],2); % Min of Arctic;
Mean_SWE_Arctic=mean(Arctic_SWE,2,'omitnan'); % Mean of Arctic;
Median_SWE_Arctic=median(Arctic_SWE,2,'omitnan'); % Median of Arctic;

%% Find Max and Min Values of the Ensemble (Snow Depth); 

% Default Ensemble; 
Max_SD_Default=max(Default_SD,[],2); % Max of Default;
Min_SD_Default=min(Default_SD,[],2); % Min of Default;
Mean_SD_Default=mean(Default_SD,2,'omitnan'); % Mean of Default;
Median_SD_Default=median(Default_SD,2,'omitnan'); % Median of Default; 

% Arctic Ensemble; 
Max_SD_Arctic=max(Arctic_SD,[],2); % Max of Arctic;
Min_SD_Arctic=min(Arctic_SD,[],2); % Min of Arctic;
Mean_SD_Arctic=mean(Arctic_SD,2,'omitnan'); % Mean of Arctic;
Median_SD_Arctic=median(Arctic_SD,2,'omitnan'); % Median of Arctic; 

%% Find Max and Min Values of the Ensemble (Bulk Density); 

% Default Ensemble; 
Max_BD_Default=max(Default_BD,[],2); % Max of Default;
Min_BD_Default=min(Default_BD,[],2); % Min of Default;
Mean_BD_Default=mean(Default_BD,2,'omitnan'); % Mean of Default;
Median_BD_Default=median(Default_BD,2,'omitnan'); % Median of Default; 

% Arctic Ensemble; 
Max_BD_Arctic=max(Arctic_BD,[],2); % Max of Arctic;
Min_BD_Arctic=min(Arctic_BD,[],2); % Min of Arctic;
Mean_BD_Arctic=mean(Arctic_BD,2,'omitnan'); % Mean of Arctic;
Median_BD_Arctic=median(Arctic_BD,2,'omitnan'); % Median of Arctic;

%% Subset time periods for plotting; 
time=Time(1:8760,:); % Find timestamps for Ensemble;
time2=Time(1:8784,:);
time1=Time(1:8777,:);
time_end=Time(1:8767,:);

%% APPENDIX A1: Plot Snow Depth Figure; 
% Snow Depth (32 years 1991-2023); 
figure(1); t=tiledlayout(8,4);% 1991;
t.TileSpacing='compact';
t.Padding='compact';

nexttile
jbfill(time1',Max_SD_Default(1:8777,:)',Min_SD_Default(1:8777,:)','b','b',0,0.5);
hold on;
jbfill(time1',Max_SD_Arctic(1:8777,:)',Min_SD_Arctic(1:8777,:)','r','r',0,0.5);
hold on;
plot(Median_SD_Default(1:8777,1),'b','LineWidth',2);
hold on;
plot(Median_SD_Arctic(1:8777,1),'r','LineWidth',2);
hold on;
plot(SD_Measured(1:8777,:),'k','LineWidth',2);
hold on;
plot(5766,0.54,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylabel('SD (m)');
ylim([0 1.5]);
xlim([0 8784]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('1991/92');

nexttile
jbfill(time',Max_SD_Default(8778:17537,:)',Min_SD_Default(8778:17537,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_SD_Arctic(8778:17537,:)',Min_SD_Arctic(8778:17537,:)','r','r',0,0.5);
hold on;
plot(SD_Measured(8778:17537,:),'k','LineWidth',2);
hold on;
plot(Median_SD_Default(8778:17537,1),'b','LineWidth',2);
hold on;
plot(Median_SD_Arctic(8778:17537,1),'r','LineWidth',2);
hold on;
ylim([0 1.5]);
plot(5725,0.45,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('1992/93');

nexttile
jbfill(time',Max_SD_Default(17538:26297,:)',Min_SD_Default(17538:26297,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_SD_Arctic(17538:26297,:)',Min_SD_Arctic(17538:26297,:)','r','r',0,0.5);
hold on;
plot(SD_Measured(17538:26297,:),'k','LineWidth',2);
hold on;
plot(Median_SD_Default(17538:26297,1),'b','LineWidth',2);
hold on;
plot(Median_SD_Arctic(17538:26297,1),'r','LineWidth',2);
plot(5893,0.41,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylim([0 1.5]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('1993/94');

nexttile
jbfill(time',Max_SD_Default(26298:35057,:)',Min_SD_Default(26298:35057,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_SD_Arctic(26298:35057,:)',Min_SD_Arctic(26298:35057,:)','r','r',0,0.5);
hold on;
plot(SD_Measured(26298:35057,:),'k','LineWidth',2);
hold on;
plot(Median_SD_Default(26298:35057,1),'b','LineWidth',2);
hold on;
plot(Median_SD_Arctic(26298:35057,1),'r','LineWidth',2);
ylim([0 1.5]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('1994/95');

nexttile
jbfill(time2',Max_SD_Default(35058:43841,:)',Min_SD_Default(35058:43841,:)','b','b',0,0.5);
hold on;
jbfill(time2',Max_SD_Arctic(35058:43841,:)',Min_SD_Arctic(35058:43841,:)','r','r',0,0.5);
hold on;
plot(SD_Measured(35058:43841,:),'k','LineWidth',2);
hold on;
plot(Median_SD_Default(35058:43841,1),'b','LineWidth',2);
hold on;
plot(Median_SD_Arctic(35058:43841,1),'r','LineWidth',2);
plot(5413,0.39,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylabel('SD (m)');
ylim([0 1.5]);
xlim([0 8784]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('1995/96');

nexttile
jbfill(time',Max_SD_Default(43842:52601,:)',Min_SD_Default(43842:52601,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_SD_Arctic(43842:52601,:)',Min_SD_Arctic(43842:52601,:)','r','r',0,0.5);
hold on;
plot(SD_Measured(43842:52601,:),'k','LineWidth',2);
hold on;
plot(Median_SD_Default(43842:52601,1),'b','LineWidth',2);
hold on;
plot(Median_SD_Arctic(43842:52601,1),'r','LineWidth',2);
hold on;
plot(5605,0.37,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylim([0 1.5]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('1996/97');

nexttile
jbfill(time',Max_SD_Default(52602:61361,:)',Min_SD_Default(52602:61361,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_SD_Arctic(52602:61361,:)',Min_SD_Arctic(52602:61361,:)','r','r',0,0.5);
hold on;
plot(SD_Measured(52602:61361,:),'k','LineWidth',2);
hold on;
plot(Median_SD_Default(52602:61361,1),'b','LineWidth',2);
hold on;
plot(Median_SD_Arctic(52602:61361,1),'r','LineWidth',2);
plot(4549,0.32,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylim([0 1.5]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('1997/98');

nexttile
jbfill(time',Max_SD_Default(61362:70121,:)',Min_SD_Default(61362:70121,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_SD_Arctic(61362:70121,:)',Min_SD_Arctic(61362:70121,:)','r','r',0,0.5);
hold on;
plot(SD_Measured(61362:70121,:),'k','LineWidth',2);
hold on;
plot(Median_SD_Default(61362:70121,1),'b','LineWidth',2);
hold on;
plot(Median_SD_Arctic(61362:70121,1),'r','LineWidth',2);
hold on; 
plot(5581,0.44,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
xlim([0 8760]);
ylim([0 1.5]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('1998/99');

nexttile
jbfill(time2',Max_SD_Default(70122:78905,:)',Min_SD_Default(70122:78905,:)','b','b',0,0.5);
hold on;
jbfill(time2',Max_SD_Arctic(70122:78905,:)',Min_SD_Arctic(70122:78905,:)','r','r',0,0.5);
hold on;
plot(SD_Measured(70122:78905,:),'k','LineWidth',2);
hold on;
plot(Median_SD_Default(70122:78905,1),'b','LineWidth',2);
hold on;
plot(Median_SD_Arctic(70122:78905,1),'r','LineWidth',2);
hold on;
plot(5437,0.62,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
xlim([0 8784]);
xticks([0 2185 4345 6553 8784]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
ylim([0 1.5]);
title('1999/00');
ylabel('SD (m)');

nexttile
jbfill(time',Max_SD_Default(78906:87665,:)',Min_SD_Default(78906:87665,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_SD_Arctic(78906:87665,:)',Min_SD_Arctic(78906:87665,:)','r','r',0,0.5);
hold on;
plot(SD_Measured(78906:87665,:),'k','LineWidth',2);
hold on;
plot(Median_SD_Default(78906:87665,1),'b','LineWidth',2);
hold on;
plot(Median_SD_Arctic(78906:87665,1),'r','LineWidth',2);
hold on;
plot(5677,0.57,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
ylim([0 1.5]);
title('2000/01');

nexttile
jbfill(time',Max_SD_Default(87666:96425,:)',Min_SD_Default(87666:96425,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_SD_Arctic(87666:96425,:)',Min_SD_Arctic(87666:96425,:)','r','r',0,0.5);
hold on;
plot(SD_Measured(87666:96425,:),'k','LineWidth',2);
hold on;
plot(Median_SD_Default(87666:96425,1),'b','LineWidth',2);
hold on;
plot(Median_SD_Arctic(87666:96425,1),'r','LineWidth',2);
hold on;
plot(5653,0.41,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
ylim([0 1.5]);
title('2001/02');

nexttile
jbfill(time',Max_SD_Default(96426:105185,:)',Min_SD_Default(96426:105185,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_SD_Arctic(96426:105185,:)',Min_SD_Arctic(96426:105185,:)','r','r',0,0.5);
hold on;
plot(SD_Measured(96426:105185,:),'k','LineWidth',2);
hold on;
plot(Median_SD_Default(96426:105185,1),'b','LineWidth',2);
hold on;
plot(Median_SD_Arctic(96426:105185,1),'r','LineWidth',2);
hold on;
plot(5341,0.43,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
ylim([0 1.5]);
title('2002/03');

nexttile
jbfill(time2',Max_SD_Default(105186:113969,:)',Min_SD_Default(105186:113969,:)','b','b',0,0.5);
hold on;
jbfill(time2',Max_SD_Arctic(105186:113969,:)',Min_SD_Arctic(105186:113969,:)','r','r',0,0.5);
hold on;
plot(SD_Measured(105186:113969,:),'k','LineWidth',2);
hold on;
plot(Median_SD_Default(105186:113969,1),'b','LineWidth',2);
hold on;
plot(Median_SD_Arctic(105186:113969,1),'r','LineWidth',2);
hold on;
plot(5725,0.50,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
xlim([0 8784]);
xticks([0 2185 4345 6553 8784]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
ylim([0 1.5]);
title('2003/04');
ylabel('SD (m)');

nexttile
jbfill(time',Max_SD_Default(113970:122729,:)',Min_SD_Default(113970:122729,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_SD_Arctic(113970:122729,:)',Min_SD_Arctic(113970:122729,:)','r','r',0,0.5);
hold on;
plot(SD_Measured(113970:122729,:),'k','LineWidth',2);
hold on;
plot(Median_SD_Default(113970:122729,1),'b','LineWidth',2);
hold on;
plot(Median_SD_Arctic(113970:122729,1),'r','LineWidth',2);
hold on;
plot(5509,0.37,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
ylim([0 1.5]);
title('2004/05');

nexttile
jbfill(time',Max_SD_Default(122730:131489,:)',Min_SD_Default(122730:131489,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_SD_Arctic(122737:131496,:)',Min_SD_Arctic(122730:131489,:)','r','r',0,0.5);
hold on;
plot(SD_Measured(122730:131489,:),'k','LineWidth',2);
hold on;
plot(Median_SD_Default(122730:131489,1),'b','LineWidth',2);
hold on;
plot(Median_SD_Arctic(122730:131489,1),'r','LineWidth',2);
hold on;
plot(5581,0.71,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
ylim([0 1.5]);
title('2005/06');

nexttile
jbfill(time',Max_SD_Default(131490:140249,:)',Min_SD_Default(131490:140249,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_SD_Arctic(131490:140249,:)',Min_SD_Arctic(131490:140249,:)','r','r',0,0.5);
hold on;
plot(SD_Measured(131490:140249,:),'k','LineWidth',2);
hold on;
plot(Median_SD_Default(131490:140249,1),'b','LineWidth',2);
hold on;
plot(Median_SD_Arctic(131490:140249,1),'r','LineWidth',2);
hold on;
plot(5509,0.40,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
ylim([0 1.5]);
title('2006/07');

nexttile
jbfill(time2',Max_SD_Default(140250:149033,:)',Min_SD_Default(140250:149033,:)','b','b',0,0.5);
hold on;
jbfill(time2',Max_SD_Arctic(140250:149033,:)',Min_SD_Arctic(140250:149033,:)','r','r',0,0.5);
hold on;
plot(SD_Measured(140250:149033,:),'k','LineWidth',2);
hold on;
plot(Median_SD_Default(140250:149033,1),'b','LineWidth',2);
hold on;
plot(Median_SD_Arctic(140250:149033,1),'r','LineWidth',2);
hold on;
plot(5557,0.47,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
xlim([0 8784]);
xticks([0 2185 4345 6553 8784]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
ylim([0 1.5]);
title('2007/08');
ylabel('SD (m)');

nexttile
jbfill(time',Max_SD_Default(149034:157793,:)',Min_SD_Default(149034:157793,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_SD_Arctic(149034:157793,:)',Min_SD_Arctic(149034:157793,:)','r','r',0,0.5);
hold on;
plot(SD_Measured(149034:157793,:),'k','LineWidth',2);
hold on;
plot(Median_SD_Default(149034:157793,1),'b','LineWidth',2);
hold on;
plot(Median_SD_Arctic(149034:157793,1),'r','LineWidth',2);
plot(5581,0.50,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
ylim([0 1.5]);
title('2008/09');

nexttile
jbfill(time',Max_SD_Default(157794:166553,:)',Min_SD_Default(157794:166553,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_SD_Arctic(157794:166553,:)',Min_SD_Arctic(157794:166553,:)','r','r',0,0.5);
hold on;
plot(SD_Measured(157794:166553,:),'k','LineWidth',2);
hold on;
plot(Median_SD_Default(157794:166553,1),'b','LineWidth',2);
hold on;
plot(Median_SD_Arctic(157794:166553,1),'r','LineWidth',2);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
ylim([0 1.5]);
title('2009/10');

nexttile
jbfill(time',Max_SD_Default(166554:175313,:)',Min_SD_Default(166554:175313,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_SD_Arctic(166554:175313,:)',Min_SD_Arctic(166554:175313,:)','r','r',0,0.5);
hold on;
plot(SD_Measured(166554:175313,:),'k','LineWidth',2);
hold on;
plot(Median_SD_Default(166554:175313,1),'b','LineWidth',2);
hold on;
plot(Median_SD_Arctic(166554:175313,1),'r','LineWidth',2);
hold on;
plot(5437,0.45,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
ylim([0 1.5]);
title('2010/11');

nexttile
jbfill(time2',Max_SD_Default(175314:184097,:)',Min_SD_Default(175314:184097,:)','b','b',0,0.5);
hold on;
jbfill(time2',Max_SD_Arctic(175314:184097,:)',Min_SD_Arctic(175314:184097,:)','r','r',0,0.5);
hold on;
plot(SD_Measured(175314:184097,:),'k','LineWidth',2);
hold on;
plot(Median_SD_Default(175314:184097,1),'b','LineWidth',2);
hold on;
plot(Median_SD_Arctic(175314:184097,1),'r','LineWidth',2);
hold on;
plot(5533,0.38,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
xlim([0 8784]);
xticks([0 2185 4345 6553 8784]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
ylim([0 1.5]);
title('2011/12');
ylabel('SD (m)');

nexttile
jbfill(time',Max_SD_Default(184098:192857,:)',Min_SD_Default(184098:192857,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_SD_Arctic(184098:192857,:)',Min_SD_Arctic(184098:192857,:)','r','r',0,0.5);
hold on;
plot(SD_Measured(184098:192857,:),'k','LineWidth',2);
hold on;
plot(Median_SD_Default(184098:192857,1),'b','LineWidth',2);
hold on;
plot(Median_SD_Arctic(184098:192857,1),'r','LineWidth',2);
hold on;
plot(5557,0.58,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylim([0 1.5]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('2012/13');

nexttile
jbfill(time',Max_SD_Default(192858:201617,:)',Min_SD_Default(192858:201617,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_SD_Arctic(192858:201617,:)',Min_SD_Arctic(192858:201617,:)','r','r',0,0.5);
hold on;
plot(SD_Measured(192858:201617,:),'k','LineWidth',2);
hold on;
plot(Median_SD_Default(192858:201617,1),'b','LineWidth',2);
hold on;
plot(Median_SD_Arctic(192858:201617,1),'r','LineWidth',2);
hold on;
plot(5677,0.40,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylim([0 1.5]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('2013/14');

nexttile;
jbfill(time',Max_SD_Default(201618:210377,:)',Min_SD_Default(201618:210377,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_SD_Arctic(201618:210377,:)',Min_SD_Arctic(201618:210377,:)','r','r',0,0.5);
hold on;
plot(SD_Measured(201618:210377,:),'k','LineWidth',2);
hold on;
plot(Median_SD_Default(201618:210377,1),'b','LineWidth',2);
hold on;
plot(Median_SD_Arctic(201618:210377,1),'r','LineWidth',2);
hold on;
plot(5677,0.38,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylim([0 1.5]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('2014/15');

nexttile
jbfill(time2',Max_SD_Default(210378:219161,:)',Min_SD_Default(210378:219161,:)','b','b',0,0.5);
hold on;
jbfill(time2',Max_SD_Arctic(210378:219161,:)',Min_SD_Arctic(210378:219161,:)','r','r',0,0.5);
hold on;
plot(SD_Measured(210378:219161,:),'k','LineWidth',2);
hold on;
plot(Median_SD_Default(210378:219161,1),'b','LineWidth',2);
hold on;
plot(Median_SD_Arctic(210378:219161,1),'r','LineWidth',2);
hold on;
plot(5677,0.46,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylim([0 1.5]);
xlim([0 8784]);
xticks([0 2185 4345 6553 8784]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('2015/16');
ylabel('SD (m)');

nexttile
jbfill(time',Max_SD_Default(219162:227921,:)',Min_SD_Default(219162:227921,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_SD_Arctic(219162:227921,:)',Min_SD_Arctic(219162:227921,:)','r','r',0,0.5);
hold on;
plot(SD_Measured(219162:227921,:),'k','LineWidth',2);
hold on;
plot(Median_SD_Default(219162:227921,1),'b','LineWidth',2);
hold on;
plot(Median_SD_Arctic(219162:227921,1),'r','LineWidth',2);
hold on;
plot(5629,0.42,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylim([0 1.5]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('2016/17');

nexttile;
jbfill(time',Max_SD_Default(227922:236681,:)',Min_SD_Default(227922:236681,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_SD_Arctic(227922:236681,:)',Min_SD_Arctic(227922:236681,:)','r','r',0,0.5);
hold on;
plot(SD_Measured(227922:236681,:),'k','LineWidth',2);
hold on;
plot(Median_SD_Default(227922:236681,1),'b','LineWidth',2);
hold on;
plot(Median_SD_Arctic(227922:236681,1),'r','LineWidth',2);
hold on;
plot(5605,0.42,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
ylim([0 1.5]);
title('2017/18');

nexttile
jbfill(time',Max_SD_Default(236682:245441,:)',Min_SD_Default(236682:245441,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_SD_Arctic(236682:245441,:)',Min_SD_Arctic(236682:245441,:)','r','r',0,0.5);
hold on;
plot(SD_Measured(236682:245441,:),'k','LineWidth',2);
hold on;
plot(Median_SD_Default(236682:245441,1),'b','LineWidth',2);
hold on;
plot(Median_SD_Arctic(236682:245441,1),'r','LineWidth',2);
hold on;
plot(5701,0.44,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
ylim([0 1.5]);
title('2018/19');

nexttile
jbfill(time2',Max_SD_Default(245442:254225,:)',Min_SD_Default(245442:254225,:)','b','b',0,0.5);
hold on;
jbfill(time2',Max_SD_Arctic(245442:254225,:)',Min_SD_Arctic(245442:254225,:)','r','r',0,0.5);
hold on;
plot(SD_Measured(245442:254225,:),'k','LineWidth',2);
hold on;
plot(Median_SD_Default(245442:254225,1),'b','LineWidth',2);
hold on;
plot(Median_SD_Arctic(245442:254225,1),'r','LineWidth',2);
hold on;
ylabel('SD (m)');
xlim([0 8784]);
xticks([0 2185 4345 6553 8784]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
ylim([0 1.5]);
title('2019/20');
xlabel('Year');

nexttile
jbfill(time',Max_SD_Default(254226:262985,:)',Min_SD_Default(254226:262985,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_SD_Arctic(254226:262985,:)',Min_SD_Arctic(254226:262985,:)','r','r',0,0.5);
hold on;
plot(SD_Measured(254226:262985,:),'k','LineWidth',2);
hold on;
plot(Median_SD_Default(254226:262985,1),'b','LineWidth',2);
hold on;
plot(Median_SD_Arctic(254226:262985,1),'r','LineWidth',2);
hold on;
plot(5605,0.32,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
ylim([0 1.5]);
title('2020/21');
xlabel('Year');

nexttile
jbfill(time',Max_SD_Default(262986:271745,:)',Min_SD_Default(262986:271745,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_SD_Arctic(262986:271745,:)',Min_SD_Arctic(262986:271745,:)','r','r',0,0.5);
hold on;
plot(SD_Measured(262986:271745,:),'k','LineWidth',2);
hold on;
plot(Median_SD_Default(262986:271745,1),'b','LineWidth',2);
hold on;
plot(Median_SD_Arctic(262986:271745,1),'r','LineWidth',2);
hold on;
plot(4885,0.35,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
ylim([0 1.5]);
title('2021/22');
xlabel('Year');

nexttile
jbfill(time_end',Max_SD_Default(271746:end,:)',Min_SD_Default(271746:end,:)','b','b',0,0.5);
hold on;
jbfill(time_end',Max_SD_Arctic(271746:end,:)',Min_SD_Arctic(271746:end,:)','r','r',0,0.5);
hold on;
plot(SD_Measured(271746:end,:),'k','LineWidth',2);
hold on;
plot(Median_SD_Default(271746:end,:),'b','LineWidth',2);
hold on;
plot(Median_SD_Arctic(271746:end,:),'r','LineWidth',2);
hold on;
plot(5677,0.47,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
xlim([0 8767]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
ylim([0 1.5]);
title('2022/23');
xlabel('Year');

%% APPENDIX A2: Plot SWE Figure; 
% Snow Depth (32 years 1998-2023); 
figure(2); t=tiledlayout(8,4);% 1991;
t.TileSpacing='compact';
t.Padding='compact';

nexttile
jbfill(time1',Max_SWE_Default(1:8777,:)',Min_SWE_Default(1:8777,:)','b','b',0,0.5);
hold on;
jbfill(time1',Max_SWE_Arctic(1:8777,:)',Min_SWE_Arctic(1:8777,:)','r','r',0,0.5);
hold on;
plot(Median_SWE_Default(1:8777,1),'b','LineWidth',2);
hold on;
plot(Median_SWE_Arctic(1:8777,1),'r','LineWidth',2);
hold on;
plot(5766,186,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylabel('SWE (mm)');
ylim([0 250]);
xlim([0 8784]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('1991/92');
legend('Default Ensemble','Arctic Ensemble','Default Ensemble Median','Arctic Ensemble Median','Snow Course Measurements');

nexttile
jbfill(time',Max_SWE_Default(8778:17537,:)',Min_SWE_Default(8778:17537,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_SWE_Arctic(8778:17537,:)',Min_SWE_Arctic(8778:17537,:)','r','r',0,0.5);
hold on;
plot(Median_SWE_Default(8778:17537,1),'b','LineWidth',2);
hold on;
plot(Median_SWE_Arctic(8778:17537,1),'r','LineWidth',2);
hold on;
plot(5725,73,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylim([0 250]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('1992/93');

nexttile
jbfill(time',Max_SWE_Default(17538:26297,:)',Min_SWE_Default(17538:26297,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_SWE_Arctic(17538:26297,:)',Min_SWE_Arctic(17538:26297,:)','r','r',0,0.5);
hold on;
plot(Median_SWE_Default(17538:26297,1),'b','LineWidth',2);
hold on;
plot(Median_SWE_Arctic(17538:26297,1),'r','LineWidth',2);
hold on;
plot(5893,88,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylim([0 250]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('1993/94');

nexttile
jbfill(time',Max_SWE_Default(26298:35057,:)',Min_SWE_Default(26298:35057,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_SWE_Arctic(26298:35057,:)',Min_SWE_Arctic(26298:35057,:)','r','r',0,0.5);
hold on;
plot(Median_SWE_Default(26298:35057,1),'b','LineWidth',2);
hold on;
plot(Median_SWE_Arctic(26298:35057,1),'r','LineWidth',2);
ylim([0 250]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('1994/95');

nexttile
jbfill(time2',Max_SWE_Default(35058:43841,:)',Min_SWE_Default(35058:43841,:)','b','b',0,0.5);
hold on;
jbfill(time2',Max_SWE_Arctic(35058:43841,:)',Min_SWE_Arctic(35058:43841,:)','r','r',0,0.5);
hold on;
plot(Median_SWE_Default(35058:43841,1),'b','LineWidth',2);
hold on;
plot(Median_SWE_Arctic(35058:43841,1),'r','LineWidth',2);
hold on;
plot(5413,58,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylabel('SWE (mm)');
ylim([0 250]);
xlim([0 8784]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('1995/96');

nexttile
jbfill(time',Max_SWE_Default(43842:52601,:)',Min_SWE_Default(43842:52601,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_SWE_Arctic(43842:52601,:)',Min_SWE_Arctic(43842:52601,:)','r','r',0,0.5);
hold on;
plot(Median_SWE_Default(43842:52601,1),'b','LineWidth',2);
hold on;
plot(Median_SWE_Arctic(43842:52601,1),'r','LineWidth',2);
hold on;
plot(5605,86,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylim([0 250]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('1996/97');

nexttile
jbfill(time',Max_SWE_Default(52602:61361,:)',Min_SWE_Default(52602:61361,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_SWE_Arctic(52602:61361,:)',Min_SWE_Arctic(52602:61361,:)','r','r',0,0.5);
hold on;
plot(Median_SWE_Default(52602:61361,1),'b','LineWidth',2);
hold on;
plot(Median_SWE_Arctic(52602:61361,1),'r','LineWidth',2);
hold on;
plot(4549,90,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylim([0 250]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('1997/98');

nexttile
jbfill(time',Max_SWE_Default(61362:70121,:)',Min_SWE_Default(61362:70121,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_SWE_Arctic(61362:70121,:)',Min_SWE_Arctic(61362:70121,:)','r','r',0,0.5);
hold on;
plot(Median_SWE_Default(61362:70121,1),'b','LineWidth',2);
hold on;
plot(Median_SWE_Arctic(61362:70121,1),'r','LineWidth',2);
hold on;
plot(5581,105,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylim([0 250]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('1998/99');

nexttile
jbfill(time2',Max_SWE_Default(70122:78905,:)',Min_SWE_Default(70122:78905,:)','b','b',0,0.5);
hold on;
jbfill(time2',Max_SWE_Arctic(70122:78905,:)',Min_SWE_Arctic(70122:78905,:)','r','r',0,0.5);
hold on;
plot(Median_SWE_Default(70122:78905,1),'b','LineWidth',2);
hold on;
plot(Median_SWE_Arctic(70122:78905,1),'r','LineWidth',2);
hold on;
plot(5437,151,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylabel('SWE (mm)');
ylim([0 250]);
xlim([0 8784]);
xticks([0 2185 4345 6553 8784]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('1999/00');

nexttile
jbfill(time',Max_SWE_Default(78906:87665,:)',Min_SWE_Default(78906:87665,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_SWE_Arctic(78906:87665,:)',Min_SWE_Arctic(78906:87665,:)','r','r',0,0.5);
hold on;
plot(Median_SWE_Default(78906:87665,1),'b','LineWidth',2);
hold on;
plot(Median_SWE_Arctic(78906:87665,1),'r','LineWidth',2);
hold on;
plot(5677,118,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylim([0 250]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('2000/01');

nexttile
jbfill(time',Max_SWE_Default(87666:96425,:)',Min_SWE_Default(87666:96425,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_SWE_Arctic(87666:96425,:)',Min_SWE_Arctic(87666:96425,:)','r','r',0,0.5);
hold on;
plot(Median_SWE_Default(87666:96425,1),'b','LineWidth',2);
hold on;
plot(Median_SWE_Arctic(87666:96425,1),'r','LineWidth',2);
hold on;
plot(5653,111,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylim([0 250]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('2001/02');

nexttile
jbfill(time',Max_SWE_Default(96426:105185,:)',Min_SWE_Default(96426:105185,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_SWE_Arctic(96426:105185,:)',Min_SWE_Arctic(96426:105185,:)','r','r',0,0.5);
hold on;
plot(Median_SWE_Default(96426:105185,1),'b','LineWidth',2);
hold on;
plot(Median_SWE_Arctic(96426:105185,1),'r','LineWidth',2);
hold on;
plot(5341,104,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylim([0 250]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('2002/03');

nexttile
jbfill(time2',Max_SWE_Default(105186:113969,:)',Min_SWE_Default(105186:113969,:)','b','b',0,0.5);
hold on;
jbfill(time2',Max_SWE_Arctic(105186:113969,:)',Min_SWE_Arctic(105186:113969,:)','r','r',0,0.5);
hold on;
plot(Median_SWE_Default(105186:113969,1),'b','LineWidth',2);
hold on;
plot(Median_SWE_Arctic(105186:113969,1),'r','LineWidth',2);
hold on;
plot(5725,122,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylabel('SWE (mm)');
ylim([0 250]);
xlim([0 8784]);
xticks([0 2185 4345 6553 8784]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('2003/04');

nexttile
jbfill(time',Max_SWE_Default(113970:122729,:)',Min_SWE_Default(113970:122729,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_SWE_Arctic(113970:122729,:)',Min_SWE_Arctic(113970:122729,:)','r','r',0,0.5);
hold on;
plot(Median_SWE_Default(113970:122729,1),'b','LineWidth',2);
hold on;
plot(Median_SWE_Arctic(113970:122729,1),'r','LineWidth',2);
hold on;
plot(5509,88,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylim([0 250]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('2004/05');

nexttile
jbfill(time',Max_SWE_Default(122730:131489,:)',Min_SWE_Default(122730:131489,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_SWE_Arctic(122730:131489,:)',Min_SWE_Arctic(122730:131489,:)','r','r',0,0.5);
hold on;
plot(Median_SWE_Default(122730:131489,1),'b','LineWidth',2);
hold on;
plot(Median_SWE_Arctic(122730:131489,1),'r','LineWidth',2);
hold on;
plot(5581,181,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylim([0 250]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('2005/06');

nexttile
jbfill(time',Max_SWE_Default(131490:140249,:)',Min_SWE_Default(131490:140249,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_SWE_Arctic(131490:140249,:)',Min_SWE_Arctic(131490:140249,:)','r','r',0,0.5);
hold on;
plot(Median_SWE_Default(131490:140249,1),'b','LineWidth',2);
hold on;
plot(Median_SWE_Arctic(131490:140249,1),'r','LineWidth',2);
hold on;
plot(5509,104,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylim([0 250]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('2006/07');

nexttile
jbfill(time2',Max_SWE_Default(140250:149033,:)',Min_SWE_Default(140250:149033,:)','b','b',0,0.5);
hold on;
jbfill(time2',Max_SWE_Arctic(140250:149033,:)',Min_SWE_Arctic(140250:149033,:)','r','r',0,0.5);
hold on;
plot(Median_SWE_Default(140250:149033,1),'b','LineWidth',2);
hold on;
plot(Median_SWE_Arctic(140250:149033,1),'r','LineWidth',2);
hold on;
plot(5557,123,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylabel('SWE (mm)');
ylim([0 250]);
xlim([0 8784]);
xticks([0 2185 4345 6553 8784]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('2007/08');

nexttile
jbfill(time',Max_SWE_Default(149034:157793,:)',Min_SWE_Default(149034:157793,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_SWE_Arctic(149034:157793,:)',Min_SWE_Arctic(149034:157793,:)','r','r',0,0.5);
hold on;
plot(Median_SWE_Default(149034:157793,1),'b','LineWidth',2);
hold on;
plot(Median_SWE_Arctic(149034:157793,1),'r','LineWidth',2);
hold on;
plot(5581,107,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylim([0 250]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('2008/09');

nexttile
jbfill(time',Max_SWE_Default(157794:166553,:)',Min_SWE_Default(157794:166553,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_SWE_Arctic(157794:166553,:)',Min_SWE_Arctic(157794:166553,:)','r','r',0,0.5);
hold on;
plot(Median_SWE_Default(157794:166553,1),'b','LineWidth',2);
hold on;
plot(Median_SWE_Arctic(157794:166553,1),'r','LineWidth',2);
ylim([0 250]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('2009/10');

nexttile
jbfill(time',Max_SWE_Default(166554:175313,:)',Min_SWE_Default(166554:175313,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_SWE_Arctic(166554:175313,:)',Min_SWE_Arctic(166554:175313,:)','r','r',0,0.5);
hold on;
plot(Median_SWE_Default(166554:175313,1),'b','LineWidth',2);
hold on;
plot(Median_SWE_Arctic(166554:175313,1),'r','LineWidth',2);
hold on;
plot(5437,97,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylim([0 250]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('2010/11');

nexttile
jbfill(time2',Max_SWE_Default(175314:184097,:)',Min_SWE_Default(175314:184097,:)','b','b',0,0.5);
hold on;
jbfill(time2',Max_SWE_Arctic(175314:184097,:)',Min_SWE_Arctic(175314:184097,:)','r','r',0,0.5);
hold on;
plot(Median_SWE_Default(175314:184097,1),'b','LineWidth',2);
hold on;
plot(Median_SWE_Arctic(175314:184097,1),'r','LineWidth',2);
hold on;
plot(5533,101,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylabel('SWE (mm)');
ylim([0 250]);
xlim([0 8784]);
xticks([0 2185 4345 6553 8784]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('2011/12');

nexttile
jbfill(time',Max_SWE_Default(184098:192857,:)',Min_SWE_Default(184098:192857,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_SWE_Arctic(184098:192857,:)',Min_SWE_Arctic(184098:192857,:)','r','r',0,0.5);
hold on;
plot(Median_SWE_Default(184098:192857,1),'b','LineWidth',2);
hold on;
plot(Median_SWE_Arctic(184098:192857,1),'r','LineWidth',2);
hold on;
plot(5557,147,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylim([0 250]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('2012/13');

nexttile
jbfill(time',Max_SWE_Default(192858:201617,:)',Min_SWE_Default(192858:201617,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_SWE_Arctic(192858:201617,:)',Min_SWE_Arctic(192858:201617,:)','r','r',0,0.5);
hold on;
plot(Median_SWE_Default(192858:201617,1),'b','LineWidth',2);
hold on;
plot(Median_SWE_Arctic(192858:201617,1),'r','LineWidth',2);
hold on;
plot(5677,99,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylim([0 250]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('2013/14');

nexttile;
jbfill(time',Max_SWE_Default(201618:210377,:)',Min_SWE_Default(201618:210377,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_SWE_Arctic(201618:210377,:)',Min_SWE_Arctic(201618:210377,:)','r','r',0,0.5);
hold on;
plot(Median_SWE_Default(201618:210377,1),'b','LineWidth',2);
hold on;
plot(Median_SWE_Arctic(201618:210377,1),'r','LineWidth',2);
hold on;
plot(5677,100,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylim([0 250]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('2014/15');

nexttile
jbfill(time2',Max_SWE_Default(210378:219161,:)',Min_SWE_Default(210378:219161,:)','b','b',0,0.5);
hold on;
jbfill(time2',Max_SWE_Arctic(210378:219161,:)',Min_SWE_Arctic(210378:219161,:)','r','r',0,0.5);
hold on;
plot(Median_SWE_Default(210378:219161,1),'b','LineWidth',2);
hold on;
plot(Median_SWE_Arctic(210378:219161,1),'r','LineWidth',2);
hold on;
plot(5677,80,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylabel('SWE (mm)');
ylim([0 250]);
xlim([0 8784]);
xticks([0 2185 4345 6553 8784]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('2015/16');

nexttile
jbfill(time',Max_SWE_Default(219162:227921,:)',Min_SWE_Default(219162:227921,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_SWE_Arctic(219162:227921,:)',Min_SWE_Arctic(219162:227921,:)','r','r',0,0.5);
hold on;
plot(Median_SWE_Default(219162:227921,1),'b','LineWidth',2);
hold on;
plot(Median_SWE_Arctic(219162:227921,1),'r','LineWidth',2);
hold on;
plot(5629,92,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylim([0 250]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('2016/17');

nexttile;
jbfill(time',Max_SWE_Default(227922:236681,:)',Min_SWE_Default(227922:236681,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_SWE_Arctic(227922:236681,:)',Min_SWE_Arctic(227922:236681,:)','r','r',0,0.5);
hold on;
plot(Median_SWE_Default(227922:236681,1),'b','LineWidth',2);
hold on;
plot(Median_SWE_Arctic(227922:236681,1),'r','LineWidth',2);
hold on;
plot(5605,90,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylim([0 250]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('2017/18');

nexttile
jbfill(time',Max_SWE_Default(236682:245441,:)',Min_SWE_Default(236682:245441,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_SWE_Arctic(236682:245441,:)',Min_SWE_Arctic(236682:245441,:)','r','r',0,0.5);
hold on;
plot(Median_SWE_Default(236682:245441,1),'b','LineWidth',2);
hold on;
plot(Median_SWE_Arctic(236682:245441,1),'r','LineWidth',2);
hold on;
plot(5701,116,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylim([0 250]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('2018/19');

nexttile
jbfill(time2',Max_SWE_Default(245442:254225,:)',Min_SWE_Default(245442:254225,:)','b','b',0,0.5);
hold on;
jbfill(time2',Max_SWE_Arctic(245442:254225,:)',Min_SWE_Arctic(245442:254225,:)','r','r',0,0.5);
hold on;
plot(Median_SWE_Default(245442:254225,1),'b','LineWidth',2);
hold on;
plot(Median_SWE_Arctic(245442:254225,1),'r','LineWidth',2);
ylabel('SWE (mm)');
ylim([0 250]);
xlim([0 8784]);
xticks([0 2185 4345 6553 8784]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('2019/20');
xlabel('Year');

nexttile
jbfill(time',Max_SWE_Default(254226:262985,:)',Min_SWE_Default(254226:262985,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_SWE_Arctic(254226:262985,:)',Min_SWE_Arctic(254226:262985,:)','r','r',0,0.5);
hold on;
plot(Median_SWE_Default(254226:262985,1),'b','LineWidth',2);
hold on;
plot(Median_SWE_Arctic(254226:262985,1),'r','LineWidth',2);
hold on;
plot(5605,63,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylim([0 250]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('2020/21');
xlabel('Year');

nexttile
jbfill(time',Max_SWE_Default(262986:271745,:)',Min_SWE_Default(262986:271745,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_SWE_Arctic(262986:271745,:)',Min_SWE_Arctic(262986:271745,:)','r','r',0,0.5);
hold on;
plot(Median_SWE_Default(262986:271745,1),'b','LineWidth',2);
hold on;
plot(Median_SWE_Arctic(262986:271745,1),'r','LineWidth',2);
hold on;
plot(4885,84,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylim([0 250]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('2021/22');
xlabel('Year');

nexttile
jbfill(time_end',Max_SWE_Default(271746:end,:)',Min_SWE_Default(271746:end,:)','b','b',0,0.5);
hold on;
jbfill(time_end',Max_SWE_Arctic(271746:end,:)',Min_SWE_Arctic(271746:end,:)','r','r',0,0.5);
hold on;
plot(Median_SWE_Default(271746:end,1),'b','LineWidth',2);
hold on;
plot(Median_SWE_Arctic(271746:end,1),'r','LineWidth',2);
hold on;
plot(5677,111,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylim([0 250]);
xlim([0 8767]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('2022/23');
xlabel('Year');

%% APPENDIX A3: Plot Bulk Density Figure; 
% Snow Depth (32 years 1998-2023); 
figure(3); t=tiledlayout(8,4);% 1991;
t.TileSpacing='compact';
t.Padding='compact';

nexttile
jbfill(time1',Max_BD_Default(1:8777,:)',Min_BD_Default(1:8777,:)','b','b',0,0.5);
hold on;
jbfill(time1',Max_BD_Arctic(1:8777,:)',Min_BD_Arctic(1:8777,:)','r','r',0,0.5);
hold on;
plot(Median_BD_Default(1:8777,1),'b','LineWidth',2);
hold on;
plot(Median_BD_Arctic(1:8777,1),'r','LineWidth',2);
hold on;
plot(5766,342,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylabel('Bulk Density (kg m^-^3)');
ylim([0 1000]);
xlim([0 8784]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('1991/92');
legend('Default Ensemble','Arctic Ensemble','Default Ensemble Median','Arctic Ensemble Median','Snow Course Measurements');

nexttile
jbfill(time',Max_BD_Default(8778:17537,:)',Min_BD_Default(8778:17537,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_BD_Arctic(8778:17537,:)',Min_BD_Arctic(8778:17537,:)','r','r',0,0.5);
hold on;
plot(Median_BD_Default(8778:17537,1),'b','LineWidth',2);
hold on;
plot(Median_BD_Arctic(8778:17537,1),'r','LineWidth',2);
hold on;
plot(5725,163,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylim([0 1000]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('1992/93');

nexttile
jbfill(time',Max_BD_Default(17538:26297,:)',Min_BD_Default(17538:26297,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_BD_Arctic(17538:26297,:)',Min_BD_Arctic(17538:26297,:)','r','r',0,0.5);
hold on;
plot(Median_BD_Default(17538:26297,1),'b','LineWidth',2);
hold on;
plot(Median_BD_Arctic(17538:26297,1),'r','LineWidth',2);
hold on;
plot(5893,220,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylim([0 1000]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('1993/94');

nexttile
jbfill(time',Max_BD_Default(26298:35057,:)',Min_BD_Default(26298:35057,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_BD_Arctic(26298:35057,:)',Min_BD_Arctic(26298:35057,:)','r','r',0,0.5);
hold on;
plot(Median_BD_Default(26298:35057,1),'b','LineWidth',2);
hold on;
plot(Median_BD_Arctic(26298:35057,1),'r','LineWidth',2);
ylim([0 1000]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('1994/95');

nexttile
jbfill(time2',Max_BD_Default(35058:43841,:)',Min_BD_Default(35058:43841,:)','b','b',0,0.5);
hold on;
jbfill(time2',Max_BD_Arctic(35058:43841,:)',Min_BD_Arctic(35058:43841,:)','r','r',0,0.5);
hold on;
plot(Median_BD_Default(35058:43841,1),'b','LineWidth',2);
hold on;
plot(Median_BD_Arctic(35058:43841,1),'r','LineWidth',2);
hold on;
plot(5413,148,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylabel('Bulk Density (kg m^-^3)');
ylim([0 1000]);
xlim([0 8784]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('1995/96');

nexttile
jbfill(time',Max_BD_Default(43842:52601,:)',Min_BD_Default(43842:52601,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_BD_Arctic(43842:52601,:)',Min_BD_Arctic(43842:52601,:)','r','r',0,0.5);
hold on;
plot(Median_BD_Default(43842:52601,1),'b','LineWidth',2);
hold on;
plot(Median_BD_Arctic(43842:52601,1),'r','LineWidth',2);
hold on;
plot(5605,234,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylim([0 1000]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('1996/97');

nexttile
jbfill(time',Max_BD_Default(52602:61361,:)',Min_BD_Default(52602:61361,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_BD_Arctic(52602:61361,:)',Min_BD_Arctic(52602:61361,:)','r','r',0,0.5);
hold on;
plot(Median_BD_Default(52602:61361,1),'b','LineWidth',2);
hold on;
plot(Median_BD_Arctic(52602:61361,1),'r','LineWidth',2);
hold on;
plot(4549,285,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylim([0 1000]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('1997/98');

nexttile
jbfill(time',Max_BD_Default(61362:70121,:)',Min_BD_Default(61362:70121,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_BD_Arctic(61362:70121,:)',Min_BD_Arctic(61362:70121,:)','r','r',0,0.5);
hold on;
plot(Median_BD_Default(61362:70121,1),'b','LineWidth',2);
hold on;
plot(Median_BD_Arctic(61362:70121,1),'r','LineWidth',2);
hold on;
plot(5581,241,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylim([0 1000]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('1998/99');

nexttile
jbfill(time2',Max_BD_Default(70122:78905,:)',Min_BD_Default(70122:78905,:)','b','b',0,0.5);
hold on;
jbfill(time2',Max_BD_Arctic(70122:78905,:)',Min_BD_Arctic(70122:78905,:)','r','r',0,0.5);
hold on;
plot(Median_BD_Default(70122:78905,1),'b','LineWidth',2);
hold on;
plot(Median_BD_Arctic(70122:78905,1),'r','LineWidth',2);
hold on;
plot(5437,244,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylabel('Bulk Density (kg m^-^3)');
ylim([0 1000]);
xlim([0 8784]);
xticks([0 2185 4345 6553 8784]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('1999/00');

nexttile
jbfill(time',Max_BD_Default(78906:87665,:)',Min_BD_Default(78906:87665,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_BD_Arctic(78906:87665,:)',Min_BD_Arctic(78906:87665,:)','r','r',0,0.5);
hold on;
plot(Median_BD_Default(78906:87665,1),'b','LineWidth',2);
hold on;
plot(Median_BD_Arctic(78906:87665,1),'r','LineWidth',2);
hold on;
plot(5677,208,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylim([0 1000]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('2000/01');

nexttile
jbfill(time',Max_BD_Default(87666:96425,:)',Min_BD_Default(87666:96425,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_BD_Arctic(87666:96425,:)',Min_BD_Arctic(87666:96425,:)','r','r',0,0.5);
hold on;
plot(Median_BD_Default(87666:96425,1),'b','LineWidth',2);
hold on;
plot(Median_BD_Arctic(87666:96425,1),'r','LineWidth',2);
hold on;
plot(5653,270,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylim([0 1000]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('2001/02');

nexttile
jbfill(time',Max_BD_Default(96426:105185,:)',Min_BD_Default(96426:105185,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_BD_Arctic(996426:105185,:)',Min_BD_Arctic(96426:105185,:)','r','r',0,0.5);
hold on;
plot(Median_BD_Default(96426:105185,1),'b','LineWidth',2);
hold on;
plot(Median_BD_Arctic(96426:105185,1),'r','LineWidth',2);
hold on;
plot(5341,242,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylim([0 1000]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('2002/03');

nexttile
jbfill(time2',Max_BD_Default(105186:113969,:)',Min_BD_Default(105186:113969,:)','b','b',0,0.5);
hold on;
jbfill(time2',Max_BD_Arctic(105186:113969,:)',Min_BD_Arctic(105186:113969,:)','r','r',0,0.5);
hold on;
plot(Median_BD_Default(105186:113969,1),'b','LineWidth',2);
hold on;
plot(Median_BD_Arctic(105186:113969,1),'r','LineWidth',2);
hold on;
plot(5725,244,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylabel('Bulk Density (kg m^-^3)');
ylim([0 1000]);
xlim([0 8784]);
xticks([0 2185 4345 6553 8784]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('2003/04');

nexttile
jbfill(time',Max_BD_Default(113970:122729,:)',Min_BD_Default(113970:122729,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_BD_Arctic(113970:122729,:)',Min_BD_Arctic(113970:122729,:)','r','r',0,0.5);
hold on;
plot(Median_BD_Default(113970:122729,1),'b','LineWidth',2);
hold on;
plot(Median_BD_Arctic(113970:122729,1),'r','LineWidth',2);
hold on;
plot(5509,236,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylim([0 1000]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('2004/05');

nexttile
jbfill(time',Max_BD_Default(122730:131489,:)',Min_BD_Default(122730:131489,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_BD_Arctic(122730:131489,:)',Min_BD_Arctic(122730:131489,:)','r','r',0,0.5);
hold on;
plot(Median_BD_Default(122730:131489,1),'b','LineWidth',2);
hold on;
plot(Median_BD_Arctic(122730:131489,1),'r','LineWidth',2);
hold on;
plot(5581,254,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylim([0 1000]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('2005/06');

nexttile
jbfill(time',Max_BD_Default(131490:140249,:)',Min_BD_Default(131490:140249,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_BD_Arctic(131490:140249,:)',Min_BD_Arctic(131490:140249,:)','r','r',0,0.5);
hold on;
plot(Median_BD_Default(131490:140249,1),'b','LineWidth',2);
hold on;
plot(Median_BD_Arctic(131490:140249,1),'r','LineWidth',2);
hold on;
plot(5509,260,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylim([0 1000]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('2006/07');

nexttile
jbfill(time2',Max_BD_Default(140250:149033,:)',Min_BD_Default(140250:149033,:)','b','b',0,0.5);
hold on;
jbfill(time2',Max_BD_Arctic(140250:149033,:)',Min_BD_Arctic(140250:149033,:)','r','r',0,0.5);
hold on;
plot(Median_BD_Default(140250:149033,1),'b','LineWidth',2);
hold on;
plot(Median_BD_Arctic(140250:149033,1),'r','LineWidth',2);
hold on;
plot(5557,260,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylabel('Bulk Density (kg m^-^3)');
ylim([0 1000]);
xlim([0 8784]);
xticks([0 2185 4345 6553 8784]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('2007/08');

nexttile
jbfill(time',Max_BD_Default(149034:157793,:)',Min_BD_Default(149034:157793,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_BD_Arctic(149034:157793,:)',Min_BD_Arctic(149034:157793,:)','r','r',0,0.5);
hold on;
plot(Median_BD_Default(149034:157793,1),'b','LineWidth',2);
hold on;
plot(Median_BD_Arctic(149034:157793,1),'r','LineWidth',2);
hold on;
plot(5581,214,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylim([0 1000]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('2008/09');

nexttile
jbfill(time',Max_BD_Default(157794:166553,:)',Min_BD_Default(157794:166553,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_BD_Arctic(157794:166553,:)',Min_BD_Arctic(157794:166553,:)','r','r',0,0.5);
hold on;
plot(Median_BD_Default(157794:166553,1),'b','LineWidth',2);
hold on;
plot(Median_BD_Arctic(157794:166553,1),'r','LineWidth',2);
ylim([0 1000]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('2009/10');

nexttile
jbfill(time',Max_BD_Default(166554:175313,:)',Min_BD_Default(166554:175313,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_BD_Arctic(166554:175313,:)',Min_BD_Arctic(166554:175313,:)','r','r',0,0.5);
hold on;
plot(Median_BD_Default(166554:175313,1),'b','LineWidth',2);
hold on;
plot(Median_BD_Arctic(166554:175313,1),'r','LineWidth',2);
hold on;
plot(5437,216,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylim([0 1000]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('2010/11');

nexttile
jbfill(time2',Max_BD_Default(175314:184097,:)',Min_BD_Default(175314:184097,:)','b','b',0,0.5);
hold on;
jbfill(time2',Max_BD_Arctic(175314:184097,:)',Min_BD_Arctic(175314:184097,:)','r','r',0,0.5);
hold on;
plot(Median_BD_Default(175314:184097,1),'b','LineWidth',2);
hold on;
plot(Median_BD_Arctic(175314:184097,1),'r','LineWidth',2);
hold on;
plot(5533,265,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylabel('Bulk Density (kg m^-^3)');
ylim([0 1000]);
xlim([0 8784]);
xticks([0 2185 4345 6553 8784]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('2011/12');

nexttile
jbfill(time',Max_BD_Default(184098:192857,:)',Min_BD_Default(184098:192857,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_BD_Arctic(184098:192857,:)',Min_BD_Arctic(184098:192857,:)','r','r',0,0.5);
hold on;
plot(Median_BD_Default(184098:192857,1),'b','LineWidth',2);
hold on;
plot(Median_BD_Arctic(184098:192857,1),'r','LineWidth',2);
hold on;
plot(5557,252,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylim([0 1000]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('2012/13');

nexttile
jbfill(time',Max_BD_Default(192858:201617,:)',Min_BD_Default(192858:201617,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_BD_Arctic(192858:201617,:)',Min_BD_Arctic(192858:201617,:)','r','r',0,0.5);
hold on;
plot(Median_BD_Default(192858:201617,1),'b','LineWidth',2);
hold on;
plot(Median_BD_Arctic(192858:201617,1),'r','LineWidth',2);
hold on;
plot(5677,243,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylim([0 1000]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('2013/14');

nexttile;
jbfill(time',Max_BD_Default(201618:210377,:)',Min_BD_Default(201618:210377,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_BD_Arctic(201618:210377,:)',Min_BD_Arctic(201618:210377,:)','r','r',0,0.5);
hold on;
plot(Median_BD_Default(201618:210377,1),'b','LineWidth',2);
hold on;
plot(Median_BD_Arctic(201618:210377,1),'r','LineWidth',2);
hold on;
plot(5677,246,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylim([0 1000]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('2014/15');

nexttile
jbfill(time2',Max_BD_Default(210378:219161,:)',Min_BD_Default(210378:219161,:)','b','b',0,0.5);
hold on;
jbfill(time2',Max_BD_Arctic(210378:219161,:)',Min_BD_Arctic(210378:219161,:)','r','r',0,0.5);
hold on;
plot(Median_BD_Default(210378:219161,1),'b','LineWidth',2);
hold on;
plot(Median_BD_Arctic(210378:219161,1),'r','LineWidth',2);
hold on;
plot(5677,176,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylabel('Bulk Density (kg m^-^3)');
ylim([0 1000]);
xlim([0 8784]);
xticks([0 2185 4345 6553 8784]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('2015/16');

nexttile
jbfill(time',Max_BD_Default(219162:227921,:)',Min_BD_Default(219162:227921,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_BD_Arctic(219162:227921,:)',Min_BD_Arctic(219162:227921,:)','r','r',0,0.5);
hold on;
plot(Median_BD_Default(219162:227921,1),'b','LineWidth',2);
hold on;
plot(Median_BD_Arctic(219162:227921,1),'r','LineWidth',2);
hold on;
plot(5629,220,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylim([0 1000]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('2016/17');

nexttile;
jbfill(time',Max_BD_Default(227922:236681,:)',Min_BD_Default(227922:236681,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_BD_Arctic(227922:236681,:)',Min_BD_Arctic(227922:236681,:)','r','r',0,0.5);
hold on;
plot(Median_BD_Default(227922:236681,1),'b','LineWidth',2);
hold on;
plot(Median_BD_Arctic(227922:236681,1),'r','LineWidth',2);
hold on;
plot(5605,213,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylim([0 1000]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('2017/18');

nexttile
jbfill(time',Max_BD_Default(236682:245441,:)',Min_BD_Default(236682:245441,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_BD_Arctic(236682:245441,:)',Min_BD_Arctic(236682:245441,:)','r','r',0,0.5);
hold on;
plot(Median_BD_Default(236682:245441,1),'b','LineWidth',2);
hold on;
plot(Median_BD_Arctic(236682:245441,1),'r','LineWidth',2);
hold on;
plot(5701,259,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylim([0 1000]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('2018/19');

nexttile
jbfill(time2',Max_BD_Default(245442:254225,:)',Min_BD_Default(245442:254225,:)','b','b',0,0.5);
hold on;
jbfill(time2',Max_BD_Arctic(245442:254225,:)',Min_BD_Arctic(245442:254225,:)','r','r',0,0.5);
hold on;
plot(Median_BD_Default(245442:254225,1),'b','LineWidth',2);
hold on;
plot(Median_BD_Arctic(245442:254225,1),'r','LineWidth',2);
ylabel('Bulk Density (kg m^-^3)');
ylim([0 1000]);
xlim([0 8784]);
xticks([0 2185 4345 6553 8784]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('2019/20');
xlabel('Year');

nexttile
jbfill(time',Max_BD_Default(254226:262985,:)',Min_BD_Default(254226:262985,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_BD_Arctic(254226:262985,:)',Min_BD_Arctic(254226:262985,:)','r','r',0,0.5);
hold on;
plot(Median_BD_Default(254226:262985,1),'b','LineWidth',2);
hold on;
plot(Median_BD_Arctic(254226:262985,1),'r','LineWidth',2);
hold on;
plot(5605,200,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylim([0 1000]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('2020/21');
xlabel('Year');

nexttile
jbfill(time',Max_BD_Default(254226:262985,:)',Min_BD_Default(254226:262985,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_BD_Arctic(254226:262985,:)',Min_BD_Arctic(254226:262985,:)','r','r',0,0.5);
hold on;
plot(Median_BD_Default(254226:262985,1),'b','LineWidth',2);
hold on;
plot(Median_BD_Arctic(254226:262985,1),'r','LineWidth',2);
hold on;
plot(4885,241,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylim([0 1000]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('2021/22');
xlabel('Year');

nexttile
jbfill(time_end',Max_BD_Default(271746:end,:)',Min_BD_Default(271746:end,:)','b','b',0,0.5);
hold on;
jbfill(time_end',Max_BD_Arctic(271746:end,:)',Min_BD_Arctic(271746:end,:)','r','r',0,0.5);
hold on;
plot(Median_BD_Default(271746:end,1),'b','LineWidth',2);
hold on;
plot(Median_BD_Arctic(271746:end,1),'r','LineWidth',2);
hold on;
plot(5677,236,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylim([0 1000]);
xlim([0 8767]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('2022/23');
xlabel('Year');

%% FIGURE 2: Years of high and low snow; 

figure(4); t=tiledlayout(3,3);% 1991;
t.TileSpacing='compact';
t.Padding='compact';

nexttile
jbfill(time',Max_SWE_Default(113970:122729,:)',Min_SWE_Default(113970:122729,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_SWE_Arctic(113970:122729,:)',Min_SWE_Arctic(113970:122729,:)','r','r',0,0.5);
hold on;
plot(Median_SWE_Default(113970:122729,1),'b','LineWidth',2);
hold on;
plot(Median_SWE_Arctic(113970:122729,1),'r','LineWidth',2);
hold on;
plot(5509,88,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylim([0 250]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('2004/05');
ylabel('SWE (mm)','FontSize',14);

nexttile
jbfill(time',Max_SWE_Default(96426:105185,:)',Min_SWE_Default(96426:105185,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_SWE_Arctic(96426:105185,:)',Min_SWE_Arctic(96426:105185,:)','r','r',0,0.5);
hold on;
plot(Median_SWE_Default(96426:105185,1),'b','LineWidth',2);
hold on;
plot(Median_SWE_Arctic(96426:105185,1),'r','LineWidth',2);
hold on;
plot(5341,104,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylim([0 250]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('2002/03');

nexttile
jbfill(time',Max_SWE_Default(236682:245441,:)',Min_SWE_Default(236682:245441,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_SWE_Arctic(236682:245441,:)',Min_SWE_Arctic(236682:245441,:)','r','r',0,0.5);
hold on;
plot(Median_SWE_Default(236682:245441,1),'b','LineWidth',2);
hold on;
plot(Median_SWE_Arctic(236682:245441,1),'r','LineWidth',2);
hold on;
plot(5701,116,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylim([0 250]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('2018/19');

nexttile
jbfill(time',Max_SD_Default(113970:122729,:)',Min_SD_Default(113970:122729,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_SD_Arctic(113970:122729,:)',Min_SD_Arctic(113970:122729,:)','r','r',0,0.5);
hold on;
plot(SD_Measured(113970:122729,:),'k','LineWidth',2);
hold on;
plot(Median_SD_Default(113970:122729,1),'b','LineWidth',2);
hold on;
plot(Median_SD_Arctic(113970:122729,1),'r','LineWidth',2);
hold on;
plot(5509,0.37,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
ylim([0 1.5]);
title('2004/05');
ylabel('Snow Depth (m)','FontSize',14);

nexttile
jbfill(time',Max_SD_Default(96426:105185,:)',Min_SD_Default(96426:105185,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_SD_Arctic(96426:105185,:)',Min_SD_Arctic(96426:105185,:)','r','r',0,0.5);
hold on;
plot(SD_Measured(96426:105185,:),'k','LineWidth',2);
hold on;
plot(Median_SD_Default(96426:105185,1),'b','LineWidth',2);
hold on;
plot(Median_SD_Arctic(96426:105185,1),'r','LineWidth',2);
hold on;
plot(5341,0.43,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
ylim([0 1.5]);
title('2002/03');
legend('Default Ensemble','Arctic Ensemble','Default Ensemble Median','Arctic Ensemble Median','SR50 Measurements','Snow Course Measurements');

nexttile
jbfill(time',Max_SD_Default(236682:245441,:)',Min_SD_Default(236682:245441,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_SD_Arctic(236682:245441,:)',Min_SD_Arctic(236682:245441,:)','r','r',0,0.5);
hold on;
plot(SD_Measured(236682:245441,:),'k','LineWidth',2);
hold on;
plot(Median_SD_Default(236682:245441,1),'b','LineWidth',2);
hold on;
plot(Median_SD_Arctic(236682:245441,1),'r','LineWidth',2);
hold on;
plot(5701,0.44,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
ylim([0 1.2]);
title('2018/19');

nexttile
jbfill(time',Max_BD_Default(113970:122729,:)',Min_BD_Default(113970:122729,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_BD_Arctic(113970:122729,:)',Min_BD_Arctic(113970:122729,:)','r','r',0,0.5);
hold on;
plot(Median_BD_Default(113970:122729,1),'b','LineWidth',2);
hold on;
plot(Median_BD_Arctic(113970:122729,1),'r','LineWidth',2);
hold on;
plot(5509,236,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylim([0 1000]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('2004/05');
ylabel('Bulk Density (kg m^-^3)','FontSize',14);

nexttile
jbfill(time',Max_BD_Default(96426:105185,:)',Min_BD_Default(96426:105185,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_BD_Arctic(96426:105185,:)',Min_BD_Arctic(96426:105185,:)','r','r',0,0.5);
hold on;
plot(Median_BD_Default(96426:105185,1),'b','LineWidth',2);
hold on;
plot(Median_BD_Arctic(96426:105185,1),'r','LineWidth',2);
hold on;
plot(5341,242,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylim([0 1000]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('2002/03');

nexttile
jbfill(time',Max_BD_Default(236682:245441,:)',Min_BD_Default(236682:245441,:)','b','b',0,0.5);
hold on;
jbfill(time',Max_BD_Arctic(236682:245441,:)',Min_BD_Arctic(236682:245441,:)','r','r',0,0.5);
hold on;
plot(Median_BD_Default(236682:245441,1),'b','LineWidth',2);
hold on;
plot(Median_BD_Arctic(236682:245441,1),'r','LineWidth',2);
hold on;
plot(5701,259,'x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2);
ylim([0 1000]);
xlim([0 8760]);
xticks([0 2185 4345 6553 8760]);
xticklabels({'1st-Sep','1st-Dec','1st-Mar','1st-Jun','1st-Sep'});
title('2018/19');

%% FIGURE 2: Create box plot of distribution of snow depth; 

%% Peak SWE simulated results;

% Cat together peak SWE simulated results(Snow Depth);
Default_Peak_SD = vertcat(Default_SD(5766,:),Default_SD(14509,:),Default_SD(23437,:),Default_SD(32005,:),Default_SD(40477,:),Default_SD(49453,:),Default_SD(57157,:),Default_SD(66949,:),Default_SD(75565,:),Default_SD(84589,:),Default_SD(93349,:),Default_SD(101773,:),Default_SD(110917,:),Default_SD(119485,:),Default_SD(128317,:),Default_SD(137005,:),Default_SD(145813,:),Default_SD(154621,:),Default_SD(171998,:),Default_SD(180853,:),Default_SD(189661,:),Default_SD(198561,:),Default_SD(207301,:),Default_SD(216061,:),Default_SD(224797,:),Default_SD(233533,:),Default_SD(242389,:),Default_SD(259837,:),Default_SD(267877,:),Default_SD(277430,:));
Arctic_Peak_SD = vertcat(Arctic_SD(5766,:),Arctic_SD(14509,:),Arctic_SD(23437,:),Arctic_SD(32005,:),Arctic_SD(40477,:),Arctic_SD(49453,:),Arctic_SD(57157,:),Arctic_SD(66949,:),Arctic_SD(75565,:),Arctic_SD(84569,:),Arctic_SD(93349,:),Arctic_SD(101773,:),Arctic_SD(110917,:),Arctic_SD(119485,:),Arctic_SD(128317,:),Arctic_SD(137005,:),Arctic_SD(145813,:),Arctic_SD(154621,:),Arctic_SD(171998,:),Arctic_SD(180853,:),Arctic_SD(189661,:),Arctic_SD(198561,:),Arctic_SD(207301,:),Arctic_SD(216061,:),Arctic_SD(224797,:),Arctic_SD(233533,:),Arctic_SD(242389,:),Arctic_SD(259837,:),Arctic_SD(267877,:),Arctic_SD(277430,:));
SD_Peak_Measured = vertcat(SD_Measured(5766,:),SD_Measured(14509,:),SD_Measured(23437,:),SD_Measured(32005,:), SD_Measured(40477,:), SD_Measured(49453,:), SD_Measured(57157,:), SD_Measured(66949,:), SD_Measured(75565,:), SD_Measured(84569,:), SD_Measured(93349,:), SD_Measured(101773,:), SD_Measured(110917,:), SD_Measured(119485,:), SD_Measured(128317,:), SD_Measured(137005,:), SD_Measured(145813,:), SD_Measured(154621,:), SD_Measured(171998,:), SD_Measured(180853,:), SD_Measured(189661,:), SD_Measured(198561,:), SD_Measured(207301,:), SD_Measured(216061,:), SD_Measured(224797,:), SD_Measured(233533,:), SD_Measured(242389,:), SD_Measured(259837,:), SD_Measured(267877,:), SD_Measured(277430,:));

% Cat together peak SWE simulated results (SWE);
Default_Peak_SWE = vertcat(Default_SWE(5766,:),Default_SWE(14509,:),Default_SWE(23437,:),Default_SWE(32005,:),Default_SWE(40477,:),Default_SWE(49453,:),Default_SWE(57157,:),Default_SWE(66949,:),Default_SWE(75565,:),Default_SWE(84589,:),Default_SWE(93349,:),Default_SWE(101773,:),Default_SWE(110917,:),Default_SWE(119485,:),Default_SWE(128317,:),Default_SWE(137005,:),Default_SWE(145813,:),Default_SWE(154621,:),Default_SWE(171998,:),Default_SWE(180853,:),Default_SWE(189661,:),Default_SWE(198561,:),Default_SWE(207301,:),Default_SWE(216061,:),Default_SWE(224797,:),Default_SWE(233533,:),Default_SWE(242389,:),Default_SWE(259837,:),Default_SWE(267877,:),Default_SWE(277430,:));
Arctic_Peak_SWE = vertcat(Arctic_SWE(5766,:),Arctic_SWE(14509,:),Arctic_SWE(23437,:),Arctic_SWE(32005,:),Arctic_SWE(40477,:),Arctic_SWE(49453,:),Arctic_SWE(57157,:),Arctic_SWE(66949,:),Arctic_SWE(75565,:),Arctic_SWE(84569,:),Arctic_SWE(93349,:),Arctic_SWE(101773,:),Arctic_SWE(110917,:),Arctic_SWE(119485,:),Arctic_SWE(128317,:),Arctic_SWE(137005,:),Arctic_SWE(145813,:),Arctic_SWE(154621,:),Arctic_SWE(171998,:),Arctic_SWE(180853,:),Arctic_SWE(189661,:),Arctic_SWE(198561,:),Arctic_SWE(207301,:),Arctic_SWE(216061,:),Arctic_SWE(224797,:),Arctic_SWE(233533,:),Arctic_SWE(242389,:),Arctic_SWE(259837,:),Arctic_SWE(267877,:),Arctic_SWE(277430,:));
 
% Cat together peak SWE simulated results (Bulk Density);
Default_Peak_Density = vertcat(Default_BD(5766,:),Default_BD(14509,:),Default_BD(23437,:),Default_BD(32005,:),Default_BD(40477,:),Default_BD(49453,:),Default_BD(57157,:),Default_BD(66949,:),Default_BD(75565,:),Default_BD(84589,:),Default_BD(93349,:),Default_BD(101773,:),Default_BD(110917,:),Default_BD(119485,:),Default_BD(128317,:),Default_BD(137005,:),Default_BD(145813,:),Default_BD(154621,:),Default_BD(171998,:),Default_BD(180853,:),Default_BD(189661,:),Default_BD(198561,:),Default_BD(207301,:),Default_BD(216061,:),Default_BD(224797,:),Default_BD(233533,:),Default_BD(242389,:),Default_BD(259837,:),Default_BD(267877,:),Default_BD(277430,:));
Arctic_Peak_Density = vertcat(Arctic_BD(5766,:),Arctic_BD(14509,:),Arctic_BD(23437,:),Arctic_BD(32005,:),Arctic_BD(40477,:),Arctic_BD(49453,:),Arctic_BD(57157,:),Arctic_BD(66949,:),Arctic_BD(75565,:),Arctic_BD(84569,:),Arctic_BD(93349,:),Arctic_BD(101773,:),Arctic_BD(110917,:),Arctic_BD(119485,:),Arctic_BD(128317,:),Arctic_BD(137005,:),Arctic_BD(145813,:),Arctic_BD(154621,:),Arctic_BD(171998,:),Arctic_BD(180853,:),Arctic_BD(189661,:),Arctic_BD(198561,:),Arctic_BD(207301,:),Arctic_BD(216061,:),Arctic_BD(224797,:),Arctic_BD(233533,:),Arctic_BD(242389,:),Arctic_BD(259837,:),Arctic_BD(267877,:),Arctic_BD(277430,:));

figure (5);
numBins = 10;

lowerError_SWE = 47;
upperError_SWE = 81;

subplot(3,1,1);
histogram(Default_Peak_SWE,'Normalization','probability','EdgeAlpha',0,'FaceColor','b','NumBins',numBins);
hold on;
histogram(Arctic_Peak_SWE,'Normalization','probability','EdgeAlpha',0,'FaceColor','r','NumBins',numBins);
hold on;
errorbar(105,0.2,lowerError_SWE,upperError_SWE,'horizontal','x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2,'Color','g');
hold on;
xline(128,'Color','b','LineStyle','--','LineWidth',2);
hold on;
xline(131,'Color','r','LineStyle','--','LineWidth',2);
ylim([0 0.4]);
xlim([20 260]);
xticks([20 40 60 80 100 120 140 160 180 200 220 240 260]);
xticklabels({'20','40','60','80','100','120','140','160','180','200','220','240','260'});
xlabel('SWE (mm)','FontSize',14);
ylabel('Probability');
legend('Default Ensemble','Arctic Ensemble','Default Median','Arctic Median','Measurements');

lowerError_SD = 0.125;
upperError_SD = 0.275; 

subplot(3,1,2);
histogram(Default_Peak_SD,'Normalization','probability','EdgeAlpha',0,'FaceColor','b','NumBins',numBins);
hold on;
histogram(Arctic_Peak_SD,'Normalization','probability','EdgeAlpha',0,'FaceColor','r','NumBins',numBins);
hold on;
xline(0.54,'Color','b','LineStyle','--','LineWidth',2);
hold on;
xline(0.47,'Color','r','LineStyle','--','LineWidth',2);
hold on;
errorbar(0.44,0.2,lowerError_SD, upperError_SD,'horizontal','x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2,'Color','g');
hold on;
ylim([0 0.4]);
hold on;
xlim([0 1.2]);
xticks([0 0.2 0.4 0.6 0.8 1 1.2]);
xticklabels({'0','0.2','0.4','0.6','0.8','1','1.2'});
xlabel('Snow Depth (m)','FontSize',14);
ylabel('Probability');

lowerError_Density = 88;
upperError_Density = 106;

subplot(3,1,3);
histogram(Default_Peak_Density,'Normalization','probability','EdgeAlpha',0,'FaceColor','b','NumBins',numBins);
hold on;
histogram(Arctic_Peak_Density,'Normalization','probability','EdgeAlpha',0,'FaceColor','r','NumBins',numBins);
hold on;
errorbar(236,0.2,lowerError_Density,upperError_Density,'horizontal','x','MarkerSize', 17, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'g','LineWidth',2,'Color','g');
hold on;
xline(239,'Color','b','LineStyle','--','LineWidth',2);
hold on;
xline(278,'Color','r','LineStyle','--','LineWidth',2);
ylim([0 0.4]);
xlim([120 400]);
xticks([120 140 160 180 200 220 240 260 280 300 320 340 360 380 400]);
xticklabels({'120','140','160','180','200','220','240','260','280','300','320','340','360','380','400'});
xlabel('Bulk Density (kg m^-^3)','FontSize',14);
ylabel('Probability');
