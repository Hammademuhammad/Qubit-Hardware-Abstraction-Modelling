% FPGA Based Hardware abstraction of Quantum Computing By Madiha Khalid et al.
% Emulates the Qubit storage, gates and measurements in BB84 Protocols

clear; clc;

num_qubits = 8;
basis_labels = ["+", "×"];
states_labels = ["|0⟩", "|1⟩"];
basis = [1, 0; 1/sqrt(2), 1/sqrt(2); 0, 1; 1/sqrt(2), -1/sqrt(2)];

private_key = randi([0, 1], 1, num_qubits);
random_basis = randi([0, 1], 1, num_qubits);

disp("Private Key: "); disp(private_key);
disp("Random Basis: "); disp(basis_labels(random_basis + 1));

encoded_qubits = zeros(num_qubits, 2);
for i = 1:num_qubits
    if random_basis(i) == 0
        encoded_qubits(i, :) = basis(1 + private_key(i), :);
    else
        encoded_qubits(i, :) = basis(3 + private_key(i), :);
    end
end
disp("Encoded Qubits: ");
disp(encoded_qubits);

received_basis = randi([0, 1], 1, num_qubits);
received_key = zeros(1, num_qubits);
disp("Received Basis: "); disp(basis_labels(received_basis + 1));

for i = 1:num_qubits
    if received_basis(i) == random_basis(i)
        prob_0 = abs(encoded_qubits(i, 1))^2;
        if rand < prob_0
            received_key(i) = 0;
        else
            received_key(i) = 1;
        end
    else
        received_key(i) = randi([0, 1]);
    end
end

disp("Received Key: ");
disp(received_key);

matching_indices = find(random_basis == received_basis);
transmitted_key = private_key(matching_indices);
retrieved_key = received_key(matching_indices);

disp("Matching Indices: ");
disp(matching_indices);

disp("Transmitted Key (Valid Basis Matches): ");
disp(transmitted_key);

disp("Retrieved Key (Valid Basis Matches): ");
disp(retrieved_key);

error_rate = 1 - sum(transmitted_key == retrieved_key) / length(transmitted_key);
disp("Error Rate: "); disp(error_rate);
