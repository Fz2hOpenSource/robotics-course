# MuJoCo Physics Engine

## Overview

MuJoCo provides accurate physics simulation for locomotion and contact tasks.

## Installation

```bash
pip install mujoco
```

## Basic Usage

```python
import mujoco

model = mujoco.load(model_path)
data = mujoco.Data(model)

# Step simulation
for _ in range(1000):
    mujoco.mj_step(model, data)
```

## XML Model

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

## Use Cases

- Humanoid locomotion
- Robotic locomotion
- Contact dynamics

---

*[← Back to Index](index.md)*
