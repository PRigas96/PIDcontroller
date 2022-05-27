R = 4.7e3;
C = 10e-6;
L = 1;
D = 0.4;
Vin=24;
h1 = [  Vin*(L*(D/(1-D)^2)) Vin*R];
h2 = [ L*R*C L*R*(1-D)^2  ];