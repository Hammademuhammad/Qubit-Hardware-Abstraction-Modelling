% MATLAB Code to Visualize Bloch Sphere with 5 Quantum States
clear; clc; close all;

[x, y, z] = sphere(50); % Generate sphere coordinates
figure;
surf(x, y, z, 'FaceAlpha', 0.1, 'EdgeColor', 'none'); % Plot Bloch sphere
hold on;
axis equal;
xlabel('X-axis');
ylabel('Y-axis');
zlabel('Z-axis');
title('Bloch Sphere with 5 Quantum States');
colormap winter;

states = [
    0, 0;               % State |0⟩ (north pole)
    pi, 0;              % State |1⟩ (south pole)
    pi/2, 0;            % State on equator along +X-axis
    pi/2, pi/2;         % State on equator along +Y-axis
    pi/2, pi            % State on equator along -X-axis
];

colors = ['r', 'g', 'b', 'm', 'k']; % Colors for the states
for i = 1:size(states, 1)
    theta = states(i, 1);
    phi = states(i, 2);
    % Convert to Cartesian coordinates
    x_state = sin(theta) * cos(phi);
    y_state = sin(theta) * sin(phi);
    z_state = cos(theta);
    % Plot the state
    plot3(x_state, y_state, z_state, 'o', 'MarkerSize', 10, ...
          'MarkerFaceColor', colors(i), 'MarkerEdgeColor', 'k');
    % Add text label
    text(x_state * 1.1, y_state * 1.1, z_state * 1.1, ...
         ['State ', num2str(i)], 'FontSize', 12, 'Color', colors(i));
end

line([-1, 1], [0, 0], [0, 0], 'Color', 'r', 'LineWidth', 1.5); % X-axis
line([0, 0], [-1, 1], [0, 0], 'Color', 'g', 'LineWidth', 1.5); % Y-axis
line([0, 0], [0, 0], [-1, 1], 'Color', 'b', 'LineWidth', 1.5); % Z-axis

view([30, 30]); % Set 3D view angle
grid on;

legend('Bloch Sphere', 'State 1 |0⟩', 'State 2 |1⟩', 'State 3', ...
       'State 4', 'State 5', 'Location', 'northeastoutside');
hold off;


