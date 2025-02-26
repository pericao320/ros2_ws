ros2 run tf2_tools view_frames.py

jetson@nano:~$ ros2 topic hz /kinect/depth/camera_info 
average rate: 59.716
	min: 0.001s max: 0.039s std dev: 0.01246s window: 62
average rate: 60.320
	min: 0.001s max: 0.039s std dev: 0.01372s window: 123
average rate: 59.986
	min: 0.001s max: 0.039s std dev: 0.01375s window: 184
average rate: 60.169
	min: 0.001s max: 0.039s std dev: 0.01326s window: 245
average rate: 60.135
	min: 0.001s max: 0.039s std dev: 0.01256s window: 305
average rate: 60.093
	min: 0.001s max: 0.039s std dev: 0.01182s window: 365
average rate: 60.077
	min: 0.001s max: 0.039s std dev: 0.01110s window: 425
average rate: 60.054
	min: 0.001s max: 0.039s std dev: 0.01043s window: 485
	
jetson@nano:~$ ros2 topic hz /kinect/depth/image_raw 
average rate: 29.940
	min: 0.030s max: 0.035s std dev: 0.00131s window: 31
average rate: 29.448
	min: 0.030s max: 0.066s std dev: 0.00437s window: 60
average rate: 29.286
	min: 0.030s max: 0.066s std dev: 0.00488s window: 89
average rate: 29.234
	min: 0.030s max: 0.066s std dev: 0.00507s window: 119
average rate: 29.376
	min: 0.030s max: 0.066s std dev: 0.00459s window: 149
average rate: 29.474
	min: 0.030s max: 0.066s std dev: 0.00424s window: 179
average rate: 29.543
	min: 0.030s max: 0.066s std dev: 0.00397s window: 209
average rate: 29.599
	min: 0.030s max: 0.066s std dev: 0.00374s window: 240
	
jetson@nano:~$ ros2 topic hz /kinect/image_raw 
average rate: 22.146
	min: 0.031s max: 0.367s std dev: 0.05900s window: 31
average rate: 23.333
	min: 0.014s max: 0.367s std dev: 0.04555s window: 56
average rate: 24.481
	min: 0.014s max: 0.367s std dev: 0.03795s window: 84
average rate: 25.496
	min: 0.014s max: 0.367s std dev: 0.03301s window: 113
average rate: 26.124
	min: 0.014s max: 0.367s std dev: 0.02965s window: 142
average rate: 26.587
	min: 0.014s max: 0.367s std dev: 0.02706s window: 172
average rate: 27.059
	min: 0.014s max: 0.367s std dev: 0.02497s window: 203
average rate: 27.444
	min: 0.014s max: 0.367s std dev: 0.02347s window: 234
	
jetson@nano:~$ ros2 topic hz /kinect/points
average rate: 20.475
	min: 0.028s max: 0.163s std dev: 0.03452s window: 23
average rate: 19.437
	min: 0.028s max: 0.256s std dev: 0.04411s window: 42
average rate: 18.726
	min: 0.025s max: 0.256s std dev: 0.04078s window: 60
average rate: 19.974
	min: 0.025s max: 0.256s std dev: 0.03814s window: 84
average rate: 19.461
	min: 0.023s max: 0.256s std dev: 0.03861s window: 102
average rate: 18.422
	min: 0.023s max: 0.256s std dev: 0.04237s window: 115
average rate: 18.705
	min: 0.019s max: 0.256s std dev: 0.04063s window: 136
average rate: 18.598
	min: 0.019s max: 0.256s std dev: 0.03959s window: 154

jetson@nano:~$ ros2 topic delay /kinect/depth/camera_info 
average delay: 908794007.752
	min: 0.002s max: 1738562450.062s std dev: 868382742.67548s window: 44
average delay: 885998171.717
	min: 0.002s max: 1738562451.063s std dev: 869120470.34214s window: 104
average delay: 879882215.890
	min: 0.002s max: 1738562452.065s std dev: 869216582.74517s window: 164
average delay: 873179347.670
	min: 0.002s max: 1738562453.033s std dev: 869272485.35219s window: 223
average delay: 872352890.944
	min: 0.002s max: 1738562454.035s std dev: 869275798.84532s window: 283
	
