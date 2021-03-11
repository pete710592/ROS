echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
source ~/.bashrc
#sudo apt install -y python-rosinstall python-rosinstall-generator python-wstool build-essential
cd ~/ROS/catkin_ws
catkin_make
cd ~/ROS/catkin_ws/src
catkin_create_pkg ros_basic rospy std_msgs
cd ~/ROS/catkin_ws/src/ros_basic/src
chmod 777 hc_sr04.py led.py button.py pi_subscriber.py publish_teleop.py subscriber_node.py publisher_node.py
#echo "source ~/ROS/catkin_ws/devel/setup.bash" >> ~/.bashrc
source ~/.bashrc
