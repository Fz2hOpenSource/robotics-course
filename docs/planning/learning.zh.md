# 经验学习

## 动作中学习

通过实践和反馈改进技能。

## 方法

### 从演示中学习

- **示教编程**
- **模仿学习**
- **从观察中学习**

### 从执行中学习

- **强化学习**: 试错
- **从错误中学习**: 分析并纠正失败

## 技能改进

```python
def improve_skill(policy, experience):
    # 根据结果更新策略
    for state, action, reward in experience:
        policy[state][action] += alpha * reward
    return policy
```

## 模型学习

学习环境动态：

1. 收集状态-动作-状态转换
2. 拟合转换模型 $P(s'|s,a)$
3. 用模型进行规划

---

*[← 返回概览](course_overview.md)*
