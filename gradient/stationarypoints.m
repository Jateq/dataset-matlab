syms x1 x2
f = 1.5*x1^2 + x2^2 - 2*x1*x2 + 2*x1^3 + 0.5*x1^4;
df_dx1 = diff(f, x1);
df_dx2 = diff(f, x2);

[crit_x1, crit_x2] = solve([df_dx1 == 0, df_dx2 == 0], [x1, x2]);

d2f_dx1x1 = diff(df_dx1, x1);
d2f_dx1x2 = diff(df_dx1, x2);
d2f_dx2x2 = diff(df_dx2, x2);

for i = 1:length(crit_x1)
    x1_val = crit_x1(i);
    x2_val = crit_x2(i);
    H = [subs(d2f_dx1x1, {x1, x2}, {x1_val, x2_val}), subs(d2f_dx1x2, {x1, x2}, {x1_val, x2_val});
         subs(d2f_dx1x2, {x1, x2}, {x1_val, x2_val}), subs(d2f_dx2x2, {x1, x2}, {x1_val, x2_val})];
    eigenvalues = eig(double(H));
    if all(eigenvalues > 0)
        disp(['Local minimum at (', num2str(double(x1_val)), ', ', num2str(double(x2_val)), ')']);
    elseif all(eigenvalues < 0)
        disp(['Local maximum at (', num2str(double(x1_val)), ', ', num2str(double(x2_val)), ')']);
    else
        disp(['Saddle point at (', num2str(double(x1_val)), ', ', num2str(double(x2_val)), ')']);
    end
end
