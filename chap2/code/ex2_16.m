%Elliptic Trajectory
% Example 2.16
clear;clc;

t0 = 0;
t1 = 8;
q0 = 0;
q1 = 10;
lamda = 0.2;
delta = 7.1;
T = t1 - t0;
h = q1 - q0;


x=linspace(0,T,1000);
y=[];
dy = [];
ddy = [];
dddy = [];

%for cal vc
fun = @(a,b) (2 * a).^2/(abs( 1 - (2 * a).^2)).^b;
inte_q = integral(@(a) fun(a,0.2),0,0.5,'ArrayValued',true)
vc = 1/(2 * delta *inte_q);

fun2 = @(delta,tau,lamba)  exp(-delta.* (2 * tau).^2 / (abs( 1 - (2 * tau).^2)).^lamba )

for t = x;
    tau = (t - t0)/T - 0.5;
    
    qN   = vc *  integral(@(tau) fun2(delta,tau, lamda),0,tau,'ArrayValued',true);
    qN_d = vc * exp(-delta * fun(tau, lamda) );
    
    q = q0 + h * (0.5 + qN);
    y = [y,q];
    dq = h/T * qN_d;
    dy = [dy,dq];
end


subplot(2,1,1);
plot(x,y,'linewidth',1.5);
ylabel('Position')

subplot(2,1,2);
plot(x,dy,'linewidth',1.5);
ylabel('Velocity')


