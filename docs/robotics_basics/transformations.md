# Coordinate Transformations

## Overview

Coordinate transformations are fundamental to robotics, enabling representation of positions and orientations in different reference frames.

## Rotation Representations

### Rotation Matrix (3x3)

Orthogonal matrix $R$ where $R^T R = I$ and $\det(R) = 1$

Properties:
- 9 parameters, 6 constraints → 3 DOF
- Intuitive for composition
- Memory intensive for transmission

### Euler Angles

Sequential rotations about principal axes.

**ZYZ Convention:**
$$R = R_z(\alpha) R_y(\beta) R_z(\gamma)$$

Common issues: Gimbal lock at $\beta = \pm 90°$

### Axis-Angle (Exponential Coordinates)

$$R = e^{[\omega]_\times \theta}$$

Where $[\omega]_\times$ is the skew-symmetric matrix of $\omega$.

### Quaternions

4-parameter representation: $q = [w, x, y, z]$ or $q = [cos(\theta/2), \sin(\theta/2)\omega]$

Advantages:
- No gimbal lock
- Efficient interpolation (Slerp)
- Minimal storage

## Homogeneous Transformations

Combining rotation and translation:

$$T = \begin{bmatrix} R & d \\ 0 & 1 \end{bmatrix}$$

Where $R$ is 3x3 rotation matrix and $d$ is 3x1 translation vector.

## Common Operations

### Transformation Composition
$$T_{AC} = T_{AB} \cdot T_{BC}$$

### Inverse Transformation
$$T^{-1} = \begin{bmatrix} R^T & -R^T d \\ 0 & 1 \end{bmatrix}$$

### Vector Transformation
$$v_A = R_{AB} \cdot v_B$$

---

*[← Back to Index](index.md)*
