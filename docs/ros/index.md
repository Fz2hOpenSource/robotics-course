# Introduction to ROS

ROS is used to build connections between different modules of a robot, similar to the human nervous system. It can take images output from a camera module as input for an object recognition module to achieve object recognition. This is similar to how the nervous system transmits information from the eyes to different modules in the brain to enable complex decision-making and behavior.

But why use ROS for passing information between different modules? Can't I just have them transfer information directly in the code? Why does ROS occupy such an important position in the robotics field?

The reason is that ROS's design is more conducive to collaboration and community exchange. For example, if someone develops a super impressive algorithm but only writes it into their own program, if you want to use it, you can only read through the source code, figure out how it's called, and determine what the module's inputs and outputs are. However, if the developer builds it as a ROS package, you can use ROS as this nervous system to quickly integrate it into your robot code or replace an existing module. This greatly reduces the development burden.

It is precisely because the robotics community has built a rich collection of functional modules (mapping, navigation, localization) based on ROS that we can quickly get started with robotics and accomplish relatively complex tasks, rather than writing code from scratch.

You only need to remember two things:

1. ROS handles passing information between modules.

2. Community ROS packages can reduce our development burden.

## Key Concepts

- **Nodes**: Executable files that perform computation.
- **Topics**: Named buses over which nodes exchange messages.
- **Services**: Request/reply communication between nodes.

<!-- ## Helpful Resources -->

<!-- <div class="video-wrapper">
  <iframe width="560" height="315" src="https://www.youtube.com/embed/some-video-id" frameborder="0" allowfullscreen></iframe>
</div> -->

[Official ROS Documentation](http://wiki.ros.org/){ .md-button }
