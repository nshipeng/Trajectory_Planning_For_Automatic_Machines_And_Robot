%EX 2.20
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
    q =  q0 + h * (t - t0)/T - h/(2 * pi) * (27/28 * sin( 2* pi * (t - t0)/T) + 1/84 * sin(6 * pi * (t - t0)/T));
    y = [y,q];
    dq = h/T * ( 1 - 27/28 * cos(2*pi * (t - t0)/T) - 1/28 * cos(6 * pi *(t - t0)/T));
    dy = [dy,dq];
 
    ddq =2* h * pi/( T^2)  * (27/28 * sin(2*pi * (t - t0)/T) + 3/28 * sin(6 * pi * (t - t0)/T));
    ddy = [ddy,ddq];
    
    dddq = 4* h * pi^2/(T^3)* (27/28 * cos(2 * pi * (t  -t0)/T) + 9/28 * cos(6 * pi * (t - t0)/T));
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
