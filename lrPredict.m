function p = lrPredict(theta, X)

m = size(X, 1); % Number of training examples
X = [ones(m, 1) X];

%p = zeros(m, 1);

%h = sigmoid(X * theta);

%for i = 1:m
    %if h(m) >= 0.1
    %    p(m) = 1;
    %end
    %p(m) = h(m);
%end

p = sigmoid(X * theta);
p(p >= 0.5) = 1;
p(p < 0.5) = 0;

end
