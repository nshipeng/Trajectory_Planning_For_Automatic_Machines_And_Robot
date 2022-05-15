%trajectory plannng for automatic machines and robots p27
function [a0,a1,a2,a3,a4,a5,a6,a7,T,ts,qs] = poly_five(q0,v0,a0,j0,q1,v1,a1,j1,t0,t1)
    ts = t0;
    qs = q0;
    T = t1 - t0;
    h = q1 - q0;
    
    a0 = q0;
    a1 = v0;
    a2 = 0.5 * a0;
    a3 = j0/6;
    a4 = (210  * h -  T * ( (30 * a0 - 15 * a1) * T  + (4 * j0 + j1)   * T^2   + 120 * v0 + 90 * v1))/(6 * T^4);
    a5 = (-168 * h +  T * ( (20 * a0 - 14 * a1) * T  + (2 * j0 + j1)   * T^2   +  90 * v0 + 78 * v1))/(2 * T^5);
    a6 = (420  * h -  T * ( (45 * a0 - 39 * a1) * T  + (4 * j0 + 3*j1) * T^2   + 216 * v0 + 204 * v1))/(6 * T^6);
    a7 = (-120 * h +  T * (( 12 * a0 - 12 * a1) * T  + (j0 + j1)       * T^2   +  60 * v0  + 60* v1))/(6 * T^7);
    
end

%
    
    
    
