function xtplus1 =  CS4300_Trajectory_Model(xt, dt, ay, R)
% CS4300_Trajectory_Model - models either linear or projectile trajectory
% On input:
%   xt (4x1 matrix of floats): x, y, vx, vy at time t 
%   dt (float): time step size
%   ay (float): acceleration in the y direction
%   R (4x4 matrix): noise matrix
% On output:
%   xtplus1 (1x4 matrix of floats): x, y, vx, vy at time t+1
% Call:
%   [xt,at,zt,St] = CS4300_A5_driver_lin(0,0,1,1,1,0.1,pi/4);
% Author:
%   Matthew Lemon
%   UU575787
%   Derek Heldt-Werle
%   UU828479
%   Fall 2016
%

A = [1,0,dt,0;0,1,0,dt;0,0,1,0;0,0,0,1];
B = [(dt^2)/2,0;0,(dt^2)/2;dt,0;0,dt];
u = [0;ay];

xtplus1 = A*xt + B*u + sqrt(R)*randn;

% x = x0 + vx*dt;
% y = y0 + vy*dt;
% vx_new = vx;
% 
% if projectile
%     vy_new = vy - 9.8*dt;
% else
%     vy_new = vy;
% end

end

