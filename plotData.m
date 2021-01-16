function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%
Setosa = find(y==0);
Versicolor = find(y==1);

plot(X(Setosa,1), X(Setosa,2), 'k+', 'LineWidth', 2, 'MarkerSize', 6);
plot(X(Versicolor,1),X(Versicolor,2), 'ko', 'MarkerFaceColor', 'y', 'MarkerSize', 6);


% =========================================================================



hold off;

end