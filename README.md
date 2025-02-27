# Sistema de Visión Artificial

## Descripción
Este proyecto implementa un sistema de visión artificial utilizando ROS, una cámara Kinect y una Jetson Nano de 2GB de RAM. El objetivo principal es capturar y procesar datos visuales del entorno físico circundante y representarlos en un espacio tridimensional utilizando RViz. Este sistema está diseñado para integrarse en un robot móvil de alto torque con capacidades de navegación autónoma y SLAM.

## Características principales
- **Captura de datos**: Utiliza la cámara Kinect para capturar puntos y vectores del entorno.
- **Procesamiento**: Procesa los datos capturados mediante nodos desarrollados en ROS.
- **Visualización en 3D**: Representación de los datos procesados en RViz para una visualización clara y detallada del entorno.
- Diseñado para complementar a posteriori sistemas de navegación autónoma mediante mapeo simultáneo y localización.

## Requisitos
- **Hardware**:
  - Jetson Nano (2GB o superior)
  - Cámara Kinect
  - Robot móvil de alto torque (opcional, para integración completa)
  - Jetson Nano password: jetson
- **Software**:
  - Ubuntu 20.04
  - ROS (Robot Operating System)
  - RViz
  - Python 3.6+

## Instalación
1. **Configurar el entorno ROS 2 Foxy**:
    ```bash
    sudo apt update && sudo apt upgrade -y
    sudo apt install ros-foxy-desktop
    echo "source /opt/ros/foxy/setup.bash" >> ~/.bashrc
    source ~/.bashrc
    ```
2. **Clonar este repositorio**:
    ```bash
    mkdir ~/ros2_ws
    cd ~/ros2_ws/src
    git clone https://github.com/pericao320/ros2_ws.git
    ```
3. **Arreglar la ruta del paquete que no se reconoce**
   Ir a la carpeta:
   ```bash
    cd /home/<usuario>/ros2_ws/src/kinect_ros2/include/kinect_ros2
    ```
   Y cambiar el archivo *kinect_ros2_component.hpp* la linea N°**6** de código:
   ```bash
   #include "/home/<usuario>/ros2_ws/src/libfreenect/include/libfreenect.h"
   ```
   En *usuario* pon tu nombre de usuario
4. **Compilar los paquetes**:
    ```bash
    cd ~/ros2_ws
    colcon build
    source install/setup.bash
    ```
5. **Conectar la cámara Kinect**:
    Asegúrate de que la Kinect esté correctamente conectada a la Jetson Nano y sea reconocida.

   
### Instalación (para otra distro de ROS 2)
1. **Crear un workspace vacío**:
    ```bash
    mkdir -p ~/ros2_ws/src
    cd ~/ros2_ws
    colcon build
    ```

2. **Clonar el repositorio en una carpeta separada**:
    ```bash
    mkdir -p ~/Documents
    cd ~/Documents
    git clone https://github.com/pericao320/ros2_ws.git
    ```

3. **Copiar la carpeta `src` al workspace**:
    ```bash
    cp -r ~/Documents/ros2_ws/src ~/ros2_ws/
    ```

4. **Compilar los paquetes**:
    ```bash
    cd ~/ros2_ws
    colcon build
    source install/setup.bash
    ```

5. **Conectar la cámara Kinect**:
    Asegúrate de que la Kinect esté correctamente conectada y reconocida por tu sistema.
   
### Resolución de problemas comunes

Si encuentras errores relacionados con la configuración de paquetes o bibliotecas, sigue estos pasos:

1. **Instalar dependencias faltantes**:
   Asegúrate de que todas las dependencias necesarias están instaladas, especialmente `libfreenect`:
   ```bash
   sudo apt update
   sudo apt install libfreenect
   ```
3. **Actualizar las variables de entorno**:
   Si el paquete no se encuentra al intentar lanzarlo, asegúrate de incluir el espacio de trabajo en las rutas de ROS 2:
   ```bash
   echo "source ~/ros2_ws/install/setup.bash" >> ~/.bashrc
   source ~/.bashrc
   ```
5. **Verificar la instalación del paquete**:
    ```bash
   Confirma que el paquete `kinect_ros2` está registrado:
   ros2 pkg list | grep kinect_ros2
    ```
## Uso
1. **Lanzar el sistema**:
    ```bash
    source ~/.bashrc
    ros2 launch kinect_ros2 pointcloud.launch.py
    ```
2. **Visualizar en RViz**:
    - Abre RViz.
    - Carga la configuración predeterminada proporcionada en este repositorio (`config/rviz_config.rviz`).
    - Observa la representación en 3D del entorno circundante.

3. **Conexión ROS_DDS**:
   Configura estos en el archivo ~/.bashrc
    ```bash
    export ROS_DOMAIN_ID=0
    export RMW_IMPLEMENTATION=rmw_fastrtps_cpp
    # O puedes usar
    # export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
    ```

## Créditos
Este proyecto fue desarrollado como parte de la tesis titulada **"Robot móvil de alto torque: visión artificial"**, en la línea de Innovación y transferencia de tecnología.

##
## Anexos
### Pruebas del algoritmo
<div style="display: grid; grid-template-columns: repeat(2, 1fr); gap: 10px;">
    <img src="https://i.imgur.com/IAHdM28.png" title="Imagen de ejemplo (Simula una capturada por el sensor Kinect)" alt="RvizImage" width="500"/>
    <img src="https://i.imgur.com/dI1jHVn.jpeg" title="Nube de puntos del entorno generada a partir del algoritmo" alt="RvizImage" width="500"/>
</div>
### Vistas del entorno dentro de ROS 2 (Imágnes capturadas dentro de la tarjeta electronica) 
<img src="https://imgur.com/RHlBvtq.jpg" title="Nube de puntos del entorno generada con la información de profundidad" alt="RvizImage" width="500"/>
<img src="https://imgur.com/WknejJU.jpg" title="Prueba slam_toolbox a partir de datos de nube de puntos" alt="RvizImage" width="500"/>
<img src="https://imgur.com/uF0aJV2.jpg" title="Diagrama de flujo de tópicos y nodos extraídos del sistema" alt="nodesImage" width="500"/>
