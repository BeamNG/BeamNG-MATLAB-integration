%link bng object to BeamNG folder 
bng =  py.beamngpy.BeamNGpy('localhost', int32(64256));
%bng =  py.beamngpy.BeamNGpy('localhost', int8(64256), home='C:\\game');
%open the BeamNG UI
bng.open();
% Add scenario information; name and level
scenario = py.beamngpy.Scenario('west_coast_usa', 'example');
% Add vehicle's information; name plate no. and vehicle model 
vehicle = py.beamngpy.Vehicle('ego_vehicle', model='etk800', licence='MATLAB');
% specify the veicle's starting position 
scenario.add_vehicle(vehicle, pos=[-717, 101, 118], ...
    rot_quat=[0, 0, 0.3826834, 0.9238795]);
% save all data and load the scenario 
scenario.make(bng);
% waiting for the loaing process
pause(2);
% load the vehicle, level, and scensors in scenario 
bng.load_scenario(scenario);
bng.set_steps_per_second(60);
bng.set_deterministic();
%another wait
pause(2);
%start the scenario 
bng.start_scenario();
%another wait
pause(2);
% adding initial throttle and strearing angle 
vehicle.control(throttle=1);
vehicle.control(steering=0.5);
% setup the AI driving mode 
vehicle.ai_set_mode('span');
lidar1 =  py.beamngpy.sensors.Lidar('lidar1', bng, vehicle, ...
    is_using_shared_memory=true, is_visualised=true);
%another wait

pause(3);
% LiDAR point cloud data (automatic polling)
% parse lidar data in data object 
data = lidar1.poll();

%another wait
pause(1);
                                
% Collect the data now that it has been computed.
bng.step(3, wait=false);
