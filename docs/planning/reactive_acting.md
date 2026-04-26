# Reactive Acting

## Real-Time Response

Reactive systems respond immediately to environmental changes without deliberation.

## Principles

1. **Stimulus-response**: Direct mapping from perception to action
2. **Situatedness**: Actions depend on current state
3. **Timeliness**: Responses within time constraints

## Architectures

### Subsumption Architecture

Layered behaviors:
- Higher layers inhibit lower ones
- Behaviors compete for control

### Potential Fields

Navigate using virtual forces:

```python
def compute_force(robot_pos, goal, obstacles):
    f_goal = k * (goal - robot_pos)
    f_obs = sum(f_repulsion(robot_pos, obs) for obs in obstacles)
    return f_goal + f_obs
```

## Hybrid Approaches

Combine reactive and deliberative:
- Reactive layer for immediate response
- Deliberative layer for complex tasks

---

*[← Back to Overview](course_overview.md)*
