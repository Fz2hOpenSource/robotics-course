# Piper-X MuJoCo Simulation

## Project Overview

**piper-X** is a MuJoCo-based simulation of the AgileX Piper robotic arm, developed by [AB-pixel-pixel](https://github.com/AB-pixel-pixel/piper-X).

- **Repository**: [AB-pixel-pixel/piper-X](https://github.com/AB-pixel-pixel/piper-X)
- **Simulator**: MuJoCo
- **Language**: Python

## About AgileX Piper

The AgileX Piper is a 6-DOF collaborative robotic arm with:

| Specification | Value |
|---------------|-------|
| Degrees of Freedom | 6 |
| Payload | 1.5 kg |
| Reach | 580mm |
| Weight | ~9kg |
| Repeatability | ±0.1mm |

### Key Features

- **Lightweight**: Easy to mount and integrate
- **High Precision**: Industrial-grade servo motors
- **ROS/ROS2 Support**: Native integration with Robot Operating System
- **Cobot Design**: Safe for human-robot collaboration

## piper-X Project Goals

This project aims to provide:

1. **Physics-Accurate Simulation**: Realistic dynamics modeling in MuJoCo
2. **Rapid Prototyping**: Test manipulation algorithms without hardware
3. **Research Platform**: Foundation for RL and control research
4. **Sim-to-Real Bridge**: Transfer learned policies to real hardware

## Getting Started

### Installation

```bash
# Clone the repository
git clone https://github.com/AB-pixel-pixel/piper-X.git
cd piper-X

# Install dependencies
pip install mujoco
pip install numpy
pip install matplotlib
```

### Basic Usage

```python
import mujoco
import numpy as np

# Load Piper model
model = mujoco.load("piper.xml")
data = mujoco.Data(model)

# Set joint positions
data.qpos[0:6] = [0, -0.5, 1.0, 0, 0.5, 0]

# Run simulation
for _ in range(1000):
    mujoco.mj_step(model, data)
```

## Project Structure

```
piper-X/
├── piper.xml          # MuJoCo model definition
├── sim.py             # Basic simulation example
├── control.py          # Joint position control
├── ik_solver.py        # Inverse kinematics
└── rl_train.py         # Reinforcement learning setup
```

## Integration with This Course

This project connects to our course materials:

| Module | Connection |
|--------|------------|
| [Simulation](../simulation/index.md) | MuJoCo fundamentals |
| [Robotics Basics](../robotics_basics/index.md) | Forward/inverse kinematics |
| [Control](../manipulation/control.md) | Joint trajectory control |
| [RL Applications](../learning/robot_applications.md) | Policy learning |

## Next Steps

1. Try the basic simulation
2. Implement joint space control
3. Add inverse kinematics
4. Train a grasping policy with RL

## References

- [AgileX Piper Official](https://www.agilex.ai/)
- [AgileX Piper SDK](https://github.com/agilexrobotics/piper_sdk)
- [AgileX ROS Driver](https://github.com/agilexrobotics/piper_ros)
- [MuJoCo Documentation](https://mujoco.readthedocs.io/)

---

*[← Back to Simulation Index](../simulation/index.md)*
