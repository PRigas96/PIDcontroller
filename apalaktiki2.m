% define transfer functions
s = tf('s');
z =  abs(-0.1581);%-0.1581
wn =1.7203;%1.7203
 
Hnon = tf([wn^2],[1 2*z*wn wn^2]);
C =@(Kp,Ki) Kp + Ki/s;
G =Hnon;
% define parameter combinations
Kp = [1,2,4,1,1];
Ki = [1,1,1,2,4];
% create figure
figure
ah = axes;
hold(ah,'on');
% loop through given combinations of Kp and Ki
for ik = 1:length(Kp)
    H = feedback(C(Kp(ik),Ki(ik))*G,1);
    step(H)
end
% create cell array of legend entries
cLegend = arrayfun(@(Kp,Ki) sprintf('Kp = %i, Ki = %i',Kp,Ki),Kp,Ki,'UniformOutput',false);
% add legend to figure
legend(ah,cLegend)