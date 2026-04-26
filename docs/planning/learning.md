# Learning from Experience

## Learning in Acting

Improve skills through practice and feedback.

## Approaches

### Learning from Demonstrations

- **Programming by Demonstration**
- **Imitation Learning**
- **Learning from Observation**

### Learning from Execution

- **Reinforcement Learning**: Trial and error
- **Learning from Mistakes**: Analyze and correct failures

## Skill Refinement

```python
def improve_skill(policy, experience):
    # Update policy based on outcomes
    for state, action, reward in experience:
        policy[state][action] += alpha * reward
    return policy
```

## Model Learning

Learn environment dynamics:

1. Collect state-action-state transitions
2. Fit transition model $P(s'|s,a)$
3. Use model for planning

---

*[← Back to Overview](course_overview.md)*
