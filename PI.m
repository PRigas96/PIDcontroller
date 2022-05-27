function [Ki2,Kp2] = PI(A)

if A=='zpk'
    Kp2 =10;
    Ki2 =0.01;
end

if A=='trf'
    Kp2=10;
    Ki2=0.03;


end