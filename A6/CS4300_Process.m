function xtplus1 = CS4300_Process(xt, A, B, u, R)
% CS4300_Process - process model
% On input:
%   xt (4x1 matrix of floats): x, y, vx, vy at time t 
%   A (4x4 matrix): position dt matrix
%   B (4x2 matrix): acceleration dt matrix 
%   u (2x1 matrix): ax, ay at time t
%   R (4x4 matrix): noise matrix
% On output:
%   xtplus1 (4x1 matrix of floats): [x; y; vx; vy] at time t+1
% Call:
%   xt = [0;0;0;0];
%   A = [1,0,0.2,0;0,1,0,0.2;0,0,1,0;0,0,0,1];
%   B = [0.01,0;0,0.01;0.2,0;0,0.2];
%   u = [0;-9.8];
%   R = 0.0001*eye(4,4);
%   xt = CS4300_Process(xt, A, B, u, R);
% Author:
%   Matthew Lemon
%   UU575787
%   Derek Heldt-Werle
%   UU828479
%   Fall 2016
%

Noise = R(1:end,1) + R(1:end,2) + R(1:end,3) + R(1:end,4);

xtplus1 = A*xt + B*u + sqrt(Noise)*randn;

end

