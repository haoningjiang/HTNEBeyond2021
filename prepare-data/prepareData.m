function [X, y] = prepareData(file)
%call with movie_data.txt 

moviedata = dlmread(file);
y = moviedata(:, end);
x = moviedata(:, [1:4]);
m = length(y);

%add column for ratio
X = [x (x(:, 2) ./ (x(:, 1) + x(:, 2)))];
X(:, 3) = X(:, 3) / 1000;
X(:, 4) = X(:, 4) / 10;
X(:, 5) = X(:, 5) * 10;

end
