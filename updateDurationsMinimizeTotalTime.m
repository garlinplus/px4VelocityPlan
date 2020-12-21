function [T1,T2,T3] = updateDurationsMinimizeTotalTime(state,vel_sp,max_jerk,max_accel,direction)
	 jerk_max_T1 = direction * max_jerk;
	 delta_v = vel_sp - state.v;

	T1 = computeT1(state.a, delta_v,jerk_max_T1,max_accel);
	T3 = computeT3(T1, state.a, jerk_max_T1);
	T2 = computeT2(T1, T3, state.a, delta_v, jerk_max_T1);
end

