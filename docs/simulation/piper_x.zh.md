# Piper-X MuJoCo仿真

## 项目概述

**piper-X** 是一个基于MuJoCo的AgileX Piper机械臂仿真项目，由 [AB-pixel-pixel](https://github.com/AB-pixel-pixel/piper-X) 开发。

- **仓库地址**: [AB-pixel-pixel/piper-X](https://github.com/AB-pixel-pixel/piper-X)
- **仿真器**: MuJoCo
- **编程语言**: Python

## 关于AgileX Piper

AgileX Piper是一款6自由度协作型机械臂：

| 规格 | 参数 |
|------|------|
| 自由度 | 6 |
| 负载 | 1.5 kg |
| 臂展 | 580mm |
| 重量 | ~9kg |
| 重复精度 | ±0.1mm |

### 主要特点

- **轻量级**: 易于安装和集成
- **高精度**: 工业级伺服电机
- **ROS/ROS2支持**: 原生集成机器人操作系统
- **协作设计**: 人机协作安全

## piper-X 项目目标

本项目旨在提供：

1. **物理精确仿真**: MuJoCo中的真实动力学建模
2. **快速原型**: 无需硬件即可测试操作算法
3. **研究平台**: 强化学习和控制研究的基础
4. **仿真到真实桥梁**: 将学习到的策略迁移到真实硬件

## 快速开始

### 安装

```bash
# 克隆仓库
git clone https://github.com/AB-pixel-pixel/piper-X.git
cd piper-X

# 安装依赖
pip install mujoco
pip install numpy
pip install matplotlib
```

### 基本使用

```python
import mujoco
import numpy as np

# 加载Piper模型
model = mujoco.load("piper.xml")
data = mujoco.Data(model)

# 设置关节位置
data.qpos[0:6] = [0, -0.5, 1.0, 0, 0.5, 0]

# 运行仿真
for _ in range(1000):
    mujoco.mj_step(model, data)
```

## 项目结构

```
piper-X/
├── piper.xml          # MuJoCo模型定义
├── sim.py             # 基础仿真示例
├── control.py         # 关节位置控制
├── ik_solver.py       # 逆运动学求解器
└── rl_train.py        # 强化学习训练设置
```

## 与本课程的结合

本项目与我们的教程内容紧密相关：

| 模块 | 关联内容 |
|------|----------|
| [仿真](../simulation/index.md) | MuJoCo基础 |
| [机器人学基础](../robotics_basics/index.md) | 正/逆运动学 |
| [控制](../manipulation/control.md) | 关节轨迹控制 |
| [RL应用](../learning/robot_applications.md) | 策略学习 |

## 下一步

1. 尝试基础仿真
2. 实现关节空间控制
3. 添加逆运动学
4. 用强化学习训练抓取策略

## 参考资料

- [AgileX Piper官网](https://www.agilex.ai/)
- [AgileX Piper SDK](https://github.com/agilexrobotics/piper_sdk)
- [AgileX ROS驱动](https://github.com/agilexrobotics/piper_ros)
- [MuJoCo文档](https://mujoco.readthedocs.io/)

---

*[← 返回仿真目录](../simulation/index.md)*
