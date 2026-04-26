# 硬件集成

## ROS/ROS2集成

```python
import rclpy
from rclpy.node import Node

class RobotController(Node):
    def __init__(self):
        super().__init__('controller')
        self.publisher = self.create_publisher(JointCommand, '/joint_commands', 10)
        self.subscription = self.create_subscription(JointState, '/joint_states', self.callback, 10)
```

## 实时考虑

- 使用实时内核
- 适当分配线程优先级
- 最小化回调延迟

## 标定

- 相机内参/外参
- 机器人运动学
- 力/力矩传感器

---

*[← 返回目录](index.md)*
