%Example 2.1
clear;clc;

a0 = 10;
a1 = 0.0;
a2 = 1.1462;
a3 = -0.2806;
a4 = 0.0267;
a5 = -0.0009;
ts = 0.0;
qs = 10;                      %start pos
T = 8;                        % time interval

fprintf('a0 = %f\n',a0);
fprintf('a1 = %f\n',a1);
fprintf('a2 = %f\n',a2);
fprintf('a3 = %f\n',a3);
fprintf('a4 = %f\n',a4);
fprintf('a5 = %f\n',a5);
fprintf('ts = %f\n',ts);
fprintf('qs = %f\n',qs);

x=linspace(0,T,1000);
y=[];
dy = [];
ddy = [];
dddy = [];

for t = x;
        q_ = qs + a1 * (t - ts) + a2 *(t - ts)^2 + a3 *(t - ts)^3 + a4 *(t - ts)^4 + a5 *(t - ts)^5;
        y = [y,q_];
        
        q_d = a1  + 2*a2*(t - ts) + 3 * a3 *(t - ts)^2 + 4 * a4 *(t - ts)^3 + 5 * a5 *(t - ts)^4;
        dy = [dy,q_d];
        
        q_dd =  2 * a2 * t + 6 * a3 *(t - ts) + 12 * a4 * (t - ts)^2 + 20 * a5 *(t - ts)^3;
        ddy = [ddy,q_dd];
 
end

%plot fig 2.1
subplot(3,1,1);
plot(x,y,'linewidth',1.5);
ylabel('Position')

subplot(3,1,2);
plot(x,dy,'linewidth',1.5);
ylabel('Velocity')

subplot(3,1,3);
plot(x,ddy,'linewidth',1.5);
ylabel('Accelaration')


        
        
