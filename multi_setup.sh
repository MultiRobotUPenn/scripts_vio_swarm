#!/bin/bash

SESSION_NAME=dragonfly_multi_robot
UAV_NAME=$SESSION_NAME

declare -a ROBOTS=( "dragonfly1" 
                    "dragonfly2"
                    "dragonfly3"
                    "dragonfly4"
                    "dragonfly5"
                    "dragonfly6" 
                    "dragonfly7" 
                    "dragonfly8" 
                    "dragonfly9" 
                    "dragonfly10" 
                    "dragonfly11" 
                    "dragonfly12" )
#declare -a ROBOTS=("dragonfly13")

if [ -z ${TMUX} ];
then
  TMUX= tmux new-session -s $SESSION_NAME -d
  echo "Starting new session."
else
  SESSION_NAME="$(tmux display-message -p '#S')"
fi

tmux new-window -t ${SESSION_NAME}:4 -n "All Robots"

robot_indices=${!ROBOTS[*]}
for i in $robot_indices;
do
  robot_i=${ROBOTS[$i]}
  tmux split-window -v
  tmux send-keys "ssh -t ${robot_i}@$robot_i" C-m
  tmux send-keys "sudo ~/scripts_vio_swarm/run_robot.sh $robot_i" C-m
  tmux select-layout tiled
  sleep 1
done

tmux kill-pane -t 0
tmux select-layout tiled

sleep 5

tmux new-window -t $SESSION_NAME:3 -n "Multi Mav Manager"
tmux send-keys "roslaunch multi_mav_manager multi_dragonfly.launch" C-m

tmux select-window -t $SESSION_NAME:1
tmux rename-window -t 1 "Command Central"
tmux send-keys "source aliases.sh" C-m
tmux send-keys "./df_demo.sh"

tmux split-window -v
tmux send-keys "source aliases.sh" C-m
tmux send-keys "estop"

tmux select-pane -t 0
tmux split-window -v
tmux send-keys "cd bags" C-m
tmux send-keys "rosbag record -a"
tmux select-pane -t 0 tmux select-layout main-vertical 
tmux -2 attach-session -t $SESSION_NAME
clear
