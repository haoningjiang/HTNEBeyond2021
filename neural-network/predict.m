function p = predict(Theta1, Theta2, X)

%PREDICT returns a prediction (1 or 0) as to whether or not a certain film
%(X) passes the Bechdel test. 

m = size(X, 1);
p = zeros(size(X, 1), 1);

%add column of 1's to X
%X = [ones(m, 1) X];

h1 = sigmoid([ones(m, 1) X] * Theta1');
h2 = sigmoid([ones(m, 1) h1] * Theta2');
[dummy, p] = max(h2, [], 2);
p = p - 1; %since indexing in matlab starts at 1? 


end
