#!/bin/bash
# SPDX-FileCopyrightText: 2024 Tonami Seki
# SPDX-License-Identifier: BSD-3-Clause

source /opt/ros/jazzy/setup.bash
source ~/ros2_ws/install/setup.bash
source ~/ros2_ws/install/local_setup.bash
source ~/.bashrc
source ~/ros2_ws/install/local_setup.bash

dir=~
[ "$1" != "" ] && dir="$1"

cd ~/ros2_ws
colcon build

source install/setup.bash
source ~/.bashrci

timeout 10 ros2 launch mypkg humidity_monitoring.launch.py > /tmp/mypkg.log 2>&1
grep 'Received humidity' /tmp/mypkg.log
echo "Test passed!"
  exit 0
