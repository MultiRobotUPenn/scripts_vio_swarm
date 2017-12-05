#!/bin/bash

# Don't forget to source the setup.bash file.
source ~/vio_swarm_ws/devel/setup.bash

SPACING=1.5

alias motors='rosservice call /multi_mav_services/motors'
alias takeoff='rosservice call /multi_mav_services/takeoff'
alias line='    rosservice call /multi_mav_services/goFormLine "{roll: 0.0, pitch: 0.0, yaw: 0.0, center: [0.0, 0.0, 1.0], spacing: $SPACING}"'
alias line1='   rosservice call /multi_mav_services/goFormLine "{roll: 0.0, pitch: 0.0, yaw: 1.6, center: [0.0, -1.0, 1.5], spacing: $SPACING}"'
alias circle='  rosservice call /multi_mav_services/goFormCircle "{roll: 0.0, pitch: 0.0, yaw: 0.0, center: [0.0, 0.0, 1.0], spacing: $SPACING}"'
alias land='rosservice call /multi_mav_services/land'
alias eland='rosservice call /multi_mav_services/eland'
alias estop='rosservice call /multi_mav_services/estop'

read -p "Press [Enter] to turn on motors"
rosservice call /multi_mav_services/motors true
sleep 1

read -p "Press [Enter] to takeoff"
rosservice call /multi_mav_services/takeoff
sleep 1

read -p "Press [Enter] to go up"
rosservice call /multi_mav_services/goFormRect "{roll: 0.0, pitch: 0.0, yaw: 0.0, center: [0.0, 0.0, 2.5], spacing: $SPACING}"
sleep 1

read -p "Press [Enter] to form circle"
rosservice call /multi_mav_services/goFormCircle "{roll: 0.0, pitch: -0.2, yaw: 0.0, center: [-7.0, 0.0, 3.5], spacing: $SPACING}"
sleep 1

read -p "Press [Enter] to move Rect forward 2m"
rosservice call /multi_mav_services/goFormRect "{roll: 0.0, pitch: 0.2, yaw: 0.0, center: [2.0, 0.0, 4.0], spacing: $SPACING}"
sleep 1

read -p "Press [Enter] to move Rect forward 2m"
rosservice call /multi_mav_services/goFormRect "{roll: 0.0, pitch: 0.0, yaw: 1.5, center: [0.0, 0.0, 4.0], spacing: $SPACING}"
sleep 1

read -p "Press [Enter] to change to line"
rosservice call /multi_mav_services/goFormLine "{roll: 0.0, pitch: 0.0, yaw: 0.0, center: [-3.0, 0.0, 4.0], spacing: $SPACING}"
sleep 1

read -p "Press [Enter] to form circle"
rosservice call /multi_mav_services/goFormCircle "{roll: 0.0, pitch: 0.3, yaw: 0.0, center: [-7.0, 0.0, 4.0], spacing: $SPACING}"
sleep 1

read -p "Press [Enter] to form circle"
rosservice call /multi_mav_services/goFormCircle "{roll: 0.0, pitch: 0.0, yaw: 0.0, center: [0.0, 0.0, 5.0], spacing: 2.5}"
sleep 1

read -p "Press [Enter] to form crest"
rosservice call /multi_mav_services/goFormRawPos "goals: 
- x: -3
  y: -0
  z: 7.0
  yaw: 0.0
- x: -1.5
  y: 1.928
  z: 7.0
  yaw: 0.0
- x: -1.5
  y: -1.928
  z: 7.0
  yaw: 0.0
- x: -0.4
  y: 0.964
  z: 7.0
  yaw: 0.0
- x: -0.4
  y: -0.964
  z: 7.0
  yaw: 0.0
- x: 0.75
  y: -0
  z: 7.0
  yaw: 0.0
- x: 1.5
  y: 2.25
  z: 7.0
  yaw: 0.0
- x: 1.5
  y: -2.25
  z: 7.0
  yaw: 0.0
- x: 3
  y: 2.25
  z: 7.0
  yaw: 0.0
- x: 3
  y: -2.25
  z: 7.0
  yaw: 0.0
- x: 3
  y: 0.75
  z: 7.0
  yaw: 0.0
- x: 3
  y: -0.75
  z: 7.0
  yaw: 0.0"
sleep 1

read -p "Press [Enter] to make G"
rosservice call /multi_mav_services/goFormRawPos "goals: 
- x: 0
  y: 0.75
  z: 7.0
  yaw: 0.0
- x: 0
  y: 2.25
  z: 7.0
  yaw: 0.0
- x: -1.5
  y: 2.25
  z: 7.0
  yaw: 0.0
- x: -3
  y: 1.5
  z: 7.0
  yaw: 0.0
- x: -3
  y: -0
  z: 7.0
  yaw: 0.0
- x: -3
  y: -1.5
  z: 7.0
  yaw: 0.0
- x: -1.5
  y: -2.25
  z: 7.0
  yaw: 0.0
- x: 0
  y: -2.25
  z: 7.0
  yaw: 0.0
- x: 1.5
  y: -2.25
  z: 7.0
  yaw: 0.0
- x: 3
  y: -1.5
  z: 7.0
  yaw: 0.0
- x: 3
  y: -0
  z: 7.0
  yaw: 0.0
