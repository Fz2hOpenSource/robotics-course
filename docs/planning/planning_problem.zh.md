# 规划问题表述

## 经典规划

### 基于状态的表示

- **初始状态**: $s_0$
- **目标状态**: $s_g$
- **动作**: $A = \{a_1, a_2, ...\}$
- **转移**: $s' = a(s)$

### PDDL（规划领域定义语言）

```pddl
(:action move
  :parameters (?from ?to)
  :precondition (and (robot-at ?from) (adjacent ?from ?to))
  :effect (and (not (robot-at ?from)) (robot-at ?to))
)
```

## 问题类型

1. **命题规划**: 布尔状态变量
2. **一阶规划**: 对象和关系
3. **数值规划**: 数量约束

## 规划作为搜索

```
function GRAPH-SEARCH(problem):
    frontier = {initial state}
    while frontier not empty:
        state = frontier.pop()
        if state is goal: return solution
        for each action in applicable(state):
            frontier.push(result(state, action))
```

## 复杂度

- 经典规划是PSPACE完全
- 限制表示下是NP完全

---

*[← 返回概览](course_overview.md)*
