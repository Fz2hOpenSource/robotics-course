 # ROS Introduction

ROS is used to build connections between different modules of a robot, similar to the human nervous system.
It can take images output from a camera module as input to an object recognition module to achieve object recognition.
This is similar to how the nervous system transmits information from the eyes to different modules in the brain to enable complex decision-making and behaviors.

But why use ROS for transmission between different modules?
Can't I just pass parameters directly in the code?
Why does ROS occupy such an important position in the robotics field?

The reason is that ROS's design is more conducive to collaboration and community communication.
For example, if someone develops a super powerful algorithm but only writes it into their own program,
if you want to use it, you can only read the source code, think about how it's called, and what the module's inputs and outputs are.
But if the developer builds it as a ROS package, you can use ROS as this nervous system to quickly integrate it into your robot code or replace the original module.
This greatly reduces the development burden.

At the same time, we can run programs with high computational overhead, such as neural networks, on the host machine rather than on the robot.
On one hand, this can reduce the robot's power consumption, giving you more debugging time,
and on the other hand, it can leverage the powerful computing capability of the host machine to accomplish more complex tasks.

It is precisely because the robotics community has built rich functional modules (mapping, navigation, localization) based on ROS
that we can quickly get started with robots and accomplish relatively complex tasks, rather than writing code from scratch.

You only need to remember two things:

1. ROS is responsible for transmitting information between modules.

2. Community ROS packages can reduce our development burden.




## Core Concepts

- [**Setup Robot Environment**](setup_robot_env.zh.md): Configure the robot environment, including installing ROS Noetic + Gazebo / creating a ROS workspace.
- [**ROS Communication**](ros_communication_demo.zh.md): Executable files that perform computations.



## Auxiliary Resources

[ROS2 Official Documentation](https://docs.ros.org/en/humble/index.html){ .md-button }
[ROS Official Documentation](http://wiki.ros.org/){ .md-button }


<!-- <div class="video-wrapper">
  <iframe width="560" height="315" src="https://www.youtube.com/embed/some-video-id" frameborder="0" allowfullscreen></iframe>
</div> -->

[ROS Official Documentation](http://wiki.ros.org/){ .md-button }