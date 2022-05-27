clear all;clc;
% First define state space system
b = [2 3];
a = [1 5 6];
[A,B,C,D] = tf2ss(b,a) 


S = [ B A*B ];
S_t = S^(-1);
 
q = S_t(2,:);
P = [q ; q*A  ];

 
T= P^(-1);
 
A_n = T^(-1) * A * T;
B_n = T^(-1) * B;
C_n = C * T;
D_n = D;

lamda = eig(A_n);
lamda = round(lamda,2);
T_new = [ 1 1  ; lamda(1) lamda(2)  ];

A_d = T_new^(-1) * A_n * T_new 

B_d = T_new^(-1) * B_n 

C_d = C_n * T_new 

D_d = D_n 
 
 