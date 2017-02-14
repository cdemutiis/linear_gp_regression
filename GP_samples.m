% Author: Claudio S. De Mutiis
% Date: 20th November 2016
% Solutions to part (c) of Problem 3 (Assignment 3 of Probabilistic and 
% Unsupervised Learning)
% Given a covariance kernel function kernel and a vector of input points x,
% return a function f(x) evaluated on the input points x drawn randomly
% from a GP with the given covariance kernel and with zero mean.

function f = GP_samples(kernel,x)
    size = length(x);
    K = zeros(size);
    for i = 1:size
        s = x(i);
        for j = 1:size
            t = x(j);
            K(i,j) = kernel(s,t); 
        end
    end
    mean_k = zeros(1,size);
    f = mvnrnd(mean_k,K);
    plot(x,f)
    title('Kernel Generated GP')
    xlabel('Year+(Month-1)/12')
    ylabel('Kernel Output')
end