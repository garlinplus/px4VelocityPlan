function [T1,T3] = computeT1(a0,v3,j_max,a_max)

    delta = 2* a0 * a0 + 4 * j_max * v3;

    sqrt_delta = sqrt(delta);
    T1_plus = (-a0 + 0.5 * sqrt_delta) / j_max;
    T1_minus = (-a0 - 0.5 * sqrt_delta) / j_max;

    T3_plus = a0 / j_max + T1_plus;
    T3_minus = a0 / j_max + T1_minus;
    T1 = 0;

    if T1_plus >= 0 && T3_plus >= 0 
        T1 = T1_plus; 
    elseif T1_minus >= 0 && T3_minus >= 0
        T1 = T1_minus;
    end

	T1 = saturateT1ForAccel(a0, j_max, T1, a_max);
    T1 = max(T1, 0);
    
    T3 = T1 + a0 / j_max;
