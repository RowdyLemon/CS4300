function [U,U_trace] = CS4300_A7_runner()
% CS4300_A7_runner - Used to call value iteration by setting up params
% On output:
%       U (vector): state utilities
%       U_trace (iterxn): trace of utility values during iteration
% On output:
%       U (vector): state utilities
%       U_trace (iterxn): trace of utility values during iteration
% Call:
%       [U, U_trace] = CS4300_A7_runner();
% Author:
%   Matthew Lemon
%   UU575787
%   Derek Heldt-Werle
%   UU828479
%   Fall 2016
%

S = [1:16];
A = [1:4];
P(1,1).probs = [0.1, 0.1, 0, 0, 0.8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
P(1,2).probs = [0.9, 0, 0, 0, 0.1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
P(1,3).probs = [0.9, 0.1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
P(1,4).probs = [0.1, 0.8, 0, 0, 0.1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
P(2,1).probs = [0.1, 0, 0.1, 0, 0, 0.8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
P(2,2).probs = [0.8, 0.1, 0, 0, 0, 0.1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
P(2,3).probs = [0.1, 0.8, 0.1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
P(2,4).probs = [0, 0.1, 0.8, 0, 0, 0.1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
P(3,1).probs = [0, 0.1, 0, 0.1, 0, 0, 0.8, 0, 0, 0, 0, 0, 0, 0, 0, 0];
P(3,2).probs = [0, 0.8, 0.1, 0, 0, 0, 0.1, 0, 0, 0, 0, 0, 0, 0, 0, 0];
P(3,3).probs = [0, 0.1, 0.8, 0.1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
P(3,4).probs = [0, 0, 0.1, 0.8, 0, 0, 0.1, 0, 0, 0, 0, 0, 0, 0, 0, 0];
P(4,1).probs = [0, 0, 0.1, 0.1, 0, 0, 0, 0.8, 0, 0, 0, 0, 0, 0, 0, 0];
P(4,2).probs = [0, 0, 0.8, 0.1, 0, 0, 0, 0.1, 0, 0, 0, 0, 0, 0, 0, 0];
P(4,3).probs = [0, 0, 0.1, 0.9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
P(4,4).probs = [0, 0, 0, 0.9, 0, 0, 0, 0.1, 0, 0, 0, 0, 0, 0, 0, 0];
P(5,1).probs = [0, 0, 0, 0, 0.1, 0.1, 0, 0, 0.8, 0, 0, 0, 0, 0, 0, 0];
P(5,2).probs = [0.1, 0, 0, 0, 0.8, 0, 0, 0, 0.1, 0, 0, 0, 0, 0, 0, 0];
P(5,3).probs = [0.8, 0, 0, 0, 0.1, 0.1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
P(5,4).probs = [0.1, 0, 0, 0, 0, 0.8, 0, 0, 0.1, 0, 0, 0, 0, 0, 0, 0];
P(6,1).probs = [0, 0, 0, 0, 0.1, 0, 0.1, 0, 0, 0.8, 0, 0, 0, 0, 0, 0];
P(6,2).probs = [0, 0.1, 0, 0, 0.8, 0, 0, 0, 0, 0.1, 0, 0, 0, 0, 0, 0];
P(6,3).probs = [0, 0.8, 0, 0, 0.1, 0, 0.1, 0, 0, 0, 0, 0, 0, 0, 0, 0];
P(6,4).probs = [0, 0.1, 0, 0, 0, 0, 0.8, 0, 0, 0.1, 0, 0, 0, 0, 0, 0];
P(7,1).probs = [0, 0, 0, 0, 0, 0.1, 0, 0.1, 0, 0, 0.8, 0, 0, 0, 0, 0];
P(7,2).probs = [0, 0, 0.1, 0, 0, 0.8, 0, 0, 0, 0, 0.1, 0, 0, 0, 0, 0];
P(7,3).probs = [0, 0, 0.8, 0, 0, 0.1, 0, 0.1, 0, 0, 0, 0, 0, 0, 0, 0];
P(7,4).probs = [0, 0, 0.1, 0, 0, 0, 0, 0.8, 0, 0, 0.1, 0, 0, 0, 0, 0];
P(8,1).probs = [0, 0, 0, 0, 0, 0, 0.1, 0.1, 0, 0, 0, 0.8, 0, 0, 0, 0];
P(8,2).probs = [0, 0, 0, 0.1, 0, 0, 0.8, 0, 0, 0, 0, 0.1, 0, 0, 0, 0];
P(8,3).probs = [0, 0, 0, 0.8, 0, 0, 0.1, 0.1, 0, 0, 0, 0, 0, 0, 0, 0];
P(8,4).probs = [0, 0, 0, 0.1, 0, 0, 0, 0.8, 0, 0, 0, 0.1, 0, 0, 0, 0];
P(9,1).probs = [0, 0, 0, 0, 0, 0, 0, 0, 0.1, 0.1, 0, 0, 0.8, 0, 0, 0];
P(9,2).probs = [0, 0, 0, 0, 0.1, 0, 0, 0, 0.8, 0, 0, 0, 0.1, 0, 0, 0];
P(9,3).probs = [0, 0, 0, 0, 0.8, 0, 0, 0, 0.1, 0.1, 0, 0, 0, 0, 0, 0];
P(9,4).probs = [0, 0, 0, 0, 0.1, 0, 0, 0, 0, 0.8, 0, 0, 0.1, 0, 0, 0];
P(10,1).probs = [0, 0, 0, 0, 0, 0, 0, 0, 0.1, 0, 0.1, 0, 0, 0.8, 0, 0];
P(10,2).probs = [0, 0, 0, 0, 0, 0.1, 0, 0, 0.8, 0, 0, 0, 0, 0.1, 0, 0];
P(10,3).probs = [0, 0, 0, 0, 0, 0.8, 0, 0, 0.1, 0, 0.1, 0, 0, 0, 0, 0];
P(10,4).probs = [0, 0, 0, 0, 0, 0.1, 0, 0, 0, 0, 0.8, 0, 0, 0.1, 0, 0];
P(11,1).probs = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0.1, 0, 0.1, 0, 0, 0.8, 0];
P(11,2).probs = [0, 0, 0, 0, 0, 0, 0.1, 0, 0, 0.8, 0, 0, 0, 0, 0.1, 0];
P(11,3).probs = [0, 0, 0, 0, 0, 0, 0.8, 0, 0, 0.1, 0, 0.1, 0, 0, 0, 0];
P(11,4).probs = [0, 0, 0, 0, 0, 0, 0.1, 0, 0, 0, 0, 0.8, 0, 0, 0.1, 0];
P(12,1).probs = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.1, 0.1, 0, 0, 0, 0.8];
P(12,2).probs = [0, 0, 0, 0, 0, 0, 0, 0.1, 0, 0, 0.8, 0, 0, 0, 0, 0.1];
P(12,3).probs = [0, 0, 0, 0, 0, 0, 0, 0.8, 0, 0, 0.1, 0.1, 0, 0, 0, 0];
P(12,4).probs = [0, 0, 0, 0, 0, 0, 0, 0.1, 0, 0, 0, 0.8, 0, 0, 0, 0.1];
P(13,1).probs = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.9, 0.1, 0, 0];
P(13,2).probs = [0, 0, 0, 0, 0, 0, 0, 0, 0.1, 0, 0, 0, 0.9, 0, 0, 0];
P(13,3).probs = [0, 0, 0, 0, 0, 0, 0, 0, 0.8, 0, 0, 0, 0.1, 0.1, 0, 0];
P(13,4).probs = [0, 0, 0, 0, 0, 0, 0, 0, 0.1, 0, 0, 0, 0.1, 0.8, 0, 0];
P(14,1).probs = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.1, 0.8, 0.1, 0];
P(14,2).probs = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0.1, 0, 0, 0.8, 0.1, 0, 0];
P(14,3).probs = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0.8, 0, 0, 0.1, 0, 0.1, 0];
P(14,4).probs = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0.1, 0, 0, 0, 0.1, 0.8, 0];
P(15,1).probs = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.1, 0.8, 0.1];
P(15,2).probs = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.1, 0, 0, 0.8, 0.1, 0];
P(15,3).probs = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.8, 0, 0, 0.1, 0, 0.1];
P(15,4).probs = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.1, 0, 0, 0, 0.1, 0.8];
P(16,1).probs = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.1, 0.9];
P(16,2).probs = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.1, 0, 0, 0.8, 0.1];
P(16,3).probs = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.8, 0, 0, 0.1, 0.1];
P(16,4).probs = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.1, 0, 0, 0, 0.9];

