%% TF %%
z_trf = 0.8375;%-0.1581
wn_trf = 1.1953;%1.7203
%  [max, yout_norm,yout_pd,yout_pid] = fun(wn,z) ;
%  figure
% fplot(yout_norm,[0 25]);
%% ZPK %%
% z_zpk =0.0928;
% wn_zpk = 1.0352;
% Kp1=1.9;
%      Kp2=8;
%     Ki2=0.03;
% [max_zpk, yout_norm_zpk,yout_pd_zpk,yout_pid_zpk,gains_zpk] = fun(wn_zpk,z_zpk,'zpk',Kp1,Ki2,Kp2) ;
% lgd=legend('Normal','PD','PID');
% title(lgd,'zpk yout');
%  
%% TF %%
% z_trf =  0.1581; 
% wn_trf =1.7203;

Kp1=5;
     Kp2=8;
    Ki2=0.03;
[max_trf, yout_norm_trf,yout_pd_trf,yout_pid_trf,gains_trf] = fun(wn_trf,z_trf,'trf',Kp1,Ki2,Kp2) ;
lgd=legend('Regular','PD','PID');
title(lgd,'H yout');
%% plots for different Gains
%  hold on
%  figure
% for i=1:10
%     fun(wn_zpk,z_zpk,'zpk',i) ;
%     lgd=legend('Regular','PD','PID');
%     title(lgd,'zpk for different Kp');
% end
%  hold off
%  hold on
%  figure 
% for i=0:10:55
%     fun(wn_trf,z_trf,'trf',i,2,1) ;
%     lgd=legend('Regular','PD','PID');
%     title(lgd,'TF for different Kp2');
% end
%  hold off
% H=tf([1],[1 2*z_trf*wn_trf  wn_trf*wn_trf*5.0000  wn_trf*wn_trf*0.02]);
% pzmap(H)
% grid on
% figure 
%  hold on
%  
% for i=0.1:0.2:2
%  
%     H=tf([1],[1 2*z_zpk*wn_zpk  wn_zpk*wn_zpk*5  wn_zpk*wn_zpk*i]);
% pzmap(H)
% grid on
%   title('TF poles for different Ki2 ');
%    
% end
%  hold off
