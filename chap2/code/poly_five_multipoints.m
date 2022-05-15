%q P: input points
%t TS: input times
%A: (n-1)*4  cubic paras
%V: intermediate velocity
%T_total : total time of the trajectory
function [A,V,P,TS,T_total ] = poly_five_multipoints(q,t)
    n = length(q);
    T_total = t(n) -t(1);
    A = eye(n-1,6);
    V = zeros(1,n);
    P = zeros(1,n);
    TS = zeros(1,n);
    for j = 1:n
        P(j) = q(j);
        TS(j) = t(j);
    end
    V(1) = input('assigned init velocity  ');
    V(n) = input('assigned final velocity  ');
    
    heuristic = 1;  
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
        
        
        T = t1 - t0;
        h = q1 - q0;
        a0 = q0;
        a1 = v0;
        a2 = 0.5 * a0;
        a3 = 1/  (2 * T^3) * ( 20 * h  - (8* v1 + 12* v0)  * T  - (3 * a0 - a1)   * T^2);
        a4 = 1 / (2 * T^4) * (-30 * h  +(14 * v1 + 16 * v0)* T  + (3 * a0 - 2*a1) * T^2);
        a5 = 1 / (2 * T^5) * ( 12 * h  -  6 *(v1 + v0)      *T  + (a1- a0)        * T^2);
        
        A(i,1) = a0;
        A(i,2) = a1;
        A(i,3) = a2;
        A(i,4) = a3;
        A(i,5) = a4;
        A(i,6) = a5;
    end
       
end