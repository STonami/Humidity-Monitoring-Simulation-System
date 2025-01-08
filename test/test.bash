#!/bin/bash
# SPDX-FileCopyrightText: 2024 Tonami Seki
# SPDX-License-Identifier: BSD-3-Clause

dir=~
[ "$1" != "" ] && dir="$1"

cd ~/ros2_ws
colcon build
if [ $? -ne 0 ]; then
    echo "Build failed"
    exit 1
fi

source install/setup.bash
source ~/.bashrc

timeout 20 ros2 launch mypkg humidity_monitoring.launch.py > /tmp/mypkg.log 2>&1
if [ $? -eq 0 ]; then
    echo "Test passed!"
    exit 0
else
    echo "Test failed"
    exit 1
fi
