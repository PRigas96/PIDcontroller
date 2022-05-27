% First define state space system
a1 = 17;
a2 = 7;
a3 = 3;
a4 = 1;

a = [ a1 a2 a3 a4];

A = [ 1 a(1) ; a(3) 1];
B = [a(2) ; a(4)];
C = [ 1  0];
D = 0;
[n,d]=ss2tf(A,B,C,D);

mySys_tf=tf(n,d)

H = zpk(mySys_tf)


