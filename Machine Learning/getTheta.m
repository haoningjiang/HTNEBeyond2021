function [Theta1, Theta2] = getTheta(X, y, lambda)

%GETTHETA returns matrices Theta1 and Theta2, which are obtained by
%minimizing neuralcostfunc via fmincg. Theta1 and Theta2 contain the
%parameters obtained by training the neural network using the training
%data. 


%shorthand for neuralcostfunc, that only takes in the nn param as input
costFunction = @(p) neuralCostFunc(p, X, y, lambda);

%random initial thetas to to avoid symmetry issue
init_Theta1 = rand(2, 3) * 2 * 0.12 - 0.12;
init_Theta2 = rand(1, 3) * 2 * 0.12 - 0.12;

init_theta = [init_Theta1(:) ; init_Theta2(:)];

%find theta by minimizing cost function
options = optimset('MaxIter', 50);
[theta, ~] = fmincg(costFunction, init_theta, options);

Theta1 = reshape(theta(1:6), 2, 3);
Theta2 = reshape(theta(7:end), 1, 3);


end
