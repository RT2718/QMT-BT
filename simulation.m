% Improved simulation of HH–VV entangled photon measurements
% Vectorized, reproducible, and clear variable naming

% Ensure reproducible randomness
rng('default');  

% Parameters
numPhotons = 1000;                           % Number of photon trials - can be 50, 100 or 1000 in this experiment
photonStates = randi([0, 1], numPhotons, 1); % Random bit sequence: 0→H, 1→V

% Simulate Bob's detection outcomes (0=H, 1=V) with 50/50 probability
bobV = rand(numPhotons, 1) < 0.5;   % Logical array: true if V detected
bobH = ~bobV;                      % Complement: H when not V

% Alice's outcomes perfectly correlate: mirrors Bob's detections
aliceV = bobV;
aliceH = bobH;

% Assemble results matrix
% Columns: [Bit, Alice_V, Alice_H, Bob_V, Bob_H]
results = [photonStates, aliceV, aliceH, bobV, bobH];

% Convert to table for clarity and export
variableNames = {'Bit', 'Alice_V', 'Alice_H', 'Bob_V', 'Bob_H'};
T = array2table(results, 'VariableNames', variableNames);

% Export to CSV
outputFile = 'HH_VV_simulation_correlated.csv';
writetable(T, outputFile);

% Feedback to user
fprintf('Simulation complete: saved results to %s\n', outputFile);

disp('First 10 rows of results:');
disp(T(1:min(10,numPhotons), :))
