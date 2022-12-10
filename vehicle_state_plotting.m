%% 

close all
clear
clc

%% SCENARIO CREATION

% Start the simulator
beamng =  py.beamngpy.BeamNGpy('localhost', int32(64256));
beamng.open();

% Create a vehicle
vehicle = py.beamngpy.Vehicle('ego_vehicle', pyargs('model', 'etk800', ...
                                                    'licence', 'Matlab', ...
                                                    'color', 'Green'));

% Create electrics sensor
electrics = py.beamngpy.sensors.Electrics();
vehicle.attach_sensor('electrics', electrics)

% Create scenario
scenario = py.beamngpy.Scenario('west_coast_usa', 'vehicle_state');

scenario.add_vehicle(vehicle, pyargs('pos', py.tuple({-717.121, 101, 118.675}), ...
                                     'rot_quat', py.beamngpy.angle_to_quat(py.tuple({0, 0, 45}))));

scenario.make(beamng)

%% RUNNING

beamng.load_scenario(scenario)
beamng.start_scenario()

vehicle.ai_set_mode('span')

% Initialize output array
n_sample = 240;

positions = zeros(n_sample, 3);
directions = zeros(n_sample, 3);
wheel_speeds = zeros(n_sample, 1);
throttles = zeros(n_sample, 1);
brakes = zeros(n_sample, 1);

% Display sensor output
vehicle.poll_sensors()
sensors = vehicle.sensors;

position_init = vehicle.state{'pos'};
direction_init = vehicle.state{'dir'};
electrics_sensor = sensors{'electrics'};
wheel_speed_init = electrics_sensor.data{'wheelspeed'};
throttle_init = electrics_sensor.data{'throttle'};
brake_init = electrics_sensor.data{'brake'};

disp(strcat("The vehicle position is: ", num2str(double(position_init))))
disp(strcat("The vehicle direction is: ", num2str(double(direction_init))))
disp(strcat("The wheel speed is: ", num2str(wheel_speed_init)))
disp(strcat("The throttle intensity is: ", num2str(throttle_init)))
disp(strcat("The brake intensity is: ", num2str(brake_init)))


% Acquire data
for ii = 1:n_sample
    pause(0.1)
    vehicle.poll_sensors()
    sensors = vehicle.sensors;
    electrics_sensor = sensors{'electrics'};
    positions(ii, :) = vehicle.state{'pos'};
    directions(ii, :) = vehicle.state{'dir'};
    wheel_speeds(ii) = electrics_sensor.data{'wheelspeed'};
    throttles(ii) = electrics_sensor.data{'throttle'};
    brakes(ii) = electrics_sensor.data{'brake'};
end

beamng.close()

%% PLOTTING
subplot(2, 2, [1 2])
plot(throttles, 'b')
hold on
plot(brakes, 'r')
grid on
legend('Throttle', 'Brake')
title('Brake and Throttle vs time')

subplot 223
plot(positions(:, 1), positions(:, 2))
grid on
title('Position')
xlabel('X')
ylabel('Y')

subplot 224
angles = atan2(directions(:, 2), directions(:, 1));
polarplot(angles, wheel_speeds)
grid on
title('Wheel Speed and Direction')
