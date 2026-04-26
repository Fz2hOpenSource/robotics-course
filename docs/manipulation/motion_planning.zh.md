# 运动规划

## 概述

运动规划找到从起始构型到目标构型的无碰撞路径。

## 轨迹优化

### 直接轨迹优化

表述为优化问题：

```python
prog = MathematicalProgram()
traj_vars = prog.NewContinuousVariables(N, "trajectory")
prog.AddCost(cost(traj_vars))
prog.AddConstraint(constraints(traj_vars))
result = Solve(prog)
```

### GCS（凸集图）

通过凸分解的最优运动规划：

1. 将构型空间分解为凸集
2. 构建重叠图
3. 求解带边权最短路

## 基于采样的规划

### RRT（快速探索随机树）

- 基于探索
- 渐近完备
- 非最优

### PRM（概率路线图）

- 学习阶段 + 查询阶段
- 适合多次查询

## 碰撞检测

```python
 checker = CollisionChecker(model=plant, context=context)
 is_collision_free = checker.CheckConfigsCollisionFree([q1, q2])
```

## 时间最优路径参数化

给定几何路径，在满足动力学约束下找到最快遍历时间。

---

*[← 返回目录](index.md)*
