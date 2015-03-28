function d = cardynamicsv2(t,x)

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
w =3.7;

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

% Based on explicit
K = (w/2)^3;
desiredPsi = acos(3*(-t+w/2)^2/sqrt(9*(-t+w/2)^4+1));
OMT = 1.85-t;
F1 = (54*(OMT)^5)/(9*(OMT)^4+1)^1.5;
F2 = (6*(OMT))/sqrt(9*(OMT)^4+1);
N = F1-F2;
DN = sqrt(1 - (9*(OMT)^4)/(9*OMT^4+1) );
desiredPsidot = -N/DN;
desiredsy = -t;
desiredsx = K-(desiredsy+w/2)^3;
%ax = k5*(cos(desiredPsi)*(desiredsx - sx) + sin(desiredPsi)*(desiredsy - sy))...
   % +k6*(vd-v); % based on explicit

A = Cr*lr-Cf*lf;
dPsid= -N/DN; %(48*(w-2*t))/((9*(w-2*t)^4)+16);
dbeta = ((A/(m*v^2))-1)*psidot + Cf*delta/(m*v^2) - (Cf+Cr)*beta/(m*v);
dpsi = psidot;
dpsidot = -A*beta/Iz - ((lf^2*Cf+lr^2*Cr)/Iz)*(psidot/v) + (lf*Cf)*delta/Iz;
dv = ax;
dsx = v*cos(beta+psi);
dsy = v*sin(beta+psi);
vmag=sqrt(9*(t-(w/2))^4+1);
dsxd = vd*(3*(t-(w/2))^2)/vmag;
dsyd = vd/vmag;

vw = k1*(cos(Psid)*(syd - sy) - sin(Psid)*(sxd - sx)) ...
    +k2*(Psid - psi)...
    +k3*(dPsid - dpsi)...
    -k4*(delta);

ddelta = vw;

% Based on explicit
% vw = k1*(cos(desiredPsi)*(desiredsy - sy) - sin(desiredPsi)*(desiredsx - sx)) ...
%     +k2*(desiredPsi - psi)...
%     +k3*(desiredPsidot - dpsi)...
%     -k4*(delta);
%ddelta = vw;


d = [dbeta,dpsi,dpsidot,dv,dsx,dsy,ddelta,dPsid,dsxd,dsyd]';
if nnz(~isreal(d))
    x
    d
    keyboard;
end