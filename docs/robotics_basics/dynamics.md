# Robot Dynamics

## Overview

Robot dynamics describes the relationship between forces/torques and robot motion. It answers the question: "What joint torques are needed to produce desired motion?"

## Lagrange-Euler Formulation

The Lagrangian $L = K - P$ (kinetic energy minus potential energy) leads to:

$$\tau = M(q)\ddot{q} + C(q,\dot{q})\dot{q} + g(q)$$

Where:
- $M(q)$: Mass/Inertia matrix
- $C(q,\dot{q})$: Coriolis and centrifugal forces
- $g(q)$: Gravity vector
- $\tau$: Joint torques

## Newton-Euler Formulation

Recursive formulation that propagates velocities and accelerations from base to tip, then propagates forces back.

### Algorithm Steps:
1. Outward recursion: Compute $\omega_i, \dot{v}_i$ for each link
2. Inward recursion: Compute $\tau_i$ for each joint

## Manipulator Equations of Motion

$$M(q)\ddot{q} + N(q,\dot{q}) = \tau$$

Where $N$ represents all nonlinear terms including Coriolis, centrifugal, and gravity effects.

## Dynamic Parameters

Key parameters affecting robot dynamics:
- Link masses
- Moments of inertia
- Center of mass locations
- Friction coefficients

## Practical Considerations

### Friction Models
- Coulomb friction
- Viscous friction
- Stiction (static + kinetic)

### Actuator Dynamics
- Motor constants
- Gear ratios
- Backlash

---

*[← Back to Index](index.md) | [← Robotics Basics](index.md)*
