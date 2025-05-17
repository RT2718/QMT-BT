[file, path] = uigetfile({'*.xlsx;*.csv', 'Excel or CSV Files (*.xlsx, *.csv)'}, 'Select the File');
full_path = fullfile(path, file);

if endsWith(file, '.csv')
    data = readmatrix(full_path);  % Read CSV file =>Goof for simulation matrix
else
    data = readmatrix(full_path, 'Sheet', '50 Bits');  % Read Excel sheet => Good for the experiment data
end

% --- Extract Columns (, Alice V/H, Bob V/H) ---
AliceV = data(:, 4); % Alice-V measurements
AliceH = data(:, 2); % Alice-H measurements
BobV = data(:, 5);   % Bob-V measurements  
BobH = data(:, 3);   % Bob-H measurements

P_HH=0;
P_HV=0;
P_VV=0;
P_VH=0;

function prob = probability(i, alice, bob, AliceH, AliceV, BobH,BobV)
    sum = AliceH(i)+AliceV(i)+BobH(i)+BobV(i);
    prob = (alice(i)+bob(i))/sum;
end

for i = 1:length(AliceV)
    P_HH = P_HH + probability(i,AliceH,BobH,AliceH, AliceV, BobH,BobV);
    P_HV = P_HV + probability(i,AliceH,BobV,AliceH, AliceV, BobH,BobV);
    P_VH = P_VH + probability(i,AliceV,BobH,AliceH, AliceV, BobH,BobV);
    P_VV = P_VV + probability(i,AliceV,BobV,AliceH, AliceV, BobH,BobV);
end

P_HH=P_HH/length(AliceV);
P_HV=P_HV/length(AliceV);
P_VV=P_VV/length(AliceV);
P_VH=P_VH/length(AliceV);

density_matrix_HHVV = zeros(4, 4);
density_matrix_HHVV(1, 1) = P_HH;  
density_matrix_HHVV(1, 4) = P_HV;  
density_matrix_HHVV(4, 1) = P_VH;  
density_matrix_HHVV(4, 4) = P_VV;  

% --- Visualize the Probability Matrix HH-VV as a 3D Bar Plot ---
figure;
G2_plot = bar3(density_matrix_HHVV);

% Apply interpolated coloring
for k = 1:length(G2_plot)
    zdata = G2_plot(k).ZData;
    G2_plot(k).CData = zdata;
    G2_plot(k).FaceColor = 'interp';
end

% Customize the plot labels
set(gca, 'XTickLabel', {'HH', 'HV', 'VH', 'VV'});
set(gca, 'YTickLabel', {'HH', 'HV', 'VH', 'VV'});
title('Density Matrix Simulation HH-VV');
%title('Density Matrix HH-VV - 50 Bits');
xlabel('\bf Detector');
ylabel('\bf Source');
colormap(parula);
colorbar;

% --- Extract Columns (, Alice V/H, Bob V/H) ---
AliceV = data(:, 4); % Alice-V measurements
AliceH = data(:, 2); % Alice-H measurements
BobV = data(:, 3);   % Bob-V measurements  
BobH = data(:, 5);   % Bob-H measurements

P_HVVH=0;
P_HVHV=0;
P_VHVH=0;
P_VHHV=0;

for i = 1:length(AliceV)
    P_HVVH = P_HVVH + probability(i,AliceV,BobH,AliceH, AliceV, BobH,BobV);
    P_HVHV = P_HVHV + probability(i,AliceV,BobV,AliceH, AliceV, BobH,BobV);
    P_VHVH = P_VHVH + probability(i,AliceH,BobH,AliceH, AliceV, BobH,BobV);
    P_VHHV = P_VHHV + probability(i,AliceH,BobV,AliceH, AliceV, BobH,BobV);
end

P_HVVH=P_HVVH/length(AliceV);
P_HVHV=P_HVHV/length(AliceV);
P_VHVH=P_VHVH/length(AliceV);
P_VHHV=P_VHHV/length(AliceV);

%densitu matrix HVVH
density_matrix_HV = zeros(4, 4);
density_matrix_HV(3, 2) =P_HVVH;  % Probability of HV -> VH
density_matrix_HV(3, 3) = P_VHVH;  % Probability of VH -> VH
density_matrix_HV(2, 2) = P_HVHV;  % Probability of HV -> HV
density_matrix_HV(2, 3) = P_VHHV;  % Probability of VH -> HV

% --- Visualize the Probability Matrix H as a 3D Bar Plot ---
figure;
G2_plot = bar3(density_matrix_HV);

% Apply interpolated coloring
for k = 1:length(G2_plot)
    zdata = G2_plot(k).ZData;
    G2_plot(k).CData = zdata;
    G2_plot(k).FaceColor = 'interp';
end

% Customize the plot labels
set(gca, 'XTickLabel', {'HH', 'HV', 'VH', 'VV'});
set(gca, 'YTickLabel', {'HH', 'HV', 'VH', 'VV'});
title('Density Matrix Simulation HV-VH');
%title('Density Matrix HV-VH - 50 Bits');
xlabel('\bf Detector');
ylabel('\bf Source');
colormap(parula);
colorbar;