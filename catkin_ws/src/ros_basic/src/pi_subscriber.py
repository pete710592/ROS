#!/usr/bin/env python

import rospy
import RPi.GPIO as gpio
from std_msgs.msg import String

## set pin about LED color
red   = 17
green = 27
blue  = 22

## set gpio
# setmode
gpio.setmode(gpio.BCM)
gpio.setup(red , gpio.OUT)
gpio.setup(green , gpio.OUT)
gpio.setup(blue , gpio.OUT)

# set output
gpio.output(red , gpio.HIGH)
gpio.output(green , gpio.HIGH)
gpio.output(blue , gpio.HIGH)


def callback(data):
    select_color = data.data
    trigger = { 'R': (red,0),'G': (green,0),'B': (blue,0),'r': (red,0),'g': (green,0),'b': (blue,0) }
    close   = {'C':(red,green,blue,1),'c':(red,green,blue,1)}
    if select_color in trigger.keys() :
        print ('The word is {} and Pin is {} ').format(select_color, trigger[select_color][0])

        ## close all
        pin   = close['C'][0:3]
        digital_signal = close['C'][3]
        for index in range(0,3):
            gpio.output(pin[index] , digital_signal)

        ## light select color
        pin   = trigger[select_color][0]
        digital_signal =trigger[select_color][1]
        gpio.output(pin , digital_signal)

    elif select_color in close.keys():
        pin   = close[select_color][0:3]
        digital_signal = close[select_color][3]
        for index in range(0,3):
            gpio.output(pin[index] , digital_signal)
        print ('Close all.')


if __name__ == '__main__':

    rospy.init_node('subcriber_teleop', anonymous=True)

    while(True):
        if rospy.is_shutdown() == True:
            gpio.cleanup()
            print''
            break
        else:
            rospy.Subscriber("pub_teleop", String, callback)
            rospy.spin()
