function [local_time,state_init,d,T1,T2,T3] = updateDurations(vel_setpoint,state,max_jerk,max_accel)
vel_sp = vel_setpoint;
local_time = 0;
state_init = state;
d = comupteDirection(vel_sp,state,max_jerk);

T1 = 0;
T2 = 0;
T3 = 0;

if d~= 0
   [T1,T2,T3] = updateDurationsMinimizeTotalTime(state,vel_sp,max_jerk,max_accel,d);
end