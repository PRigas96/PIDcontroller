%% 1o erg %%
% Credit To Panos Rigas for Creating the Code
% e for errors
% wn_tf_f = mean(wn_tf); and re apply for simplify solution numerically
% z_tf_f = mean(z_tf);
% wn_zpk_f = mean(wn_zpk);
% z_zpk_f = mean(z_zpk);
%% initialization %%
clear all;
clc;
syms   wn z s a
% Dhmhioyrgia Y
y_up = poly2sym(wn^2,s);
y_down = poly2sym([1 2*wn*z wn^2],s);
y = [ y_up y_down];
%% input Data
Onoma = [16 1 13 15]; % size(Onoma) < Size(Epitheto)
Epitheto = [17 7 3 1 18];% 
S = [ 0 0.9 2 ];
%simplification
Onoma2 = [16 1 13 15 ];
Epitheto2 = [17 7 3 1 18];
%% Poly Creation
p1_up = Onoma ;
p1_down = Epitheto;

p2_up = poly(Onoma2);
p2_down = poly(Epitheto2);
%% Main programm
n1 = length(p1_up);
n2 = length(p2_up);
if n1 > n2
    p2_up = [ zeros(1,n1-n2) p2_up];
    p2_down = [ zeros(1,n1-n2) p2_down];
end
if n1 < n2
    p1_up = [ zeros(1,n2-n1) p1_up];
    p1_down = [ zeros(1,n2-n1) p1_down];
end

n3 = length(p1_down);
n4 = length(p2_down);
p1_down = [ zeros(1,n4-n3) p1_down];

up = [ p1_up ; p2_up];
down = [p1_down; p2_down];

n = size(S,2); 
L = size(S,1);
for k = 1:L
for i = 1:2
    for j = 1:n %O(n^2) oxi O(n^3)
        e(i,j) = subs(y(1),s,S(k,j))/subs(y(2),s,S(k,j))...
            - polyval(up(i,:),S(k,j))/polyval(down(i,:),S(k,j)) ; % errors
    end
end

x = [ wn z ];
e_sq = sum(e.^2,2); % sum of squares
%derivatives
eqn(1) = simplify(diff(e_sq(1),x(1)));
eqn(2) = simplify( diff(e_sq(1),x(2)));

eqn(3) = diff(e_sq(2),x(1));
eqn(4) = diff(e_sq(2),x(2));
%  simplify(eqn) ;
  sol1 = solve(eqn(1)==0,eqn(2)==0,x); 
  sol2 = solve(eqn(3)==0,eqn(4)==0,x); 
%     sol(:,1) = sol1.wn;
%     sol(:,2) = sol1.z;
%     sol(:,3) = sol2.wn;
%     sol(:,4) = sol2.z;
  
 % discard nonreal solutions for h
  if isreal(sol1.wn)
     ind = find(sol1.wn >0);
  ind_l = length(ind);
     for i = 1:ind_l
       sol_h(i,2*k-1) = sol1.wn(ind(i));
         if isreal(sol1.z)
    sol_h(i,2*k) = sol1.z(ind(i));
  else
    sol_h(i,2*k) = imag(sol1.z(ind(i))); 'hi'
         end
     end
  else
         ind = find(imag(sol1.wn) >0);
  ind_l = length(ind);
     for i = 1:ind_l
       sol_h(i,2*k-1) =imag( sol1.wn(ind(i)));
         if isreal(sol1.z)
    sol_h(i,2*k) = sol1.z(ind(i));
  else
    sol_h(i,2*k) = imag(sol1.z(ind(i)));
         end
     end  
  end
    % discard nonreal solutions for zpk
  if isreal(sol2.wn)
     ind = find(sol2.wn >0);
  ind_l = length(ind);
     for i = 1:ind_l
       sol_zpk(i,2*k-1) = sol2.wn(ind(i));
         if isreal(sol2.z)
    sol_zpk(i,2*k) = sol2.z(ind(i));
  else
    sol_zpk(i,2*k) = imag(sol2.z(ind(i)));
         end
     end
  else
         ind = find(imag(sol2.wn) >0);
  ind_l = length(ind);
     for i = 1:ind_l
       sol_zpk(i,2*k-1) =imag( sol2.wn(ind(i)));
         if isreal(sol2.z)
    sol_zpk(i,2*k) = sol2.z(ind(i));
  else
    sol_zpk(i,2*k) = imag(sol2.z(ind(i)));
         end
     end  
  end
 
end
%% results
for i = 1: length(sol_h)/2
solh_wn_f(i,:)= sol_h(2*i-1);
solh_z_f(i,:)= sol_h(2*i);
end
 
for i = 1: length(sol_zpk)/2
solzpk_wn_f(i,:)= sol_zpk(2*i-1);
solzpk_z_f(i,:)= sol_zpk(2*i);
end
 
%% choose method of analysing results
 solh_wn_f;
 solh_z_f;
 solzpk_wn_f;
 solzpk_z_f;