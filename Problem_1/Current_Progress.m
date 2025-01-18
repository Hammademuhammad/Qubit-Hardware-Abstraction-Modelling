states = {
    'S0', [1; 0];
    'S4', [0; 1];
    'S1', [sqrt(0.75); sqrt(0.25)];
    'S2', [sqrt(0.5); sqrt(0.5)];
    'S3', [sqrt(0.25); sqrt(0.75)];
};

transitionCosts = [
    0, 10, 10, 10, 10;
    10, 0, 1, 1, 1;
    10, 1, 0, 1, 10;
    10, 1, 1, 0, 1;
    10, 1, 10, 1, 0
];

G = digraph(transitionCosts, {'S0', 'S4', 'S1', 'S2', 'S3'});

figure;
plot(G, 'EdgeLabel', G.Edges.Weight);
title('Quantum State Transition Graph');
xlabel('States');
ylabel('States');

[startNode, endNode] = deal(1, 2);
[shortestPath, pathCost] = shortestpath(G, startNode, endNode);

fprintf('Shortest path from S0 to S4: ');
for i = 1:length(shortestPath)
    fprintf('%s ', G.Nodes.Name{shortestPath(i)});
end
fprintf('\nTotal cost: %.2f\n', pathCost);

function newState = transition(state, target, weight)
    operator = eye(2) * sqrt(1 - weight / max(weight));
    newState = operator * state;
    newState = newState / norm(newState);
end

currentState = states{1, 2};
finalState = states{2, 2};
weight = transitionCosts(1, 2);
newState = transition(currentState, finalState, weight);

fprintf('Initial state: [%.2f, %.2f]\n', currentState(1), currentState(2));
fprintf('New state after transition: [%.2f, %.2f]\n', newState(1), newState(2));
