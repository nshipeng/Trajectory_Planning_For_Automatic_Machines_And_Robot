%Cycloideal Trajectory
% Example 2.15
clear;clc;

t0 = 0;
t1 = 8;
T = 8;
q0 = 0;
q1 = 10;
h = q1 - q0;

x=linspace(0,T,1000);
y=[];
dy = [];
ddy = [];
dddy = [];

for t = x;
    q = h * ((t - t0)/T - 1/(2 * pi) * sin(2*pi * (t - t0)/T)) + q0;
    y = [y,q];
    dq = h/T * ( 1 - cos( 2 *pi *(t - t0)/T));
    dy = [dy,dq];
 
    ddq = 2 * pi * h/(T^2) * sin( 2* pi *(t - t0)/T);
    ddy = [ddy,ddq];
    dddq = 4 * pi^2 *h / (T^3) * cos(2*pi *(t - t0)/T);
    dddy = [dddy,dddq];
end


subplot(4,1,1);
plot(x,y,'linewidth',1.5);
ylabel('Position')

subplot(4,1,2);
plot(x,dy,'linewidth',1.5);
ylabel('Velocity')

subplot(4,1,3);
plot(x,ddy,'linewidth',1.5);
ylabel('Accelaration')

subplot(4,1,4);
plot(x,dddy,'linewidth',1.5);
ylabel('Jerk')