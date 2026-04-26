# Planning with Learning

## Integrated Approaches

Combine symbolic planning with statistical learning.

## Methods

### Learning Plan Heuristics

Learn search heuristics from experience.

### Learning Action Models

Improve planning accuracy by learning better action models.

### Plan Repair with Learning

Use learned models to repair failed plans.

## Neuro-Symbolic Planning

```python
# Hybrid architecture
symbolic_planner = Planner()
neural_perception = CNN()
policy_network = RLAgent()

# Integration
state = neural_perception(observation)
high_level_plan = symbolic_planner.plan(state)
low_level_action = policy_network.select_action(state)
```

## Applications

- Robot manipulation
- Autonomous driving
- Game playing

---

*[← Back to Overview](course_overview.md)*
