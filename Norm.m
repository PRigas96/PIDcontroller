function  [a,yout1 ] = Norm(wn,z)
syms t y(t) Y(s) y0 s
x=0:0.1:25;
Hnon = tf([wn^2],[1 2*z*wn wn^2]);
yout_non = step(Hnon,x);[~,I_non]=max(yout_non);
% Hnon = tf([wn^2],[1 2*z*wn wn^2 0]);
%  yt = ilaplace(Hnon,s,t)

 snum = poly2sym([wn^2], s) ;                                    % Symbolic Numerator Polynomial
sden = poly2sym([1 2*z*wn wn^2 0], s);                                     % Symbolic Denominator Polynomial
FT_time_domain = ilaplace(snum/sden);                        % Inverse Laplace Transform
yout1=FT_time_domain;
yout1=vpa(yout1,3);

a = zeros(1,2);
[a(1),a(2)]=max(yout_non);

fplot(yout1,[0 15])
legend('Norm')
end