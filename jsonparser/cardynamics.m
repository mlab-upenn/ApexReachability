function d = cardynamics(t,x)

m =2273;
Iz= 4423;
Cf= 108000;
Cr =108000;
lf =1.292;
lr =1.515;
k1 =2;
k2 =12;
k3 =4;
k4 =2;
k5 =1;
k6 =10;
vd =7.5;

beta = x(1);
psi=x(2);
psidot=x(3);
v=x(4);
sx=x(5);
sy=x(6);
delta=x(7);
Psid=x(8);
sxd=x(9);
syd=x(10);

ax = k5*(cos(Psid)*(sxd - sx) + sin(Psid)*(syd - sy))...
    +k6*(vd-v);

A = Cr*lr-Cf*lf;
temp1 = 9*t^4+1;
dPsid = -6*t*sqrt(1/temp1)/(sqrt(temp1));
dbeta = ((A)/m*v^2-1)*psidot + Cf*delta/(m*v^2) - (Cf+Cr)*beta/(m*v);
dpsi = psidot;
dpsidot = -A*beta/Iz - ((lf^2*Cf+lr^2*Cr)/Iz)*(psidot/v) + (lf*Cf)*delta/Iz;
dv = ax;
dsx = v*cos(beta+psi);
dsy = v*sin(beta+psi);
dsxd = vd*3*t^2;
dsyd = -vd;

vw = k1*(cos(Psid)*(syd - sy) - sin(Psid)*(sxd - sx)) ...
    +k2*(Psid - psi)...
    +k3*(dPsid - dpsi)...
    -k4*(delta);

ddelta = vw;


d = [dbeta,dpsi,dpsidot,dv,dsx,dsy,ddelta,dPsid,dsxd,dsyd]';