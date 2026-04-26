# 与学习结合的规划

## 集成方法

结合符号规划与统计学习。

## 方法

### 学习规划启发式

从经验中学习搜索启发式。

### 学习动作模型

通过学习更好的动作模型提高规划精度。

### 使用学习修复规划

用学习到的模型修复失败的规划。

## 神经符号规划

```python
# 混合架构
symbolic_planner = Planner()
neural_perception = CNN()
policy_network = RLAgent()

# 集成
state = neural_perception(observation)
high_level_plan = symbolic_planner.plan(state)
low_level_action = policy_network.select_action(state)
```

## 应用

- 机器人操作
- 自动驾驶
- 游戏博弈

---

*[← 返回概览](course_overview.md)*
