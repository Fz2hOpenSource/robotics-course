# 混合控制

## 位置/力控制

在某些任务空间方向上控制位置，在其他方向上控制力。

## 任务坐标系表述

$$F_{control} = \begin{cases} K_p (x_d - x) + K_d (\dot{x}_d - \dot{x}) & \text{在位置方向} \\ F_d & \text{在力方向} \end{cases}$$

## 笛卡尔刚度控制

$$F = K(x_d - x)$$

---

*[← 返回目录](index.md)*
