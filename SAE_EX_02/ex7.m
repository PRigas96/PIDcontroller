clear all;clc;
% First define state space system
b = [0 3 1];
a = [1 6 11 6];
[A,B,C,D] = tf2ss(b,a) 


S = [ B A*B (A^(2))*B];
S_t = S^(-1);
 
q = S_t(3,:);
P = [q ; q*A ; q*A^(2)];

 
T= P^(-1);
 
A_n = T^(-1) * A * T;
B_n = T^(-1) * B;
C_n = C * T;
D_n = D;

lamda = eig(A_n);
T_new = [ 1 1 1; lamda(1) lamda(2) lamda(3);lamda(1)^2 lamda(2)^2 lamda(3)^2];

A_d = T_new^(-1) * A_n * T_new 

B_d = T_new^(-1) * B_n 

C_d = C_n * T_new 

D_d = D_n 

 