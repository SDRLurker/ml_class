function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%


% 1-2. Regularized linear regression cost function
hx = X*theta;
err = (hx-y);
theta1 = theta;
theta1(1) = 0;
J = 1/(2*m) * (err'*err) + lambda/(2*m) * (theta1'*theta1);
% 1.3 Regularized linear regression gradient
grad = X' * err / m;
grad(2:end) = grad(2:end) + lambda/m * theta(2:end); 
%for i = 1:length(theta)
%    grad(i) = 1 / m * sum(err .* X(:,i));
%    if grad(i) > 1
%        grad(i)=grad(i) + lambda / m * theta1(i);
%end










% =========================================================================

grad = grad(:);

end
