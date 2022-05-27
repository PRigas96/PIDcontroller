%% 1η εργαστηριακη
clc;
clear;
A = [0 1 0 0 0 0; 0 0 1 0 0 0; 0 0 -5 0 0 -3; 0 0 0 0 1 0; 0 0 0 0 0 1; 0 0 -(3/4) -(10/4) 0 0];
B = [0 0; 0 0; 1 0; 0 0; 0 0; 0 1/2];
C = [1 0 0 0 0 0; 0 0 0 1 0 0];
D = zeros(2,2) ;
sys = ss(A,B,C,D)
% canon_sys = canon(sys)
systf = minreal(tf(sys))
S = ctrb(sys);
if rank(S)==size(A,1)
    "It is controlable"
else
    "It is not controlable"
end