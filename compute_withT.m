function [T1,T2,T3] = compute_withT(T123,jmax,amax,a0,deltav)
a = -jmax;
b = jmax * T123 - a0;
delta = T123 * T123 * jmax * jmax + 2*T123 * a0 * jmax - a0 * a0 - 4 * jmax * deltav;

T1p = max(0.5*(-b + sqrt(delta))/a,0);
T1n = max(0.5*(-b - sqrt(delta))/a,0);

T3p = T1p + a0/jmax;
T3n = T1n + a0/jmax;

T13p = T1p + T3p;
T13n = T1n + T3n;

T1 = 0;
if T13p > T123
    T1 = T1n;
elseif T13n > T123
    T1 = T1p;
end

T1 = max(T1,0);
accel_T1 = a0 + jmax * T1;
T1_new = T1;
if accel_T1 > amax
    T1_new = (amax - a0) / jmax;
elseif accel_T1 < -amax
   T1_new = (-amax - a0) / jmax; 
end

T1 = T1_new;
T3 = T1 + a0 / jmax;
T2 = T123 - T1 - T3;