# Robotic Manipulation (MIT Course)

This module covers the MIT 6.8210 course on Robotic Manipulation, taught by Russ Tedrake.

## Course Overview

- **Instructor**: Russ Tedrake (MIT CSAIL)
- **Source**: [manipulation.csail.mit.edu](https://manipulation.csail.mit.edu/)
- **Framework**: Drake
- **Focus**: Perception, Planning, and Control for robot manipulation

## Topics Covered

### Fundamentals
- [Introduction](introduction.md) - Course overview and motivation
- [Robot Hardware](hardware.md) - Arms, grippers, sensors
- [Pick and Place Basics](pick_place.md) - Kinematics for manipulation

### Perception
- [Pose Estimation](pose_estimation.md) - Geometric pose estimation
- [Bin Picking](bin_picking.md) - Grasping in clutter
- [Deep Perception](deep_perception.md) - CNN-based perception

### Planning
- [Motion Planning](motion_planning.md) - Trajectory optimization, RRT, GCS
- [Task Planning](task_planning.md) - State machines, behavior trees

### Control
- [Trajectory Tracking](control.md) - Position and force control
- [Hybrid Control](hybrid_control.md) - Position/force hybrid strategies

### Learning
- [Reinforcement Learning](rl_manipulation.md) - RL for manipulation tasks

## Prerequisites

- Linear Algebra
- Control Theory basics
- Python programming
- (Recommended) [Robotics Basics](../robotics_basics/index.md)

## Software Setup

This course uses the **Drake** robotics framework. See the [Installation Guide](installation.md) for setup instructions.

## Course Projects

1. Basic pick-and-place pipeline
2. Vision-based bin picking
3. Learning-based grasping

---

*[← Back to Home](../index.md)*
