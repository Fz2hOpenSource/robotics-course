# Model-Based RL

## Learn the Dynamics

$$s_{t+1} = f(s_t, a_t) + \epsilon$$

## Model Predictive Control (MPC)

```python
def mpc_planner(state, horizon=10):
    best_action = None
    best_reward = -inf
    for _ in range(num_samples):
        actions = sample_actions(horizon)
        predicted_states = rollout(state, actions, model)
        reward = sum(reward_fn(predicted_states))
        if reward > best_reward:
            best_reward = reward
            best_action = actions[0]
    return best_action
```

## Dyna Architecture

1. Learn model from real experience
2. Use model for planning
3. Update policy with real and simulated data

## PETS (PETS)

Probabilistic ensemble trajectory sampling:
- Ensemble of neural networks
- Uncertainty-aware planning

---

*[← Back to Index](index.md)*
