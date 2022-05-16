% example 2.12
q0 = 0,   v0 = 1;  a0 = 0;  j0 = 0; s0= 0;
q1 = 1,   v1 = 0;  a1 = 8;  j1 = 0; s1 = 0;
t0 = 1;  t1 = 5;
n_ci = 4;                       % n_ci + 1 = 5    ==>  n_ci = 4
n_cf = 4;                       % n_cf + 1 = 5    ==>  n_cf = 4;
n = n_ci + n_cf +1;             % polynomial degree

M0 = [  1,  0,  0,  0, 0;
       -1,  1,  0,  0, 0;
        1, -2,  1,  0, 0;
       -1,  3, -3,  1, 0;
        1, -4,  6, -4, 1
      ];
b0 = [0; v0/n; a0/(n * (n -1)); j0/(n*(n-1)*(n-2)); s0/(n * (n-1) *(n-2) * (n-3))];

P0 =  M0\b0;

M1 = [  1,  0,  0,  0, 0;
      1, -1,  0,  0, 0;
      1, -2,  1,  0, 0;
      1, -3,  3, -1, 0;
      1, -4,  6, -4, 1
  ];
b1 = [1; v1/n; a1/(n * (n -1)); j1/(n*(n-1)*(n-2)); s1/(n * (n-1) *(n-2) * (n-3))];

P1 = M1 \b1;

P = [P0(1),P0(2),P0(3),P0(4),P0(5),P1(5),P1(4),P1(3),P1(2),P1(1)];

x=linspace(0,1,1000);
y=[];
dy = [];
ddy = [];

for t = x;
        q_ =  t + 140 * t^5  - 504 * t^6  + 684 * t^7  - 415 * t^8  + 95 * t^9
        y = [y,q_];
        
        q_d = 1 + 700 * t^4 -  3024 * t^5 + 4788 * t^6 - 3320 * t^7 + 855 * t^8;
        dy = [dy,q_d];
        
        q_dd =  2800 * t^3 - 15120 * t^4 + 28728 * t^5 - 23240 * t^6 + 6840 * t^7;
        ddy = [ddy,q_dd];
        
 
end


subplot(3,1,1);
plot(x,y,'linewidth',1.5);
ylabel('Position')

subplot(3,1,2);
plot(x,dy,'linewidth',1.5);
ylabel('Velocity')

subplot(3,1,3);
plot(x,ddy,'linewidth',1.5);
ylabel('Accelaration')


   
   
   
   