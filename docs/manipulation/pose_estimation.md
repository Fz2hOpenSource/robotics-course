# Pose Estimation

## Geometric Pose Estimation

### Point Cloud Registration

Given correspondences:

$$T^* = \arg\min_T \sum_i \|p_i - T q_i\|^2$$

### ICP (Iterative Closest Point)

1. Find point correspondences
2. Estimate transformation
3. Repeat until convergence

## Handling Partial Views

- Segmentation
- Outlier removal
- Multi-view fusion

## Grasp Pose Detection

### Contact Model

$$\mu N \geq F_t$$ (friction cone constraint)

### Grasp Quality

- Force closure
- Grasp stiffness
- Task-oriented metrics

---

*[← Back to Index](index.md)*
