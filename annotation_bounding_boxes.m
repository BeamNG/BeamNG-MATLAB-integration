
close all
clear
clc

% Executing this file will demonstrate the annotation functionality of the camera sensor.

% Link bng object to BeamNG folder.
%bng =  py.beamngpy.BeamNGpy('localhost', int8(64256), home='C:\\Users\\User\\AppData\\BeamNG.drive');
bng =  py.beamngpy.BeamNGpy('localhost', int32(64256));
bng.open()                                                       % Start up the simulator.
scenario = py.beamngpy.Scenario('italy', 'annotation_bounding_boxes');      % Create the scenario.
%
% Create some vehicles which will appear in the camera images.
ego = py.beamngpy.Vehicle('ego', pyargs('model', 'etk800', 'color', 'White'));
scenario.add_vehicle(ego, pyargs('pos', py.list({237.90, -894.42, 246.10}), 'rot_quat', py.list({0.0173, -0.0019, -0.6354, 0.7720})));
car1 = py.beamngpy.Vehicle('car1', pyargs('model', 'etk800', 'color', 'Green'));
scenario.add_vehicle(car1, pyargs('pos', py.list({246.94, -901.64, 247.58}), 'rot_quat', py.list({-0.0099, 0.0206, 0.9348, -0.3543})));
car2 = py.beamngpy.Vehicle('car2', pyargs('model', 'etk800', 'color', 'Red'));
scenario.add_vehicle(car2, pyargs('pos', py.list({276.27, -881.42, 247.84}), 'rot_quat', py.list({-0.0106, 0.0405, 0.4845, 0.8738})));
car3 = py.beamngpy.Vehicle('car3', pyargs('model', 'etki', 'color', 'Blue'));
scenario.add_vehicle(car3, pyargs('pos', py.list({261.52, -894.68, 248.04}), 'rot_quat', py.list({0.0026, 0.01758, -0.8344, 0.5508})));
car4 = py.beamngpy.Vehicle('car4', pyargs('model', 'miramar', 'color', 'Black'));
scenario.add_vehicle(car4, pyargs('pos', py.list({267.06, -892.03, 248.32}), 'rot_quat', py.list({0.0065, 0.0194, -0.8501, 0.5262})));

scenario.make(bng);
bng.set_deterministic();
bng.set_steps_per_second(int32(60));                           % Set simulator to 60hz temporal resolution
bng.load_scenario(scenario);
bng.hide_hud();
bng.start_scenario();
bng.switch_vehicle(ego);

% Get the annotation class data.
annotations = bng.get_annotations();                    % Gets a dictionary of RGB colours, indexed by material names.
disp(annotations);
class_data = bng.get_annotation_classes(annotations);   % Gets a dictionary of material names, indexed by RGB colours (encoded as 32-bit).
disp(class_data);
pause(int32(10));                                              % Some sleeping time to make sure the level is fully loaded.

% Create some camera sensors in the simulation.
disp('Camera test start.');

% Create a camera sensor.
cam_width = 1024;
cam_height = 1024;

% args = pyargs( ...
%     'requested_update_time', -1.0, ...
%     'is_render_instance', true, ...
%     'pos', py.list({-0.3, 1.0, 2.0}), ...
%     'resolution', py.list({int32(cam_width), int32(cam_height)}));


args = pyargs( ...
            'requested_update_time', -1.0, ...
              'is_using_shared_memory', false, ...
                  'pos', py.list({-0.3, 1.0, 2.0}), ...
                  'dir', py.list({0, -1.0, 0.0}), ...
                  'field_of_view_y' , 70 , ...
                  'near_far_planes' ,  py.list({0.1, 100}), ... 
                 'resolution', py.list({int32(cam_width), int32(cam_height)}), ...
                  'is_render_annotations', true, ...
                  'is_render_instance', true, ...
                  'is_render_depth', true);

cam1 = py.beamngpy.sensors.Camera('camera1', bng, ego, args);

% Wait a couple of seconds (to give camera sensor time to update) then poll it.
pause(2);
images = cam1.get_full_poll_request();

% Plot the camera images.
subplot 231
colour_RGBA = double(py.numpy.array(images{'colour'}));
colour_RGB = colour_RGBA(:, :, 1:3) / 256;
image(colour_RGB);
title('Colour');
axis equal
xlim([0 cam_width])
ylim([0 cam_height])

subplot 232
annotation_RGBA = double(py.numpy.array(images{'annotation'}));
annotation_RGB = annotation_RGBA(:, :, 1:3) / 256;
image(annotation_RGB);
title('Class Annotations');
axis equal
xlim([0 cam_width])
ylim([0 cam_height])

subplot 233
instance_RGBA = double(py.numpy.array(images{'instance'}));
instance_RGB = instance_RGBA(:, :, 1:3) / 256;
image(instance_RGB);
title('Instance Annotations');
axis equal
xlim([0 cam_width])
ylim([0 cam_height])

subplot 234
depth_RGB = double(py.numpy.array(images{'depth'}));
image(depth_RGB);
colormap(gray)
title('Depth');
axis equal
xlim([0 cam_width])
ylim([0 cam_height])

% Compute and display the bounding boxes for each vehicle instance.
bounding_boxes = cam1.extract_bounding_boxes(images{'annotation'}, images{'instance'}, class_data);
for i = bounding_boxes.length - 1 : -1 : 1
    n = bounding_boxes(i);
    disp(n{1}{'class'})
    if n{1}{'class'} ~= "CAR"
        bounding_boxes.remove(n{1});
    end
end
disp(bounding_boxes);

% Draw the bounding boxes on top of the colour image.
image_with_boxes = cam1.draw_bounding_boxes(bounding_boxes, images{'colour'});
subplot 235
image_with_boxes_RGBA = double(py.numpy.array(image_with_boxes));
image_with_boxes_RGB = image_with_boxes_RGBA(:, :, 1:3) / 256;
image(image_with_boxes_RGB);
title('Bounding Boxes');
axis equal
xlim([0 cam_width])
ylim([0 cam_height])

% Export the bounding boxes to PASCAL-VOC XML format.
xml = cam1.export_bounding_boxes_xml(bounding_boxes, pyargs('filename', 'example.png', ...
                                                            'size', py.list({cam_width, cam_height, 3})));
disp(xml);

% Close the simulation.
bng.close();
