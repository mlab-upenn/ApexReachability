#define D 0.1
#define m 2273
#define Iz 4423
#define Cf 108000
#define Cr 108000
#define lf 1.292
#define lr 1.515
#define k1 2
#define k2 12
#define k3 4
#define k4 2
#define k5 1
#define k6 10

[0,120] sx;
[0,30] sy;
[0,3] Psi;
[-.15, .15] delta;
[0,10] v;
[0, 10] time;

/* Symbols */
/* Plant State Variables */
// Beta is the slip angle at the center of mass
// Psi_dot is the yaw rate
// Psi is the heading angle
// v is the velocity
// sx is the x position
// sy is the y position
// delta is the angle of the front wheel

/* Controller variables */
// Psi_d is the requested heading angle
// Psi_dot_d is the requested yaw rate
// sx_d is the requested x position
// sy_d is the requested y position

/* System inputs from tracking controller */
// ax is an input to the system and is the longitudinal acceleration
// vw is an input to the system and is speed rotational speed of the steering angle

{
    mode 1;

    invt:
    // X position must be greater than or equal to 0
    (x>=0);
    // Velocity must be greater than or equal to 0
    (v>=0);

    flow:
    /* Plant equations */
    // Compute rate of change of the slip angle
    d/dt[Beta]=((((Cr*lr-Cf*lf)/(m*v^2))-1)(Psi_dot))+((Cf*delta)/(mv))-(((Cf-Cr)/mv)*Beta);
    // Rate of change of yaw rate
    d/dt[Psi_dot]=(((Cr*lr-Cf*lf)/Iz)*Beta)-(((Cf*lf^2-Cr*lr^2)/Iz)*(Psi_dot/v))+((Cf*lf/Iz)*delta);
    // Rate of change of the heading angle is equal to yaw rate
    d/dt[Psi]=Psi_dot;
    // Longitudinal acceleration
    d/dt[v]=k5*(cos(acos(1/(v*cos(v))))*(v-sx)+sin(acos(1/(v*cos(v))))*(sin(v)-sy))+k6*(v-v);
    // X component of velocity
    d/dt[sx]=v*cos(Beta+Psi);
    // Y component of velocity
    d/dt[sy]=v*sin(Beta+Psi);
    // Rate of change of front wheel angle.
    d/dt[delta]=k1*((cos(acos(1/(v*cos(v))))*(sin(v)-sy))-(sin(acos(1/(v*cos(v))))*(v-sx)))+k2*(acos(1/(v*cos(v)))-Psi)+k3*((v*sin(v)/sqrt(v^2-(cos(v))^2))-Psi_dot)-k4*(delta);

    /*
    // Rate of change of front wheel angle
    vw=k1*((cos(Psi_d)*(sy_d-sy))-(sin(Psi_d)*(sx_d-sx)))+k2*(Psi_d-Psi)+k3*(Psi_dot_d-Psi_dot)-k4*(delta);
    // Longitudinal acceleration
    ax=k5*(cos(Psi_d)*(sx_d-sx)+sin(Psi_d)*(sy_d-sy))+k6*(v_d-v);
    // Requested heading angle
    Psi_d=acos(1/(v*cos(v)));
    // Requested yaw rate
    Psi_dot_d=v*sin(v)/sqrt(v^2-(cos(v))^2);
    // Requested Position
    sx_d=v;
    sy_d=sin(v);*/

}