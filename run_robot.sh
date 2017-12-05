#!/bin/bash

UAV_NAME=$1

echo "uav name is ${UAV_NAME}"


sudo -s << SCRIPT
source ~/robot_ws_vio_swarm/devel/setup.bash
stop snav
sleep 7
start snav
sleep 7
roslaunch mav_manager mav_manager_vio_qc.launch model:=${UAV_NAME}
SCRIPT

exit

clear
