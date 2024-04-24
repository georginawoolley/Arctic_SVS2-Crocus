# TVC_SVS2-Crocus_Arctic_Ensemble
Code and data for Ensemble modelling of Arctic tundra snowpack properties, Woolley et al., [DOI Pending]

Ensemble output to create figures can be found at: 10.6084/m9.figshare.25639215

# Abstract 

Sophisticated snowpack models such as Crocus and SNOWPACK struggle to properly simulate profiles of density and specific surface area (SSA) within Arctic snowpacks due to an underestimation of wind-induced compaction, misrepresentation of basal vegetation influencing compaction and metamorphism, and omission of water vapour flux transport. To improve the simulation of profiles of density and SSA, parameterisations of snow physical processes that consider the effect of high wind speeds, the presence of basal vegetation and alternate thermal conductivity formulations were implemented into an ensemble version of the Soil, Vegetation and Snow version 2 (SVS2-Crocus) land surface model, creating Arctic SVS2-Crocus. The ensemble versions of default and Arctic SVS2-Crocus were driven with in-situ meteorological data and evaluated using measurements of snowpack properties (snow water equivalent; SWE, depth, density and SSA) at Trail Valley Creek (TVC), Northwest Territories, Canada over 32-years (1991-2023). Results show that both default and Arctic SVS2-Crocus can simulate the correct magnitude of SWE (RMSE for both ensembles: 55 kg m-2) and snow depth (default RMSE: 0.22 m; Arctic RMSE: 0.18 m) at TVC in comparison to measurements. Wind-induced compaction within Arctic SVS2-Crocus effectively compacts the surface layers of the snowpack, increasing the density, and reducing the RMSE in density by 41% (176 kg m-3 to 103 kg m-3). Parameterisations of basal vegetation are less effective in reducing compaction of basal snow layers (default RMSE: 67 kg m-3; Arctic RMSE: 65 kg m-3), reaffirming the need to consider water vapour flux transport for simulation of low-density basal layers. The top 100 ensemble members of Arctic SVS2-Crocus produced lower continuous ranked probability scores (CRPS) than default SVS2-Crocus when simulating snow density profiles. The top performing members of the Arctic SVS2-Crocus ensemble featured modifications that raise wind speeds to increase compaction in snow surface layers and prevent snowdrift and increase viscosity in basal layers. Selecting these process representations in Arctic SVS2-Crocus will improve simulation of snow density profiles, which is crucial for many applications. 

# GitRepo Breakdown

The gitrepo contains 3 subfolders: 

Code_For_Figures = Contains matlab code to create all figures.
Ensemble_Members = Contains text files of raw ensemble members.
TVC_Snow_Measurements = Contains dataset of measured snowpack properties.

and 2 files: 

README.md (this file)
Variable_Names.txt = Contains breakdown of variable names within netcdf files.
jbfill* = Matlab function to shade areas between curves.
crps** = Matlab function to calculate the CRPS.

In order to create figures:

1. Download all netcdf files from 10.6084/m9.figshare.25639215 - these contain the ensemble output required to create figures and measurements of snowpack properties.
2. Run SD_SWE_BD_Fig_Code.m for evaluation of bulk snowpack properties (figures 2, 3, appendix B1, B2, B3).
3. Run Density_Evaluation.m for evaluation of snow density profiles (figures 4 & 6).
4. Run SSA_Evaluation.m for evaluation of SSA profiles (figures 5 & 7).
5. Run Ranked_CRPS_Density.m for ranking of ensemble members for simulation of snow density (figures 8 & 9).
6. Run Ranked_CRPS_SSA.m for ranking of ensemble members for simulation of SSA (supplementary material S1 & S2).

* John Bockstege (2024). Shade area between two curves (https://www.mathworks.com/matlabcentral/fileexchange/13188-shade-area-between-two-curves), MATLAB Central File Exchange. Retrieved April 24, 2024.
* * Durga Lal Shrestha (2024). Continuous rank probability score (https://www.mathworks.com/matlabcentral/fileexchange/47807-continuous-rank-probability-score), MATLAB Central File Exchange. Retrieved April 24, 2024.


