# 操作强化学习

## 策略梯度方法

### REINFORCE

$$\nabla J = \mathbb{E}[\nabla_\theta \log \pi_\theta(a|s) G_t]$$

### PPO（近端策略优化）

稳定学习的裁剪目标：

$$L^{CLIP} = \mathbb{E}[\min(r_t A_t, \text{clip}(r_t, 1-\epsilon, 1+\epsilon) A_t)]$$

## 基于模型的强化学习

学习用于规划的动态模型：

1. 收集数据
2. 拟合动态模型
3. 用学习到的模型规划
4. 执行并改进

## 仿真到真实迁移

- 领域随机化
- 系统辨识
- 渐进式微调

---

*[← 返回目录](index.md)*
