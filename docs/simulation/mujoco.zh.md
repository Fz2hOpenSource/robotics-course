# MuJoCo物理引擎

## 概述

MuJoCo为locomotion和接触任务提供精确的物理仿真。

## 安装

```bash
pip install mujoco
```

## 基本用法

```python
import mujoco

model = mujoco.load(model_path)
data = mujoco.Data(model)

# 步进仿真
for _ in range(1000):
    mujoco.mj_step(model, data)
```

## XML模型

```xml
<mujoco model="robot">
  <worldbody>
    <body name="torso">
      <freejoint/>
      <geom type="sphere" size=".1"/>
    </body>
  </worldbody>
</mujoco>
```

## 使用场景

- 类人机器人locomotion
- 机器人locomotion
- 接触动力学

---

*[← 返回目录](index.md)*
