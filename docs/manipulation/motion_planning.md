# Motion Planning

## Overview

Motion planning finds a collision-free path from start to goal configuration.

## Trajectory Optimization

### Direct Trajectory Optimization

Formulate as optimization problem:

```python
prog = MathematicalProgram()
traj_vars = prog.NewContinuousVariables(N, "trajectory")
prog.AddCost(cost(traj_vars))
prog.AddConstraint(constraints(traj_vars))
result = Solve(prog)
```

### GCS (Graph of Convex Sets)

Optimal motion planning via convex decomposition:

1. Decompose configuration space into convex sets
2. Build graph of overlaps
3. Solve shortest path with edge costs

## Sampling-Based Planning

### RRT (Rapidly-exploring Random Trees)

- Exploration-based
- Asymptotically complete
- Not optimal

### PRM (Probabilistic Roadmaps)

- Learning phase + query phase
- Good for multiple queries

## Collision Checking

```python
 checker = CollisionChecker(model=plant, context=context)
 is_collision_free = checker.CheckConfigsCollisionFree([q1, q2])
```

## Time-Optimal Path Parameterization

Given geometric path, find fastest traversal time respecting dynamics.

---

*[← Back to Index](index.md)*