- x: 3
  y: 1.5
  z: 7.0
  yaw: 0.0"
sleep 1

read -p "Press [Enter] to make R"
rosservice call /multi_mav_services/goFormRawPos "goals: 
- x: -3
  y: -2.25
  z: 7.0
  yaw: 0.0
- x: -0.75
  y: -2.25
  z: 7.0
  yaw: 0.0
- x: 0.75
  y: -2.25
  z: 7.0
  yaw: 0.0
- x: 2.25
  y: -2.25
  z: 7.0
  yaw: 0.0
- x: 3
  y: -0.951
  z: 7.0
  yaw: 0.0
- x: 3
  y: 0.951
  z: 7.0
  yaw: 0.0
- x: 2.25
  y: 2.25
  z: 7.0
  yaw: 0.0
- x: 0.75
  y: 2.25
  z: 7.0
  yaw: 0.0
- x: 0
  y: 0.951
  z: 7.0
  yaw: 0.0
- x: 0
  y: -0.951
  z: 7.0
  yaw: 0.0
- x: -1.5
  y: 0.65
  z: 7.0
  yaw: 0.0
- x: -3
  y: 2.25
  z: 7.0
  yaw: 0.0"
sleep 1

read -p "Press [Enter] to make A"
rosservice call /multi_mav_services/goFormRawPos "goals: 
- x: -3
  y: -2.25
  z: 7.0
  yaw: 0.0
- x: -0.75
  y: -2.25
  z: 7.0
  yaw: 0.0
- x: 0.75
  y: -2.25
  z: 7.0
  yaw: 0.0
- x: 2.25
  y: -2.25
  z: 7.0
  yaw: 0.0
- x: 3
  y: -0.951
  z: 7.0
  yaw: 0.0
- x: 3
  y: 0.951
  z: 7.0
  yaw: 0.0
- x: 2.25
  y: 2.25
  z: 7.0
  yaw: 0.0
- x: 0.75
  y: 2.25
  z: 7.0
  yaw: 0.0
- x: 0
  y: 0.951
  z: 7.0
  yaw: 0.0
- x: 0
  y: -0.951
  z: 7.0
  yaw: 0.0
- x: -0.75
  y: 2.25
  z: 7.0
  yaw: 0.0
- x: -3
  y: 2.25
  z: 7.0
  yaw: 0.0"
sleep 1

read -p "Press [Enter] to make S"
rosservice call /multi_mav_services/goFormRawPos "goals: 
- x: -1.5
  y: -2.25
  z: 7.0
  yaw: 0.0
- x: -3
  y: -0.75
  z: 7.0
  yaw: 0.0
- x: -3
  y: 0.75
  z: 7.0
  yaw: 0.0
- x: -2.25
  y: 2.25
  z: 7.0
  yaw: 0.0
- x: -0.75
  y: 2.25
  z: 7.0
  yaw: 0.0
- x: -0.25
  y: 0.75
  z: 7.0
  yaw: 0.0
- x: 0.25
  y: -0.75
  z: 7.0
  yaw: 0.0
- x: 0.75
  y: -2.25
  z: 7.0
  yaw: 0.0
- x: 2.25
  y: -2.25
  z: 7.0
  yaw: 0.0
- x: 3
  y: -0.75
  z: 7.0
  yaw: 0.0
- x: 3
  y: 0.75
  z: 7.0
  yaw: 0.0
- x: 1.5
  y: 2.25
  z: 7.0
  yaw: 0.0"
sleep 1

read -p "Press [Enter] to make P"
rosservice call /multi_mav_services/goFormRawPos "goals: 
- x: -3
  y: -2.55
  z: 7.0
  yaw: 0.0
- x: -3
  y: -0.75
  z: 7.0
  yaw: 0.0
- x: -1.476
  y: -1.5
  z: 7.0
  yaw: 0.0
- x: 0.508
  y: -1.5
  z: 7.0
  yaw: 0.0
- x: 2.008
  y: -1.5
  z: 7.0
  yaw: 0.0
- x: 3
  y: -2.55
  z: 7.0
  yaw: 0.0
- x: 3
  y: -0.375
  z: 7.0
  yaw: 0.0
- x: 3
  y: 1.125
  z: 7.0
  yaw: 0.0
- x: 2.008
  y: 2.25
  z: 7.0
  yaw: 0.0
- x: 0.508
  y: 2.25
  z: 7.0
  yaw: 0.0
- x: -0.484
  y: 1.125
  z: 7.0
  yaw: 0.0
- x: -0.484
  y: -0.375
  z: 7.0
  yaw: 0.0"
sleep 1

read -p "Press [Enter] to form rectangle close to start pos"
rosservice call /multi_mav_services/goFormRect "{roll: 0.0, pitch: 0.0, yaw: 0.0, center: [0.0, 0.0, 4.0], spacing: 3.0}"
sleep 1

read -p "Press [Enter] to form rectangle close to start pos"
rosservice call /multi_mav_services/goFormRect "{roll: 0.0, pitch: 0.0, yaw: 0.0, center: [0.0, 0.0, 1.0], spacing: 1.5}"
sleep 1

read -p "Press [Enter] to land"
rosservice call /multi_mav_services/land
sleep 1

read -p "Press [Enter] to turn off motors"
rosservice call /multi_mav_services/motors false
sleep 1
