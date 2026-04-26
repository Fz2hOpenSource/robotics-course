# DH Parameters

## Overview

The Denavit-Hartenberg (DH) convention provides a systematic method for assigning coordinate frames to robot links.

## Standard DH Parameters

Four parameters for each joint:

| Parameter | Description | Axis |
|-----------|-------------|------|
| $\theta_i$ | Joint angle | Z (revolute) |
| $d_i$ | Link offset | Z |
| $a_i$ | Link length | X |
| $\alpha_i$ | Link twist | X |

## Transformation Matrix

$$_{i-1}^{i}T = R_z(\theta_i) \cdot T_z(d_i) \cdot T_x(a_i) \cdot R_x(\alpha_i)$$

$$= \begin{bmatrix} \cos\theta_i & -\sin\theta_i\cos\alpha_i & \sin\theta_i\sin\alpha_i & a_i\cos\theta_i \\ \sin\theta_i & \cos\theta_i\cos\alpha_i & -\cos\theta_i\sin\alpha_i & a_i\sin\theta_i \\ 0 & \sin\alpha_i & \cos\alpha_i & d_i \\ 0 & 0 & 0 & 1 \end{bmatrix}$$

## Convention Steps

1. Label joints 1 to n from base to end-effector
2. Align Z-axis with joint axes
3. Choose base frame origin at joint 1 origin
4. For each link:
   - $a_i$: Distance from $Z_i$ to $Z_{i+1}$ along $X_i$
   - $\alpha_i$: Angle from $Z_i$ to $Z_{i+1}$ about $X_i$
   - $d_i$: Distance from $X_{i-1}$ to $X_i$ along $Z_i$
   - $\theta_i$: Angle from $X_{i-1}$ to $X_i$ about $Z_i$

## Modified DH Parameters

Alternative convention placing frame $i$ at joint $i$ (before transformation):

$$_{i}^{i-1}T = R_x(\alpha_{i-1}) \cdot T_x(a_{i-1}) \cdot R_z(\theta_i) \cdot T_z(d_i)$$

## Best Practices

- Be consistent with convention choice
- Document which convention you're using
- Verify with known configurations

---

*[← Back to Index](index.md)*
