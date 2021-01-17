function J = lrCost(theta, X, y)
%basically the same as the one in the other cost function but without regularization and without grad
%used to pick best model 

m = length(y); % number of training examples
X = [ones(m, 1) X];

J = 0;

yZero = y .* log(sigmoid(X * theta));
yOne = (1 - y) .* log(1 - sigmoid(X * theta));

J = (-1/m) * sum(yZero + yOne);

end
