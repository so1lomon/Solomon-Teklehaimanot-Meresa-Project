%% Figure 1: Individual plots for PD, PI, and PID controllers
figure(1)
subplot(3,1,1);
plot(PD_speed.Time, PD_speed.Data, '--g', 'LineWidth', 1.5);
title("Speed Response with PD Controller, setpoint=400rad/sec", 'FontSize', 12, 'FontName', 'Times New Roman');
ylabel('Motor Response (rad/s)', 'FontSize', 12, 'FontName', 'Times New Roman');
xlabel('Time (s)', 'FontSize', 12, 'FontName', 'Times New Roman');
grid on;

subplot(3,1,2);
plot(PI_speed.Time, PI_speed.Data, ':r', 'LineWidth', 1.5);
title("Speed Response with PI Controller, setpoint=400rad/sec", 'FontSize', 12, 'FontName', 'Times New Roman');
ylabel('Motor Response (rad/s)', 'FontSize', 12, 'FontName', 'Times New Roman');
xlabel('Time (s)', 'FontSize', 12, 'FontName', 'Times New Roman');
grid on;

subplot(3,1,3);
plot(PID_speed.Time, PID_speed.Data, '-k', 'LineWidth', 1.5);
title("Speed Response with PID Controller, setpoint=400rad/sec", 'FontSize', 12, 'FontName', 'Times New Roman');
ylabel('Motor Response (rad/s)', 'FontSize', 12, 'FontName', 'Times New Roman');
xlabel('Time (s)', 'FontSize', 12, 'FontName', 'Times New Roman');
grid on;

%% Figure 2: Compare PD, PI, and PID together
figure(2)
plot(PID_speed.Time, PID_speed.Data, '-k', 'LineWidth', 1.5); hold on;
plot(PI_speed.Time, PI_speed.Data, ':r', 'LineWidth', 1.5);
plot(PD_speed.Time, PD_speed.Data, '--g', 'LineWidth', 1.5);
hold off;
title("Comparison of Speed Responses, setpoint=400rad/sec", 'FontSize', 12, 'FontName', 'Times New Roman');
legend('PID', 'PI', 'PD', 'FontSize', 12, 'FontName', 'Times New Roman', 'Location', 'Best');
xlabel('Time (s)', 'FontSize', 12, 'FontName', 'Times New Roman');
ylabel('Motor Response (rad/s)', 'FontSize', 12, 'FontName', 'Times New Roman');
grid on;

%% Figure 3: Compare PI and PID controllers
figure(3)
plot(PID_speed.Time, PID_speed.Data, '-k', 'LineWidth', 1.5); hold on;
plot(PI_speed.Time, PI_speed.Data, ':r', 'LineWidth', 1.5);
hold off;
title("Speed Response of PI and PID Controllers, setpoint=400rad/sec", 'FontSize', 12, 'FontName', 'Times New Roman');
legend('PID', 'PI', 'FontSize', 12, 'FontName', 'Times New Roman', 'Location', 'Best');
xlabel('Time (s)', 'FontSize', 12, 'FontName', 'Times New Roman');
ylabel('Motor Response (rad/s)', 'FontSize', 12, 'FontName', 'Times New Roman');
grid on;

%% Step Response Characteristics
PD_info = stepinfo(PD_speed.Data, PD_speed.Time);
PI_info = stepinfo(PI_speed.Data, PI_speed.Time);
PID_info = stepinfo(PID_speed.Data, PID_speed.Time);

disp('Step Response Characteristics:');
disp('PD Controller:'); disp(PD_info);
disp('PI Controller:'); disp(PI_info);
disp('PID Controller:'); disp(PID_info);

%% Figure 4: Error comparison for PD, PI, and PID
figure(4)
plot(PID_error.Time, PID_error.Data, '-k', 'LineWidth', 1.5); hold on;
plot(PI_error.Time, PI_error.Data, ':r', 'LineWidth', 1.5);
plot(PD_error.Time, PD_error.Data, '--g', 'LineWidth', 1.5);
hold off;
title('Speed Error Response with PI and PID, setpoint=400rad/sec', 'FontSize', 12, 'FontName', 'Times New Roman');
legend('PID', 'PI', 'PD', 'FontSize', 12, 'FontName', 'Times New Roman', 'Location', 'Best');
xlabel('Time (s)', 'FontSize', 12, 'FontName', 'Times New Roman');
ylabel('Error', 'FontSize', 12, 'FontName', 'Times New Roman');
grid on;

%% Figure 5: Error comparison between PI and PID
figure(5)
plot(PID_error.Time, PID_error.Data, '-k', 'LineWidth', 1.5); hold on;
plot(PI_error.Time, PI_error.Data, ':r', 'LineWidth', 1.5);
hold off;
title('Speed Errors Responded by PI and PID, setpoint=400rad/sec', 'FontSize', 12, 'FontName', 'Times New Roman');
legend('PID', 'PI', 'FontSize', 12, 'FontName', 'Times New Roman', 'Location', 'Best');
xlabel('Time (s)', 'FontSize', 12, 'FontName', 'Times New Roman');
ylabel('Error', 'FontSize', 12, 'FontName', 'Times New Roman');
grid on;

%% Step Info of Errors
PID_error_info = stepinfo(PID_error.Data, PID_error.Time);
PI_error_info = stepinfo(PI_error.Data, PI_error.Time);
PD_error_info = stepinfo(PD_error.Data, PD_error.Time);

disp('Step Info of Errors:');
disp('PID Error:'); disp(PID_error_info);
disp('PI Error:'); disp(PI_error_info);
disp('PD Error:'); disp(PD_error_info);

%% Figure 6: Open-loop response
figure(6)
plot(openloop.Time, openloop.Data, '-b', 'LineWidth', 1.5);
title("Open-Loop System Response, setpoint=400rad/sec", 'FontSize', 12, 'FontName', 'Times New Roman');
xlabel('Time (s)', 'FontSize', 12, 'FontName', 'Times New Roman');
ylabel('Motor Response (rad/s)', 'FontSize', 12, 'FontName', 'Times New Roman');
grid on;

%% Step Info of Open-Loop Response
openloop_info = stepinfo(openloop.Data, openloop.Time);
disp('Open-Loop Step Response Info:'); disp(openloop_info);
