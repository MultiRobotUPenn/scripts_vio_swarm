# scripts_vio_swarm
tmux scripts to run multiple vehicles

# Files in this folder
______

## multi_setup.sh
Bash script run on Ground Station
#### What does it do?
1) Sets up tmux session
2) SSH into multiple robots
3) Runs run_robot.sh on each robot

## ssh_all.sh
Bash script to ssh into multiple robots for debugging purposes.


## run_robot.sh
Bash script run on the robot, it is called in a loop in setup.sh
#### What does it do?
1) Launches state_control_vehicle state_control.launch
2) Sets up tmux session for the robot


## setup.conf
Sets a few settings for the tmux session on the Ground Station

## chrony.conf
The configuration file to install on each robot for clock synchronization

## df_demo.sh
An example set of formations and commands that were preformed to demonstrate the swarm capabilities. This was performed in a large outdoor space

## indoor_demo.sh
Another example set of formations and commands that were performed in smaller indoor flying spaces

# Setting Up a New Robot in the VIO-Swarm
## These are instructions of how to set up a new robot to run the multi robot demo

1. SSH in to robot
  ```
    ssh-copy-id dragonflyXX@dragonflyXX
  ssh dragonflyXX@dragonflyXX
  sudo -s
    ```
1. **Copy** (*scp*) `scripts_vio_swarm` directory from the groundstation to the home directory of the robot
1. **Copy** (*scp*) `robot_ws_vio_swarm` to the home directory of the robot
1. **Edit** mav_manager/config/server_multimaster.yaml on the robot
    * Replace dragonflyXX with the name of the robot you are using
    * The .yaml file should read:
        ```
        sync_topics: ['/dragonflyXX/odom']
        ignore_nodes: ['/rviz']
        ignore_services: ['']
        ```
5. Go back to groundstation
    * Add robot to multi_mav_manager/config/multi_mav_manager.yaml
    * Add robot to multi_mav_manager/config/server_multimaster.yaml
    * Add robot to scripts/multi_setup.sh
    * Add robot to scripts/ssh_all.sh
6. Reset ipfirewall, this step is only necessary if you don't have an active firewall
```sudo iptables -F```
1. Set up chrony on the robot
    ```
    sudo apt-get install chrony
    rm /etc/chrony/chrony.conf
    ```
9. **Copy** `scripts_vio_swarm/chrony.conf` to the robot at `/etc/chrony/` 
10. Configure wifi on the robot
    * edit /etc/wpa_supplicant/wpa_supplicant.conf
    * add network information
        ```
        wpa_cli
        status
        reconfigure
        ```
