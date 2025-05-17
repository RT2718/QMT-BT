num_photons = 1000;  % Number of random photon states
photon_states = randi([0, 1], num_photons, 1);  % Generate random bits ( |H⟩, |V⟩)

results = zeros(num_photons, 5);  % Matrix Columns: [Bit, Alice-V, Alice-H, Bob-V, Bob-H]
results(:, 1) = photon_states;  % Store photon states

% --- Simulate Detection in HH-VV Basis  ---
for i = 1:num_photons
    % --- Bob's Detection (Random 50-50 Chance) ---
    if rand() > 0.5
        results(i, 4) = 0;  % Bob-V = 0
        results(i, 5) = 1;  % Bob-H = 1
    else
        results(i, 4) = 1;  % Bob-V = 1
        results(i, 5) = 0;  % Bob-H = 0
    end
    
    % --- Alice's Detection (Fully correlated with Alice) ---
    results(i, 2) = results(i, 4);  % Alice-V mirrors Bob-V
    results(i, 3) = results(i, 5);  % Alice-H mirrors Bob-H
end

% --- Create Table and Export to CSV ---
T = array2table(results, 'VariableNames', {'Bit', 'Alice_V', 'Alice_H', 'Bob_V', 'Bob_H'});
writetable(T, 'HH_VV_simulation_correlated.csv');
disp('Simulation results saved to HH_VV_simulation_correlated.csv');
disp(T);  % Display table
