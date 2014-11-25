#!/bin/bash
#Find the name of the anonymous rviz node
export RVIZ_NODE_NAME=`rosnode list | grep rviz`
#Find the names of the topics that output the types of interest - in this case the ones used to send commands from rviz to the backend
export RECORDED_TOPIC_NAMES=`rosnode info $RVIZ_NODE_NAME | grep "visualization_msgs/InteractiveMarkerFeedback\|ActionGoal" | awk '{print $2}' | tr '\\n' ' '`
#For debugging purposes, we can output the names of these topics 
echo $RECORDED_TOPIC_NAMES
#Start bagging the topics of interest
rosbag record $RECORDED_TOPIC_NAMES
