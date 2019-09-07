close all

r_i = 2;
r_o = 4;

global step_for_r
step_for_r = (r_o - r_i) / 10;

sigma_t = tangential_stress(2.7, 40, 0.32, r_i, r_o);
sigma_r = radial_stress(2.7, 40, 0.32, r_i, r_o);

figure(1)
subplot(1, 2, 1)
p = 0:0.01:pi;
x = cos(p) * r_i;
y = sin(p) * r_i;
plot(y, x, 'k')
hold on
axis equal
title('tangential stress')
p = 0:0.01:pi;
x = cos(p) * r_o;
y = sin(p) * r_o;
plot(y, x, 'k')
sigma_t = r_i * sigma_t ./ max(abs(sigma_t));
plot(r_i:step_for_r:r_o, sigma_t, 'r');

sigma_index = 0;
for i=r_i:step_for_r:r_o
    sigma_index = sigma_index + 1;
    plot([i, i], [0, sigma_t(sigma_index)], 'b');
end

subplot(1, 2, 2)
p = 0:0.01:pi;
x = cos(p) * r_i;
y = sin(p) * r_i;
plot(y, x, 'k')
hold on
axis equal
title('radial stress')
p = 0:0.01:pi;
x = cos(p) * r_o;
y = sin(p) * r_o;
plot(y, x, 'k')
sigma_r = r_i * sigma_r ./ max(abs(sigma_r));
plot(r_i:step_for_r:r_o, sigma_r, 'r');

sigma_index = 0;
for i=r_i:step_for_r:r_o
    sigma_index = sigma_index + 1;
    plot([i, i], [0, sigma_r(sigma_index)], 'b');
end

