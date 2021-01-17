function [error_train, error_val] = ...
    learningCurve(X, y, Xval, yval, lambda, num_inputs)
m = size(X, 1);

error_train = zeros(m, 1);
error_val   = zeros(m, 1);

for i = 1:m
    x_train = X(1:i, :);
    y_train = y(1:i);
    
    [theta_train] = lrGetTheta(x_train, y_train, lambda, num_inputs);
    [j_train, grad_train] = lrCostFunc(theta_train, x_train, y_train, 0);
    error_train(i) = j_train;
    
    x_cv = Xval(1:i, :);
    y_cv = yval(1:i);
    
    [j_cv, grad_cv] = lrCostFunc(theta_train, Xval, yval, 0);
    error_val(i) = j_cv;

end
