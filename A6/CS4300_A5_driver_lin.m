function [x_trace,a_trace,z_trace,Sigma2_trace] = CS4300_A5_driver_lin(...
x0,y0,vx0,vy0,max_time,del_t,theta)
% CS4300_A5_driver_lin - driver function for linear Kalman Filter
% On input:
%   x0 (float): initial x location
%   y0 (float): initial y location
%   vx0 (float): initial x velocity
%   vy0 (float): initial y velocity
%   max_time (float): max time for tracking
%   del_t (float): time step size
%   theta (float): angle of line (in radians)
% On output:
%   x_trace (nx2 array): each row has estimated pose (x,y vals)
%   a_trace (nx2 array): actual location at each time step
%   z_trace (nx2 array): sensed location at each time step
%   Sigma2_trace (struct array): covariance of estimated location
%       (i).Sigma2 (2x2 array): covariance matrix for i_th step
% Call:
%   [xt,at,zt,St] = CS4300_A5_driver_lin(0,0,1,1,1,0.1,pi/4);
% Author:
%   Matthew Lemon
%   UU575787
%   Derek Heldt-Werle
%   UU828479
%   Fall 2016
%

t_vals = [0:del_t:max_time];
num_t_vals = length(t_vals);

xa = [x0;y0;vx0;vy0];
a_trace = xa';
A = [1,0,del_t,0;0,1,0,del_t;0,0,1,0;0,0,0,1];
B = [(del_t^2)/2,0;0,(del_t^2)/2;del_t,0;0,del_t];
C = [1,0,0,0;0,1,0,0];
u = [0; 0];
% u = [0; -9.8];
R = 0.1 * eye(4,4);
% R = 0.001*eye(4);
Q = 0.1 * eye(2,2);
% Q = 0.001*eye(2);
% Q(2,2) = 6;

xz = CS4300_Sensor(xa, C, Q);
z_trace = xz';

x = [0;0;0;0];
x_trace = x';

sigma = zeros(4,4);
sigma2_trace(1).sigma2 = sigma;

for s = 1:num_t_vals
    xa = CS4300_Process(xa, A, B, u, R);
    a_trace(s+1,:) = xa';
    
    z = CS4300_Sensor(xa, C, Q);
    z_trace(s+1,:) = z';
    
    
    [x, sigma] = CS4300_KF(x, sigma, u, z, A, R, B, C, Q);
    x_trace(s+1,:) = x';
    Sigma2_trace(s+1).sigma2 = sigma;
end
end

