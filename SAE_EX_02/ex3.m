 
clc; clearvars; syms  t s Y y(t) Dy(t)
assume([t Y] > 0);
Dy = diff(y, t);
D2y = diff(Dy, t);
LS = 5;
% Diff. Equation formulation:
EQN=D2y+Dy+y-LS;
% Laplace transform of the Diff. Equation
LEQN=laplace(EQN,t,s);  
% Substitute ICs and initiate the arbitrary unknown "Y"
LT_Y=subs(LEQN,laplace(y,t,s),Y);
LT_Y=subs(LT_Y, y(0), 1);                            %  y(0) = 1
LT_Y=subs(LT_Y, subs(diff(y(t), t), t, 0), 0);  %  dy(0)= 0
% Solve for the arbitrary unknown: Y
ys=solve(LT_Y,Y);
% Inverse of the Laplace Transform:
y=ilaplace(ys,s,t);
pretty(y)