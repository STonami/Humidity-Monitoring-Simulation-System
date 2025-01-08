#!/bin/bash
# SPDX-FileCopyrightText: 2024 Tonami Seki
# SPDX-License-Identifier: BSD-3-Clause

dir=~/ros2_ws 

cd $dir || exit 1
colcon build || exit 1
source /opt/ros/humble/setup.bash
timeout 10 ros2 launch mypkg humidity_monitoring.launch.py > /tmp/mypkg.log 2>&1
if grep -q 'Received humidity' /tmp/mypkg.log; then
  echo "Test passed!"
  exit 0
else
  echo "Test failed. Log content:"
  cat /tmp/mypkg.log
  exit 1
fi

