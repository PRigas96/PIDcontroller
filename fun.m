function  [a,yout1,yout2,yout3,gains ] = fun(wn,z,A,Kp1,Ki2,Kp2) 
syms t y(t) Y(s) y0 s
x=0:0.1:15;
Hnon = tf([wn^2],[1 2*z*wn wn^2]);
yout_non = step(Hnon,x);[~,I_non]=max(yout_non);
% Hnon = tf([wn^2],[1 2*z*wn wn^2 0]);
%  yt = ilaplace(Hnon,s,t)

 snum = poly2sym([wn^2], s) ;                                    % Symbolic Numerator Polynomial
sden = poly2sym([1 2*z*wn wn^2 0], s);                                     % Symbolic Denominator Polynomial
FT_time_domain = ilaplace(snum/sden);                        % Inverse Laplace Transform
yout1=FT_time_domain;
yout1=vpa(yout1,3);
% figure
% hold on

%   bode(Hnon)
 
%% PD
e=0.00001;
z_w = 1-e;
 
Kd1 = ( 2 * (1-z) * wn)/(wn^2);
% Kp1 = 2;

s = - Kp1/Kd1;
p_v1 = [1    (2*(z)*wn + (wn^2) * Kd1)     (wn^2)*Kp1 ] ;
Hpd = tf([(wn^2)*Kd1 (wn^2)*Kp1],p_v1);
yout_pd = step(Hpd,x);[~,I_pd]=max(yout_pd);

syms t y(t) Y(s) y0 s
snum1 = poly2sym([(wn^2)*Kd1 (wn^2)*Kp1], s) ;                                    % Symbolic Numerator Polynomial
sden1 = poly2sym([1    (2*(z)*wn + (wn^2) * Kd1)     (wn^2)*Kp1 0], s);                                     % Symbolic Denominator Polynomial
FT_time_domain1 = ilaplace(snum1/sden1);                        % Inverse Laplace Transform
yout2=FT_time_domain1;
yout2=vpa(yout2,3);
% rhStabilityCriterion
%% PI
z=1-e;
% [Ki2,Kp2] = PI(A);
% Kp2 = 5;
% Ki2 = 0.02;
% p_v2 = [1 2*z*wn wn^2 * Kp2 wn^2 * Ki2];
% Hpi = tf([(wn^2)*Kp2 (wn^2)*Ki2],p_v2);

% bode(Hpi)

%% PID
Kp = Kp1*Kp2 + Kd1* Ki2;
Kd = Kd1 *Kp2;
Ki = Kp1*Ki2;
Hpid= tf([(wn^2)*Kd (wn^2)*Kp (wn^2)*Ki],[1 ((wn^2)*Kd+2*wn*z) (wn^2)*Kp (wn^2)*Ki]);
yout_pid = step(Hpid,x);[~,I_pid]=max(yout_pid);

syms t y(t) Y(s) y0 s
snum3 = poly2sym([(wn^2)*Kd (wn^2)*Kp (wn^2)*Ki], s) ;                                    % Symbolic Numerator Polynomial
sden3 = poly2sym([1 ((wn^2)*Kd+2*wn*z) (wn^2)*Kp (wn^2)*Ki 0], s);                                     % Symbolic Denominator Polynomial
FT_time_domain3 = ilaplace(snum3/sden3);                        % Inverse Laplace Transform
yout3=FT_time_domain3;
yout3=vpa(yout3,3);

 %% Bode and max output %%

%  bode(Hnon,Hpd,Hpid)
%  legend('Normal','PD','PID')
 
 a=[max(yout_non) max(yout_pd) max(yout_pid); I_non/10 I_pd/10 I_pid/10];
 
 
 %% output graph%%
% 
%   figure(1) 
%  hold on
% 
% plot(x',yout_non)
% plot(x',yout_pd)
% plot(x',yout_pid)
%  hold off
% 
figure(3)
hold on 
fplot(yout1,[0 16])
fplot(yout2,[0 16])
fplot(yout3 ,[0 16 ])

hold off
gains=[Kp1 Kd1 Kp2 Ki2 Kp Kd Ki];
end