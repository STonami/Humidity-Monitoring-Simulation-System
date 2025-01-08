# SPDX-FileCopyrightText: 2025 Tonami Seki
# SPDX-License-Identifier: BSD-3-Clause

from launch import LaunchDescription
from launch_ros.actions import Node

def generate_launch_description():
    return LaunchDescription([
        Node(
            package='mypkg',
            executable='humidity_publisher',
            name='humidity_publisher',
            output='screen',
        ),
        Node(
            package='mypkg',
            executable='humidity_subscriber',
            name='humidity_subscriber',
            output='screen',
        ),
    ])

