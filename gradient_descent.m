%% Fall 2021, MAT3007 Optimization, Tutorial 13
% % The Chinese University of Hong Kong, Shenzhen
% Author: Zhuo Li, School of Data Science
% Nov 29, 2021


%% Gradient descent with bt line search exercise
clear; clc;

x0 = [0 0]'; % init point
esp = 1e-6; % tolerance

maxIter = 1e3; % max number of iteration
iter = 1;
xk = x0;

hist = [x0; norm(g(x0)); f(x0)]; % matrix to store history of each iteration

% 1. Our gradient descent
% tic;
while norm(g(xk)) > esp && iter <= maxIter % stopping criterion
    gk = g(xk); % gradient of xk
    dk = -gk; % descent direction
    alpha = bt_line_search(xk, gk);
    xk = xk + alpha*dk; % update xl
    hist(:, iter+1) = [xk; norm(gk); f(xk)];
    iter = iter + 1;
end
% toc;


% 2. MATLAB built-in solver
% tic;
[xm, fval] = fminunc(@f, x0);
% toc;

fprintf('Our sol:\n [%f %f]\n', xk);
fprintf('fiminunc sol:\n [%f %f]', xm);


%% Plots

figure(1)
x1p = hist(1,:);
x2p = hist(2,:);

x1 = -0.2:0.005:0.2;
x2 = -0.5:0.005:0;
[X1, X2] = meshgrid(x1, x2);
Y = 2*X1.^2 + X2.^2 - 3*X1.*X2 - X1 + exp(X2);


contour(X1,X2,Y,'ShowText','on');
hold on
scatter(x1p, x2p, 'b')
hold on
scatter(x1p(end), x2p(end), 'r+');
hold on 
plot(x1p, x2p, 'b')
grid on
title('$x_k$ trajectory', 'interpreter', 'latex')
xlabel('$x_1$', 'interpreter', 'latex')
ylabel('$x_2$', 'interpreter', 'latex')


figure(2)
iters = 0:1:iter-1;
gks = hist(3, :);
semilogy(iters, gks)
grid on
title("Error")
ylabel('$\Vert \nabla f(x)\Vert^2$', 'interpreter', 'latex')
xlabel('iter')


figure(3)
fvals = hist(4, :);
plot(iters, fvals);
hold on
scatter(iters, fvals);
grid on
title("Function value")
ylabel('$f(x_k)$', 'interpreter', 'latex')
xlabel('iter')




%% functions

function alpha = bt_line_search(xk, gk)
    alpha = 1; % init step size
    sigma = 0.5;
    gamma = 0.5; % shrinking param
    xtemp = xk - alpha * gk;
    
    while f(xtemp) > f(xk) - sigma * alpha * norm(gk)^2
        alpha = alpha * gamma; % shirinking step
        xtemp = xk - alpha * gk;
    end
end


% Objective function
function y = f(x)
    y = 2*x(1)^2 + x(2)^2 - 3*x(1)*x(2) - x(1) + exp(x(2));
%     y = exp(1-x(1)-x(2)) + exp(x(1)+x(2)-1) + x(1)^2 + x(1)*x(2) + x(2)^2 + x(1) - 3*x(2);
end

% gradient
function y = g(x)
  y = [4*x(1) - 3*x(2) - 1; 2*x(2) - 3*x(1) + exp(x(2))];
%     y = [-exp(1-x(1)-x(2)) + exp(x(1)+x(2)-1) + 2*x(1) + x(2) + 1; -exp(1-x(1)-x(2)) + exp(x(1)+x(2)-1) + 2*x(2) + x(1) - 3;]
    
end