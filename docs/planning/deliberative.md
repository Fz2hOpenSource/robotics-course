# Deliberative Acting

## Planning-Based Control

Deliberative systems use planning to select actions.

## Model

1. **World model**: Current and predicted states
2. **Plan library**: Available actions
3. **Goal specification**: Desired outcomes

## Acting Loop

```
while not goal_achieved:
    state = perceive()
    if plan_invalid(plan, state):
        plan = replan(state, goal)
    action = next_action(plan)
    execute(action)
    update_state()
```

## Anytime Algorithms

Algorithms that improve solution quality over time:

- **Hierarchical Task Networks (HTN)**
- **A* with pathmax**
- **RA* (Randomized A*)**

## Integration with Execution

- **Plan monitoring**: Detect failures
- **Plan repair**: Modify plan on failure
- **Plan execution**: Carefully sequence actions

---

*[← Back to Overview](course_overview.md)*
