# RL Fundamentals

## Markov Decision Process (MDP)

A sequential decision problem defined by $(S, A, P, R, \gamma)$:

- **S**: State space
- **A**: Action space
- **P**: Transition probability $P(s'|s,a)$
- **R**: Reward function $R(s,a,s')$
- **$\gamma$**: Discount factor

## Value Functions

### State Value Function
$$V^\pi(s) = \mathbb{E}_\pi [G_t | s_t = s]$$

### Action Value Function
$$Q^\pi(s,a) = \mathbb{E}_\pi [G_t | s_t = s, a_t = a]$$

## Bellman Equations

$$V^\pi(s) = \sum_a \pi(a|s) \sum_{s'} P(s'|s,a) [R(s,a,s') + \gamma V^\pi(s')]$$

## Optimal Policy

$$V^*(s) = \max_\pi V^\pi(s)$$

---

*[← Back to Index](index.md)*
