
clear all;
clc;

state.a = 8;
state.v = 3;
state.x = 0;
vel_sp = 50;

max_jerk = 10;
max_accel = 10;
v_max = 6;

dt = 0;
[local_time,state_init,d,T1,T2,T3] = updateDurations(vel_sp,state,max_jerk,max_accel);
[local_time,state] = updateTraj(state,T1,T2,T3,state_init,max_jerk,d,dt,local_time,1);

T123 = T1 + T2 + T3;
dt = 0.01;
N = ceil(T123 / dt)

x = zeros(N,3);
t = zeros(N,1);

for i = 1:N
    [local_time,state] = updateTraj(state,T1,T2,T3,state_init,max_jerk,d,dt,local_time,1);
    x(i,1) = state.a;
    x(i,2) = state.v;
    x(i,3) = state.x;
    
    [local_time,state_init,d,T1,T2,T3] = updateDurations(vel_sp,state,max_jerk,max_accel);
    t(i) = (i-1) * dt;
end

subplot(3,1,1)
plot(t,x(:,1));
subplot(3,1,2)
plot(t,x(:,2))
subplot(3,1,3)
plot(t,x(:,3))