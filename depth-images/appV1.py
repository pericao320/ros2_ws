import numpy as np
import cv2
import open3d as o3d

# 1. Cargar imagen de profundidad (en milímetros o metros, dependiendo de la cámara)
depth_image = cv2.imread("depth_image_re_inv.png", cv2.IMREAD_UNCHANGED)
if depth_image is None:
    raise ValueError("No se pudo cargar la imagen de profundidad. Verifica la ruta del archivo.")

# Verificar si la imagen tiene más de un canal y convertirla a escala de grises si es necesario
if len(depth_image.shape) > 2:
    depth_image = cv2.cvtColor(depth_image, cv2.COLOR_BGR2GRAY)

# 2. Parámetros de la cámara (Ejemplo de cámara Intel RealSense D435)
fx, fy = 600, 600  # Distancias focales en píxeles
cx, cy = 320, 240  # Centro óptico (punto principal)
height, width = depth_image.shape
# print(width, height)
# print(depth_image)
# print(f"Dimensiones de la matriz de profundidad: {depth_image.shape}")

# 3. Crear coordenadas de píxeles
x, y = np.meshgrid(np.arange(width), np.arange(height))
# print(f"x: {x}")
# print(f"y: {y}")

# 4. Convertir la imagen de profundidad en coordenadas 3D
Z = depth_image*1.5 / 1000.0  # Convertir a metros si está en milímetros
X = (x - cx) * Z / fx
Y = (y - cy) * Z / fy
print(f"Z: {depth_image[0][0]}")
#print(f"Z: {depth_image[639][479]}")

# Invertir las coordenadas X para corregir la inversión horizontal
X = -X
Y = -Y

# 5. Crear la nube de puntos (X, Y, Z)
points = np.stack((X, Y, Z), axis=-1).reshape(-1, 3)

# 6. Filtrar puntos inválidos (con profundidad cero)
valid_points = Z.flatten() > 0
points = points[valid_points]

# 7. Visualizar con Open3D
pcd = o3d.geometry.PointCloud()
pcd.points = o3d.utility.Vector3dVector(points)

# Crear una ventana de visualización de Open3D
vis = o3d.visualization.Visualizer()
vis.create_window(window_name="Point Cloud")

# Añadir la nube de puntos a la visualización
vis.add_geometry(pcd)

# Crear un sistema de coordenadas
axis = o3d.geometry.TriangleMesh.create_coordinate_frame(size=0.013, origin=[-0.01, 0, 0])
vis.add_geometry(axis)

# Configurar la visualización
opt = vis.get_render_option()
opt.background_color = np.asarray([0, 0, 0])
opt.point_size = 1

# Actualizar la visualización
vis.poll_events()
vis.update_renderer()

# Mantener la ventana abierta hasta que se cierre manualmente
vis.run()
vis.destroy_window()
 