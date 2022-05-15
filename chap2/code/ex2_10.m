 [A,V,P,TS,T] = poly_five_multipoints([10,20,0,30,40],[0,2,4,8,10])

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
    a4 = A(idx,5);
    a5 = A(idx,6);
    
    q_ = a0 + a1 * (t - ts) + a2 *(t - ts)^2 + a3 *(t - ts)^3 + a4 *(t - ts)^4 + a5 *(t - ts)^5;
    y = [y,q_];
        
    q_d = a1  + 2*a2*(t - ts) + 3 * a3 *(t - ts)^2 + 4 * a4 *(t - ts)^3 + 5 * a5 *(t - ts)^4;
    dy = [dy,q_d];

    q_dd =  2 * a2  + 6 * a3 *(t - ts) + 12 * a4 * (t - ts)^2 + 20 * a5 *(t - ts)^3;
    ddy = [ddy,q_dd];
end


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