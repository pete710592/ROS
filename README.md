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
| Name  | Pin | Pin name |
|:-----:|:---:|:--------:|
| VCC   | 12  | GPIO 18  |
| GND   | 14  | Ground   |
```shell
rosrun ros_basic led.py
```

### Ex3: GPIO-RGB燈  
| Name  | Pin | Pin name |
|:-----:|:---:|:--------:|
| 3.3V  | 2   | 3.3V     |
| RED   | 11  | GPIO 17  |
| GREEN | 13  | GPIO 27  |
| BLUE  | 15  | GPIO 22  |
```shell
rosrun ros_basic pi_subscriber.py
rosrun ros_basic publish_teleop.py
```

### Ex4: 超音波感測器  
| Name  | Pin | Pin name |
|:-----:|:---:|:--------:|
| VCC   | 22  | GPIO 18  |
| GND   | 9   | Ground   |
| TRIG  | 13  | GPIO 27  |
| ECHO  | 15  | GPIO 22  |
```shell
rosrun ros_basic hc_sr04.py
```

### Ex5: 按鈕  
| Name  | Pin | Pin name |
|:-----:|:---:|:--------:|
| 3.3V  | 2   | 3.3V     |
| VCC   | 11  | GPIO 17  |
| GND   | 9   | Ground   |
```shell
rosrun ros_basic button.py
```
