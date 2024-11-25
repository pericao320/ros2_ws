from launch import LaunchDescription
from launch.actions import DeclareLaunchArgument
from launch.substitutions import LaunchConfiguration
from launch_ros.actions import Node

def generate_launch_description():
    return LaunchDescription([
        # Declarar el argumento para el robot_description
        DeclareLaunchArgument(
            'robot_description',
            default_value='',
            description='URDF file of the robot'
        ),

        # Nodo robot_state_publisher
        Node(
            package='robot_state_publisher',
            executable='robot_state_publisher',
            name='robot_state_publisher',
            output='screen',
            parameters=[{'robot_description': LaunchConfiguration('robot_description')}]
        ),

        # Nodo RViz
        Node(
            package='rviz2',
            executable='rviz2',
            name='rviz2',
            output='screen',
            arguments=['-d', '/home/pericao/ros2_ws/src/my_robot/rviz/my_robot_config.rviz']  # Ajusta la ruta al archivo .rviz si lo tienes
        ),
    ])

