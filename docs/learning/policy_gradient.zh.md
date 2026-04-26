# 策略梯度方法

## REINFORCE

直接梯度估计：

$$\nabla_\theta J \approx \frac{1}{N} \sum_i \nabla_\theta \log \pi_\theta(a_i|s_i) G_i$$

## PPO (近端策略优化)

稳定学习的裁剪目标：

```python
def ppo_loss(old_log_probs, new_log_probs, advantages):
    ratio = torch.exp(new_log_probs - old_log_probs)
    clipped = torch.clamp(ratio, 1-eps, 1+eps) * advantages
    return -torch.min(ratio * advantages, clipped).mean()
```

## TRPO

信任域约束：

$$\max_\theta \mathbb{E}[\frac{\pi_\theta(a|s)}{\pi_{\theta_{old}}(a|s)} A^{\pi_{\theta_{old}}}(s,a)]$$
$$\text{s.t. } D_{KL}(\pi_{\theta_{old}} || \pi_\theta) \leq \delta$$

## 演员-评论家

结合策略梯度和价值函数：
- **演员**: 策略网络
- **评论家**: 价值函数

---

*[← 返回目录](index.md)*