jetson@nano:~ros2 topic delay /kinect/depth/image_raw 
average delay: 0.005
	min: 0.004s max: 0.006s std dev: 0.00057s window: 29
average delay: 0.005
	min: 0.004s max: 0.007s std dev: 0.00069s window: 58
average delay: 0.005
	min: 0.004s max: 0.007s std dev: 0.00064s window: 88
average delay: 0.005
	min: 0.004s max: 0.007s std dev: 0.00071s window: 118
average delay: 0.005
	min: 0.004s max: 0.008s std dev: 0.00073s window: 147
	
jetson@nano:~ros2 topic delay /kinect/image_raw 
average delay: 1738562545.873
	min: 1738562545.377s max: 1738562546.309s std dev: 0.26537s window: 27
average delay: 1738562546.374
	min: 1738562545.377s max: 1738562547.307s std dev: 0.55069s window: 57
average delay: 1738562546.874
	min: 1738562545.377s max: 1738562548.307s std dev: 0.83818s window: 87
average delay: 1738562547.359
	min: 1738562545.377s max: 1738562549.304s std dev: 1.11919s window: 116
average delay: 1738562547.865
	min: 1738562545.377s max: 1738562550.305s std dev: 1.41523s window: 146
average delay: 1738562548.369
	min: 1738562545.377s max: 1738562551.307s std dev: 1.70664s window: 176

jetson@nano:~$ ros2 topic delay /kinect/points
average delay: 0.044
	min: 0.039s max: 0.050s std dev: 0.00325s window: 23
average delay: 0.044
	min: 0.037s max: 0.050s std dev: 0.00338s window: 37
average delay: 0.045
	min: 0.033s max: 0.067s std dev: 0.00490s window: 58
average delay: 0.044
	min: 0.030s max: 0.067s std dev: 0.00570s window: 71
average delay: 0.045
	min: 0.030s max: 0.067s std dev: 0.00582s window: 86
average delay: 0.044
	min: 0.030s max: 0.067s std dev: 0.00585s window: 97
average delay: 0.044
	min: 0.030s max: 0.067s std dev: 0.00578s window: 109

jetson@nano:~$ ros2 topic bw /kinect/depth/camera_info 
Subscribed to [/kinect/depth/camera_info]
22.09 KB/s from 100 messages
	Message size mean: 0.37 KB min: 0.37 KB max: 0.37 KB
22.12 KB/s from 100 messages
	Message size mean: 0.37 KB min: 0.37 KB max: 0.37 KB
22.12 KB/s from 100 messages
	Message size mean: 0.37 KB min: 0.37 KB max: 0.37 KB
22.15 KB/s from 100 messages
	Message size mean: 0.37 KB min: 0.37 KB max: 0.37 KB
22.15 KB/s from 100 messages
	Message size mean: 0.37 KB min: 0.37 KB max: 0.37 KB
22.18 KB/s from 100 messages
	Message size mean: 0.37 KB min: 0.37 KB max: 0.37 KB
jetson@nano:~$ ros2 topic bw /kinect/depth/image_raw 
Subscribed to [/kinect/depth/image_raw]
16.77 MB/s from 100 messages
	Message size mean: 0.61 MB min: 0.61 MB max: 0.61 MB
18.46 MB/s from 100 messages
	Message size mean: 0.61 MB min: 0.61 MB max: 0.61 MB
18.46 MB/s from 100 messages
	Message size mean: 0.61 MB min: 0.61 MB max: 0.61 MB
18.47 MB/s from 100 messages
	Message size mean: 0.61 MB min: 0.61 MB max: 0.61 MB
jetson@nano:~$ ros2 topic bw /kinect/image_raw 
Subscribed to [/kinect/image_raw]
27.92 MB/s from 100 messages
	Message size mean: 0.92 MB min: 0.92 MB max: 0.92 MB
27.90 MB/s from 100 messages
	Message size mean: 0.92 MB min: 0.92 MB max: 0.92 MB
27.33 MB/s from 100 messages
	Message size mean: 0.92 MB min: 0.92 MB max: 0.92 MB
27.34 MB/s from 100 messages
	Message size mean: 0.92 MB min: 0.92 MB max: 0.92 MB
27.33 MB/s from 100 messages
	Message size mean: 0.92 MB min: 0.92 MB max: 0.92 MB
