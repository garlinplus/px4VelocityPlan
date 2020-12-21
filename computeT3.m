function [T3] = computeT3(T1,a0,max_jerk)
	T3 = a0 / max_jerk + T1;
	 T3 = max(T3, 0);
end

