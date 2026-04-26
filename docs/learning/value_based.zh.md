# 基于价值的方法

## Q-Learning

离策略TD控制算法：

```python
def q_learning(env, episodes=1000):
    Q = np.zeros((state_n, action_n))
    for episode in range(episodes):
        state = env.reset()
        done = False
        while not done:
            action = epsilon_greedy(Q[state])
            next_state, reward, done, _ = env.step(action)
            Q[state, action] += alpha * (
                reward + gamma * np.max(Q[next_state]) - Q[state, action]
            )
            state = next_state
    return Q
```

## 深度Q网络 (DQN)

使用神经网络近似Q函数：

- **经验回放**: 在缓冲区存储转换
- **目标网络**: 稳定训练
- **双DQN**: 减少过度估计

## 扩展

- **Dueling DQN**: 分离价值和优势
- **优先经验回放**: 采样重要转换

---

*[← 返回目录](index.md)*
