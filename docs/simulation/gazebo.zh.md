# Gazebo仿真器

## 概述

Gazebo是一个与ROS/ROS2集成的机器人仿真环境。

## 安装

```bash
# ROS2 Humble
sudo apt install ros-humble-gazebo-ros-pkgs
```

## 创建机器人模型

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

## 在ROS2中生成

```python
from gazebo_msgs.srv import SpawnEntity
# 从URDF/Xacro生成机器人
```

## 最佳实践

- 使用SDF建模世界
- 优化碰撞几何体
- 使用合适的物理参数

---

*[← 返回目录](index.md)*
