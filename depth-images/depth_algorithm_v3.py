# by pericao320

import numpy as np
import cv2
import open3d as o3d
import time

# Inicializar la captura de video
cap = cv2.VideoCapture(5)

if not cap.isOpened():
    raise ValueError("No se pudo abrir la cámara.")

try:
    vis = o3d.visualization.Visualizer()
    vis.create_window(window_name="Point Cloud")

    # Crear un objeto PointCloud vacío
    pcd = o3d.geometry.PointCloud()
    vis.add_geometry(pcd)

    # Crear un sistema de coordenadas
    axis = o3d.geometry.TriangleMesh.create_coordinate_frame(size=0.01, origin=[0, 0, 0])
    vis.add_geometry(axis)

    while True:
        ret, depth_image = cap.read()
        if not ret:
            print("No se pudo capturar la imagen.")
            continue

        # Mostrar la imagen de la webcam
        cv2.imshow("Webcam", depth_image)

        if len(depth_image.shape) > 2:
            depth_image = cv2.cvtColor(depth_image, cv2.COLOR_BGR2GRAY)

        fx, fy = 587.04607160, 587.04607160
        cx, cy = 317.39001517, 234.30080720
        height, width = depth_image.shape

        x, y = np.meshgrid(np.arange(width), np.arange(height))

        Z = depth_image / 1000.0
        print(np.max(depth_image))
        print(np.min(depth_image))
        X = (x - cx) * Z / fx
        Y = (y - cy) * Z / fy

        # X = -X
        Y = -Y

        points = np.stack((X, Y, Z), axis=-1).reshape(-1, 3)
        valid_points = Z.flatten() > 0
        points = points[valid_points]

        if len(points) == 0:
            print("[WARNING] No hay puntos válidos en la nube.")
            continue
        
        pcd.points = o3d.utility.Vector3dVector(points)
        vis.update_geometry(pcd)
        vis.poll_events()
        vis.update_renderer()

        opt = vis.get_render_option()
        opt.point_size = 2

        # Mantener el framerate de 30fps
        time.sleep(1/60)

        # Salir del bucle si se presiona la tecla 'q'
        if cv2.waitKey(1) & 0xFF == ord('q'):
            break

except Exception as e:
    print(e)

finally:
    cap.release()
    vis.destroy_window()
    cv2.destroyAllWindows()


