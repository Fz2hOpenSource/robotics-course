# Hybrid Control

## Position/Force Control

Control position in some task space directions, force in others.

## Task Frame Formulation

$$F_{control} = \begin{cases} K_p (x_d - x) + K_d (\dot{x}_d - \dot{x}) & \text{in position directions} \\ F_d & \text{in force directions} \end{cases}$$

## Cartesian Stiffness Control

$$F = K(x_d - x)$$

---

*[← Back to Index](index.md)*
