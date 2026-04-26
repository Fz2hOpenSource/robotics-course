# Hardware Integration

## ROS/ROS2 Integration

```python
import rclpy
from rclpy.node import Node

class RobotController(Node):
    def __init__(self):
        super().__init__('controller')
        self.publisher = self.create_publisher(JointCommand, '/joint_commands', 10)
        self.subscription = self.create_subscription(JointState, '/joint_states', self.callback, 10)
```

## Real-Time Considerations

- Use real-time kernels
- Prioritize threads appropriately
- Minimize callback latencies

## Calibration

- Camera intrinsics/extrinsics
- Robot kinematics
- Force/torque sensors

---

*[← Back to Index](index.md)*
