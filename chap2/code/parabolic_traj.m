% Parabolic trajectory
% q0 qs: initial point
% q1 qf: final point
% t0 ts: initial instants 
% t_mid: time instants of the middle point
% t1 tf: final instants
% idx : 3 for ex 2.3¡¢ 4 for ex 2.4, 5 for ex 2.5

function [a0,a1,a2,a3,a4,a5,qs,q_mid,qf,ts,t_mid,tf,T,h] = parabolic_traj(q0,v0,q1,v1,t0,t1,idx)
    ts = t0;
    tf = t1;
    qs = q0;
    qf = q1;
    t_mid = (t0 + t1) /2;
    q_mid = (q0 + q1)/2;      %middle point
    T = t1 - t0;
    h = 2 * (q_mid - q0);
    
  
    if(idx == 3)
          a0 = q0;
            a1 = v0;
            a2 = 2/(T^2) * (h - v0*T);

            a3 = (q1 + q0)/2 ;
            a4 = 2* h/T - v1;
            a5 = 2/(T^2) * (v1*T - h);
    elseif(idx == 4)
        a0 = q0;
        a1 = v0;
        a2 = (4 * h - T* (3*v0 + v1))/(2 * T^2);
        
        a3 = (4*(q0 + q1) + T*(v0 - v1))/8;
        a4 = (4 * h - T *(v0+v1))/(2*T);
        a5 = (-4 * h + T*(v0 + 3*v1))/(2 * T^2);
        
    else
        t_mid = input('Input t_mid ');
        Ta = t_mid - t0;
        Td  = t1 - t_mid;
        
        a0 = q0;
        a1 = v0;
        a2 = (2 * h - v0 *( T+ Ta) - v1 * Td)/(2 * T *Ta);
        
        a3 = (2 * q1 * Ta + Td * (2 * q0 + Ta * (v0 - v1)))/(2 * T);
        a4 = (2 * h  - v0 *Ta - v1 *Td)/(T);
        a5 = -(2 * h - v0 * Ta - v1 *(T + Td))/ (2 * T *Td);
    end
    %acceleration phase
  
end

%
    
    
    
