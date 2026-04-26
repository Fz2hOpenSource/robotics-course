# 机器人控制

## 轨迹跟踪

### 关节空间控制

```python
controller = builder.AddSystem(PidController(kp, ki, kd))
```

### 笛卡尔空间控制

使用雅可比将误差变换到关节空间：

$$\tau = J^T F_{task}$$

## 力控制

### 直接力控制

```python
force_command = desired_force
```

### 阻抗控制

保持力与位置的动态关系：

$$F = M(x_d - x) + B(\dot{x}_d - \dot{x}) + K(x_d - x)$$

## 混合位置/力控制

在某些方向上控制力，在其他方向上控制位置。

### 基于无源的控制

确保与未知环境稳定交互。

---

*[← 返回目录](index.md)*
