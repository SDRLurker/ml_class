function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
% C = 1;
% sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

%EX6PARAMS(X, y, Xval, yval)

C = 1;
sigma = 0.1;

end

function [C, sigma] = EX6PARAMS(X, y, Xval, yval)

        %values to try...
        Carray = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
        Sarray = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];

        %current error amount...
        %assuming smaller error is better, set to an insanely high initial value...
        best_err = 10000000.0;

% =========================================================================
        %current best values for C and sigma...
        Cbest = 0.0;
        Sbest = 0.0;
        for ctest = 1:length(Carray)
            for stest = 1:length(Sarray)
                Ctry = Carray(ctest);
                Stry = Sarray(stest);
                %glade ex6.m had these lines sitting right there :D
                model= svmTrain(X, y, Ctry, @(x1, x2) gaussianKernel(x1, x2, Stry));
                predictions=svmPredict(model,Xval);
                err = mean(double(predictions ~= yval));
                if(err < best_err)
                    best_err = err;
                    Cbest = Ctry;
                    Sbest = Stry;
                endif
            end
        end

        C = Cbest
        sigma = Sbest

end
