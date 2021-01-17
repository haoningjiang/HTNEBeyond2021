function [f, num_wrong] = thresholdCheck(X, y, theta, threshold)

mistakes = lrPredict(theta, X, threshold) - y;
false_neg = -1 * sum(mistakes(mistakes == -1));
false_pos = sum(mistakes(mistakes == 1));

num_wrong = sum(abs(mistakes));

mistwo = lrPredict(theta, X, threshold) + y;
true_pos = sum(mistwo(mistwo == 2)) / 2;

precision = true_pos / (true_pos + false_pos);
recall = true_pos / (true_pos + false_neg);

f = 2 * precision * recall / (precision + recall);