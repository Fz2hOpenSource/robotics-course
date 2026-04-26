# 反应式动作

## 实时响应

反应式系统无需深思即可立即响应环境变化。

## 原则

1. **刺激-响应**: 从感到知的直接映射到动作
2. **情境性**: 动作依赖于当前状态
3. **时效性**: 在时间约束内响应

## 架构

### 分层架构

分层行为：
- 更高层抑制低层
- 行为竞争控制权

### 势场法

使用虚拟力导航：

```python
def compute_force(robot_pos, goal, obstacles):
    f_goal = k * (goal - robot_pos)
    f_obs = sum(f_repulsion(robot_pos, obs) for obs in obstacles)
    return f_goal + f_obs
```

## 混合方法

结合反应式和深思式：
- 反应式层用于即时响应
- 深思式层用于复杂任务

---

*[← 返回概览](course_overview.md)*
