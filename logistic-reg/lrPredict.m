function p = lrPredict(theta, X, threshold)

m = size(X, 1); % Number of training examples
X = [ones(m, 1) X];

p = sigmoid(X * theta);
p(p >= threshold) = 1;
p(p < threshold) = 0;

end