p2(1,1).probs = [0.1, 0.1, 0, 0, 0.8, 0, 0, 0, 0, 0, 0, 0];
p2(1,2).probs = [0.9, 0, 0, 0, 0.1, 0, 0, 0, 0, 0, 0, 0];
p2(1,3).probs = [0.9, 0.1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
p2(1,4).probs = [0.1, 0.8, 0, 0, 0.1, 0, 0, 0, 0, 0, 0, 0];
p2(2,1).probs = [0.1, 0, 0.1, 0, 0, 0.8, 0, 0, 0, 0, 0, 0];
p2(2,2).probs = [0.8, 0.1, 0, 0, 0, 0.1, 0, 0, 0, 0, 0, 0];
p2(2,3).probs = [0.1, 0.8, 0.1, 0, 0, 0, 0, 0, 0, 0, 0, 0];
p2(2,4).probs = [0, 0.1, 0.8, 0, 0, 0.1, 0, 0, 0, 0, 0, 0];
p2(3,1).probs = [0, 0.1, 0, 0.1, 0, 0, 0.8, 0, 0, 0, 0, 0];
p2(3,2).probs = [0, 0.8, 0.1, 0, 0, 0, 0.1, 0, 0, 0, 0, 0];
p2(3,3).probs = [0, 0.1, 0.8, 0.1, 0, 0, 0, 0, 0, 0, 0, 0];
p2(3,4).probs = [0, 0, 0.1, 0.8, 0, 0, 0.1, 0, 0, 0, 0, 0];
p2(4,1).probs = [0, 0, 0.1, 0.1, 0, 0, 0, 0.8, 0, 0, 0, 0];
p2(4,2).probs = [0, 0, 0.8, 0.1, 0, 0, 0, 0.1, 0, 0, 0, 0];
p2(4,3).probs = [0, 0, 0.1, 0.9, 0, 0, 0, 0, 0, 0, 0, 0];
p2(4,4).probs = [0, 0, 0, 0.9, 0, 0, 0, 0.1, 0, 0, 0, 0];
p2(5,1).probs = [0, 0, 0, 0, 0.1, 0.1, 0, 0, 0.8, 0, 0, 0];
p2(5,2).probs = [0.1, 0, 0, 0, 0.8, 0, 0, 0, 0.1, 0, 0, 0];
p2(5,3).probs = [0.8, 0, 0, 0, 0.1, 0.1, 0, 0, 0, 0, 0, 0];
p2(5,4).probs = [0.1, 0, 0, 0, 0, 0.8, 0, 0, 0.1, 0, 0, 0];
p2(6,1).probs = [0, 0, 0, 0, 0.1, 0, 0.1, 0, 0, 0.8, 0, 0];
p2(6,2).probs = [0, 0.1, 0, 0, 0.8, 0, 0, 0, 0, 0.1, 0, 0];
p2(6,3).probs = [0, 0.8, 0, 0, 0.1, 0, 0.1, 0, 0, 0, 0, 0];
p2(6,4).probs = [0, 0.1, 0, 0, 0, 0, 0.8, 0, 0, 0.1, 0, 0];
p2(7,1).probs = [0, 0, 0, 0, 0, 0.1, 0, 0.1, 0, 0, 0.8, 0];
p2(7,2).probs = [0, 0, 0.1, 0, 0, 0.8, 0, 0, 0, 0, 0.1, 0];
p2(7,3).probs = [0, 0, 0.8, 0, 0, 0.1, 0, 0.1, 0, 0, 0, 0];
p2(7,4).probs = [0, 0, 0.1, 0, 0, 0, 0, 0.8, 0, 0, 0.1, 0];
p2(8,1).probs = [0, 0, 0, 0, 0, 0, 0.1, 0.1, 0, 0, 0, 0.8];
p2(8,2).probs = [0, 0, 0, 0.1, 0, 0, 0.8, 0, 0, 0, 0, 0.1];
p2(8,3).probs = [0, 0, 0, 0.8, 0, 0, 0.1, 0.1, 0, 0, 0, 0];
p2(8,4).probs = [0, 0, 0, 0.1, 0, 0, 0, 0.8, 0, 0, 0, 0.1];
p2(9,1).probs = [0, 0, 0, 0, 0, 0, 0, 0, 0.9, 0.1, 0, 0];
p2(9,2).probs = [0, 0, 0, 0, 0.1, 0, 0, 0, 0.9, 0, 0, 0];
p2(9,3).probs = [0, 0, 0, 0, 0.8, 0, 0, 0, 0.1, 0.1, 0, 0];
p2(9,4).probs = [0, 0, 0, 0, 0.1, 0, 0, 0, 0.1, 0.8, 0, 0];
p2(10,1).probs = [0, 0, 0, 0, 0, 0, 0, 0, 0.1, 0.8, 0.1, 0];
p2(10,2).probs = [0, 0, 0, 0, 0, 0.1, 0, 0, 0.8, 0.1, 0, 0];
p2(10,3).probs = [0, 0, 0, 0, 0, 0.8, 0, 0, 0.1, 0, 0.1, 0];
p2(10,4).probs = [0, 0, 0, 0, 0, 0.1, 0, 0, 0, 0.1, 0.8, 0];
p2(11,1).probs = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0.1, 0.8, 0.1];
p2(11,2).probs = [0, 0, 0, 0, 0, 0, 0.1, 0, 0, 0.8, 0.1, 0];
p2(11,3).probs = [0, 0, 0, 0, 0, 0, 0.8, 0, 0, 0.1, 0, 0.1];
p2(11,4).probs = [0, 0, 0, 0, 0, 0, 0.1, 0, 0, 0, 0.1, 0.8];
p2(12,1).probs = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.1, 0.9];
p2(12,2).probs = [0, 0, 0, 0, 0, 0, 0, 0.1, 0, 0, 0.8, 0.1];
p2(12,3).probs = [0, 0, 0, 0, 0, 0, 0, 0.8, 0, 0, 0.1, 0.1];
p2(12,4).probs = [0, 0, 0, 0, 0, 0, 0, 0.1, 0, 0, 0, 0.9];

R = -ones(1,16);
R(7) = -1000;
R(11) = -1000;
R(12) = -1000;
R(16) = 1000;
gamma = [0.9];%, 0.99, 0.999, 0.9999, 0.99999, 0.999999];

U = [];
U_trace = [];
for i = 1:length(gamma)
    [U, U_trace] = CS4300_MDP_value_iteration(S, A, P, R, .9, 0.1, 1000);
end





    









