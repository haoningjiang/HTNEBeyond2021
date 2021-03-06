function [ytr, ycv, yts, Xa, Xb, Xc, Xd, Xe, Xatr, Xacv, Xats, Xbtr, Xbcv, Xbts, ...
    Xctr, Xccv, Xcts, Xdtr, Xdcv, Xdts, Xetr, Xecv, Xets] ...
    = splitData(X, y)
%split data into training, cross validation, test set
%also create different X's with different features (ie. polynomial ones) to test multiple at once


ytr = y([1:900], :);
ycv = y([901:1186], :);
yts = y([1187:end], :);


%ended up going with this one
Xa = [X(:, [1, 2, 3, 4]) ((X(:, 1) .^2)./100) ((X(:, 2) .^2)./10) ...
    ((X(:, 2) .^3) / 10) (X(:, 3) .^ 3) ((X(:, 5) .^ 3) ./ 100)];

Xatr = Xa([1:900], :);
Xacv = Xa([901:1186], :);
Xats = Xa([1187:end], :);


Xb = [X(:, [1, 2, 3, 4]) ((X(:, 1) .^2)./100) ((X(:, 2) .^2)./10) ...
    (X(:, 2) .^3 / 10) (X(:, 5) .^ 3)];


Xbtr = Xb([1:900], :);
Xbcv = Xb([901:1186], :);
Xbts = Xb([1187: end], :);


Xc = [X(:, [1, 2, 3, 4]) ((X(:, 1) .^2)./100) ((X(:, 2) .^2)./10) ...
    (X(:, 2) .^3 / 10) (X(:, 3) .^ 3)];


Xctr = Xc([1:900], :);
Xccv = Xc([901:1186], :);
Xcts = Xc([1187: end], :);

Xd = [X(:, [1, 2, 3, 4]) ((X(:, 1) .^2)./100) ((X(:, 2) .^2)./10) ...
    (X(:, 3) .^ 3) (X(:, 5) .^ 3)];


Xdtr = Xd([1:900], :);
Xdcv = Xd([901: 1186], :);
Xdts = Xd([1187: end], :);

Xe = [X(:, [1, 2, 3, 4]) ((X(:, 1) .^2)./100) ((X(:, 2) .^2)./10) ...
    (X(:, 2) .^3 / 10) (X(:, 3) .^ 3) (X(:, 5) .^ 3)];


Xetr = Xe([1:900], :);
Xecv = Xe([901: 1186], :);
Xets = Xe([1187: end], :);


end
