sudo apt-get update
sudo apt-get install iputils-ping -y
sudo apt-get install vim -y
sudo apt-get install -y openssh-server
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo apt-get update
sudo apt-get install -y ros-kinetic-desktop-full
sudo rosdep init
rosdep update
echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
source ~/.bashrc
sudo apt install -y python-rosinstall python-rosinstall-generator python-wstool build-essential
cd ~/ROS/catkin_ws
catkin_make
cd ~/ROS/catkin_ws/src
catkin_create_pkg ros_basic rospy std_msgs
cd ~/ROS/catkin_ws/src/ros_basic/src
chmod 777 hc_sr04.py led.py button.py pi_subscriber.py publish_teleop.py subscriber_node.py publisher_node.py
echo "source ~/ROS/catkin_ws/devel/setup.bash" >> ~/.bashrc
source ~/.bashrc
