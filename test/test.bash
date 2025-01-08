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

cd $dir/ros2_ws
colcon build
if [ $? -ne 0 ]; then
    echo "Build failed"
    exit 1
fi
source /opt/ros/jazzy/setup.bash
source ~/ros2_ws/install/local_setup.bash
source install/setup.bash
source ~/.bashrc
source ~/ros2_ws/install/local_setup.bash

timeout 10 ros2 launch mypkg humidity_monitoring.launch.py > /tmp/mypkg.log 2>&1
if grep -q 'Received humidity' /tmp/mypkg.log; then
  echo "Test passed!"
  exit 0
else
  echo "Test failed. Log content:"
  cat /tmp/mypkg.log
  exit 1
fi
