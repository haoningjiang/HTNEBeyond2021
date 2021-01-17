function [J, grad] = lrCostFunc(theta, X, y, lambda)

m = size(X, 1); % number of training examples
X = [ones(m, 1) X];

J = 0;
grad = zeros(size(theta));

% cost
yZero = y .* log(sigmoid(X * theta));
yOne = (1 - y) .* log(1 - sigmoid(X * theta));

helpMatrix = theta;
helpMatrix(1) = 0;

J = (-1/m) * sum(yZero + yOne) + (lambda / (2 * m) * sum(helpMatrix .^ 2));

% gradient 
sumErr = sum((sigmoid(X * theta) - y) .* X);

regressMatrix = (lambda / m) * theta;
regressMatrix(1) = 0;

grad = (sumErr / m)' + regressMatrix;

end