jetson@nano:~$ ros2 topic bw /kinect/points 
Subscribed to [/kinect/points]
79.67 MB/s from 100 messages
	Message size mean: 4.92 MB min: 4.92 MB max: 4.92 MB
88.64 MB/s from 100 messages
	Message size mean: 4.92 MB min: 4.92 MB max: 4.92 MB
92.62 MB/s from 100 messages
	Message size mean: 4.92 MB min: 4.92 MB max: 4.92 MB
87.92 MB/s from 100 messages
	Message size mean: 4.92 MB min: 4.92 MB max: 4.92 MB
jetson@nano:~$ ros2 topic type /kinect/depth/camera_info 
sensor_msgs/msg/CameraInfo
jetson@nano:~$ ros2 topic type /kinect/depth/image_raw 
sensor_msgs/msg/Image
jetson@nano:~$ ros2 topic type /kinect/image_raw 
sensor_msgs/msg/Image
jetson@nano:~$ ros2 topic type /kinect/points 
sensor_msgs/msg/PointCloud2

jetson@nano:~$ ros2 interface show sensor_msgs/msg/CameraInfo
# This message defines meta information for a camera. It should be in a
# camera namespace on topic "camera_info" and accompanied by up to five
# image topics named:
#
#   image_raw - raw data from the camera driver, possibly Bayer encoded
#   image            - monochrome, distorted
#   image_color      - color, distorted
#   image_rect       - monochrome, rectified
#   image_rect_color - color, rectified
#
# The image_pipeline contains packages (image_proc, stereo_image_proc)
# for producing the four processed image topics from image_raw and
# camera_info. The meaning of the camera parameters are described in
# detail at http://www.ros.org/wiki/image_pipeline/CameraInfo.
#
# The image_geometry package provides a user-friendly interface to
# common operations using this meta information. If you want to, e.g.,
# project a 3d point into image coordinates, we strongly recommend
# using image_geometry.
#
# If the camera is uncalibrated, the matrices D, K, R, P should be left
# zeroed out. In particular, clients may assume that K[0] == 0.0
# indicates an uncalibrated camera.

#######################################################################
#                     Image acquisition info                          #
#######################################################################

# Time of image acquisition, camera coordinate frame ID
std_msgs/Header header # Header timestamp should be acquisition time of image
                             # Header frame_id should be optical frame of camera
                             # origin of frame should be optical center of camera
                             # +x should point to the right in the image
                             # +y should point down in the image
                             # +z should point into the plane of the image


#######################################################################
#                      Calibration Parameters                         #
#######################################################################
# These are fixed during camera calibration. Their values will be the #
# same in all messages until the camera is recalibrated. Note that    #
# self-calibrating systems may "recalibrate" frequently.              #
#                                                                     #
# The internal parameters can be used to warp a raw (distorted) image #
# to:                                                                 #
#   1. An undistorted image (requires D and K)                        #
#   2. A rectified image (requires D, K, R)                           #
# The projection matrix P projects 3D points into the rectified image.#
#######################################################################

# The image dimensions with which the camera was calibrated.
# Normally this will be the full camera resolution in pixels.
uint32 height
uint32 width

# The distortion model used. Supported models are listed in
# sensor_msgs/distortion_models.hpp. For most cameras, "plumb_bob" - a
# simple model of radial and tangential distortion - is sufficent.
string distortion_model

# The distortion parameters, size depending on the distortion model.
# For "plumb_bob", the 5 parameters are: (k1, k2, t1, t2, k3).
float64[] d

# Intrinsic camera matrix for the raw (distorted) images.
#     [fx  0 cx]
# K = [ 0 fy cy]
#     [ 0  0  1]
# Projects 3D points in the camera coordinate frame to 2D pixel
# coordinates using the focal lengths (fx, fy) and principal point
# (cx, cy).
float64[9]  k # 3x3 row-major matrix

# Rectification matrix (stereo cameras only)
# A rotation matrix aligning the camera coordinate system to the ideal
# stereo image plane so that epipolar lines in both stereo images are
# parallel.
float64[9]  r # 3x3 row-major matrix

