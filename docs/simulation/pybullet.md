# PyBullet Simulator

## Overview

PyBullet offers quick prototyping for robotics and ML research.

## Installation

```bash
pip install pybullet
```

## Basic Example

```python
import pybullet as p
import pybullet_data

client = p.connect(p.GUI)
p.setAdditionalSearchPath(pybullet_data.getDataPath())

# Load robot
robot = p.loadURDF("kuka_iiwa/model.urdf")

# Step simulation
for _ in range(1000):
    p.stepSimulation()
```

## Key Features

- Easy Python API
- VR support
- Direct joint control

---

*[← Back to Index](index.md)*
