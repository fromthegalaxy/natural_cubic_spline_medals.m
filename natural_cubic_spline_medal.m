% a

function [a,b,c,d] = cubic_spline(x, y)

n = length(x) - 1; % number of intervals

% compute step sizes h(i) = x(i+1)-x(i) for i = 1,...,n
h = zeros(n,1);
for i = 1:n
    h(i) = x(i+1) - x(i);
end

% set up matrix for i = [2, n]
A = zeros(n-1, n-1);
rhs = zeros(n-1, 1);

for i = 1:n-1

    if i>1
        A(i, i-1) = h(i); % lower diagonal
        A(i, i+1) = h(i+1); % upper diagonal
    end

    A(i, i) = 2*(h(i) + h(i+1)); % diagonal entries

    rhs(i) = 3*((y(i+2) - y(i+1)) / h(i+1) - (y(i+1) - y(i)) / h(i));

end

% solve for interior c values c(2) ~ c(n)
c_interior = A \ rhs;

% putting the natural boundary conditions to c_interior
c = zeros(n+1, 1);
for i = 2:n
    c(i) = c_interior(i-1);
end


% compute a, b, d
a = y(1:n); % a_i = y_i for i = [1, n]
b = zeros(n, 1);
d = zeros(n, 1);

for i = 1:n
    b(i) = (y(i+1) - y(i)) / h(i) - h(i) / 3 * (2*c(i) + c(i+1));
    d(i) = (c(i+1) - c(i)) / (3 * h(i));
end

end


% b

% record datas
year = [1924, 1932, 1948, 1956, 1964, 1972, 1980, 1988, 1994, 2002, 2010, 2014];
medal = [1, 7, 3, 3, 3, 1, 2, 5, 13, 17, 26, 25];

[a, b, c, d] = cubic_spline(year, medal);

disp("Natural Cubic Spline Coefficients for each interval:")
n = length(year) - 1;

for i = 1:n
    fprintf('Interval [%d, %d]:\n', year(i), year(i+1));
    fprintf('  a = %.4f\n', a(i));
    fprintf('  b = %.4f\n', b(i));
    fprintf('  c = %.4f\n', c(i));
    fprintf('  d = %.4f\n', d(i));
    fprintf('\n');
end


