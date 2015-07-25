close all

a = [1, -1.3789, 0.9506];
b = 1;
n = [0:100];
x = (n == 0);
f_sample = 8000;

zplane(b, a);
saveas(gcf, '../report/zplane', 'png');

figure
[H, F] = freqz(b, a, 512, f_sample);
[max_value, max_index] = max(H);
f_peak = F(max_index)

saveas(gcf, '../report/freqz', 'png');

figure
subplot 211
impz(b, a, n);
subplot 212
y = filter(b, a, x);
stem(n, y);
saveas(gcf, '../report/impz_filter', 'png');
