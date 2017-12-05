#!/bin/bash

SESSION_NAME=ssh_all_dragonfly
UAV_NAME=$SESSION_NAME

declare -a ROBOTS=( "dragonfly1" 
                    "dragonfly2" 
                    "dragonfly3" 
                    "dragonfly4" 
                    "dragonfly5" 
                    "dragonfly6"
                    "dragonfly7"
                    "dragonfly8" 
                    "dragonfly10" 
                    "dragonfly11" 
                    "dragonfly13" 
                    "dragonfly14")
#declare -a ROBOTS=("dragonfly5" "dragonfly13" "dragonfly14")

if [ -z ${TMUX} ];
then
  TMUX= tmux new-session -s $SESSION_NAME -d
  echo "Starting new session."
else
  SESSION_NAME="$(tmux display-message -p '#S')"
fi

tmux source-file setup.conf
sleep 1

robot_indices=${!ROBOTS[*]}
for i in $robot_indices;
do
  robot_i=${ROBOTS[$i]}

  tmux new-window -t ${SESSION_NAME}:$(($i+10)) -n $robot_i
  tmux select-window -t ${SESSION_NAME}:$((i+10))
  tmux send-keys "ssh ${robot_i}@$robot_i" C-m
done

sleep 5
tmux -2 attach-session -t $SESSION_NAME
clear

