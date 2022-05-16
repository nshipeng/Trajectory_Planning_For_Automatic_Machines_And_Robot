%EX 2.19
clear;clc;

t0 = 0;
t1 = 10;
q0 = 0;
q1 = 20;
h = q1 - q0;
T = t1 - t0;

x=linspace(0,T,1000);
y=[];
dy = [];
ddy = [];
dddy = [];

for t = x;
    q =  q0 + h *( (t - t0)/T - 15/(32 * pi)* sin(2 *pi *(t - t0)/T) - 1/(96 * pi) * sin(6 * pi * (t - t0)/T));
    y = [y,q];
    dq = h/T * ( 1 - 15/16 * cos(2*pi * (t - t0)/T) - 1/16 * cos(6 * pi *(t - t0)/T));
    dy = [dy,dq];
 
    ddq = h * pi/(8 * T^2)  * (15 * sin(2*pi * (t - t0)/T) + 3 * sin(6 * pi * (t - t0)/T));
    ddy = [ddy,ddq];
    
    dddq = h * pi^2/(4 * T^3)* (15 * cos(2 * pi * (t  -t0)/T) + 9 * cos(6 * pi * (t - t0)/T));
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
