 
A = [ -4 -1 1; 0 -3 1; 1 1 -3];
B = [-1 ;1; 0];
C = [ -1 -1  0];
D = 0;

S = [ B A*B (A^2)*B];
S_t = inv(S);
 
q = S_t(3,:);
P = [q ; q*A;q*(A^2)];

 
T= P^(-1);
 
A_n = T^(-1) * A * T;
B_n = T^(-1) * B;
C_n = C * T;
D_n = D;

lamda = eig(A_n);
T_new = [ 1 1 1; lamda(1) lamda(2) lamda(3); lamda(1)^2 lamda(2)^2 lamda(3)^2];

A_d = T_new^(-1) * A_n * T_new ;

B_d = T_new^(-1) * B_n ;

C_d = C_n * T_new ;

D_d = D_n ;

 