import os
from launch import LaunchDescription
from launch.actions import DeclareLaunchArgument, LogInfo, ExecuteProcess
from launch_ros.actions import Node

def generate_launch_description():
    return LaunchDescription([
        Node(
            package='kinect_depth',
            executable='depth_publisher',
            name='kinect_depth_publisher',
            output='screen'
        )
    ])

