% Author: Claudio S. De Mutiis
% Date: 20th November 2016
% Solutions to part (a) and (b) of Problem 3 (Assignment 3 of Probabilistic 
% and Unsupervised Learning)
% The data comes from the file "co2.txt"
function [mean, sigma] = get_posterior_weights()
    mat = load('co2.txt');
    year = mat(:,1);
    month = mat(:,2);
    y = mat(:,3);
    t = year + (month - 1)/12;
    plot(t,y);
    xlabel('Year+(Month-1)/12')
    ylabel('Parts per million')
    title('Global mean CO_2 concentration')
    size = length(t);
    X = [t ones(size,1)];
    prior_mean = [0;360];
    prior_covariance = [100 0; 0 10000];
    prior_cov_inverse = pinv(prior_covariance);
    
    sigma = pinv(X'*X + prior_cov_inverse);
    mean = sigma*(X'*y + prior_cov_inverse*prior_mean);
    a_map = mean(1);
    b_map = mean(2);
    
    y_predicted = a_map*t + b_map;
    hold on;
    plot(t, y_predicted);
    legend('Observed Data','Predicted Data')
    
    figure(2)
    g_obs = y - y_predicted;
    plot(t, g_obs);
    xlabel('Year+(Month-1)/12')
    ylabel('Residuals (Observed - Predicted)')
    title('Residuals'' Analysis')
    
end