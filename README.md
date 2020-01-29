# sterowanie-robotem-szum-2019/2020

Zrodlo modelu i kontrolerow robota: https://github.com/ReactRobotics/DogBotV4

D poprawnego dzialania wymagana jest instalalcja ros_melodic oraz ros_control
dla UBuntu 18.04:
$ sudo apt install ros-melodic-desktop-full
$ sudo apt-get install ros-melodic-ros-control ros-melodic-ros-controllers

W celu stowrzenia projektu nalezy utworzyc sciezke dla projektu:

Terminal1:
$ mkdir catkin_ws
$ cd catkin_ws
$ mkdir src

Nastepnie nalezy sklonowac repozytorium do folderu src, oraz stowrzyc projekt:

$ cd src
$ git clone https://github.com/WWercyngetoryks/sterowanie-robotem-szum-2019-20.git
$ cd ..
$ catkin_make
$ cd src
$ source /opt/ros/melodic/setup.bash
$ cd ..
$ source devel/setup.bash

W nowym terminalu nalezy wlaczyc roscore:

Terminal2:
$ roscore

W Terminal1 wlaczamy symulacje robota:
Terminal1:
$ roslaunch dogbot_gazebo gztest.launch

lub
Nowy_terminal:
$ cd catkin_ws
$ roslaunch dogbot_gazebo gztest.launch

Nastepnie w lokalizacji matlab_prog nalezy uruchomic przy pomocy matlaba plik main_prog.m.

