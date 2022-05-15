%trajectory plannng for automatic machines and robots p27
function [a0,a1,a2,a3,a4,a5,T,ts,qs] = poly_five(q0,v0,a0,q1,v1,a1,t0,t1)
    ts = t0;
    qs = q0;
    a0 = q0;
    a1 = v0;
    a2 = 0.5 * a0;
    
    T = t1 - t0;
    h = q1 - q0;
    a3 = 1/(2*T^3) * (20 * h - (8* v1 + 12* v0)*T - (3 * a0 - a1)*T^2);
    a4 = 1 / (2 * T^4) * (-30 * h +(14 * v1 + 16 * v0)* T +(3*a0 - 2*a1)*T^2);
    a5 = 1 / (2 * T^5) * (12 * h - 6 *(v1 + v0)*T + (a1 - a0) * T^2);
end

%
    
    
    
