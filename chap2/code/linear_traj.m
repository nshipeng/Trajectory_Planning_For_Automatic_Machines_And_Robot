%Linear trajectory
%q0: initial point
%q1: final point
%t0: initial instants 
%t1: final instants
function [a0,a1,qs,ts,T,h] = linear_traj(q0,q1,t0,t1)
    qs = q0
    T = t1- t0
    h = q1 - q0
    ts = t0
    a0 = q0
    a1 = h/T
end

%
    
    
    
