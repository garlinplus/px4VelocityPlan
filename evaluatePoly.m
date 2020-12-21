function state = evaluatePoly(j, a0, v0, x0, t, d)
jt = d * j;
t2 = t * t;
t3 = t2 * t;

state.j = jt;
state.a = a0 + jt * t;
state.v = v0 + a0 * t + 0.5 * jt * t2;
state.x = x0 + v0 * t + 0.5 * a0 * t2 + 1 / 6 * jt * t3;
end

