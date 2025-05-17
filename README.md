In this laboratory, we use MATLAB to reconstruct polarization-entangled photon states, generate and visualize their density matrices, and assess their nonclassical correlations by evaluating Bell’s inequality parameters.
This repository contains MATLAB scripts for (1) simulating correlated photon measurements, (2) computing and visualizing density matrices from experimental/simulated data, and (3) calculating the values and errors of the Bell parameter.

Final3DPlotterSaraGarry (1).m / density.m:
This script reconstructs the density matrix to compute entanglement probabilities and then renders the resulting 4×4 matrix as a 3D bar chart: each bar’s height and its interpolated color represent the corresponding probability, and the X- and Y-axes are annotated with the input (“VV”, “VH”, “HV”, “HH”) and measurement (“HH”, “HV”, “VH”, “VV”) state labels, covering both the HH–VV and HV–VH bases. Used in quantum tomography part

define_camera_gary (1).m:
Enables us to load the cameras in the laboratory's computer.

gen_random_pulses (1).m:
Generates random bit vectors for us to use in both parts
partB.m:
This code is used to create the Intevsity VS. frame number graphs. for the second part of the experiment.

simulation.m:
Code for simulating the experiment using the computer, in order to get ideal and larger-scale results. Used in part 1 of the experiment

plotter_gary.m:
used to get the vector necessary for the other parts. used in both parts

counts.m:
Tell us the number of peaks over the threshold in part 2 of the experiment for each graph of an angle pair.

S and its error are calculated by hand in Excel and N, E are calculated by the former codes
