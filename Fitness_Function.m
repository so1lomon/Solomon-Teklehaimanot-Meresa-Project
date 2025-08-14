function J = Fitness_Function(gain)
    % the model incorporates stochastic Gaussian white noise
    % I have linearized the model of the series field DC motor using Taylor
    % Series
    % Defining the coefficients of the Series field DC motor model 
    a0 = 1;  
    a1 = 4.9514e+05; 
    a2 = 2.3529e+08; 

    % Transfer function: numerator and denominator
    numerator = [0 0 2.1684e+07];                   
    denominator = [a0 a1 a2];             

    % Create the transfer function of the DC motor
    series_DC_motor = tf(numerator, denominator);      

    % Extract PID gains
    Kp = gain(1);   
    ki = gain(2);  
    %Kd = gain(2);   

    % Construct PID controller
    pid_controller = pid(Kp, ki);

    % Build the closed-loop system
    closed_loop_sys = feedback(pid_controller * series_DC_motor, 1);

    % Simulation time and reference input
    t = 0:0.01:10;
    set_point = 400 * ones(size(t));  % Target speed: 400 rad/s

    try
        % Simulate system response
        response = lsim(closed_loop_sys, set_point, t);

        % Add Gaussian noise with 0.01 variance
        noise = sqrt(0.01) * randn(size(t));

        % Compute absolute error with noise
        e = abs(set_point - response' - noise);

        % Compute ITAE (Integral of Time-weighted Absolute Error)
        J = sum(t .* e);

        % Ensure J is scalar and finite
        if ~isscalar(J) || ~isfinite(J)
            J = 1e12;
        end

    catch
        % In case of simulation failure (e.g., unstable system), assign penalty
        J = 1e12;
    end
end
