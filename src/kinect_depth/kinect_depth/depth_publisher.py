#!/usr/bin/env python3
import rclpy
from rclpy.node import Node
from sensor_msgs.msg import Image
# from cv_bridge import CvBridge
try:
    from cv_bridge import CvBridge
except Exception as e:
    print(f"Error al importar cv_bridge: {e}")
    raise
import numpy as np
import libfreenect2
import cv2

class KinectDepthPublisher(Node):
    def __init__(self):
        super().__init__('kinect_depth_publisher')
        self.publisher_ = self.create_publisher(Image, 'kinect/depth/image', 10)
        self.bridge = CvBridge()

        # Inicializar Kinect
        self.device = libfreenect2.Device()
        self.device.open()
        self.depth = self.device.get_depth_generator()

        # Temporizador para publicar la imagen de profundidad
        self.timer = self.create_timer(0.1, self.timer_callback)  # 10 Hz

    def timer_callback(self):
        # Captura la imagen de profundidad
        depth_image = self.depth.get_depth_map()

        # Convertir la imagen de profundidad a un formato que ROS pueda manejar
        depth_image_msg = self.bridge.cv2_to_imgmsg(depth_image, encoding="32FC1")

        # Publicar la imagen de profundidad
        self.publisher_.publish(depth_image_msg)

        self.get_logger().info('Publicando imagen de profundidad')

def main(args=None):
    rclpy.init(args=args)
    node = KinectDepthPublisher()
    rclpy.spin(node)

    node.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()

