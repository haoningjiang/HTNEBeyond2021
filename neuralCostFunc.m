function [J, grad] = neuralCostFunc(init_theta, X, y, lambda)
% NEURALCOSTFUNC returns the cost and gradient for a two-layer neural
% network with one returned label. 

% reshape init_theta into theta1 and theta2; theta1 is 2x3, and theta2 is 1x3
Theta1 = reshape(init_theta(1:6), 2, 3);
Theta2 = reshape(init_theta(7:end), 1, 3);

% m is the number of training examples
m = size(X, 1);
         
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));


%add col of 1's to x
X = [ones(m, 1) X];


%cost function j
helpMatrix = sigmoid(X * Theta1');
helpMatrix = [ones(m, 1) helpMatrix];
h_theta = sigmoid(helpMatrix * Theta2');

log_h_theta = log(h_theta);
one_minus_log_h_theta = log(1 - h_theta);

%regularization
help_theta1 = Theta1;
help_theta1(:, 1) = 0;
help_theta2 = Theta2;
help_theta2(:, 1) = 0;

reg_term = (lambda / (2*m)) * (sum(sum(help_theta1 .^ 2)) + sum(sum(help_theta2 .^ 2)));

J = (-1/m) * sum(sum(y .* log_h_theta + (1 - y) .* one_minus_log_h_theta)) + reg_term;



%gradient

for t = 1:m
    %forward propagate 
    a_1 = X(t, :);
    a_1 = a_1';
    a_2 = sigmoid(Theta1 * a_1);
    a_2 = [1; a_2];
    a_3 = sigmoid(Theta2 * a_2);

    %get delta3
    delta_3 = a_3 - y;


    %get delta2
    z_2 = Theta1 * a_1;
    th2_helper = Theta2;
    th2_helper(:, 1) = [];
    delta_2 = th2_helper' * delta_3 .* sigmoidGradient(z_2);
               
    %accumulate
    Theta1_grad = Theta1_grad + delta_2 * a_1';
    Theta2_grad = Theta2_grad + delta_3 * a_2';
    
end


Theta1_grad = Theta1_grad / m;
Theta2_grad = Theta2_grad / m;

th1g_helper = Theta1 * lambda / m;
th1g_helper(:, 1) = 0;
th2g_helper = Theta2 * lambda / m;
th2g_helper(:, 1) = 0;

Theta1_grad = Theta1_grad + th1g_helper;
Theta2_grad = Theta2_grad + th2g_helper;
 

% unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
