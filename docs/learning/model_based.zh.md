# 基于模型的强化学习

## 学习动力学

$$s_{t+1} = f(s_t, a_t) + \epsilon$$

## 模型预测控制 (MPC)

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

## Dyna架构

1. 从真实经验中学习模型
2. 用模型进行规划
3. 用真实和模拟数据更新策略

## PETS

概率集成轨迹采样：
- 神经网络集成
- 不确定性感知规划

---

*[← 返回目录](index.md)*
