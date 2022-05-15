clear;clc;
%[a0,a1,a2,a3,T,ts] = cubic_traj(0,0,10,0,0,8);
[a0,a1,a2,a3,T,ts] = cubic_traj(0,-5,10,-10,0,8);

fprintf('a0 = %f\n',a0);
fprintf('a1 = %f\n',a1);
fprintf('a2 = %f\n',a2);
fprintf('a3 = %f\n',a3);


x=linspace(0,T,1000);
y=[];
dy = [];
ddy = [];
dddy = [];

for t = x;
    q = a0 + a1 *(t - ts) + a2 * (t - ts)^2 + a3 * (t - ts)^3;
    y = [y,q];
    dq = a1 + 2 * a2 * (t - ts) + 3 * a3 * (t - ts)^2;
    dy = [dy,dq];
    ddq = 2*a2 + 6 * a3 * (t - ts);
    ddy = [ddy,ddq];
end

%plot fig 2.7
subplot(3,1,1);
plot(x,y,'linewidth',1.5);
ylabel('Position')

subplot(3,1,2);
plot(x,dy,'linewidth',1.5);
ylabel('Velocity')

subplot(3,1,3);
plot(x,ddy,'linewidth',1.5);
ylabel('Accelaration')