%q P: input points
%t TS: input times
%A: (n-1)*4  cubic paras
%V: intermediate velocity
%T_total : total time of the trajectory
function [A,V,P,TS,T_total ] = cubic_multipoint(q,t)
    n = length(q);
    T_total = t(n) -t(1);
    A = eye(n-1,4);
    V = zeros(1,n);
    P = zeros(1,n);
    TS = zeros(1,n);
    for j = 1:n
        P(j) = q(j);
        TS(j) = t(j);
    end
    V(1) = input('assigned init velocity  ');
    V(n) = input('assigned final velocity  ');
    
    heuristic = 0;   %set 0 if test ex2_7£» 1 for ex2_8
    if(heuristic)
        for k = 2:n-1
            dk = (q(k) - q(k-1)) / (t(k) - t(k-1));
            dk_1 = (q(k+1) - q(k)) /(t(k+1) - t(k));
            if(sign(dk) == sign(dk_1))
                V(k) = (dk + dk_1)/2;
            else
                V(k) = 0;
            end
        end
    else
        V(2) = -10;
        V(3) = 10;
        V(4) = 3;
    end
        
    for i = 1 : n-1
        q0 = q(i);
        v0 = V(i);
        q1 = q(i+1);
        v1 = V(i+1);
        t0 = t(i);
        t1 = t(i+1);
        
        h = q1 - q0;
        T = t1 - t0;
        a0 = q0;
        a1 = v0;
        a2 = (3 * h - (2 * v0 + v1)*T)/T^2;
        a3 = (-2 * h +(v0 + v1)*T)/T^3;

        A(i,1) = a0;
        A(i,2) = a1;
        A(i,3) = a2;
        A(i,4) = a3;
    end
       
end