# Basic Pick and Place

## The Pick-Place Pipeline

1. **Perceive** object pose
2. **Plan** approach trajectory
3. **Execute** grasp
4. **Move** to goal
5. **Release** object

## Spatial Algebra

### Rotation Representations
- Euler angles
- Quaternions
- Axis-angle

### Homogeneous Transforms
$$T = \begin{bmatrix} R & p \\ 0 & 1 \end{bmatrix}$$

## Forward Kinematics

Using Drake's MultibodyPlant:

```python
plant = builder.AddSystem(MultibodyPlant(time_step))
parser = Parser(plant)
parser.AddModelFromFile("robot.sdf")
plant.Finalize()

context = plant.CreateDefaultContext()
X_WB = plant.CalcForwardKinematics(context)
```

## Inverse Kinematics

### Numerical IK with Drake

```python
def solve_ik(plant, context, X_WG):
    ik = InverseKinematics(plant, context)
    ik.AddOrientationConstraint(...)
    ik.AddPositionConstraint(...)
    result = Solve(ik.prog())
    return result.GetSolution()
```

## Grasp Selection

- Predefined grasp poses
- Grasp quality metrics
- Grasp planning algorithms

---

*[← Back to Index](index.md)*
