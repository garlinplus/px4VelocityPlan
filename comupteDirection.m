function d = computeDirection(vel_sp,state,max_jerk)
vel_zero_acc = computeVelAtZeroAcc(state,max_jerk);
direction = sign(vel_sp - vel_zero_acc);

if direction == 0
    direction = sign(state.a);
end

d = direction;