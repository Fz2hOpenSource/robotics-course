# Gazebo Simulator

## Overview

Gazebo is a robot simulation environment integrated with ROS/ROS2.

## Installation

```bash
# ROS2 Humble
sudo apt install ros-humble-gazebo-ros-pkgs
```

## Creating a Robot Model

```xml
<sdf version="1.6">
  <model name="my_robot">
    <link name="base_link">
      <collision>
        <geometry>
          <cylinder>
            <radius>0.5</radius>
            <length>0.1</length>
          </cylinder>
        </geometry>
      </collision>
    </link>
  </model>
</sdf>
```

## Spawning in ROS2

```python
from gazebo_msgs.srv import SpawnEntity
# Spawn robot from URDF/Xacro
```

## Best Practices

- Use SDF for world modeling
- Optimize collision geometry
- Use proper physics parameters

---

*[← Back to Index](index.md)*
