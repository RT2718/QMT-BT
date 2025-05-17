
readme_text = """Quantum State Tomography & Bell Test MATLAB Suite

This repository contains MATLAB scripts for (1) simulating correlated photon measurements, (2) computing and visualizing density matrices from experimental/simulated data, and (3) storing raw count sequences for various angle settings.

Contents
- simulation.m
  Simulates correlated photon detections in the HH–VV basis and exports results to CSV.
- density.m
  Reads a CSV or Excel file of measurement counts, computes the four joint probabilities P_HH,P_HV,P_VH,P_VV (and similarly for the HV–VH basis), builds the 4x4 density matrices, and generates 3D bar plots for both bases.
- counts.m
  Defines the raw count sequence a0b225_1 (angle settings a=0°, b=22.5°) as a tab-separated string. Use str2num or strsplit to convert it into a numeric vector for further analysis.
- partB.m
  Defines the raw count sequence v1 for Part B of the experiment (angle settings a=0°, b=-22.5°) in the same format. Also requires conversion to numeric form.
- peaks.m
  Defines the raw sequence D2_1 from the 50-bit tomography run, stored as a single string. Parse into a vector before peak-finding or further processing.

Requirements
- MATLAB R2018b or later
- No additional toolboxes are strictly required, though the Statistics and Machine Learning Toolbox can simplify peak-finding.

Usage
1. Simulate correlated photon data:
   run simulation.m
   - Generates HH_VV_simulation_correlated.csv in the working directory.
   - Displays the first few rows in the Command Window.
2. Compute and plot density matrices:
   run density.m
   - Prompts you to select a .csv or .xlsx file.
   - Computes and plots 3D bar charts for both HH–VV and HV–VH probability matrices.
3. Load and convert raw count sequences:
   run counts.m     % loads variable a0b225_1 (string)
   data_vec = str2num(a0b225_1);   % numeric vector
   run partB.m
   v1_vec = str2num(v1);
   run peaks.m
   D2_1_vec = str2num(D2_1);
4. Peak analysis (optional):
   [pks, locs] = findpeaks(D2_1_vec);
   plot(D2_1_vec); hold on;
   plot(locs, pks, 'ro');

File Descriptions
simulation.m:
  Purpose: Generate a synthetic dataset of photon detection events where Alice’s and Bob’s outcomes are perfectly correlated in the HH–VV basis.
density.m:
  Purpose: From real or simulated measurement counts, estimate the joint probabilities and visualize the resulting density matrices.
counts.m:
  Purpose: Store the raw counts from the measurement at a=0°, b=22.5°.
partB.m:
  Purpose: Store the raw counts for Part B (a=0°, b=-22.5°).
peaks.m:
  Purpose: Provide the sequence of measured values (D2_1) from a 50-bit tomography run for peak detection or further time-series analysis.
