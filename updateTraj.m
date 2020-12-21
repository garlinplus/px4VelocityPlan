function [local_time,state] = updateTraj(state,T1,T2,T3,state_init,max_jerk,d,dt,local_time,time_stretch)

local_time = local_time + dt * time_stretch;
t_remain = local_time;
t1 = min(t_remain,T1);

state = evaluatePoly(max_jerk,state_init.a, state_init.v, state_init.x, t1, d);
t_remain = t_remain - t1;

if t_remain > 0
   t2 = min(t_remain,T2);
   state = evaluatePoly(0,state.a, state.v, state.x, t2, d);
   t_remain = t_remain - t2;
end

if t_remain > 0
   t3 = min(t_remain,T3);
   state = evaluatePoly(max_jerk,state.a, state.v, state.x, t3, d);
   t_remain = t_remain - t3;  
end

if t_remain > 0
    state = evaluatePoly(0,0, state.v, state.x, t3, 0);
end
end

