% Kernel of part (d) in problem 3 of Problem Set 3

function k = kernel_fun(s,t)
    theta = 0.85; % creates a double "wave on the sinusoid". Also responsible 
                % for amplitudes. When it's in "resonance" no double wave.
    tau = 1; % regulates periodical features. Larger tau --> bigger period
    sigma = 10; % bigger sigma tends to create waves made of smaller waves
    phi = 0.05; % higher phi groups together local peaks and dips in a few 
             % peaks and dips 
    eta = 3; % gives the oscillatory trend of the waves' centers  
    zeta = 0.005; % creates randomness 
    if s == t
        delta = 1;
    else
        delta = 0;
    end
    
    first_term = theta^2;
    second_term = exp((-2/(sigma^2))*(sin(pi*(s-t)/tau))^2);
    third_term = (phi^2)*exp((-1/(2*eta^2))*(s-t)^2);
    fourth_term = (zeta^2)*delta;
    
    k = first_term*(second_term + third_term) + fourth_term;
end