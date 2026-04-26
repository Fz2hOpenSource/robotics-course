# 深思式动作

## 基于规划的控制

深思式系统使用规划来选择动作。

## 模型

1. **世界模型**: 当前和预测状态
2. **规划库**: 可用动作
3. **目标规范**: 期望结果

## 动作循环

```
while not goal_achieved:
    state = perceive()
    if plan_invalid(plan, state):
        plan = replan(state, goal)
    action = next_action(plan)
    execute(action)
    update_state()
```

## Anytime算法

随时间提高解质量的算法：

- **分层任务网络 (HTN)**
- **带路径最大的A***
- **RA* (随机A*)**

## 与执行集成

- **规划监控**: 检测失败
- **规划修复**: 失败时修改规划
- **规划执行**: 仔细排序动作

---

*[← 返回概览](course_overview.md)*
