#!/bin/bash
# SPDX-FileCopyrightText: 2024 Tonami Seki
# SPDX-License-Identifier: BSD-3-Clause

dir=~
[ "$1" != "" ] && dir="$1"

cd ~/ros2_ws
colcon build

source install/setup.bash
source ~/.bashrc

timeout 10 ros2 launch mypkg humidity_monitoring.launch.py > /tmp/mypkg.log 2>&1
grep 'Received humidity' /tmp/mypkg.log
if [ $? -eq 1 ]; then
        echo "Test passed!"
        exit 0
    else
        echo "Test failed"
        exit 1
    fi
