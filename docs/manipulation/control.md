# Robot Control

## Trajectory Tracking

### Joint Space Control

```python
controller = builder.AddSystem(PidController(kp, ki, kd))
```

### Cartesian Space Control

Transform errors to joint space using Jacobian:

$$\tau = J^T F_{task}$$

## Force Control

### Direct Force Control

```python
force_command = desired_force
```

### Impedance Control

Maintains relationship between force and position:

$$F = M(x_d - x) + B(\dot{x}_d - \dot{x}) + K(x_d - x)$$

## Hybrid Position/Force Control

Selectively control force in some directions, position in others.

### Passivity-Based Control

Ensures stable interaction with unknown environments.

---

*[← Back to Index](index.md)*
