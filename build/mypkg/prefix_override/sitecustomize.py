import sys
if sys.prefix == '/usr':
    sys.real_prefix = sys.prefix
    sys.prefix = sys.exec_prefix = '/home/gano/ros2_ws/src/mypkg/Humidity-Monitoring-Simulation-System/install/mypkg'
