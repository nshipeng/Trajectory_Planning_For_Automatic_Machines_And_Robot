%Example 2.2
clear;clc;
[a0,a1,qs,ts,T,h] = linear_traj(0,10,0,8);

fprintf('a0 = %f\n',a0);
fprintf('a1 = %f\n',a1);
fprintf('init pos = %f\n',qs);
fprintf('time interval = %f\n',T);


x=linspace(0,T,1000);
y=[];
dy = [];
ddy = [];
dddy = [];

for t = x;
        q_ = a0  + a1 *(t - ts);
        y = [y,q_];
        
        q_d = h/T;
        dy = [dy,q_d];
        
        q_dd =  0;
        ddy = [ddy,q_dd];
 
end

%plot fig 2.2
subplot(3,1,1);
plot(x,y,'linewidth',1.5);
ylabel('Position')

subplot(3,1,2);
plot(x,dy,'linewidth',1.5);
ylabel('Velocity')

subplot(3,1,3);
plot(x,ddy,'linewidth',1.5);
ylabel('Accelaration')


        
        
