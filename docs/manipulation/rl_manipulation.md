# Reinforcement Learning for Manipulation

## Policy Gradient Methods

### REINFORCE

$$\nabla J = \mathbb{E}[\nabla_\theta \log \pi_\theta(a|s) G_t]$$

### PPO (Proximal Policy Optimization)

Clipped objective for stable learning:

$$L^{CLIP} = \mathbb{E}[\min(r_t A_t, \text{clip}(r_t, 1-\epsilon, 1+\epsilon) A_t)]$$

## Model-Based RL

Learn dynamics model for planning:

1. Collect data
2. Fit dynamics model
3. Plan with learned model
4. Execute and refine

## Sim-to-Real Transfer

- Domain randomization
- System identification
- Progressive fine-tuning

---

*[← Back to Index](index.md)*
