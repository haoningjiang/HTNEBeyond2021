function [Theta1 Theta2] = getTheta(X, y, lambda, layer_size)

%GETTHETA returns matrices Theta1 and Theta2, which are obtained by
%minimizing neuralcostfunc via fmincg. Theta1 and Theta2 contain the
%parameters obtained by training the neural network using the training
%data. 

%shorthand for neuralcostfunc, that only takes in the nn param as input
costFunction = @(p) neuralCostFunc(p, X, y, lambda, layer_size);

%random initial thetas to to avoid symmetry issue
init_Theta1 = rand(layer_size, layer_size + 1) * 2 * 0.12 - 0.12;
init_Theta2 = rand(1, layer_size + 1) * 2 * 0.12 - 0.12;

init_theta = [init_Theta1(:) ; init_Theta2(:)];

%find theta by minimizing cost function
%options = optimset('MaxIter', 50);
%[theta, ~] = fmincg(costFunction, init_theta, options);

%options = optimoptions(@fminunc,'Algorithm','trust-region','SpecifyObjectiveGradient',true);

options = optimoptions(@fminunc, 'Display', 'iter', 'Algorithm', 'trust-region', ...
    'SpecifyObjectiveGradient', true, 'StepTolerance', 1e-8, 'CheckGradients', true);
[theta grad] = fminunc(costFunction, init_theta, options);

Theta1 = reshape(theta(1:layer_size * (layer_size + 1)), layer_size, layer_size + 1);
Theta2 = reshape(theta(1 + (layer_size * (layer_size + 1)):end), 1, layer_size + 1);

end
