clear; clc;

[a0,a1,a2,a3,a4,a5,qs,q_mid,qf,ts,t_mid,tf,T,h] = parabolic_traj(0,0.1,10,-1,0,8,5);

fprintf('a0 = %f\n',a0);
fprintf('a1 = %f\n',a1);
fprintf('a2 = %f\n',a2);
fprintf('a3 = %f\n',a3);
fprintf('a4 = %f\n',a4);
fprintf('a5 = %f\n',a5);
fprintf('qs = %f\n',qs);
fprintf('qmid = %f\n',q_mid);
fprintf('qf = %f\n',qf);
fprintf('ts = %f\n',ts);
fprintf('tmid = %f\n',t_mid);
fprintf('tf = %f\n',tf);
fprintf('T = %f\n',T);
fprintf('h = %f\n',h);

x=linspace(0,T,1000);
y=[];
dy = [];
ddy = [];
dddy = [];

for t = x;
     if(t<=t_mid)
         q = a0 + a1 *(t - ts) + a2 * (t - ts)^2;
         y = [y,q];
         dq = a1 + 2 * a2 * (t - ts);
         dy = [dy,dq];
         ddq = 2*a2;
         ddy = [ddy,ddq];
     else
         q = a3+ a4*(t - t_mid) + a5 *(t - t_mid)^2;
         y = [y,q];
         dq = a4 + 2*a5*(t - t_mid);
         dy = [dy,dq];
         ddq = 2*a5;
         ddy = [ddy,ddq];
     end
 
end

%plot fig 2.6
subplot(3,1,1);
plot(x,y,'linewidth',1.5);
ylabel('Position')

subplot(3,1,2);
plot(x,dy,'linewidth',1.5);
ylabel('Velocity')

subplot(3,1,3);
plot(x,ddy,'linewidth',1.5);
ylabel('Accelaration')

