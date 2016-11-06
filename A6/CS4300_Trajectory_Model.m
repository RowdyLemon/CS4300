function [x, y, vx_new, vy_new] =  CS4300_Trajectory_Model(x0, y0, vx, ...
    vy, dt, projectile)
% CS4300_Trajectory_Model - models either linear or projectile trajectory
% On input:
%   x0 (float): previous x location
%   y0 (float): previous y location
%   vx (float): x velocity
%   vy (float): y velocity
%   dt (float): time step size
%   projectile (boolean): Whether this is a linear or projectile trajectory
% On output:
%   x (float): new x position
%   y (float): new y position
%   vx_new (float): new x velocity
%   vy_new (float): new y velocity
% Call:
%   [xt,at,zt,St] = CS4300_A5_driver_lin(0,0,1,1,1,0.1,pi/4);
% Author:
%   Matthew Lemon
%   UU575787
%   Derek Heldt-Werle
%   UU828479
%   Fall 2016
%

x = x0 + vx*dt;
y = y0 + vy*dt;
vx_new = vx;

if projectile
    vy_new = vy - 9.8*dt;
else
    vy_new = vy;
end

end

