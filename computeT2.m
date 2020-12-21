function [T2] = computeT2(T1,T3,a0,v3,j_max)
	 T2 = 0;
	 den = a0 + j_max * T1;

	if abs(den) > 1e-7
		T2 = (-0.5 * T1 * T1 * j_max - T1 * T3 * j_max - T1 * a0 + 0.5 * T3 * T3 * j_max - T3 * a0 + v3) / den;
    end

	T2 = max(T2, 0);
end

