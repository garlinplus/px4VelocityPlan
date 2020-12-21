function vel_zero_acc = computeVelAtZeroAcc(state,max_jerk)
	 vel_zero_acc = state.v;
	if abs(state.a) > 1e-10
		j_zero_acc = -sign(state.a) * max_jerk;
		t_zero_acc = -state.a / j_zero_acc;
		vel_zero_acc = state.v + state.a * t_zero_acc + 0.5 * j_zero_acc * t_zero_acc * t_zero_acc;
    end
end

