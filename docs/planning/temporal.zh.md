# 时序规划

## 时间表示

### 持续时间

```pddl
(:durative-action cook
  :duration (= ?duration 30)
  :condition (at start (has-ingredients))
  :effect (at end (food-ready))
)
```

## 并发动作

非冲突的动作可以同时执行。

### 同步

- **开始条件**: 动作何时可以开始
- **结束条件**: 动作何时完成
- **全程条件**: 必须始终满足

## 调度

规划与调度的集成：

1. **规划**: 执行什么动作
2. **调度**: 何时执行

## 优化指标

- **总工期**: 完成总时间
- **总成本**: 动作成本之和
- **提前度**: 惩罚目标延迟

---

*[← 返回概览](course_overview.md)*