# Projection/camera matrix
#     [fx'  0  cx' Tx]
# P = [ 0  fy' cy' Ty]
#     [ 0   0   1   0]
# By convention, this matrix specifies the intrinsic (camera) matrix
#  of the processed (rectified) image. That is, the left 3x3 portion
#  is the normal camera intrinsic matrix for the rectified image.
# It projects 3D points in the camera coordinate frame to 2D pixel
#  coordinates using the focal lengths (fx', fy') and principal point
#  (cx', cy') - these may differ from the values in K.
# For monocular cameras, Tx = Ty = 0. Normally, monocular cameras will
#  also have R = the identity and P[1:3,1:3] = K.
# For a stereo pair, the fourth column [Tx Ty 0]' is related to the
#  position of the optical center of the second camera in the first
#  camera's frame. We assume Tz = 0 so both cameras are in the same
#  stereo image plane. The first camera always has Tx = Ty = 0. For
#  the right (second) camera of a horizontal stereo pair, Ty = 0 and
#  Tx = -fx' * B, where B is the baseline between the cameras.
# Given a 3D point [X Y Z]', the projection (x, y) of the point onto
#  the rectified image is given by:
#  [u v w]' = P * [X Y Z 1]'
#         x = u / w
#         y = v / w
#  This holds for both images of a stereo pair.
float64[12] p # 3x4 row-major matrix


#######################################################################
#                      Operational Parameters                         #
#######################################################################
# These define the image region actually captured by the camera       #
# driver. Although they affect the geometry of the output image, they #
# may be changed freely without recalibrating the camera.             #
#######################################################################

# Binning refers here to any camera setting which combines rectangular
#  neighborhoods of pixels into larger "super-pixels." It reduces the
#  resolution of the output image to
#  (width / binning_x) x (height / binning_y).
# The default values binning_x = binning_y = 0 is considered the same
#  as binning_x = binning_y = 1 (no subsampling).
uint32 binning_x
uint32 binning_y

# Region of interest (subwindow of full camera resolution), given in
#  full resolution (unbinned) image coordinates. A particular ROI
#  always denotes the same window of pixels on the camera sensor,
#  regardless of binning settings.
# The default setting of roi (all values 0) is considered the same as
#  full resolution (roi.width = width, roi.height = height).
RegionOfInterest roi
jetson@nano:~$ ros2 interface show sensor_msgs/msg/Image
# This message contains an uncompressed image
# (0, 0) is at top-left corner of image

std_msgs/Header header # Header timestamp should be acquisition time of image
                             # Header frame_id should be optical frame of camera
                             # origin of frame should be optical center of cameara
                             # +x should point to the right in the image
                             # +y should point down in the image
                             # +z should point into to plane of the image
                             # If the frame_id here and the frame_id of the CameraInfo
                             # message associated with the image conflict
                             # the behavior is undefined

uint32 height                # image height, that is, number of rows
uint32 width                 # image width, that is, number of columns

# The legal values for encoding are in file src/image_encodings.cpp
# If you want to standardize a new string format, join
# ros-users@lists.ros.org and send an email proposing a new encoding.

string encoding       # Encoding of pixels -- channel meaning, ordering, size
                      # taken from the list of strings in include/sensor_msgs/image_encodings.hpp

uint8 is_bigendian    # is this data bigendian?
uint32 step           # Full row length in bytes
uint8[] data          # actual matrix data, size is (step * rows)
jetson@nano:~$ ros2 interface show sensor_msgs/msg/PointCloud2
# This message holds a collection of N-dimensional points, which may
# contain additional information such as normals, intensity, etc. The
# point data is stored as a binary blob, its layout described by the
# contents of the "fields" array.
#
# The point cloud data may be organized 2d (image-like) or 1d (unordered).
# Point clouds organized as 2d images may be produced by camera depth sensors
# such as stereo or time-of-flight.

# Time of sensor data acquisition, and the coordinate frame ID (for 3d points).
std_msgs/Header header

# 2D structure of the point cloud. If the cloud is unordered, height is
# 1 and width is the length of the point cloud.
uint32 height
uint32 width

# Describes the channels and their layout in the binary data blob.
PointField[] fields

bool    is_bigendian # Is this data bigendian?
uint32  point_step   # Length of a point in bytes
uint32  row_step     # Length of a row in bytes
uint8[] data         # Actual point data, size is (row_step*height)

bool is_dense        # True if there are no invalid points


	

