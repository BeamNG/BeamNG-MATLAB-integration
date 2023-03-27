
## Overview 
We are excited to announce that the highly requested feature of bridging BeamNG.tech and [MATLAB](https://www.mathworks.com/products/matlab.html) is here. MATLAB, with its long history as an academic engineering and mathematical tool, is a programming and numeric computing platform used to analyse data, develop algorithms, and create models. The newly created bridge with MATLAB will enable you to run, control, and interact with the BeamNG.tech simulation. We have integrated five main scripts for your convenience in making use of annotations, bounding boxes, multi-shot camera, object placement, vehicle state plotting and creation of simple scenarios on our East Coast USA map.

### Prequest 
you must have the following softwares/packages installed 
* [Compatible Python](https://www.mathworks.com/support/requirements/python-compatibility.html) 
* [BeamNGpy](https://pypi.org/project/beamngpy/)
* [BeamNG.Tech](https://documentation.beamng.com/beamng_tech/)


The [BeamNG-MATLAB bridge](https://github.com/BeamNG/BeamNG-MATLAB-integration) is depending on [BeamNG.Tech](https://documentation.beamng.com/beamng_tech/) and [BeamNGpy](https://documentation.beamng.com/beamng_tech/beamngpy/). Make sure that you have the license for BeamNG.Tech. The Github repository of the BeamNG-MATLAB has some basic examples of scripts that run a vehicle with some sensors ex. Lidar, Camera, and state sensor. 

### Compatibility  

Running the BeamNG ROS integration requires three individual software components, here is a list of compatible versions.

| BeamNG.tech | BeamNGpy | BeamNG-MATLAB-integration | MATLAB | Python  |
|-------------|----------|---------------------------|--------|---------|
| [0.27](https://beamng.tech/blog/beamng-tech-027/)        | [1.25](https://github.com/BeamNG/BeamNGpy/releases/tag/v1.25)     | [0.1.0](https://github.com/BeamNG/BeamNG-MATLAB-integration/releases/tag/v0.1.0)                     | [R2022b](https://www.mathworks.com/products/new_products/latest_features.html) | [3.9](https://www.python.org/downloads/release/python-390/)     | 
| [0.28](https://beamng.tech/blog/beamng-tech-027/)        | [1.26](https://github.com/BeamNG/BeamNGpy/releases/tag/v1.26)     | [0.2.0](https://github.com/BeamNG/BeamNG-MATLAB-integration/releases/tag/v0.1.1)                     | [R2022b](https://www.mathworks.com/products/new_products/latest_features.html) | [3.9](https://www.python.org/downloads/release/python-390/)     | 

 #### 1. Setup a compatible python version   
After installing the [compatible python version](https://www.mathworks.com/support/requirements/python-compatibility.html) with MATLAB, make sure to include the path of excutable python file (exe) in your in "path" variable of "environment variables" as explained [here](https://docs.oracle.com/en/database/oracle/machine-learning/oml4r/1.5.1/oread/creating-and-modifying-environment-variables-on-windows.html#GUID-DD6F9982-60D5-48F6-8270-A27EC53807D0).  

#### 2. Run pyhton engine in MATLAB 
Run the [test_python.m](https://github.com/BeamNG/BeamNG-MATLAB-integration/blob/main/test_python.m) to make sure that python engine is connected to your MATLAB engine as shown in the picture below. 


![Testing python in MATLAB](https://raw.githubusercontent.com/BeamNG/BeamNG-MATLAB-integration/main/media/test_python.png)




### Vehicle State Plotting
#### Use the state sensor to plot some graphs of the vehicle position, wheel speed and direction, throttle, and brake. 
![Vehicle state ploting](https://raw.githubusercontent.com/BeamNG/BeamNG-MATLAB-integration/main/media/annotation_bounding_boxes.png)


### Running Lidar sensor, and AI control. 
#### Create a simple scenario
#### Use the simulator's AI with BeamNGpy
![Lidar sensor and AI control mode](https://raw.githubusercontent.com/BeamNG/BeamNG-MATLAB-integration/main/media/lidar_tour.png)

### Multi-shot Camera    
#### Change the position and rotation of a camera
![Multi-shot Camera](https://raw.githubusercontent.com/BeamNG/BeamNG-MATLAB-integration/main/media/multi_shots_1.png)

### Object Placement    
#### Define a custom scenario for a given map
#### Generate procedural content, i.e. simple meshes
![Object Placement](https://raw.githubusercontent.com/BeamNG/BeamNG-MATLAB-integration/main/media/object_placment_0.png)



### Annotation and Bounding Boxes
#### Get semantic annotations
#### Get instance annotations
#### Graw bounding boxes (note that this feature is not ready for use yet)
![Annotation and Bounding Boxes](https://raw.githubusercontent.com/BeamNG/BeamNG-MATLAB-integration/main/media/annotation_bounding_boxes.png)
