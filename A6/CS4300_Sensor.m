function xz = CS4300_Sensor(xa, C, Q)
% CS4300_Sensor - sensor model
% On input:
%   xa (4x1 matrix of floats): x, y, vx, vy actual calculated location 
%   C (2x4 matrix): used to get x and y data
%   Q (2x2 matrix): represents process noise
% On output:
%   xz (2x1 matrix): [x; y] sensor data
% Call:
%   xt = [0;0;0;0];
%   A = [1,0,0.2,0;0,1,0,0.2;0,0,1,0;0,0,0,1];
%   B = [0.01,0;0,0.01;0.2,0;0,0.2];
%   u = [0;-9.8];
%   R = 0.0001*eye(4,4);
%   xa = CS4300_Process(xt, A, B, u, R);
%   C = [1,0,0,0;0,1,0,0];
%   Q = zeros(2,2);
%   xz = CS4300_Sensor(xa, C, Q);
% Author:
%   Matthew Lemon
%   UU575787
%   Derek Heldt-Werle
%   UU828479
%   Fall 2016
%

noise = Q(1:end,1) + Q(1:end,2);
xz = C * xa + sqrt(noise)*randn;

end

