a = zeros(2,4)
for i = 1:1:8
    disp(a(i))
end

x = [1,2,3,pi]
% x^2
x.^2

a = (0:500);
b = sin(a/20) + sqrt(a);
plot(b)