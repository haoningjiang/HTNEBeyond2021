function theta = lrGetTheta(X, y, lambda, num_inputs)

costFunction = @(p) lrCostFunc(p, X, y, lambda);

%random initial thetas to to avoid symmetry issue
init_theta = rand(num_inputs + 1, 1) * 2 * 0.12 - 0.12;

%find theta by minimizing cost function

options = optimoptions(@fminunc, 'Display', 'iter', 'Algorithm', 'trust-region', ...
    'SpecifyObjectiveGradient', true);
[theta, grad] = fminunc(costFunction, init_theta, options);

end
