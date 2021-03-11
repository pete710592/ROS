#!/bin/bash
#make ros2 for ubuntu18.04 desktop & install example like turtlesim
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8
sudo apt update && sudo apt install curl gnupg2 lsb-release
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64,arm64] http://packages.ros.org/ros2/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/ros2-latest.list'
sudo apt update
sudo apt install ros-dashing-desktop
sudo apt install python3-argcomplete
source /opt/ros/dashing/setup.bash
echo "source /opt/ros/dashing/setup.bash" >> ~/.bashrc
sudo apt update && sudo apt install -y \
  build-essential \
  cmake \
  git \
  python3-colcon-common-extensions \
  python3-lark-parser \
  python3-pip \
  python-rosdep \
  python3-vcstool \
  wget
# install some pip packages needed for testing
python3 -m pip install -U \
  argcomplete \
  flake8 \
  flake8-blind-except \
  flake8-builtins \
  flake8-class-newline \
  flake8-comprehensions \
  flake8-deprecated \
  flake8-docstrings \
  flake8-import-order \
  flake8-quotes \
  pytest-repeat \
  pytest-rerunfailures \
  pytest \
  pytest-cov \
  pytest-runner \
  setuptools
# install Fast-RTPS dependencies
sudo apt install --no-install-recommends -y \
  libasio-dev \
  libtinyxml2-dev
sudo rosdep init
rosdep update
rosdep install --from-paths src --ignore-src --rosdistro dashing -y --skip-keys "console_bridge fastcdr fastrtps libopensplice67 libopensplice69 rti-connext-dds-5.3.1 urdfdom_headers"
python3 -m pip install -U lark-parser
cd ~/Downloads
wget https://github.com/ros2/ros2/releases/download/release-dashing-20190910/ros2-dashing-20190910-linux-bionic-amd64.tar.bz2 
mkdir -p ~/ros2_example && cd ~/ros2_example
tar xf ~/Downloads/ros2-dashing-20190910-linux-bionic-amd64.tar.bz2
sudo apt-get update && sudo apt-get install vim -y
echo ". ~/ros2_example/ros2-linux/setup.bash" >> ~/.bashrc
mkdir -p turtlesim/src && cd turtlesim/src
git clone https://github.com/zhangrelay/ros2_tutorials.git
cd ~/ros2_example/turtlesim
colcon build
echo "source ~/ros2_example/turtlesim/install/local_setup.bash" >> ~/.bashrc
echo "source ~/ros2_example/turtlesim/install/setup.bash" >> ~/.bashrc
