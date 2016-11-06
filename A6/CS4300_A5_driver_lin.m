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

projectile = 1;
sigma2_p = 0.01;

t_vals = [0:del_t:max_time];
num_t_vals = length(t_vals);

ideal = zeros(num_t_vals, 4);
ideal(1,:) = [x0, y0, vx0, vy0];

actual = zeros(num_t_vals, 4);
actual(1,:) = [x0, y0, vx0, vy0];

% sensor = zeros(num_t_vals_vals, 2);

plot([-1, 2000], 0);
hold on
plot(0, [-1, 10000]);
plot(x0,y0,'r+');
plot(x0,y0,'ko');
M(1) = getframe;

for s = 1:num_t_vals
%     prev_x = actual(s,1);
%     prev_y = actual(s,2);
%     prev_vx = actual(s,3);
%     prev_vy = actual(s,4);
    prev_x = ideal(s,1);
    prev_y = ideal(s,2);
    prev_vx = ideal(s,3);
    prev_vy = ideal(s,4);
    [x,y,vx,vy] = CS4300_Trajectory_Model(prev_x, prev_y, prev_vx, ...
        prev_vy, del_t, projectile);
    ideal(s+1,:) = [x,y,vx,vy];
    actual(s+1,1:2) = ideal(s+1,1:2) + sqrt(sigma2_p)*randn;
    
    clf
    plot([-1, 2000], 0);
    hold on
    plot(0, [-1, 10000]);
    plot(ideal(s+1,1),ideal(s+1,2),'r+');
    plot(actual(s+1,1),actual(s+1,2),'ko');
    M(s+1) = getframe;
    
    if(ideal(s+1,2) < 0)
        break;
    end
end

plot(ideal(:,1), ideal(:,2), 'r+');
line(actual(:,1), actual(:,2));

end

