# Value-Based Methods

## Q-Learning

Off-policy TD control algorithm:

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

## Deep Q-Network (DQN)

Use neural network to approximate Q-function:

- **Experience replay**: Store transitions in buffer
- **Target network**: Stabilize training
- **Double DQN**: Reduce overestimation

## Extensions

- **Dueling DQN**: Separate value and advantage
- **Prioritized Experience Replay**: Sample important transitions

---

*[← Back to Index](index.md)*
