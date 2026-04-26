# Policy Gradient Methods

## REINFORCE

Direct gradient estimation:

$$\nabla_\theta J \approx \frac{1}{N} \sum_i \nabla_\theta \log \pi_\theta(a_i|s_i) G_i$$

## PPO (Proximal Policy Optimization)

Clipped objective for stable learning:

```python
def ppo_loss(old_log_probs, new_log_probs, advantages):
    ratio = torch.exp(new_log_probs - old_log_probs)
    clipped = torch.clamp(ratio, 1-eps, 1+eps) * advantages
    return -torch.min(ratio * advantages, clipped).mean()
```

## TRPO

Trust region constraint:

$$\max_\theta \mathbb{E}[\frac{\pi_\theta(a|s)}{\pi_{\theta_{old}}(a|s)} A^{\pi_{\theta_{old}}}(s,a)]$$
$$\text{s.t. } D_{KL}(\pi_{\theta_{old}} || \pi_\theta) \leq \delta$$

## Actor-Critic

Combine policy gradient with value function:
- **Actor**: Policy network
- **Critic**: Value function

---

*[← Back to Index](index.md)*
