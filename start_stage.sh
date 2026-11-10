#!/bin/bash

source /opt/ros/humble/setup.bash
source ~/ros2_ws/install/setup.bash

# Install libraries and install Stage
cd ~/ros2_ws/
sudo apt update
sudo apt-get install git cmake g++ libjpeg8-dev libpng-dev libglu1-mesa-dev libltdl-dev libfltk1.1-dev
cd ./src
git clone https://github.com/tuw-robotics/Stage
git clone --branch humble https://github.com/tuw-robotics/stage_ros2.git
cd ../
colcon build --symlink-install --cmake-args -D OpenGL_GL_PREFERENCE=LEGACY --packages-select stage 
colcon build --symlink-install --packages-select stage
source install/setup.bash
colcon build --symlink-install --packages-select stage_ros2 

# Launch Stage
ros2 launch stage_ros2 stage.launch.py world:=cave enforce_prefixes:=false one_tf_tree:=true