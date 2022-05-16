%Elliptic Trajectory
% Example 2.16
clear;clc;

t0 = 0;
t1 = 8;
T = 8;
q0 = 0;
n = 2;
alpha = (n^2 - 1)/n^2;
q1 = 10;
h = q1 - q0;

x=linspace(0,T,1000);
y=[];
dy = [];
ddy = [];
dddy = [];

for t = x;
    q = h/2 * (1 - cos(pi *(t - t0)/T)/(sqrt(1 - alpha * ( sin (pi *(t - t0)/T))^2))) + q0;
    y = [y,q];
    dq =pi *h/(2*T) * sin(pi *(t - t0)/T)/ ( n^2 * sqrt(( 1 - alpha * ( sin (pi *(t - t0)/T))^2 )^3));
    dy = [dy,dq];
 
    ddq = pi^2 * h/(2 * T^2) * cos(pi *(t - t0)/T) * ( 1 + 2 * alpha * (sin(pi *(t - t0)/T))^2)/(n^2 * sqrt(( 1 - alpha *(sin(pi *(t - t0)/T))^2)^5));
    ddy = [ddy,ddq];
end


subplot(3,1,1);
plot(x,y,'linewidth',1.5);
ylabel('Position')

subplot(3,1,2);
plot(x,dy,'linewidth',1.5);
ylabel('Velocity')

subplot(3,1,3);
plot(x,ddy,'linewidth',1.5);
ylabel('Accelaration')
