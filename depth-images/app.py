import numpy as np
import cv2
import open3d as o3d

# 1. Cargar imagen de profundidad (en milímetros o metros, dependiendo de la cámara)
depth_image = cv2.imread("depth_image.png", cv2.IMREAD_UNCHANGED)
if depth_image is None:
    raise ValueError("No se pudo cargar la imagen de profundidad. Verifica la ruta del archivo.")

# Verificar si la imagen tiene más de un canal y convertirla a escala de grises si es necesario
if len(depth_image.shape) > 2:
    depth_image = cv2.cvtColor(depth_image, cv2.COLOR_BGR2GRAY)

# 2. Parámetros de la cámara (Ejemplo de cámara Intel RealSense D435)
fx, fy = 600, 600  # Distancias focales en píxeles
cx, cy = 320, 240  # Centro óptico (punto principal)
height, width = depth_image.shape

# 3. Crear coordenadas de píxeles
x, y = np.meshgrid(np.arange(width), np.arange(height))

# 4. Convertir la imagen de profundidad en coordenadas 3D
Z = depth_image / 1000.0  # Convertir a metros si está en milímetros
X = (x - cx) * Z / fx
Y = (y - cy) * Z / fy

# Invertir las coordenadas X para corregir la inversión horizontal
#X = -X
Y = -Y

# 5. Crear la nube de puntos (X, Y, Z)
points = np.stack((X, Y, Z), axis=-1).reshape(-1, 3)

# 6. Filtrar puntos inválidos (con profundidad cero)
valid_points = Z.flatten() > 0
points = points[valid_points]

# 7. Visualizar con Open3D
pcd = o3d.geometry.PointCloud()
pcd.points = o3d.utility.Vector3dVector(points)

o3d.visualization.draw_geometries([pcd], window_name="Point Cloud")
