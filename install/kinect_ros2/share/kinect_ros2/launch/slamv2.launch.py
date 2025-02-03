#v3
import os

import launch_ros
from launch_ros.actions import Node
from launch.actions import DeclareLaunchArgument, TimerAction
from launch import LaunchDescription
from launch.substitutions import LaunchConfiguration


def generate_launch_description():
    pkg_share = launch_ros.substitutions.FindPackageShare(package="kinect_ros2").find(
        "kinect_ros2"
    )
    default_rviz_config_path = os.path.join(pkg_share, "rviz/pointcloud.rviz")

    return LaunchDescription(
        [
            # Argumento para cargar configuración de RViz
            

            # Nodo de la Kinect
            Node(
                package="kinect_ros2",
                executable="kinect_ros2_node",
                name="kinect_ros2",
                namespace="kinect",
                output="screen",
                parameters=[{
                    "image_rect": "/depth/image_raw",
                    "camera_info": "/depth/camera_info"
                }],
                arguments=["--ros-args", "--remap", "image_rect:=/kinect/depth/image_raw", "--remap", "camera_info:=/kinect/depth/camera_info"],
            ),

            # Publicar transformación entre Kinect y base del robot con retraso para asegurar la disponibilidad
            TimerAction(
                period=2.0,
                actions=[
                    Node(
                        package="tf2_ros",
                        executable="static_transform_publisher",
                        name="static_tf_pub_kinect",
                        arguments=["0", "0", "0", "0", "0", "-1.57", "base_footprint", "kinect_depth"],
                    ),
                ]
            ),
            
            # Publicar transformación entre base del robot y mapa con retraso
            TimerAction(
                period=2.5,
                actions=[
                    Node(
                        package="tf2_ros",
                        executable="static_transform_publisher",
                        name="static_tf_pub_base",
                        arguments=["0", "0", "0", "0", "0", "0", "base_footprint", "map"],
                    ),
                ]
            ),
            #odom
            TimerAction(
                period=3.0,
                actions=[
                    Node(
                        package="tf2_ros",
                        executable="static_transform_publisher",
                        name="static_tf_pub_base",
                        arguments=["0", "0", "0", "0", "0", "0", "odom", "base_footprint"],
                    ),
                ]
            ),

            # Convertir nube de puntos a LaserScan
            Node(
                package="pointcloud_to_laserscan",
                executable="pointcloud_to_laserscan_node",
                name="pointcloud_to_laserscan",
                output="screen",
                parameters=[{
                    "target_frame": "base_footprint",
                    "transform_tolerance": 0.5,
                    "min_height": 0.1,
                    "max_height": 1.5,
                    "angle_min": -3.14,
                    "angle_max": 3.14,
                    "angle_increment": 0.01,
                    "scan_time": 0.1,
                    "range_min": 0.1,
                    "range_max": 25.0,
                    "use_inf": False
                }],
                remappings=[
                    ("/cloud_in", "/kinect/points"),
                    ("/scan", "/scan")
                ],
            ),

            # Iniciar SLAM Toolbox
            Node(
                package="slam_toolbox",
                executable="async_slam_toolbox_node",
                name="slam_toolbox",
                output="screen",
                parameters=[{
                    "use_sim_time": False,
                    "scan_topic": "/scan",
                    #"map_frame": "map",
                    #"odom_frame": "odom",
                    "base_frame": "base_footprint",
                    #"update_min_d": 0.05,
                    #"update_min_a": 0.01,
                    "map_save_on_exit": True,
                    #"transform_tolerance": 0.5,
                    "map_update_interval": 0.5,
                    "resolution": 0.05,
                    "minimum_time_interval": 0.5,
                    "mode": "mapping",
                    "publish_map": True,
                    "publish_map_on_update": True,
                    "enable_interactive_mode": True
                }],
            ),
        ]
    )

