%EX 2.20
clear;clc;

t0 = 0;
t1 = 10;
q0 = 0;
q1 = 20;
h = q1 - q0;
T = t1 - t0;
alpha = 0.9438;

x=linspace(0,T,1000);
y=[];
dy = [];
ddy = [];
dddy = [];

for t = x;
    q =  q0 + h * (t - t0)/T - h/(2 * pi) * alpha * (sin( 2* pi * (t - t0)/T) + 1/54 * sin(6 * pi * (t - t0)/T) + 1/1250 *(10 * pi *(t -  t0)/T));
    y = [y,q];
    dq = h/T * ( 1 - alpha *( cos(2*pi * (t - t0)/T) + 1/18 * cos(6 * pi *(t - t0)/T)  + 1/250 * cos(10 * pi * (t - t0)/T)) );
    dy = [dy,dq];
 
    ddq =2* h * pi/( T^2)  *alpha *  ( sin(2*pi * (t - t0)/T) + 1/6 * sin(6 * pi * (t - t0)/T) + 1/50 * sin (10 * pi * (t -t0)/T));
    ddy = [ddy,ddq];
    
    dddq = 4* h * pi^2/(T^3)* alpha * ( cos(2 * pi * (t  -t0)/T) + 1/2 * cos(6 * pi * (t - t0)/T) + 1/10 * cos(10 * pi * (t - t0)/T));
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
