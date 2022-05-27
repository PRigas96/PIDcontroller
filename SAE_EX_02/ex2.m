clear all ;
clc;
a1 = 17;
a2 = 7;
a3 = 3;
a4 = 1;

a = [ a1 a2 a3 a4];

A = [ 1 a(1) ; a(3) 1];
b = [a(2) ; a(4)];
C = [ 1  0];
D = 0;

S = [ b A*b];
S_t = S^(-1);
 
q = S_t(2,:);
P = [q ; q*A];

 
T= P^(-1);
 
A_n = T^(-1) * A * T;
B_n = T^(-1) * b;
C_n = C * T;
D_n = D;

lamda = eig(A_n);
T_new = [ 1 1 ; lamda(1) lamda(2)];

A_d = T_new^(-1) * A_n * T_new ;

B_d = T_new^(-1) * B_n ;

C_d = C_n * T_new ;

D_d = D_n ;

syms  t s X x(t) Dx(t) y x1 x2 X1 X2
X = [ X1 ; X2];
x = [ x1  ; x2 ] ;
Dx = diff(x, t);
 
LS = D_d ;
 
EQN= Dx - A_d .* x- LS;
 
LEQN=laplace(EQN,t,s);  
 
LT_X=subs(LEQN,laplace(x,t,s),X); 
LT_X=subs(LT_X, [x1; x2] , [5 ; 3]);  %  x1(0) = 5, x2(0) = 3
 
xs = solve(LT_X,X) ;
 
x = ilaplace(xs,s,t)
 