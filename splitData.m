function [ytr, ycv, yts, Xa, Xb, Xc, Xd, Xe, Xatr, Xacv, Xats, Xbtr, Xbcv, Xbts, ...
    Xctr, Xccv, Xcts, Xdtr, Xdcv, Xdts, Xetr, Xecv, Xets] ...
    = splitData(X, y)

ytr = y([1:900], :);
ycv = y([901:1186], :);
yts = y([1187:end], :);



Xa = [X(:, [1, 2, 3, 4]) ((X(:, 1) .^2)./100) ((X(:, 2) .^2)./10)];

Xatr = Xa([1:900], :);
Xacv = Xa([901:1186], :);
Xats = Xa([1187:end], :);


Xb = [X(:, [1, 2, 3]) ((X(:, 1) .^2)./100) ((X(:, 2) .^2)./10)];

Xbtr = Xb([1:900], :);
Xbcv = Xb([901:1186], :);
Xbts = Xb([1187: end], :);


Xc = [X(:, [1, 2, 4]) ((X(:, 1) .^2)./100) ((X(:, 2) .^2)./10)];

Xctr = Xc([1:900], :);
Xccv = Xc([901:1186], :);
Xcts = Xc([1187: end], :);

Xd = [X(:, [2, 4]) ((X(:, 1) .^2)./100) ((X(:, 2) .^2)./10)];

Xdtr = Xd([1:900], :);
Xdcv = Xd([901: 1186], :);
Xdts = Xd([1187: end], :);

Xe = [X(:, [1, 2, 4]) ((X(:, 1) .^2)./100) ((X(:, 1) .^2)./100)];

Xetr = Xe([1:900], :);
Xecv = Xe([901: 1186], :);
Xets = Xe([1187: end], :);


end