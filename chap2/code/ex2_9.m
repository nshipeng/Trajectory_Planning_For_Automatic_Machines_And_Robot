%Polynomial of degree five
clear;clc;

[a0,a1,a2,a3,a4,a5,T,ts,qs] = poly_five(0,0,0,10,0 ,0,0,8);      
%[a0,a1,a2,a3,a4,a5,T,ts,qs] = poly_five(0,-5,0,10,-10,0,0,8);

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
        q_ = a0 + a1 * (t - ts) + a2 *(t - ts)^2 + a3 *(t - ts)^3 + a4 *(t - ts)^4 + a5 *(t - ts)^5;
        y = [y,q_];
        
        q_d = a1  + 2*a2*(t - ts) + 3 * a3 *(t - ts)^2 + 4 * a4 *(t - ts)^3 + 5 * a5 *(t - ts)^4;
        dy = [dy,q_d];
        
        q_dd =  2 * a2 * t + 6 * a3 *(t - ts) + 12 * a4 * (t - ts)^2 + 20 * a5 *(t - ts)^3;
        ddy = [ddy,q_dd];
 
end

%plot fig 2.10
subplot(3,1,1);
plot(x,y,'linewidth',1.5);
ylabel('Position')

subplot(3,1,2);
plot(x,dy,'linewidth',1.5);
ylabel('Velocity')

subplot(3,1,3);
plot(x,ddy,'linewidth',1.5);
ylabel('Accelaration')


        
        
