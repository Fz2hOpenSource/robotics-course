# Planning Problem Formulation

## Classical Planning

### State-Based Representation

- **Initial state**: $s_0$
- **Goal state**: $s_g$
- **Actions**: $A = \{a_1, a_2, ...\}$
- **Transition**: $s' = a(s)$

### PDDL (Planning Domain Definition Language)

```pddl
(:action move
  :parameters (?from ?to)
  :precondition (and (robot-at ?from) (adjacent ?from ?to))
  :effect (and (not (robot-at ?from)) (robot-at ?to))
)
```

## Problem Types

1. **Propositional planning**: Boolean state variables
2. **First-order planning**: Objects and relations
3. **Numeric planning**: Quantitative constraints

## Planning as Search

```
function GRAPH-SEARCH(problem):
    frontier = {initial state}
    while frontier not empty:
        state = frontier.pop()
        if state is goal: return solution
        for each action in applicable(state):
            frontier.push(result(state, action))
```

## Complexity

- PSPACE-complete for classical planning
- NP-complete with restricted representations

---

*[← Back to Overview](course_overview.md)*
