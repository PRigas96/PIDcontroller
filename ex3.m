x0 = [1 2 3] ;
xf = [ 4 5 6];

A = [ 1 5 4;1 2 4; 1 4 5];
B = [ 1 ;2 ;1];

n = length(A);
S = ctrb(A,B);
u = zeros(n,1);
u = inv(S) * (xf' - (A^3) * x0' )