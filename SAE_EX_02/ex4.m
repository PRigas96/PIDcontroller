%Made by Panagiotis Rigas and Panagiotis Xristodoulou
clear all ;
clc;
a1 = 22;
a2 = 17;
a3 = 9;
a4 = 18;

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

syms  t s X x(t) Dx(t) y x1 x2 X1 X2 x   x1(t) x2(t)
X = [ X1 ; X2];
x = [ x1  ; x2 ] ;
 
 
eqn1=sym('D(x1)(t) - (-6.1414)* x1(t)= 0'); w
lteqn1=laplace(eqn1,t,s);
neweqn1=subs(lteqn1,{'laplace(x1(t),t,s)','x1(0)'},{X1,5 });

xtrans1=simplify(solve(neweqn1,X1));


eqn2=sym('D(x2)(t) - (8.1414)* x2(t)= 0');  
lteqn2=laplace(eqn2,t,s);
neweqn2=subs(lteqn2,{'laplace(x2(t),t,s)','x2(0)'},{X2,3 });
 
xtrans2=simplify(solve(neweqn2,X2));

x1=ilaplace(xtrans1,s,t)
x2=ilaplace(xtrans2,s,t)

y_d = C*[x1 ; x2]