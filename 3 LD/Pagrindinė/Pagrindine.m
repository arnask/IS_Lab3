x = 0.1:1/22:1;
y = (1 + 0.6*sin(2*pi*x/0.7)) + 0.3*sin(2*pi*x)/2;
c1 = 0.2;
c2 = 0.85;
r1 = 0.18;
r2 = 0.20;
w0 = randn();
w1 = randn();
w2 = randn();
lr = 0.015;

for j = 1 : 1000
for i = 1 : length(x)
    F1(i) = exp(-(x(i)-c1)^2/(2*r1^2));
    F2(i) = exp(-(x(i)-c2)^2/(2*r2^2));
    d(i) = F1(i) * w1 + F2(i) * w2 + w0;
    e(i) = y(i) - d(i);
end
for k = 1 : length(x)
    w1 = w1 + lr * e(k) * F1(k);
    w2 = w2 + lr * e(k) * F2(k);
    w0 = w0 + lr * e(k);
end
end
for i = 1:length(x)
    F1(i) = exp(-(x(i)-c1)^2/(2*r1^2));
    F2(i) = exp(-(x(i)-c2)^2/(2*r2^2));
    d(i) = F1(i) * w1 + F2(i) * w2 + w0;
end
plot(x,y,x,d, "*")
legend("True", "Predicted")