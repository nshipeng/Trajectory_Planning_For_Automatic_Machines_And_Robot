%Harmonic Trajectory
%Ð³²¨¹ì¼£
% Example 2.14
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
    q = h/2 * (1 - cos( pi * (t - t0)/T)) + q0;
    y = [y,q];
    dq = pi * h /(2 * T) * sin(pi * (t - t0)/T);
    dy = [dy,dq];
    ddq = pi^2 * h/(2 * T^2) * cos(pi * (t -t0)/T);
    ddy = [ddy,ddq];
    dddq = - pi^3 * h/(2 * T^3) * sin(pi * (t - t0)/T);
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