import launch
from launch import LaunchDescription
from launch.actions import DeclareLaunchArgument
from launch_ros.actions import Node

def generate_launch_description():
    return LaunchDescription([
        DeclareLaunchArgument('robot_description', default_value='',
                               description='URDF file of the robot'),
        Node(package='robot_state_publisher', node_executable='robot_state_publisher',
              output='screen',
              parameters=[{'robot_description': launch.substitutions.LaunchConfiguration('robot_description')}]),
        Node(package='rviz2', node_executable='rviz2', output='screen')
    ])

