
function [xk,yk]= kinf(theta,theta2)
l1 = 0.315; % gorna czesc nogi[m]
l2 = 0.3;  % dolna czesc nogi[m]

xk = l1*cos(theta) + l2*cos(theta + theta2);% y w gazebo
yk = l1*sin(theta) + l2*sin(theta + theta2);% z w gazebo
end