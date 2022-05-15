 [A,V,P,TS,T] = cubic_multipoint([10,20,0,30,40],[0,2,4,8,10])

x=linspace(0,T,1000);
y=[];
dy = [];
ddy = [];
dddy = [];

for t = x;
    idx = 1;
    while(TS(idx) <t )
        idx = idx+1;
    end
    
    if(idx -1 <=0)
        idx = 1;
    else
        idx = idx -1; 
    end

    ts = TS(idx);
    a0 = A(idx,1);
    a1 = A(idx,2);
    a2 = A(idx,3);
    a3 = A(idx,4);
    
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
hold on;
plot(TS,P,'b o')

subplot(3,1,2);
plot(x,dy,'linewidth',1.5);
ylabel('Velocity')
hold on
plot(TS,V,'b o')


subplot(3,1,3);
plot(x,ddy,'linewidth',1.5);
ylabel('Accelaration')