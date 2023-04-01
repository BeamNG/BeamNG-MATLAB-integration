# MATLAB Integration with BeamNG.tech

<a name="About"></a>

## About

We are excited to announce that the highly requested feature of bridging BeamNG.tech and [MATLAB](https://www.mathworks.com/products/matlab.html) is here. MATLAB, with its long history as an academic engineering and mathematical tool, is a programming and numeric computing platform used to analyse data, develop algorithms, and create models. The newly created bridge with MATLAB will enable you to run, control, and interact with the BeamNG.tech simulation. We have integrated five main scripts for your convenience in making use of annotations, bounding boxes, multi-shot camera, object placement, vehicle state plotting and creation of simple scenarios on our East Coast USA map.

## Table of Contents

 - [Documentation](#docs)
 - [Features](#features) 
 - [Prerequirements](#prereqs)
 - [Setup](#setup)
 - [Getting Started](#getstart)
 - [Compatibility](#compatibility)
 - [License](#license)
 
<a name="docs"></a>

## Documentation
[![](https://raw.githubusercontent.com/BeamNG/BeamNG-MATLAB-integration/main/media/readthedocs.png)](https://beamngpy.readthedocs.io/en/latest/MATLAB.html)

<a name="features"></a>

## Features


As of now the BeamNG ROS integration supports one package for the **remote** control of the simulation platform and one package for the control of a driving agent. A third package manages custom messages.

<a name="prereqs"></a>
## Prerequirements
The [BeamNG-MATLAB bridge](https://github.com/BeamNG/BeamNG-MATLAB-integration) is depending on [BeamNG.Tech](https://documentation.beamng.com/beamng_tech/) and [BeamNGpy](https://documentation.beamng.com/beamng_tech/beamngpy/). Make sure that you have the license for BeamNG.Tech. The Github repository of the BeamNG-MATLAB has some basic examples of scripts that run a vehicle with some sensors ex. Lidar, Camera, and state sensor. 

you must have the following softwares/packages installed 
* [Compatible Python](https://www.mathworks.com/support/requirements/python-compatibility.html) 
* [BeamNGpy](https://pypi.org/project/beamngpy/)
* [BeamNG.Tech](https://documentation.beamng.com/beamng_tech/)



<a name="setup"></a>

## Setup

### 1. Setup a compatible python version   
After installing the [compatible python version](https://www.mathworks.com/support/requirements/python-compatibility.html) with MATLAB, make sure to include the path of excutable python file (exe) in your in "path" variable of "environment variables" as explained [here](https://docs.oracle.com/en/database/oracle/machine-learning/oml4r/1.5.1/oread/creating-and-modifying-environment-variables-on-windows.html#GUID-DD6F9982-60D5-48F6-8270-A27EC53807D0).  

### 2. Run pyhton engine in MATLAB 
Run the [test_python.m](https://github.com/BeamNG/BeamNG-MATLAB-integration/blob/main/test_python.m) to make sure that python engine is connected to your MATLAB engine as shown in the picture below. 


![Testing python in MATLAB](https://raw.githubusercontent.com/BeamNG/BeamNG-MATLAB-integration/main/media/test_python.png)

<a name="getstart"></a>

## Getting Started

We have developed 5 fundamental scripts that showcase the versatility of using the MATLAB bridge to launch the Beamng.Tech simulator. These scripts demonstrate various capabilities such as utilizing sensors, creating scenarios, capturing screenshots from multiple viewpoints, analyzing movements, and visualizing sensors including lidar, depth camera, and AI driving for the vehicle.

The first script enables the use of sensors, such as lidar and depth camera, to gather data on the vehicle's surroundings. The second script allows for the creation of custom scenarios in the simulator, giving users complete control over the driving environment. The third script facilitates the capturing of screenshots from various angles, allowing for detailed analysis of the vehicle's performance.

The fourth script focuses on movement analysis, providing users with a detailed breakdown of the vehicle's movements and the forces acting on it. Finally, the fifth script provides a visualization of the vehicle's sensor data, including the ability to view the AI driving system in action. Overall, these 5 scripts demonstrate the powerful capabilities of the MATLAB bridge in conjunction with the Beamng.Tech simulator, offering users a comprehensive toolkit for advanced vehicle simulation and analysis.



### 1. Vehicle State Plotting
Use the state sensor to plot some graphs of the vehicle position, wheel speed and direction, throttle, and brake. 

<img src="https://raw.githubusercontent.com/BeamNG/BeamNG-MATLAB-integration/main/media/annotation_bounding_boxes.png" alt="Vehicle state plotting" >

    
### 2. Running Lidar sensor, and AI control. 
Create a simple scenario and use the simulator's AI with BeamNGpy.

<img src="https://raw.githubusercontent.com/BeamNG/BeamNG-MATLAB-integration/main/media/lidar_tour.png" alt="Lidar sensor and AI control mode" >

### 3. Multi-shot Camera    
Change the position and rotation of a camera.

<img src="https://raw.githubusercontent.com/BeamNG/BeamNG-MATLAB-integration/main/media/multi_shots_1.png" alt="Multi-shot Camera" >

### 4. Object Placement    
Define a custom scenario for a given map and generate procedural content, i.e. simple meshes.

<img src="https://raw.githubusercontent.com/BeamNG/BeamNG-MATLAB-integration/main/media/object_placment_0.png" alt="Object Placement" >

### 5. Annotation and Bounding Boxes
Get semantic annotations, instance annotations, and draw bounding boxes (note that this feature is not ready for use yet).

<img src="https://raw.githubusercontent.com/BeamNG/BeamNG-MATLAB-integration/main/media/annotation_bounding_boxes.png" alt="Annotation and Bounding Boxes" >



<a name="compatibility"></a>

## Compatibility  

Running the BeamNG ROS integration requires three individual software components, here is a list of compatible versions.

| BeamNG.tech | BeamNGpy | BeamNG-MATLAB-integration | MATLAB | Python  |
|-------------|----------|---------------------------|--------|---------|
| [0.28](https://beamng.tech/blog/beamng-tech-028/)        | [1.26](https://github.com/BeamNG/BeamNGpy/releases/tag/v1.26)     | [0.1.1](https://github.com/BeamNG/BeamNG-MATLAB-integration/releases/tag/v0.1.1)                     | [R2023a](https://www.mathworks.com/products/new_products/latest_features.html) | [3.9](https://www.python.org/downloads/release/python-390/)  | 
| [0.27](https://beamng.tech/blog/beamng-tech-027/)        | [1.25.1](https://github.com/BeamNG/BeamNGpy/releases/tag/v1.25.1)     | [0.1.0](https://github.com/BeamNG/BeamNG-MATLAB-integration/releases/tag/v0.1.0)                     | [R2022b](https://www.mathworks.com/products/new_products/latest_features.html) | [3.9](https://www.python.org/downloads/release/python-390/)     | 



<a name="license"></a>

## License

This project is licensed under the MIT License - see the [LICENSE](https://github.com/BeamNG/BeamNG-MATLAB-integration/blob/main/LICENSE.txt) file for details.

