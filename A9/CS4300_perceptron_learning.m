function [weights, trace] = CS4300_perceptron_learning(x, y, alpha, ...
    max_iter, rate)
% CS4300_perceptron_learning - find linear separating hyperplane
% On input:
%   X (nxm array): n independent variable samples each of length m
%   y (nx1 vector): dependent variable samples
%   alpha (float): learning rate
%   max_iter (int): max number of iterations
%   rate (Boolean): if 1 then alpha = 1000/(1000+iter), else
%       constant
% On output:
%   w (m+1x1 vector): weights for linear function
%   per_cor (kxm+1 array): trace of percentage correct with weight
% Call:
%   [w,pc] = CS4300_perceptron_learning(X,y,0.1,10000);
% Author:
%   Matthew Lemon
%   UU575787
%   Derek Heldt-Werle
%   UU828479
%   Fall 2016
%

end