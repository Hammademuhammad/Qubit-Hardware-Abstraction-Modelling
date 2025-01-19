clear; clc; close all;
theta = pi/4;
phi = pi/4;
state_pure = [sin(theta)*cos(phi), sin(theta)*sin(phi), cos(theta)];
sigma = 0.1;
num_samples = 1000;
noisy_states = zeros(num_samples, 3);

for i = 1:num_samples
    noisy_theta = theta + normrnd(0, sigma);
    noisy_phi = phi + normrnd(0, sigma);
    x = sin(noisy_theta) * cos(noisy_phi);
    y = sin(noisy_theta) * sin(noisy_phi);
    z = cos(noisy_theta);
    noisy_states(i, :) = [x, y, z];
end

[x, y, z] = sphere(50);
figure;
surf(x, y, z, 'FaceAlpha', 0.1, 'EdgeColor', 'none');
hold on;
axis equal;
xlabel('X-axis'); ylabel('Y-axis'); zlabel('Z-axis');
title('Bloch Sphere: White Gaussian Noise on a Qubit');
colormap winter;

plot3(state_pure(1), state_pure(2), state_pure(3), 'ro', ...
      'MarkerSize', 12, 'MarkerFaceColor', 'r', 'DisplayName', 'Initial State');

plot3(noisy_states(:, 1), noisy_states(:, 2), noisy_states(:, 3), '.', ...
      'MarkerSize', 8, 'DisplayName', 'Noisy States');

legend show;
grid on;
view([30, 30]);
