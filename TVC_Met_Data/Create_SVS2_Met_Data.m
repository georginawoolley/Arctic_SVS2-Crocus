%% Load in dataset; 
Raw_Met_Data=csvread('met_TVC_1991-2023.csv',0); % Import MET dataset;

Year = Raw_Met_Data(:,1); % Seperate year, hour, day, month data; 
Hour = Raw_Met_Data(:,4);
Day = Raw_Met_Data(:,3);
Month = Raw_Met_Data(:,2);
Minute = zeros(280512,1);
Second = zeros(280512,1);

t = datetime(Year,Month,Day,Hour,Minute,Second); % Creates string of year, month and day; 

jd = juliandate(t); % Convert MATLAB datatime to julian date;

DOY = day(t, 'dayofyear'); % Work out julian day;

X=datevec(t); % Convert time data into a vector; 
Y=[0 0 0 7 0 0]; % Add in 7 hours to account for difference betwen MST and UTC;
UTC=datestr(X+Y); % Add the two datasets together;
UTC2=datetime(UTC); % Convert into datetime;
DOY2=day(UTC2,'dayofyear'); % Recalculate day of year;

UTC_Vec=datevec(UTC2); % Convert from datetime to vector for use (individual columns);

%% Convert temp to deg C; 
TEMP = Raw_Met_Data(:,9); % Extract temperature data;
TEMP = TEMP-273.5; % Convert from K to deg C;

%% Convert from relative humidity to specific humidity; 
RH = Raw_Met_Data(:,10); % Extract relative humdiity data;

es=[]; % Loop to calculate dew point temperature;
e=[];
td=[];
for n=1:280512;
es(n,:)=6.109*exp((17.625*TEMP(n,1))/(TEMP(n,1)+243.04)); % calculate saturation vapour pressure;
e(n,:)=es(n,:)*(RH(n,1)/100); % calculate vapour pressure;
td(n,:)=log(e(n,:)/6.109)*243.04/(17.625-log(e(n,:)/6.109)); % calculate dew point;
end

% Loop to compute specific humidity; 
PSRF_mb=Raw_Met_Data(:,12)/100; % Convert Pa to mb; 

e2=[];
q=[];
for n=1:280512;
e2(n,:)=6.109*exp((17.625*td(n,:))/(td(n,:)+243.04));
q(n,:)=(0.622*e2(n,:))/(PSRF_mb(n,:)-(0.378*e2(n,:)));
end 

save('q'); % Save specific humidity dataset; 

%% Combine Precip; 
total_precip = Raw_Met_Data(:,7)+Raw_Met_Data(:,8);

L = zeros(280512,1); % Loop to partition the precipitation when temperatures are greater than 1 oC;
for i=1:280512;
if(TEMP(i,1)>1);
    if_outcome=1;
else 
    if_outcome=0;
end 
L(i,1)=if_outcome;
Liquid=find(L(:,1)==1);
L(Liquid)=total_precip(Liquid);
end 

S = zeros(280512,1); % Loop to partition the precipitation when temperatures are less than 1 oC;
for i=1:280512;
if(TEMP(i,1)<1);
    if_outcome=1;
else 
    if_outcome=0;
end 
S(i,1)=if_outcome;
Solid=find(S(:,1)==1);
S(Solid)=total_precip(Solid);
end  

PRECIP=cat(2,L,S); % Combines datasets together;

%% Create dataset;
% Cat data together in columns expected by SVS2;
SVS2_Met_1991_2023=cat(2,UTC_Vec(:,4),UTC_Vec(:,5),DOY2,UTC_Vec(:,1),Raw_Met_Data(:,5),Raw_Met_Data(:,6),total_precip,TEMP,q,Raw_Met_Data(:,11:12),PRECIP(:,1),PRECIP(:,2)); % Cat dataset together; 

save('SVS2_Met_1991_2023'); % Save workspace; 

csvwrite('SVS2_Met_1991_2023.csv',SVS2_Met_1991_2023); % Save as .csv file; 