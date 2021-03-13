# ROS  
ROS tutorials for NCTU course in spring 2021.  

## Start ROS master  
```shell
roscore
```

### Ex1: 樹莓派與電腦溝通  
```shell
rosrun ros_basic publisher_node.py
```

### Ex2: GPIO-呼吸燈  
```shell
rosrun ros_basic led.py
```

### Ex3: GPIO-RGB燈  
```shell
rosrun ros_basic pi_subscriber.py
rosrun ros_basic publish_teleop.py
```

### Ex4: 超音波感測器  
```shell
rosrun ros_basic hc_sr04.py
```

### Ex5: 按鈕  
```shell
rosrun ros_basic button.py
```
