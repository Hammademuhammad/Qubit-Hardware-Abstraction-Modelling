clear; clc; close all;
num_steps = 1000;
time = linspace(0, 10, num_steps);
potential_barrier = @(x) (x > 4 & x < 6) * 10;
qubit_state = zeros(1, num_steps);
qubit_state(1) = 1;
probability_tunneling = 0.05;
sigma = 0.1;
noise = sigma * randn(1, num_steps);

for t = 2:num_steps
    if rand < probability_tunneling
        qubit_state(t) = qubit_state(t-1) - potential_barrier(time(t)) + noise(t);
    else
        qubit_state(t) = qubit_state(t-1) + noise(t);
    end
end

plot(time, qubit_state, 'b');
hold on;
yline(0, 'r--', 'Barrier');
xlabel('Time');
ylabel('Qubit State');
title('Quantum Tunneling with White Gaussian Noise');
grid on;
