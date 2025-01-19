% Quantum NOT gate simulation using classical logic
%Refer to https://github.com/Hammademuhammad/Qubit-Hardware-Abstraction-Modelling/tree/main/Problem_1

clear; clc;

states = ["|0⟩", "|1⟩", "75% |0⟩ + 25% |1⟩", "75% |1⟩ + 25% |0⟩", "50% |0⟩ + 50% |1⟩"];
probabilities = [0, 1, 0.75, 0.25, 0.5]; 

disp("Quantum NOT Gate Simulation:");
for i = 1:length(states)
    state = states(i);
    prob = probabilities(i);
    disp("Input State: " + state);
 
    if prob == 0
        output = "|1⟩";
    elseif prob == 1
 
        output = "|0⟩";
    else
        r = rand; 
        if r < prob
            output = "|1⟩"; 
        else
            output = "|0⟩"; % Flip to |0⟩ with remaining p
        end
    end
    disp("Output State: " + output);
    disp("-----------------------------");
end
