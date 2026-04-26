# Bin Picking

## Overview

Bin picking involves grasping objects from cluttered bins - a challenging manipulation task.

## Scene Generation

### Clutter Simulation

```python
scene = ClutteredScene()
scene.AddObjects(object_mesh, num_objects=20)
```

## Grasp Selection

### Model-Based

1. Segment point cloud
2. Estimate object poses
3. Sample grasp candidates
4. Evaluate grasp quality

### Contact Mechanics

Static friction balance:

$$f_n \geq 0$$
$$|f_t| \leq \mu f_n$$

## Task-Level Programming

### State Machines

Sequential task execution.

### Behavior Trees

Hierarchical, reactive task composition.

### LLM Planning

Use language models for task decomposition.

---

*[← Back to Index](index.md)*
