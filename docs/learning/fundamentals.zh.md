# 强化学习基础

## 马尔可夫决策过程 (MDP)

由 $(S, A, P, R, \gamma)$ 定义的序贯决策问题：

- **S**: 状态空间
- **A**: 动作空间
- **P**: 转移概率 $P(s'|s,a)$
- **R**: 奖励函数 $R(s,a,s')$
- **$\gamma$**: 折扣因子

## 价值函数

### 状态价值函数
$$V^\pi(s) = \mathbb{E}_\pi [G_t | s_t = s]$$

### 动作价值函数
$$Q^\pi(s,a) = \mathbb{E}_\pi [G_t | s_t = s, a_t = a]$$

## 贝尔曼方程

$$V^\pi(s) = \sum_a \pi(a|s) \sum_{s'} P(s'|s,a) [R(s,a,s') + \gamma V^\pi(s')]$$

## 最优策略

$$V^*(s) = \max_\pi V^\pi(s)$$

---

*[← 返回目录](index.md)*
