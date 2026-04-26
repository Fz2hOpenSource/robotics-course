# PyBullet仿真器

## 概述

PyBullet为机器学习和机器人研究提供快速原型开发。

## 安装

```bash
pip install pybullet
```

## 基本示例

```python
import pybullet as p
import pybullet_data

client = p.connect(p.GUI)
p.setAdditionalSearchPath(pybullet_data.getDataPath())

# 加载机器人
robot = p.loadURDF("kuka_iiwa/model.urdf")

# 步进仿真
for _ in range(1000):
    p.stepSimulation()
```

## 关键特性

- 简易Python API
- VR支持
- 直接关节控制

---

*[← 返回目录](index.md)*
